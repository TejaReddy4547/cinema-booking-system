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
int sno=Integer.parseInt(request.getParameter("sno"));
String movname=request.getParameter("movname");
String poster=request.getParameter("poster");
String video=request.getParameter("video");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
PreparedStatement st = conn.prepareStatement("insert into trailers(sno, moviename, poster, video) " + "values(?,?,?,?)");
st.setInt(1,sno);
st.setString(2, movname);
st.setString(3, poster);
st.setString(4,video);
int  j = st.executeUpdate();
if(j!=0)
{
response.sendRedirect("http://localhost:7036/SRKR/adminmovies.jsp");
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
    click on yes to go back to Home page or no to logout
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
