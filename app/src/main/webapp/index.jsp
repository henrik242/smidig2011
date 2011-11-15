<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%

    Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:/opt/sqlite/smidig2011.sqlite");
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery("select message from newsmidig2011;");
    String messages = "";
    while (rs.next()) {
      messages += rs.getString("message");
    }
    rs.close();
    conn.close();
%><html>
<body>
<h2>Hello Smidig 2011!</h2>

<%= messages %>
</body>
</html>
