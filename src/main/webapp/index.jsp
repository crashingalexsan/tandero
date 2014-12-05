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
    <script type="text/javascript">
        function breakout()
        {
            if (window.top != window.self)
            {
                window.top.location="index.jsp"
            }
        }
    </script>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title> WELCOME || TANDERO</title>
</head>
<body>
<body onLoad="javascript:breakout()">
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="btn-group btn-group-lg">

            <div class="btn-group">
                <form action="welcomeServlet" method="post" target="main">
                    <button type="submit" class="btn btn-success">Home</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="loginServlet" method="post" target="main">
                    <button type="input" class="btn btn-success">LogIn</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="RServlet" method="post" target="main">
                    <button name="value" type="input" class="btn btn-success" value="SignIn/signin.jsp">Sign in</button>
                </form>
            </div>
            <div class="btn-group">
                <form action="faqservlet" method="post" target="main">
                    <button type="input" class="btn btn-success">Faq</button>

                </form>
            </div>
        </div>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<iframe name="main" frameborder=0 src="welcome.jsp" width="100%" height="100%"></iframe>

<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

</body>
</html>
