<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<div class="topnav">
<a href="http://localhost:7036/SRKR/usermovies.jsp" target="_self"  class="active" >MOVIES</a>
<a href="http://localhost:7036/SRKR/mybookings.jsp" target="_self" class="active" >MY BOOKINGS</a>
<a href="http://localhost:7036/SRKR/mypayments.jsp" target="_self" class="active" >MY PAYMENTS</a>
<a href="http://localhost:7036/SRKR/logout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<style>
body {
  background-image: url('image.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement statement=connection.createStatement();
String sql ="select movieimage,movietrailer,poster,moviename, cast, theatrename, theatreaddress, screenno from movies where movieid = 3";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
String moviename = resultSet.getString("moviename");
String poster=resultSet.getString("poster");
String video=resultSet.getString("movietrailer");
String theatrename = resultSet.getString("theatrename");
String theatreaddress = resultSet.getString("theatreaddress");
String screenno = resultSet.getString("screenno");
session.setAttribute("moviename", moviename); 
session.setAttribute("screenno", screenno); 
session.setAttribute("theatrename", theatrename);
session.setAttribute("theatreaddress", theatreaddress);
%>
<form name="form1" method="post" action="http://localhost:7036/SRKR/booking.jsp" >
<h1 style="color:red;"><%= moviename %>
</h1>
<video width="440" height="270" poster="<%= poster %>" controls >
    <source src="<%= video %>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
</video>
<h1 style="color:red;"> Cast :
</h1> 
<h2 style="color:coral;"><%= resultSet.getString("cast") %>
</h2>
<h1 style="color:red;"> Theatre Name :
</h1> 
<h2 style="color:coral;"><%= theatrename %>
</h2>
<h1 style="color:red;"> Theatre Address :
</h1> 
<h2 style="color:coral;"><%= theatreaddress %>
</h2>
<h1 style="color:red;"> Screen number :
 </h1>
<h2 style="color:coral;"><%= screenno %>
</h2>
<h2 style="color:red;">select date:
<input type="date" name="date" min="2022-04-29" max="2022-05-14" \></h2>
<h2 style="color:red;">Number of tickets:
<input type="number" min="1" max ="100" name="t1"\></h2>
<h2 style="color:red;">Select show timings:</h2>
  <input type="radio" id="show1" name="show" value="10am to 1pm">
  <label style="color:coral;" for="show1">10am to 1pm</label>
  <input type="radio" id="show2" name="show" value="3pm to 6pm">
  <label style="color:coral;" for="show2">3pm to 6pm</label>  
  <input type="radio" id="show3" name="show" value="7pm to 10pm">
  <label style="color:coral;" for="show3">7pm to 10pm</label>
  <input type="radio" id="show4" name="show" value="11pm to 2am">
  <label style="color:coral;" for="show4">11pm to 2am</label>
<h2 style="color:red;">Select Seats Type:</h2>
  <input type="radio" id="seat1" name="seat" value="Ordinary">
  <label style="color:coral;" for="seat">Ordinary cost Rs.100 per ticket</label>
  <input type="radio" id="seat2" name="seat" value="Executive">
  <label style="color:coral;" for="seat">Executive cost Rs.150 per ticket</label>  
  <input type="radio" id="seat3" name="seat" value="Premium">
  <label style="color:coral;" for="seat3">Premium cost Rs.200 per ticket</label>
  
<br>
<br>

<input type="submit" value="Book">
<%
}
%>
</form>
</body>
</html>
