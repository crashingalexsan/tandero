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
<p style="color: #37d01b">${sessionScope['ok']}</p>
<% if(session.getAttribute("ok")==null){ %>
<p style="color: #ff0000">${sessionScope['error']}</p>
<% session.setAttribute("error", null); %>
<% session.setAttribute("ok", null); %>
<p>Enter the new password:</p>
<form name="form1" method="post" action="ChangePass">
    <p><label for="password">Password: </label>
    <input type="password" name="password" id="password" pattern="(?=.*[a-zA-Z0-9]).{6,15}" title="Password must contain at least 6 characters." required="required"></p>
    <p><label for="password2">Confirm Password: </label>
    <input type="password" name="password2" id="password2" pattern="(?=.*[a-zA-Z0-9]).{6,15}" title="Password must contain at least 6 characters." required="required"></p>
    <input type="submit" name="submit" id="submit" value="Send">
</form>
<% } %>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>