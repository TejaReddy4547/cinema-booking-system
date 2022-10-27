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


String userid=request.getParameter("userid");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String lname=request.getParameter("lname");
String dob=request.getParameter("dob");
String pwd=request.getParameter("pwd");
String address=request.getParameter("address");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
PreparedStatement st = conn.prepareStatement("insert into register(userid, firstname , middlename, lastname , dateofbirth , password , address ) " + "values(?,?,?,?,?,?,?)");
st.setString(1, userid);
st.setString(2, fname);
st.setString(3, mname);
st.setString(4, lname);
st.setString(5, dob);
st.setString(6, pwd);
st.setString(7, address);
int  j = st.executeUpdate();
if((j!=0))
{
response.sendRedirect("http://localhost:7036/SRKR/loginjsp.html");
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




<%

ex.printStackTrace();
}

%>
   </body>
</html>
