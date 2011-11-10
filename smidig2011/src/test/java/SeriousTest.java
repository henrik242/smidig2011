import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import static org.junit.Assert.assertEquals;

public class SeriousTest {

    Connection conn;

    @Before
    public void setup() throws Exception {
        Class.forName("org.sqlite.JDBC");
        conn = DriverManager.getConnection("jdbc:sqlite:/opt/sqlite/smidig2011.sqlite");
    }

    @Test
    public void shouldNotFail() throws Exception {
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery("select message from newsmidig2011;");
        assertEquals("shoop shoop", rs.getString("message"));
        rs.close();
    }

    @After
    public void teardown() throws Exception {
        conn.close();
    }
}
