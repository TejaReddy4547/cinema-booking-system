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
<body>
<%

int movid=Integer.parseInt(request.getParameter("movid"));
String movimg=request.getParameter("movimg");
String poster=request.getParameter("poster");
String movtra=request.getParameter("movtra");
String movname=request.getParameter("movname");
String cast=request.getParameter("cast");
String tname=request.getParameter("tname");
String tadd=request.getParameter("tadd");
int scno=Integer.parseInt(request.getParameter("scno"));
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
PreparedStatement st = conn.prepareStatement("insert into movies(movieid, movieimage ,poster,movietrailer, moviename, cast, theatrename, theatreaddress, screenno) " + "values(?,?,?,?,?,?,?,?,?)");
st.setInt(1,movid);
st.setString(2, movimg);
st.setString(3, poster);
st.setString(4, movtra);
st.setString(5, movname);
st.setString(6, cast);
st.setString(7,tname);
st.setString(8,tadd);
st.setInt(9,scno);
int  j = st.executeUpdate();
if((j!=0))
{
response.sendRedirect("http://localhost:7036/SRKR/moviedetails.jsp");
}
}
catch(Exception ex)
{
%>
<script>
setTimeout(function(){ alert("something went wrong please check"); }, 1);
</script>
<style>
body {
  background-image: url('wrong.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
<h1 style="color:red";>
    click on yes to go back to movie details page or no to logout
</h1>
<center>
<form name="form1" method="post" action="http://localhost:7036/SRKR/adminmovies.jsp" >
<input type="submit" value="yes">
</form>
<form name="form1" method="post" action="http://localhost:7036/SRKR/logout.jsp" >
<input type="submit" value="no">
</form>
</center>



<%

ex.printStackTrace();
}

%>
   </body>
</html>
