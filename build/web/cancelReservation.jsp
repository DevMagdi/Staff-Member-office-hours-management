<%-- 
    Document   : viewTransactions
    Created on : Dec 22, 2020, 10:45:58 PM
    Author     : fsam5
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel A Reservation</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    
        <style>
            .center {
                margin-left: auto;
                margin-right: auto;
            }
        </style>
    </head>
    <body>
        
        
        <h1 style="text-align:center;">All Transactions For Customer: <span style="color: red;"></span></h1>
        <h4 style="text-align:center; color: red">Choose which Transaction to cancel by clicking on its Bank Transaction ID</h4>
       <%
            String url = "jdbc:mysql://localhost:3306/staffmember";
            String user = "root";
            String password = "";
            Connection Con = null;
            String query;
            Statement Stmt = null;
            ResultSet RS = null;
            
            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();

                query = "SELECT * FROM reservation WHERE id = '" + 1 + "';";
                
                RS = Stmt.executeQuery(query);
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        
        <table border="1" class='center'>
            <tr>
                <th>ID</th> 
                <th>Member</th>
                <th>Slot</th> 
                <th>Date</th> 
                <th>Status</th>
            </tr>
            <% while(RS.next()) {%>
            <tr>
                <td><a href="cancelReservation?id=<%=RS.getString("id")%>"><%=RS.getString("id")%></a></td>
                <td><%=RS.getString("members")%></td>
                <td><%=RS.getString("slot")%></td>
                <td><%=RS.getString("date")%></td>
                <td><%=RS.getString("Status")%></td>
                
            </tr>
            
            <%}%>
        </table>
        <br>
        <div style="margin: auto; width: 50%; text-align: center"><br><br>
                <a href="LoginSuccess.jsp"><button class = "btn btn-success btn-lg">Back</button></a>
                  </div>
    </body>
</html>
