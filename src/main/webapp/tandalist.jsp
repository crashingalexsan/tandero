
<%@page contentType="text/html" pageEncoding="UTF-8"%>
		 
<%@page import="com.iteso.sweng.Tanda.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Welcome <%=session.getAttribute("name")%></title>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>

<h1> tanda list </h1>

<table >
<tr><td>Name</td><td>Status</td> <td>Organizer</td></tr>
<%
DBtanda tandas=new DBtanda();
tandas.conectar();
tandas.loadTandas();
iTanda tanda= tandas.getNextTanda();
while(tanda!=null)
{
  out.print("<tr><td>"+tanda.name+"</td>  ");
  if(tanda.state==0)
  out.print("<td> <a href=\"getInTanda.jsp?tti="+tanda.tandaId+"\">Open</a> </td>");
  
  else if(tanda.state==1)
  out.print("<td> In progress </td>");
  else
  out.print("<td> Dead </td>");
  
  
  out.print("<td>"+tanda.userName+"</td></tr>");
  
  out.print("\n");
  tanda= tandas.getNextTanda();
}
tandas.desconectar();
%>
</table>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>

</html>

