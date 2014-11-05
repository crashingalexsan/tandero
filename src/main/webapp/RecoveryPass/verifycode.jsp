<%--
    Document   : verifycode
    Created on : 014-oct-2014, 17:50:20
    Author     : Daniel
--%>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<t:if test="${sessionScope['sessionVCode']!=null}">
    <% response.setContentType("text/html");
        RequestDispatcher rd=request.getRequestDispatcher("vpass.jsp");
        rd.forward(request, response);%>
</t:if>
<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
    <title>Verify Code || TANDERO</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body>

<p><strong>Enter your email & code for change your password.</strong></p>
<p style="color: #ff0000">${sessionScope['error']}</p>
<form action="VerifyCodeServlet" method="post">
    <label for="textfield">E-mail:</label>
    <input type="text" name="Remail" id="Remail">
    <br>
    <label for="textfield2">Code:</label>
    <input type="code" name="code" id="code">
    <br>
    <input type="submit" value="Recovery">
</form>
<br>
<br>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>