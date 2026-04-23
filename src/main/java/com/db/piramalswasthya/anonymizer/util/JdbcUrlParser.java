package com.db.piramalswasthya.anonymizer.util;

/**
 * Lightweight JDBC URL parser used by CLI utilities.
 * Supports URLs like: jdbc:mysql://host:3306/dbname?params
 */
public final class JdbcUrlParser {
    private JdbcUrlParser() {}

    public static record Parts(String host, int port, String database) {}

    public static Parts parse(String url) {
        if (url == null) return null;
        try {
            String u = url.trim();
            if (!u.startsWith("jdbc:")) return null;
            u = u.substring(5);
            int idx = u.indexOf("//");
            if (idx >= 0) u = u.substring(idx + 2);
            int slash = u.indexOf('/');
            String hostPort = (slash >= 0) ? u.substring(0, slash) : u;
            String rest = (slash >= 0) ? u.substring(slash + 1) : "";
            String host = hostPort;
            int port = 3306;
            if (hostPort.contains(":")) {
                String[] hp = hostPort.split(":", 2);
                host = hp[0];
                try { port = Integer.parseInt(hp[1]); } catch (NumberFormatException ex) { port = 3306; }
            }
            String db = rest;
            int q = db.indexOf('?'); if (q >= 0) db = db.substring(0, q);
            if (db != null && db.isBlank()) db = null;
            return new Parts(host, port, db);
        } catch (Exception e) {
            return null;
        }
    }
}
