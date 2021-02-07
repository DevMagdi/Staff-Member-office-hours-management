
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity=
              "sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    
<title>Login Success Page</title>
</head>
<body>
    
    
    <div  class="m-auto text-center mt-5" style="margin: 100px 50px 30px 700px;">
        <h3>Hi Student ID: <%=request.getSession().getAttribute("sessionUserID")%></h3>
        <br><a href="showstaff.jsp"><button class="btn btn-primary">Show Staff For Specific Subject</button></a>
        <br><br><a href="search.jsp"><button class="btn btn-primary">Search for specific contact</button></a>
         <br><br><a href="ShowOfficeHours.jsp"><button class="btn btn-primary">View The Office Hours Schedule</button></a>
         <br><br><a href="MakeReservation.jsp"><button class="btn btn-primary">Reserve an appointment</button></a>
         <br><br><a href="cancelReservation.jsp"><button class="btn btn-primary">Cancel an appointment Reservation</button></a>
         <br><br><a href="messagetostaff.jsp"><button class="btn btn-primary">Message to Staff Member</button></a>
         <br><br><a href="UpdateUser"><button class="btn btn-primary">Edit Your Profile</button></a>
        <br><br><a href="logout"><button class="btn btn-danger">LogOut</button></a>
        
    </div>

</body>
</html>
