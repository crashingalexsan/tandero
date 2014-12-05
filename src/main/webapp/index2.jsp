<%@ page import="com.iteso.sweng.Profile.BDProfile" %>
<%@ page import="com.iteso.sweng.Profile.Profile" %>
<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 29/10/14
  Time: 08:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <%
        if(session.getAttribute("email")==null)
            response.sendRedirect("error.jsp");

    %>
    <script type="text/javascript">
        function breakout()
        {
            if (window.top != window.self)
            {
                window.top.location="index2.jsp"
            }
        }
    </script>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Tandero.com || TANDERO</title>
</head>
<body onLoad="javascript:breakout()">
<%

    String email = (String)session.getAttribute("email");
    BDProfile a = new BDProfile();
    a.conectar();
    Profile b = a.getContact(email);
    a.desconectar();

%>
<% if(email!=null){%>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="btn-group btn-group-lg">

            <div class="btn-group">
                <form action="construction.jsp" method="post" target="main">
                    <button type="submit" class="btn btn-success">Home</button>

                </form>
            </div>
            <div class="btn-group">
                <form action="RServlet" method="post" target="main">
                    <button name="value" type="input" class="btn btn-success" value="Profile/profile.jsp">Profile</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="RServlet" method="post" target="main">
                    <button name="value" type="input" class="btn btn-success" value="Account/account.jsp">Account</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="SearchPeople.jsp" method="post" target="main">
                    <button type="input" class="btn btn-success" >Search People</button>
                </form>
            </div>
            <%if(b.isStatus()){%>
            <div class="btn-group">
                <form action="mytandas.jsp" method="post" target="main">
                    <button type="submit" class="btn btn-success">My Tandas</button>
                </form>
            </div>
            <%}%>
            <div class="btn-group">
                <form action="tandalist.jsp" method="post" target="main">
                    <button type="submit" class="btn btn-success">All Tandas</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="faqmemberservlet" method="post" target="main">
                    <button type="input" class="btn btn-success">Members Faq</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="LogoutServlet" method="post" target="main">
                    <button type="submit" class="btn btn-success">Log Out</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="deleteprofile.jsp" method="post" target="main">
                    <button type="submit" class="btn btn-warning">Erase Profile</button>
                </form>
            </div>
        </div>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<iframe name="main" src="welcome2.jsp" frameborder=0 width="100%" height="100%"></iframe>
<%}%>

<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

</body>
</html>