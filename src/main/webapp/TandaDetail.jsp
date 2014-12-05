<%@ page import="com.iteso.sweng.Tanda.Tanda" %>
<%@ page import="com.iteso.sweng.Tanda.Display.MyTandas" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.iteso.sweng.Tanda.User" %>
<%@ page import="com.iteso.sweng.Tanda.Display.Partakers" %>
<%--
  Created by IntelliJ IDEA.
  User: Arturo Cabrera
  Date: 12/4/2014
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    if(session.getAttribute("email")==null)
        response.sendRedirect("error.jsp");

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>
    <title>Tandas || TANDERO</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>

<%String email = (String)session.getAttribute("email");%>
<%String i=request.getParameter("tanda");%>

<%
    MyTandas m = new com.iteso.sweng.Tanda.Display.MyTandas();
    m.conectar();
    ArrayList<Tanda> t=m.getTandas(email);
    m.desconectar();
%>

<%
    Partakers pt = new Partakers();
    pt.conectar();
    ArrayList<User> u = pt.getPartakers(Integer.parseInt(i)-1);
    pt.desconectar();
%>


<%Tanda tanda = t.get(Integer.parseInt(i));%>

<h3><%= tanda.getName()%></h3>
<table>
    <tr>
        <td> Status</td>
        <td>
            <% int status = tanda.getState();%>
            <%String statusLine= (status==0)?"Open":
                    (status==1)?"In Progress": "Dead";
            %>
            <%if (statusLine.equals("Open")){%>
                <font color="green">
            <%}else if(statusLine.equals("In Progress")){%>
                <font color="#b22222">
            <%} else {%>
                <font color="gray">
            <%}%>
            <%=statusLine%>
                </font>
            <img src=""></td>
    </tr>
    <tr>
        <td>Organizer</td>
        <td><%= tanda.getOrganizer().getName()%></td>
    </tr>
    <tr>
        <td>Amount</td><td> $<%=tanda.getMonto()%></td>
    </tr>
</table>
<hr>
<p>
<table>
    <tr>
        <td colspan="2"><b>Partakers</b></td>
    </tr>

    <!-- loop here-->
    <%for(int j=0; j<u.size(); j++){%>
    <tr>
        <td>
            <%=u.get(j).getName()%>
        </td></tr>
    <%}%>
    <!--end of loop-->
</table>
</p>
</body>
</html>
