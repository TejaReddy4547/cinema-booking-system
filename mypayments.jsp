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
<font color ="red">
<h1 >MY PAYMENTS</h1>
</font>
<font color ="orangered">
<table border="1">
<tr ><th>MOVIE NAME</th><th>TICKETS</th><th>AMOUNT</th><tr> 
<style>
body {
  background-image: url('payment.jpg');
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
ResultSet rs1 = stmt.executeQuery("select moviename,  tickets ,amount from "+name+"");
while(rs1.next()){
%>

<tr>
<td ><%=rs1.getString("moviename") %></td>
<td ><%=rs1.getInt("tickets") %></td>
<td ><%=rs1.getInt("amount") %></td>
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

