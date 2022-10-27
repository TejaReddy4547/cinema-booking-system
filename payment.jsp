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
  background-image: url('payment.jpg');
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
String name=(String)session.getAttribute("user"); 
String moviename=(String)session.getAttribute("moviename");
String screenno=(String)session.getAttribute("screenno");
String date=(String)session.getAttribute("date"); 
String showtimings=(String)session.getAttribute("showtimings");
String seattype=(String)session.getAttribute("seattype");
Integer tickets=(Integer)session.getAttribute("tickets");
Integer amount=(Integer)session.getAttribute("amount");
%>
<font color ="red">
<h1 >PAYMENT SLIP</h1>
</font>
<font color ="white">
<br>
<table border="1">
<tr ><th>USER NAME</th><th>MOVIE NAME</th><th>NO OF TICKETS</th><th>SEAT TYPE</th><th>TOTAL AMOUNT</th></tr> 
<tr ><td><%= name %></td><td><%= moviename %></td><td><%= tickets %></td><td><%= seattype %></td><td><%= amount %></td></tr> 

</font>
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement st=conn.createStatement();
String theatrename=(String)session.getAttribute("theatrename");
int i=st.executeUpdate("insert into admin (date, screenno, theatrename, seattype, tickets, showtimings, amount)values('"+date+"','"+screenno+"','"+theatrename+"','"+seattype+"',"+tickets+",'"+showtimings+"',"+amount+")");
int j=st.executeUpdate("insert into "+name+"(moviename, date, screenno, theatrename, seattype, showtimings, tickets, amount)values('"+moviename+"','"+date+"','"+screenno+"','"+theatrename+"','"+seattype+"','"+showtimings+"',"+tickets+","+amount+")");


}
catch(Exception e)
{

}

%>
<center>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
</center>
</body>
</html>
