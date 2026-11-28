package db.migration.dbidentity;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
import java.util.Random;

import javax.imageio.ImageIO;

import org.junit.jupiter.api.Test;

class BeneficiaryImageCompressorTest {

	private final BeneficiaryImageCompressor compressor = new BeneficiaryImageCompressor(400, 0.9f);

	/** A noisy photo-like image, so PNG cannot squeeze it and the test sizes are realistic. */
	private static BufferedImage photo(int width, int height, int type) {
		BufferedImage image = new BufferedImage(width, height, type);
		Random random = new Random(7);
		for (int y = 0; y < height; y++)
			for (int x = 0; x < width; x++)
				image.setRGB(x, y, 0xFF000000 | random.nextInt(0xFFFFFF));
		return image;
	}

	private static byte[] encode(BufferedImage image, String format) throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ImageIO.write(image, format, out);
		return out.toByteArray();
	}

	private static BufferedImage decodeDataUrl(String dataUrl) throws Exception {
		String base64 = dataUrl.substring(dataUrl.indexOf(",") + 1);
		return ImageIO.read(new ByteArrayInputStream(Base64.getDecoder().decode(base64)));
	}

	@Test
	void largePngDataUrlBecomesSmallJpegAtMaxWidth() throws Exception {
		String stored = "data:image/png;base64,"
				+ Base64.getEncoder().encodeToString(encode(photo(1280, 960, BufferedImage.TYPE_INT_RGB), "png"));

		String result = compressor.compress(stored);

		assertNotNull(result);
		assertTrue(result.startsWith("data:image/jpeg;base64,"));
		assertTrue(result.length() < stored.length() / 5, "expected a large saving, got " + result.length());
		BufferedImage image = decodeDataUrl(result);
		assertEquals(400, image.getWidth());
		assertEquals(300, image.getHeight(), "aspect ratio kept");
	}

	@Test
	void plainBase64WithoutPrefixStaysWithoutPrefix() throws Exception {
		String stored = Base64.getEncoder().encodeToString(encode(photo(1000, 1000, BufferedImage.TYPE_INT_RGB), "png"));

		String result = compressor.compress(stored);

		assertNotNull(result);
		assertTrue(!result.startsWith("data:"));
		BufferedImage image = ImageIO.read(new ByteArrayInputStream(Base64.getDecoder().decode(result)));
		assertEquals(400, image.getWidth());
	}

	@Test
	void transparentAreasBecomeWhiteNotBlack() throws Exception {
		BufferedImage transparent = new BufferedImage(800, 800, BufferedImage.TYPE_INT_ARGB);
		BufferedImage noisy = photo(800, 400, BufferedImage.TYPE_INT_RGB);
		transparent.getGraphics().drawImage(noisy, 0, 400, null); // top half fully transparent
		String stored = "data:image/png;base64," + Base64.getEncoder().encodeToString(encode(transparent, "png"));

		BufferedImage image = decodeDataUrl(compressor.compress(stored));

		Color topLeft = new Color(image.getRGB(10, 10));
		assertTrue(topLeft.getRed() > 240 && topLeft.getGreen() > 240 && topLeft.getBlue() > 240,
				"transparent area should be white, was " + topLeft);
	}

	@Test
	void smallImageThatDoesNotShrinkIsLeftAlone() throws Exception {
		String stored = "data:image/jpeg;base64,"
				+ Base64.getEncoder().encodeToString(encode(photo(200, 150, BufferedImage.TYPE_INT_RGB), "jpg"));

		assertNull(compressor.compress(stored));
	}

	@Test
	void notAnImageIsLeftAlone() {
		assertNull(compressor.compress("data:image/png;base64," + Base64.getEncoder().encodeToString(new byte[5000])));
		assertNull(compressor.compress("this is not base64 !!!"));
		assertNull(compressor.compress(""));
		assertNull(compressor.compress(null));
	}

	@Test
	void exifRotatedPhoneJpegIsTurnedUpright() throws Exception {
		// stored sideways (wide), with EXIF orientation 6 = rotate 90 degrees clockwise to view (tall)
		byte[] jpeg = withExifOrientation(encode(photo(1200, 800, BufferedImage.TYPE_INT_RGB), "jpg"), 6);
		assertEquals(6, BeneficiaryImageCompressor.ExifOrientation.read(jpeg));

		BufferedImage image = decodeDataUrl(
				compressor.compress("data:image/jpeg;base64," + Base64.getEncoder().encodeToString(jpeg)));

		assertEquals(400, image.getWidth());
		assertEquals(600, image.getHeight(), "portrait after applying the EXIF rotation");
	}

	@Test
	void exifOrientationIsNormalWhenAbsent() throws Exception {
		assertEquals(1, BeneficiaryImageCompressor.ExifOrientation.read(encode(photo(10, 10, 1), "jpg")));
		assertEquals(1, BeneficiaryImageCompressor.ExifOrientation.read(encode(photo(10, 10, 1), "png")));
		assertEquals(1, BeneficiaryImageCompressor.ExifOrientation.read(new byte[] { (byte) 0xFF, (byte) 0xD8 }));
	}

	/** Inserts a minimal big-endian EXIF APP1 segment holding only the orientation tag, right after SOI. */
	private static byte[] withExifOrientation(byte[] jpeg, int orientation) {
		byte[] tiff = {
				'M', 'M', 0, 42, 0, 0, 0, 8,          // header, IFD0 at offset 8
				0, 1,                                 // one entry
				0x01, 0x12, 0, 3, 0, 0, 0, 1, 0, (byte) orientation, 0, 0, // Orientation, SHORT, 1
				0, 0, 0, 0 };                         // no next IFD
		byte[] exifHeader = { 'E', 'x', 'i', 'f', 0, 0 };
		int length = 2 + exifHeader.length + tiff.length;
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		out.write(jpeg, 0, 2);
		out.write(0xFF);
		out.write(0xE1);
		out.write(length >> 8);
		out.write(length & 0xFF);
		out.write(exifHeader, 0, exifHeader.length);
		out.write(tiff, 0, tiff.length);
		out.write(jpeg, 2, jpeg.length - 2);
		return out.toByteArray();
	}
}
