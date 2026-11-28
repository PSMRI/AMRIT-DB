/*
* AMRIT – Accessible Medical Records via Integrated Technology
* Integrated EHR (Electronic Health Records) Solution
*
* Copyright (C) "Piramal Swasthya Management and Research Institute"
*
* This file is part of AMRIT.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see https://www.gnu.org/licenses/.
*/
package db.migration.dbidentity;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Iterator;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

/**
 * Shrinks a beneficiary photo stored as base64 text: at most {@code maxWidth} pixels wide, saved as JPEG at the given
 * quality. Photos are stored with or without a data-URL prefix ("data:image/png;base64,"); the result keeps the same
 * style, with the prefix changed to image/jpeg.
 *
 * Returns null when the photo should be left as it is: empty, not a readable image, or not made meaningfully smaller.
 */
public class BeneficiaryImageCompressor {

	private static final String DATA_URL_PREFIX = "data:";
	private static final String BASE64_MARKER = ";base64,";
	private static final String JPEG_DATA_URL_PREFIX = "data:image/jpeg;base64,";

	/** Only write a compressed photo back when it is at least this much smaller (0.9 = 10% saving). */
	private static final double MIN_SAVING_RATIO = 0.9;

	private final int maxWidth;
	private final float jpegQuality;

	public BeneficiaryImageCompressor(int maxWidth, float jpegQuality) {
		if (maxWidth <= 0)
			throw new IllegalArgumentException("maxWidth must be positive");
		if (jpegQuality <= 0f || jpegQuality > 1f)
			throw new IllegalArgumentException("jpegQuality must be in (0, 1]");
		this.maxWidth = maxWidth;
		this.jpegQuality = jpegQuality;
	}

	/**
	 * @return the compressed photo in the same text form as the input, or null to leave the stored photo unchanged
	 */
	public String compress(String storedImage) {
		if (storedImage == null || storedImage.isBlank())
			return null;

		String text = storedImage.trim();
		boolean hasDataUrlPrefix = text.startsWith(DATA_URL_PREFIX);
		String base64 = text;
		if (hasDataUrlPrefix) {
			int marker = text.indexOf(BASE64_MARKER);
			if (marker < 0)
				return null; // a data URL that is not base64 - not something this migration understands
			base64 = text.substring(marker + BASE64_MARKER.length());
		}

		byte[] original;
		try {
			original = Base64.getMimeDecoder().decode(base64);
		} catch (IllegalArgumentException e) {
			return null;
		}

		byte[] compressed;
		try {
			compressed = compressBytes(original);
		} catch (IOException | RuntimeException e) {
			return null;
		}
		if (compressed == null)
			return null;

		String encoded = Base64.getEncoder().encodeToString(compressed);
		String result = hasDataUrlPrefix ? JPEG_DATA_URL_PREFIX + encoded : encoded;

		return result.length() < storedImage.length() * MIN_SAVING_RATIO ? result : null;
	}

	byte[] compressBytes(byte[] original) throws IOException {
		BufferedImage image = ImageIO.read(new ByteArrayInputStream(original));
		if (image == null)
			return null; // not an image format ImageIO can read

		image = applyExifOrientation(image, ExifOrientation.read(original));
		image = toRgbOnWhite(resizeToMaxWidth(image));
		return writeJpeg(image);
	}

	/** Downscales in halving steps, which keeps a large reduction sharp instead of jagged. */
	private BufferedImage resizeToMaxWidth(BufferedImage image) {
		int width = image.getWidth();
		int height = image.getHeight();
		if (width <= maxWidth)
			return image;

		int targetHeight = Math.max(1, (int) Math.round((double) height * maxWidth / width));
		BufferedImage current = image;
		int currentWidth = width;
		int currentHeight = height;

		while (currentWidth > maxWidth) {
			int nextWidth = Math.max(maxWidth, currentWidth / 2);
			int nextHeight = nextWidth == maxWidth ? targetHeight : Math.max(1, currentHeight / 2);
			current = draw(current, nextWidth, nextHeight, BufferedImage.TYPE_INT_ARGB, null);
			currentWidth = nextWidth;
			currentHeight = nextHeight;
		}
		return current;
	}

	/** JPEG has no transparency: transparent areas (from a PNG) become white rather than black. */
	private BufferedImage toRgbOnWhite(BufferedImage image) {
		if (image.getType() == BufferedImage.TYPE_INT_RGB)
			return image;
		return draw(image, image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_RGB, Color.WHITE);
	}

