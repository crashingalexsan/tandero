<%--
  Created by IntelliJ IDEA.
  User: Alejandro
  Date: 04/12/2014
  Time: 06:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.iteso.sweng.Profile.BDProfile" %>
<%@ page import="com.iteso.sweng.Profile.Profile" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
  <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Resultado Busqueda|| TANDERO</title>
</head>
<body>

<%

  String email = (String)session.getAttribute("emailBuscar");
  BDProfile a = new BDProfile();
  a.conectar();
  Profile b = a.getContact(email);
  a.desconectar();

%>
<% if(email!=null){%>

<h1>Your Profile</h1>
<script>
  var x = document.createElement("img");
  x.setAttribute("src","<%=b.getImage()%> ");
  x.setAttribute("width", "228");
  x.setAttribute("alt", "The Pulpit Rock");
  document.body.appendChild(x);
</script>
<p><strong>Nickname: </strong><span><% if(b.getNick()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getNick()%></span></p>
<p><strong>Name: </strong><%=b.getName()%></p>
<p><strong>Last Name: </strong><%=b.getLastname()%></p>
<p><strong>Country: </strong><span><% if(b.getCountry()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getCountry()%></span></p>

<%}%>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>
