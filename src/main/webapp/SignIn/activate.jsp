<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 03/11/14
  Time: 06:19 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    if(session.getAttribute("email")==null)
        response.sendRedirect("error.jsp");

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Active Account || Tandero.com</title>
    <meta name="viewport" content="width=device-width">
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>
<p style="color: #31B404">${sessionScope['ok']}</p>
<% if(session.getAttribute("ok")==null) { %>
<p><strong>Enter your code for activate your account.</strong></p>
<p style="color: #ff0000">${sessionScope['error']}</p>
<form action="ActivateServlet" method="post">
    <label for="textfield">Code:</label>
    <input type="code" name="code" id="code">
    <br>
    <input type="submit" value="Activate">
</form><form action="ResendCodeServlet" method="post">
    <input type="submit" value="Resend Code">
</form>
<br>
<%}%>
<%session.setAttribute("ok",null);%>
<%session.setAttribute("error",null);%>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>
