<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
margin: 0;
font-family: Arial, Helvetica, sans-serif;
}

.topnav {
overflow: hidden;
background-color: #333;
}

.topnav a {
float: left;
color: #f2f2f2;
text-align: center;
padding: 14px 16px;
text-decoration: none;
font-size: 17px;
}

.topnav a:hover {
background-color: #ddd;
color: black;
}

.topnava.active {
background-color: #4CAF50;
color: white;
}
body {
  background-image: url('booking.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
</style>
</head>
<body>
<div class="topnav">
<a href="http://localhost:7036/SRKR/usermovies.jsp" target="_self"  class="active" >MOVIES</a>
<a href="http://localhost:7036/SRKR/mybookings.jsp" target="_self" class="active" >MY BOOKINGS</a>
<a href="http://localhost:7036/SRKR/mypayments.jsp" target="_self" class="active" >MY PAYMENTS</a>
<a href="http://localhost:7036/SRKR/logout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
} 
catch (ClassNotFoundException e) 
{
e.printStackTrace();
}

try
{

String scno=request.getParameter("t1");
int i=Integer.parseInt(scno); 
String seat=request.getParameter("seat");
int a;
if(seat .equals( "Ordinary"))
{
	a=100;
}
else if(seat .equals( "Executive"))
{
	a=150;
}
else
{
        a=200;
}
int s = i*a;
String date=request.getParameter("date");
String seattype=request.getParameter("seat");
String showtimings=request.getParameter("show");
session.setAttribute("showtimings", showtimings); 
session.setAttribute("date", date); 
session.setAttribute("tickets", i); 
session.setAttribute("amount", s); 
session.setAttribute("seattype",seattype); 

String name=(String)session.getAttribute("user"); 
String moviename=(String)session.getAttribute("moviename");
String theatrename=(String)session.getAttribute("theatrename");
String theatreaddress=(String)session.getAttribute("theatreaddress");
String screenno=(String)session.getAttribute("screenno");
%>
<font color ="red">
<h1 >TICKET DETAILS</h1>
</font>
<font color ="OrangeRed">
<br>
<table border="1">
<tr ><th>USER NAME</th><th>MOVIE NAME</th><th>SCREEN NO</th><th>DATE</th><th>SHOW TIMINGS</th><th>THEATRE NAME</th><th>THEATRE ADDRESS</th><th>NO OFTICKETS</th><th>TOTAL AMOUNT</th></tr> 
<tr ><td><%= name %></td><td><%= moviename %></td><td><%= screenno %></td><td><%= date %></td><td><%= showtimings %></td><td><%= theatrename %></td><td><%= theatreaddress %></td><td><%= scno %></td><td><%= s %></td></tr> 
</font>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement statement=connection.createStatement();
String sql1 = "create table "+ name +"(moviename varchar(25) ,date varchar(20),screenno varchar(20),theatrename varchar(100),seattype varchar(30),showtimings varchar(20),tickets int ,amount int);";
statement.executeUpdate(sql1);
}
catch(Exception e)
{

}
finally
{%>
<center>
<form name="form1" method="post" action="http://localhost:7036/SRKR/payment.jsp" >
<input type="submit" value="CONFIRM and MAKE PAYMENT">
</form>
</center>
<%
}

%>

</body>
</html>
