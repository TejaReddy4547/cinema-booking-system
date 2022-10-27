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
        
        <title>delete an trailer from MySQL Database</title>
    </head>
    <body>
         <%
int slno=Integer.parseInt(request.getParameter("sno"));
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
PreparedStatement st = conn.prepareStatement("delete from trailers where sno = ?");
st.setInt(1,slno);
int  j = st.executeUpdate();
response.sendRedirect("http://localhost:7036/SRKR/moviedetails.jsp");
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
<form name="form1" method="post" action="http://localhost:7036/SRKR/logout.jsp" >
<input type="submit" value="no">
</form>
</form>
</center>
<%
ex.printStackTrace();
}



%>
    </body>
</html>
