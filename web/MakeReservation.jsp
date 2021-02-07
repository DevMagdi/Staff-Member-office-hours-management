<%-- 
    Document   : makeATransaction
    Created on : Dec 23, 2020, 9:59:45 AM
    Author     : fsam5
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    
        <title>Making A Reservation </title>
        <style>
            .form{
                margin: auto;
                width: 50%;
                border: 3px solid black;
                padding: 10px 0px 30px 10px;
                font-size: 25px;
                text-align: center;
            }
        </style>
    </head>
    <body class="mt-10">
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

                RS = Stmt.executeQuery("SELECT name,courseid FROM office_hours;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
            <div class="m-auto text-center mt-5" style="margin: 10px 0 0 10px; width: 400px">
            <form action="makeReservation" method="post"class="mt-5 border px-4 py-5" style="padding: 10px;">
                <h3>Make Reservation Appointment</h3>
                <table class="w-100">
                    <tbody>
                        <tr>

                        </tr>
                         <tr>
                            <td><input type="text" placeholder="Member Staff:"
                                name="members" class="form-control mt-2" /> <span
                                id="usernameErrorMsg" class="text-danger"></span></td>
                        </tr>
                        
                        <tr></tr>
                         <tr>
                            <td><input type="number" placeholder="Slot:"
                                name="slot" class="form-control mt-2" /> <span
                                id="usernameErrorMsg" class="text-danger"></span></td>
                        </tr>
                        
                        <tr></tr>
                        <tr>
                            <td><input type="date" placeholder="Date:" name="date"
                                class="form-control mt-2" /> <span id="nameErrorMsg"
                                class="text-danger"></span></td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td><input type="text" placeholder="Mail:" name="mail"
                                class="form-control mt-2" /> <span id="nameErrorMsg"
                                class="text-danger"></span></td>
                        </tr>
                        <tr></tr>

                    </tbody>
                <tr></tr>
            </table><br><br>
            <br> <input type="submit" class="btn btn-primary" value="Reserve">
             
        </form>
                <div style="margin: auto; width: 50%; text-align: center"><br><br>
                <a href="LoginSuccess.jsp"><button class = "btn btn-success btn-lg">Back</button></a>
                  </div>
    </div>
    </body>
</html>
