<%-- 
    Document   : verifycode
    Created on : 014-oct-2014, 17:50:20
    Author     : Daniel
--%>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<t:if test="${sessionScope['sessionVCode2']==null}">
    <t:if test="${sessionScope['sessionVCode']==null}">
        <% response.sendRedirect("../error.jsp");%>
    </t:if>
    <!DOCTYPE html>
    <html>
    <head>
        <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
        <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
        <title>Change your password || TANDERO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>

    <p><strong>Enter your new password.</strong></p>
    <p style="color: #ff0000">${sessionScope['error']}</p>
    <form action="VPassServlet" method="post">
        <label for="textfield">New Password:</label>
        <input name="npass" id="npass">
        <br>
        <label for="textfield2">Confirm the password:</label>
        <input name="cpass" id="cpass">
        <br>
        <input type="submit" value="Change">
    </form>
    <br>
    <br>

    <script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

    </body>
    </html>
</t:if>

<!DOCTYPE html>
<html>
<head>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
    <title>Password Changed || TANDERO</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="btn-group btn-group-lg">

            <div class="btn-group">
                <form action="welcomeServlet" method="post">
                    <button type="submit" class="btn btn-success">Home</button>

                </form>
            </div>

            <div class="btn-group">
                <form action="faqservlet" method="post">
                    <button type="input" class="btn btn-success">Faq</button>

                </form>
            </div>
            <div class="btn-group">
                <form action="profileServlet" method="post">
                    <button type="submit" class="btn btn-success">Profile</button>

                </form>
            </div>
            <div class="btn-group">
                <form action="loginServlet" method="post">
                    <button type="input" class="btn btn-success">LogIn</button>
                </form>
            </div>
        </div>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<p style="color: #31B404">${sessionScope['ok2']}</p>
<br>
<br>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>