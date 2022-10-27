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
<a href="http://localhost:7036/SRKR/adminmovies.jsp" target="_self"  class="active" >MOVIES</a>
<!--<a class="active" href="book.jsp" target="_self">Home</a>-->
<a href="http://localhost:7036/SRKR/moviedetails.jsp" target="_self" class="active" >MOVIE DETAILS</a>
<a href="http://localhost:7036/SRKR/payments.jsp" target="_self" class="active" >SHOW PAYMENTS</a>
<a href="http://localhost:7036/SRKR/logout.jsp" target="_self" class="active" >LOGOUT</a>
</div>
<font color ="red">
<h1 >MOVIE DETAILS</h1>
</font>
<center>
<font color ="cornsilk">
<h2 >MOVIES</h2>

<table border="1">
<tr ><th>MOVIEID</th><th>MOVIE NAME</th><th>CAST</th><th>THEATRE NAME</th><th>THEATRE ADDRESS</th><th>SCREEN NO</th><tr> 
<style>
body {
  background-image: url('moviedetails.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

<%
try{
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement stmt=con.createStatement();
ResultSet rs1 = stmt.executeQuery("select movieid, movieimage, moviename, cast, theatrename, theatreaddress, screenno from movies");
while(rs1.next()){
%>

<tr>
<td ><%=rs1.getInt("movieid") %></td>
<td ><%=rs1.getString("moviename") %></td>
<td ><%=rs1.getString("cast") %></td>
<td ><%=rs1.getString("theatrename") %></td>
<td ><%=rs1.getString("theatreaddress") %></td>
<td ><%=rs1.getInt("screenno") %></td>
</tr>

<%

}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</font>
</table>
<form method="post" action="addmovie.html">
<input type="submit" value="Add Movie">
</form>
<form method="post" action="deletemovie.html">
<input type="submit" value="Delete Movie">
</form>
<h2 >TRAILERS</h2>
<table border="1">
<tr ><th>TRAILER ID</th><th>MOVIE NAME</th><tr> 
<%
try{
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement stmt=con.createStatement();
ResultSet rs2 = stmt.executeQuery("select sno, moviename from trailers");
while(rs2.next()){
%>
<tr>
<td ><%=rs2.getInt("sno") %></td>
<td ><%=rs2.getString("moviename") %></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<form method="post" action="addtrailer.html">
<input type="submit" value="Add Trailer">
</form>
<form method="post" action="deletetrailer.html">
<input type="submit" value="Delete Trailer">
</form>

</center>
<p>
<strong>
NOTE:</strong>
Before adding movie or trailer please check the movie or trailer details whether there is a free slot are not , maximum movies in theatre is 8 and trailers is 3
</p>
</font>
</body>
</html>
