<%--
  Created by IntelliJ IDEA.
  User: Pesina
  Date: 03/12/2014
  Time: 02:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    if(session.getAttribute("email")==null)
        response.sendRedirect("error.jsp");

%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.iteso.sweng.Profile.*"%>
<html>
<head>
    <title>Account deletion| Tandero.com</title>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>
<%String email = (String)session.getAttribute("email");%>
<%
    BDProfile a = new BDProfile();
    a.conectar();
    Profile b = a.getContact(email);
    a.desconectar();
%>
<h1>Delete Profile</h1>
<p style="color: #ff0000">${sessionScope['error']}</p>


<form action="DeleteProfileServlet" method="post">
    <table>
        <tr>
            <td>Email: </td>
            <td>
                <input type="text" name="email" value="<%=b.getEmail()%>" readonly></td>

        </tr>

        <tr>
            <td>password</td>
            <td><input type="password" name="password" /></td>
        </tr>
    </table>
    <input type="submit" name="" class="btn btn-danger" value="Delete Profile"/>
</form>



<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

</body>
</html>
