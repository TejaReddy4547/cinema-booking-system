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
<a href="http://localhost:7036/SRKR/adminmovies.jsp" target="_self"  class="active" >MOVIES</a>
<!--<a class="active" href="book.jsp" target="_self">Home</a>-->
<a href="http://localhost:7036/SRKR/moviedetails.jsp" target="_self" class="active" >MOVIE DETAILS</a>
<a href="http://localhost:7036/SRKR/payments.jsp" target="_self" class="active" >SHOW PAYMENTS</a>
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

%>
<div class="button-container">
<%
while(resultSet2.next())
{ 

String movieimage=resultSet2.getString("movieimage");
%>
<form>
<img src="<%= resultSet2.getString("movieimage") %>" alt="movie image" width ="330" height ="360"> 
</form>
<%
}
%>


</div>
</body>
</html>

