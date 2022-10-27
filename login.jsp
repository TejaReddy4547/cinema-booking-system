<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("id");
String pwd=request.getParameter("password");
 
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<body>
<style>
body {
  background-image: url('login.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

<%
try
{

String id1 = "admin";
String pwd1="Admin";
if((id .equals( id1))&&(pwd.equals( pwd1)))
{
response.sendRedirect("http://localhost:7036/SRKR/adminmovies.jsp");
}
else
{
int y=0;
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/reddy","root","Teja@4547");
Statement statement=connection.createStatement();
String sql ="select userid , password from register";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next())
{      
  String loginid=resultSet.getString("userid");
  String password=resultSet.getString("password"); 
	if((loginid .equals( id))&&(password .equals( pwd)))
         { 
	session.setAttribute("user", id); 
	response.sendRedirect("http://localhost:7036/SRKR/usermovies.jsp"); 
	 y=y+1;
              
           }
}
if(y==0)
{

out.println("LOGINID OR PASSWORD IS WRONG");

}
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>

</body>
</html>
