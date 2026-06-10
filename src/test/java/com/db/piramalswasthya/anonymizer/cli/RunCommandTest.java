package com.db.piramalswasthya.anonymizer.cli;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import com.db.piramalswasthya.anonymizer.config.AnonymizationRules;
import com.db.piramalswasthya.anonymizer.core.AnonymizationEngine;
import com.db.piramalswasthya.anonymizer.core.KeysetPaginator;
import com.db.piramalswasthya.anonymizer.output.DirectRestoreWriter;

class RunCommandTest {

    @Test
    @SuppressWarnings("unchecked")
    void processTableAddsUnknownColumnsAsPreserveWithoutMutatingUnmodifiableGetter() throws Exception {
        RunCommand command = new RunCommand();
        AnonymizationRules rules = new AnonymizationRules();
        rules.setUnknownColumnPolicy(AnonymizationRules.UnknownColumnPolicy.WARN);

        AnonymizationRules.ColumnRule idRule = new AnonymizationRules.ColumnRule();
        idRule.setStrategy("PRESERVE");

        AnonymizationRules.TableRules tableRules = new AnonymizationRules.TableRules();
        tableRules.setPrimaryKey("id");
        tableRules.setColumns(new LinkedHashMap<>(Map.of("id", idRule)));

        KeysetPaginator paginator = mock(KeysetPaginator.class);
        when(paginator.getTableColumns("Beneficiary")).thenReturn(List.of("id", "newColumn"));

        AnonymizationEngine engine = mock(AnonymizationEngine.class);
        DirectRestoreWriter writer = mock(DirectRestoreWriter.class);

        command.processTable("db_identity", "Beneficiary", tableRules, rules, engine, paginator, writer);

        ArgumentCaptor<List<String>> columnsCaptor =
            ArgumentCaptor.forClass((Class<List<String>>) (Class<?>) List.class);
        verify(paginator).streamTable(eq("Beneficiary"), eq("id"), columnsCaptor.capture(), any());

        assertEquals(List.of("id", "newColumn"), columnsCaptor.getValue());
        assertEquals("PRESERVE", tableRules.getColumns().get("newColumn").getStrategy());
    }

}
