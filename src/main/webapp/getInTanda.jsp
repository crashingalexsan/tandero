
<%@page contentType="text/html" pageEncoding="UTF-8"%>
		 
<%@page import="com.iteso.sweng.Tanda.*"%>
<%@page import="com.iteso.sweng.Profile.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Welcome <%=session.getAttribute("name")%></title>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>

<h1> procesando peticion </h1>


<%String email = (String)session.getAttribute("email");%>
<%

if(session.getAttribute("email")==null)
        response.sendRedirect("error.jsp");

if(request.getParameter("tti")==null)
	response.sendRedirect("tandalist.jsp");

BDProfile a = new BDProfile();
    a.conectar();
    Profile b = a.getContact(email);
    a.desconectar();
	
int ui = Integer.parseInt(request.getParameter("tti"));
DBtanda tandas=new DBtanda();
tandas.conectar();
	tandas.getUserIntoTanda(b.getID(),ui);
tandas.desconectar();
System.out.println("Peticion cumplida");
%>

<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>

</html>