	private static BufferedImage draw(BufferedImage source, int width, int height, int type, Color background) {
		BufferedImage target = new BufferedImage(width, height, type);
		Graphics2D g = target.createGraphics();
		try {
			g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
			g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
			g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
			if (background != null) {
				g.setColor(background);
				g.fillRect(0, 0, width, height);
			}
			g.drawImage(source, 0, 0, width, height, null);
		} finally {
			g.dispose();
		}
		return target;
	}

	private byte[] writeJpeg(BufferedImage image) throws IOException {
		Iterator<ImageWriter> writers = ImageIO.getImageWritersByFormatName("jpeg");
		if (!writers.hasNext())
			throw new IOException("No JPEG writer available");
		ImageWriter writer = writers.next();

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		try (ImageOutputStream ios = ImageIO.createImageOutputStream(out)) {
			writer.setOutput(ios);
			ImageWriteParam param = writer.getDefaultWriteParam();
			param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
			param.setCompressionQuality(jpegQuality);
			writer.write(null, new IIOImage(image, null, null), param);
		} finally {
			writer.dispose();
		}
		return out.toByteArray();
	}

	/**
	 * Phone photos are often stored sideways with an EXIF tag telling the viewer to rotate them. The browser honours
	 * that tag, but the re-encoded JPEG carries no EXIF, so the rotation is applied to the pixels here.
	 */
	static BufferedImage applyExifOrientation(BufferedImage image, int orientation) {
		if (orientation <= 1 || orientation > 8)
			return image;

		int w = image.getWidth();
		int h = image.getHeight();
		boolean swap = orientation >= 5;
		AffineTransform t = new AffineTransform();
		switch (orientation) {
		case 2: t.translate(w, 0); t.scale(-1, 1); break;                       // mirror
		case 3: t.translate(w, h); t.rotate(Math.PI); break;                    // 180
		case 4: t.translate(0, h); t.scale(1, -1); break;                       // flip
		case 5: t.rotate(-Math.PI / 2); t.scale(-1, 1); break;                  // transpose
		case 6: t.translate(h, 0); t.rotate(Math.PI / 2); break;                // 90 clockwise
		case 7: t.scale(-1, 1); t.translate(-h, 0); t.translate(0, w); t.rotate(3 * Math.PI / 2); break; // transverse
		case 8: t.translate(0, w); t.rotate(3 * Math.PI / 2); break;            // 90 anticlockwise
		default: return image;
		}

		BufferedImage target = new BufferedImage(swap ? h : w, swap ? w : h, BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = target.createGraphics();
		try {
			g.drawImage(image, t, null);
		} finally {
			g.dispose();
		}
		return target;
	}

	/** Reads the EXIF orientation tag (0x0112) from JPEG bytes; 1 (normal) when absent or unreadable. */
	static final class ExifOrientation {
		private ExifOrientation() {
		}

		static int read(byte[] jpeg) {
			try {
				return find(jpeg);
			} catch (RuntimeException e) {
				return 1;
			}
		}

		private static int find(byte[] b) {
			if (b.length < 4 || (b[0] & 0xFF) != 0xFF || (b[1] & 0xFF) != 0xD8)
				return 1; // not a JPEG
			int pos = 2;
			while (pos + 4 <= b.length) {
				if ((b[pos] & 0xFF) != 0xFF)
					return 1;
				int marker = b[pos + 1] & 0xFF;
				if (marker == 0xDA || marker == 0xD9)
					return 1; // image data starts - no EXIF before it
				int length = u16(b, pos + 2, false);
				if (marker == 0xE1 && pos + 10 <= b.length && b[pos + 4] == 'E' && b[pos + 5] == 'x'
						&& b[pos + 6] == 'i' && b[pos + 7] == 'f')
					return fromTiff(b, pos + 10, pos + 2 + length);
				pos += 2 + length;
			}
			return 1;
		}

		private static int fromTiff(byte[] b, int tiff, int end) {
			boolean little = b[tiff] == 'I' && b[tiff + 1] == 'I';
			int ifd = tiff + u32(b, tiff + 4, little);
			int entries = u16(b, ifd, little);
			for (int i = 0; i < entries; i++) {
				int entry = ifd + 2 + i * 12;
				if (entry + 12 > end)
					return 1;
				if (u16(b, entry, little) == 0x0112)
					return u16(b, entry + 8, little);
			}
			return 1;
		}

		private static int u16(byte[] b, int p, boolean little) {
			int a = b[p] & 0xFF;
			int c = b[p + 1] & 0xFF;
			return little ? (c << 8) | a : (a << 8) | c;
		}

		private static int u32(byte[] b, int p, boolean little) {
			return little ? (u16(b, p + 2, true) << 16) | u16(b, p, true)
					: (u16(b, p, false) << 16) | u16(b, p + 2, false);
		}
	}
}
