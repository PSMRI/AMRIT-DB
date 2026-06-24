package com.db.piramalswasthya.anonymizer.output;

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

    @Test
    void resetSchemaSetsSourceCatalogBeforeShowingTables() throws Exception {
        String schema = "db_identity";
        String table = "Beneficiary";
        String createDdl = "CREATE TABLE `Beneficiary` (`id` bigint)";

        DataSource targetDataSource = mock(DataSource.class);
        Connection writerConnection = mock(Connection.class);
        Connection adminConnection = mock(Connection.class);
        Statement adminStatement = mock(Statement.class);
        Statement targetStatement = mock(Statement.class);

        DataSource sourceDataSource = mock(DataSource.class);
        Connection tableListConnection = mock(Connection.class);
        Statement tableListStatement = mock(Statement.class);
        ResultSet tableListResultSet = mock(ResultSet.class);
        Connection ddlConnection = mock(Connection.class);
        Statement ddlStatement = mock(Statement.class);
        ResultSet ddlResultSet = mock(ResultSet.class);

        when(targetDataSource.getConnection()).thenReturn(writerConnection, adminConnection);
        when(adminConnection.createStatement()).thenReturn(adminStatement);
        when(writerConnection.createStatement()).thenReturn(targetStatement);

        when(sourceDataSource.getConnection()).thenReturn(tableListConnection, ddlConnection);
        when(tableListConnection.createStatement()).thenReturn(tableListStatement);
        when(tableListStatement.executeQuery("SHOW TABLES")).thenReturn(tableListResultSet);
        when(tableListResultSet.next()).thenReturn(true, false);
        when(tableListResultSet.getString(1)).thenReturn(table);

        when(ddlConnection.createStatement()).thenReturn(ddlStatement);
        when(ddlStatement.executeQuery("SHOW CREATE TABLE `Beneficiary`")).thenReturn(ddlResultSet);
        when(ddlResultSet.next()).thenReturn(true);
        when(ddlResultSet.getString(2)).thenReturn(createDdl);

        DirectRestoreWriter writer = new DirectRestoreWriter(targetDataSource, 100, schema);

        writer.resetSchema(sourceDataSource);

        InOrder tableDiscoveryOrder = inOrder(tableListConnection, tableListStatement);
        tableDiscoveryOrder.verify(tableListConnection).setCatalog(schema);
        tableDiscoveryOrder.verify(tableListConnection).createStatement();
        tableDiscoveryOrder.verify(tableListStatement).executeQuery("SHOW TABLES");

        verify(ddlStatement).executeQuery("SHOW CREATE TABLE `Beneficiary`");
        verify(targetStatement).addBatch(createDdl);
        verify(targetStatement).executeBatch();
    }

    @Test
    void closeCommitsWhenMarkedSuccessful() throws Exception {
        DataSource targetDataSource = mock(DataSource.class);
        Connection connection = mock(Connection.class);
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
        Connection connection = mock(Connection.class);
        when(targetDataSource.getConnection()).thenReturn(connection);

        DirectRestoreWriter writer = new DirectRestoreWriter(targetDataSource, 100, "db_identity");

        writer.close();

        verify(connection).rollback();
        verify(connection, never()).commit();
        verify(connection).close();
    }
}
