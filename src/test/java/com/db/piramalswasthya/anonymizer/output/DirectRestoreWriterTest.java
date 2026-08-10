package com.db.piramalswasthya.anonymizer.output;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.inOrder;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.mockito.InOrder;

class DirectRestoreWriterTest {

    /** Writer connection with a permissive statement mock for the constructor's DDL/session setup. */
    private static Connection mockWriterConnection() throws Exception {
        Connection conn = mock(Connection.class);
        Statement stmt = mock(Statement.class);
        when(conn.createStatement()).thenReturn(stmt);
        return conn;
    }

    @Test
    void resetSchemaClonesTablesAndViewsFromSource() throws Exception {
        String schema = "db_identity";
        String createDdl = "CREATE TABLE `Beneficiary` (`id` bigint)";
        String viewDdl = "CREATE VIEW `v_search` AS SELECT 1";

        DataSource targetDataSource = mock(DataSource.class);
        Connection writerConnection = mock(Connection.class);
        Statement writerSetupStatement = mock(Statement.class);
        Statement targetDdlStatement = mock(Statement.class);
        // Constructor creates statements (ensureSchemaExists + FK checks), then clone creates one more
        when(writerConnection.createStatement())
            .thenReturn(writerSetupStatement, writerSetupStatement, targetDdlStatement);
        when(targetDataSource.getConnection()).thenReturn(writerConnection);

        DataSource sourceDataSource = mock(DataSource.class);
        Connection tableListConnection = mock(Connection.class);
        Statement tableListStatement = mock(Statement.class);
        ResultSet tableListResultSet = mock(ResultSet.class);
        Connection ddlConnection = mock(Connection.class);
        Statement ddlStatement = mock(Statement.class);
        ResultSet tableDdlResultSet = mock(ResultSet.class);
        ResultSet viewDdlResultSet = mock(ResultSet.class);

        when(sourceDataSource.getConnection()).thenReturn(tableListConnection, ddlConnection);
        when(tableListConnection.createStatement()).thenReturn(tableListStatement);
        when(tableListStatement.executeQuery("SHOW FULL TABLES")).thenReturn(tableListResultSet);
        when(tableListResultSet.next()).thenReturn(true, true, false);
        when(tableListResultSet.getString(1)).thenReturn("Beneficiary", "v_search");
        when(tableListResultSet.getString(2)).thenReturn("BASE TABLE", "VIEW");

        when(ddlConnection.createStatement()).thenReturn(ddlStatement);
        when(ddlStatement.executeQuery("SHOW CREATE TABLE `Beneficiary`")).thenReturn(tableDdlResultSet);
        when(tableDdlResultSet.next()).thenReturn(true);
        when(tableDdlResultSet.getString(2)).thenReturn(createDdl);
        when(ddlStatement.executeQuery("SHOW CREATE VIEW `v_search`")).thenReturn(viewDdlResultSet);
        when(viewDdlResultSet.next()).thenReturn(true);
        when(viewDdlResultSet.getString(2)).thenReturn(viewDdl);

        DirectRestoreWriter writer = new DirectRestoreWriter(targetDataSource, 100, schema);
        writer.resetSchema(sourceDataSource);

        // Tables are dropped and re-created from source DDL, views cloned after
        InOrder ddlOrder = inOrder(targetDdlStatement);
        ddlOrder.verify(targetDdlStatement).execute("DROP TABLE IF EXISTS `Beneficiary`");
        ddlOrder.verify(targetDdlStatement).execute(createDdl);
        ddlOrder.verify(targetDdlStatement).execute("DROP VIEW IF EXISTS `v_search`");
        ddlOrder.verify(targetDdlStatement).execute(viewDdl);

        // Constructor must have created the schema and disabled FK checks
        verify(writerSetupStatement).execute("CREATE DATABASE IF NOT EXISTS `db_identity`");
        verify(writerSetupStatement).execute("SET FOREIGN_KEY_CHECKS=0");
        verify(writerConnection).setCatalog(schema);
    }

    @Test
    void closeCommitsWhenMarkedSuccessful() throws Exception {
        DataSource targetDataSource = mock(DataSource.class);
        Connection connection = mockWriterConnection();
        when(targetDataSource.getConnection()).thenReturn(connection);

        DirectRestoreWriter writer = new DirectRestoreWriter(targetDataSource, 100, "db_identity");

        writer.markSuccess();
        writer.close();

        verify(connection).commit();
        verify(connection, never()).rollback();
        verify(connection).close();
    }

    @Test
    void closeRollsBackWhenNotMarkedSuccessful() throws Exception {
        DataSource targetDataSource = mock(DataSource.class);
        Connection connection = mockWriterConnection();
        when(targetDataSource.getConnection()).thenReturn(connection);

        DirectRestoreWriter writer = new DirectRestoreWriter(targetDataSource, 100, "db_identity");

        writer.close();

        verify(connection).rollback();
        verify(connection, never()).commit();
        verify(connection).close();
    }

    @Test
    void stripDefinerRemovesDefinerClause() {
        assertEquals("CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v` AS select 1",
            DirectRestoreWriter.stripDefiner(
                "CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`10.0.%` SQL SECURITY DEFINER VIEW `v` AS select 1"));
        assertEquals("CREATE VIEW `v` AS select 1",
            DirectRestoreWriter.stripDefiner("CREATE DEFINER=root@localhost VIEW `v` AS select 1"));
    }
}
