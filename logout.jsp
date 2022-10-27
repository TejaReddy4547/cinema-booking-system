<!DOCTYPE html>
<html>
<body>
<%
session.invalidate();
response.sendRedirect("loginjsp.html");
%>
</body>
</html>