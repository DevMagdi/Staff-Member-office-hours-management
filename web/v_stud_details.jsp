<%-- 
    Document   : showProjects
    Created on : Oct 17, 2019, 3:14:02 PM
    Author     : ahmed
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Contact Details</title>
    </head>

    <body>
        <h1>Student Details</h1>
        <%
            String url = "jdbc:mysql://localhost:3306/staffmember";
            String user = "root";
            String password = "";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;

            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                //int rows_affected = Stmt.executeUpdate("INSERT INTO department VALUES ('TestDepartment', 100, '111111101', '1988-05-22');");
                //out.println("Number of Rows Affected  "+ rows_affected);

                RS = Stmt.executeQuery("SELECT * FROM student;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <table border="1">
            <tr>
                <th>ID</th> 
                <th>Name</th> 
                <th>Mail</th> 
                
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("id")%></td>
                <td><%=RS.getString("name")%></td>
                <td><%=RS.getString("mail")%></td>
                
            </tr>
            <%}%>
        </table>
        <br/>
        <a href="index.html">Bach to Home</a>
    </body>
</html>

<%
    RS.close();
    Stmt.close();
    Con.close();
%>