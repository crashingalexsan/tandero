<%
    if(session.getAttribute("email")!=null)
        response.sendRedirect("index2.jsp");

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login Application</title>
</head>
<body>

<table>
    <form action="profileServlet" method="post">
        <fieldset style="width: 300px">
            <legend> Login to App </legend>
            <tr>
                <td>User Email</td>
                <td><input type="text" name="email" required="required" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" required="required" /></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" class="btn btn-danger" value="Login" />
        </fieldset>
    </form>
    </td>
    </tr>
</table>

<form action="RGenerateServlet" method="post">
    <input type="submit"  class="btn btn-warning" value="Forgot your Password?" />
</form>

<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

</body>
</html>
