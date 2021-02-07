

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    
        <title>Drs & Tas  Office Hours</title>
    </head>

    <body>
        <h1>Drs & Tas  Office Hours</h1>
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

                RS = Stmt.executeQuery("SELECT * FROM office_hours;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <table border="1">
            <tr>
                <th>Name</th>
                <th>Course ID</th>
                <th>Course Name</th> 
                <th>Sat</th> 
                <th>Sun</th> 
                <th>Mon</th>
                <th>Tues</th>
                <th>Wed</th> 
                <th>Thu</th> 
                 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("name")%></td>
                <td><%=RS.getString("courseid")%></td>
                <td><%=RS.getString("coursename")%></td>
                <td><%=RS.getString("sat")%></td>
                <td><%=RS.getString("sun")%></td>
                <td><%=RS.getString("mon")%></td>
                <td><%=RS.getString("tues")%></td>
                <td><%=RS.getString("wed")%></td>
                <td><%=RS.getString("thu")%></td>
            </tr>
            <%}%>
        </table>
        <br/>
        <div style="margin: auto; width: 50%; text-align: center"><br><br>
                <a href="LoginSuccess.jsp"><button class = "btn btn-success btn-lg">Back</button></a>
                  </div>
    </body>
</html>

<%
    RS.close();
    Stmt.close();
    Con.close();
%>