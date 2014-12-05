<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 10/11/14
  Time: 07:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    if(session.getAttribute("email")==null)
        response.sendRedirect("error.jsp");

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Settings</title>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>
<h1>Account Settings</h1>
<form id="changepass" action="RServlet" method="post" target="main">
    <input hidden="yes" name="value" value="Account/ChangePass/index.jsp">
</form>
<form id="editprofile" action="RServlet" method="post" target="main">
    <input hidden="yes" name="value" value="Profile/editprofile.jsp">
</form>

<a href="#" target="main" onclick="document.getElementById('changepass').submit();">Change Password</a><br>
<a href="#" target="main" onclick="document.getElementById('editprofile').submit();">Edit Profile</a><br>

<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>
