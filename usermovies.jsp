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
.button-container form,
.button-container form div {
    display: inline;
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
<style>
body {
  background-image: url('movie.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
<h2 style="color:red;">Upcoming Movie's Trailers
</h2>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement statement=connection.createStatement();
String sql1 ="select poster,video from trailers";
ResultSet resultSet1 = statement.executeQuery(sql1);
while(resultSet1.next())
{ 

String poster=resultSet1.getString("poster");
String video=resultSet1.getString("video");
%>
<video width="440" height="270" poster="<%= poster %>" controls>
    <source src="<%= video %>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
 </video>
<%
}
%>

<h2 style="color:red;">Book your show</h2>

<%
String sql2 ="select movieimage from movies order by movieid";
ResultSet resultSet2 = statement.executeQuery(sql2);
int i = 0;
%>
<div class="button-container">
<%
while(resultSet2.next())
{ 
i=i+1;
String movieimage=resultSet2.getString("movieimage");
 
if(i==1)
{ %>
<form method="post" action="http://localhost:7036/SRKR/1.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
else if(i == 2)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/2.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
else if(i == 3)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/3.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
else if(i == 4)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/4.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
else if(i == 5)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/5.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
else if(i == 6)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/6.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
else if(i == 7)
{
 %>
<form method="post" action="http://localhost:7036/SRKR/7.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
else 
{
 %>
<form method="post" action="http://localhost:7036/SRKR/8.jsp">
<input type="image" src="<%= movieimage %>" name="submit" width="330" height="360" alt="submit"/> 
</form>
<%
}
}
%>


</div>
</body>
</html>
