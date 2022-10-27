<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
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
<!--<a class="active" href="book.jsp" target="_self">Home</a>-->
<a href="http://localhost:7036/SRKR/mybookings.jsp" target="_self" class="active" >MY BOOKINGS</a>
<a href="http://localhost:7036/SRKR/mypayments.jsp" target="_self" class="active" >MY PAYMENTS</a>
<a href="http://localhost:7036/SRKR/logout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<font color ="OrangeRed">
<h1 >MY BOOKINGS</h1>

<table border="1">
<tr ><th>MOVIE NAME</th><th>DATE</th><th>SHOW TIMINGS</th><th>TICKETS</th><tr> 
<style>
body {
  background-image: url('booking.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

<%
try{
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement stmt=con.createStatement();
String name=(String)session.getAttribute("user"); 
ResultSet rs1 = stmt.executeQuery("select moviename, date , showtimings, tickets from "+name+" where date > 2021-07-13 order by date ");
while(rs1.next())
{
String moviename= rs1.getString("moviename");
String date= rs1.getString("date");
String showtimings= rs1.getString("showtimings");
String tickets= rs1.getString("tickets");
%>

<tr>
<td ><%=moviename %></td>
<td ><%=date %></td>
<td ><%=showtimings %></td>
<td ><%=tickets %></td>

</tr>

<%

}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</font>
</body>
</html>

