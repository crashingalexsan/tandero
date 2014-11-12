<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 10/11/14
  Time: 07:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    if(session.getAttribute("email")==null)
        response.sendRedirect("error.jsp");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Change Password || Tandero.com</title>
</head>
<body>
<h1>Change Password</h1>
<p style="color: #ff0000">${sessionScope['error']}</p>
<% session.setAttribute("error", null); %>
<p>Enter your actually password:</p>
<form name="form" method="post" action="ConfirmServlet">
    <label for="password"></label>
    <input type="password" name="password" id="password" required="required">
    <input type="submit" name="submit" id="submit" value="Send">
</form>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>
