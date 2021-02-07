<%@ page import="java.util.*" %> 
<html>
<head>
</head>
<body>

<br><br><br><br><br><br>
<table width="700px" align="center"
style="border:1px solid #000000;">
<tr>
<td colspan=8 align="center"
style="background-color:ffeeff">
<b>Employee Record</b></td>
</tr>
<tr style="background-color:efefef;">
<td><b>Employee Name</b></td>
<td><b>Username</b></td>
<td><b>Email</b></td>
<td><b>Contact No</b></td>
<td><b>Address</b></td>
<td><b>Country</b></td>
<td><b>State</b></td>
<td><b>Department</b></td>

</tr>
<%
int count=0;
String color = "#F9EBB3";


if(request.getAttribute("empList")!=null)
{
ArrayList al = (ArrayList)request.getAttribute("empList");
Iterator itr = al.iterator();


while(itr.hasNext()){

if((count%2)==0){
color = "#eeffee";
}
else{
color = "#F9EBB3";
}
count++;
ArrayList empList = (ArrayList)itr.next();
%>
<tr style="background-color:<%=color%>;">
<td><%=empList.get(0)%></td>
<td><%=empList.get(1)%></td>
<td><%=empList.get(2)%></td>

</tr>
<%
}
}
%>
<%
if(count==0){
%>
<tr>
<td colspan=8 align="center"
style="background-color:eeffee"><b>No Record</b></td>
</tr>
<%
}
%>
</table>
</body>
</html>