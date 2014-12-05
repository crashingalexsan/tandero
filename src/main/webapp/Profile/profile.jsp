<%-- 
    Document   : index
    Created on : 09-oct-2014, 17:50:20
    Author     : Daniel
--%>
<%
    if(session.getAttribute("email")==null)
        response.sendRedirect("error.jsp");

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.iteso.sweng.Profile.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile || TANDERO</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>
<%

%>
<%String email = (String)session.getAttribute("email");
%>

<%
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
<p><strong>E-mail: </strong><%=b.getEmail()%></p>
<p><strong>Phone Home: </strong><span><% if(b.getPhome()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getPhome()%></span></p>
<p><strong>Phone Office: </strong><span><% if(b.getPoffice()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getPoffice()%></span></p>
<p><strong>Phone Mobile: </strong><span><% if(b.getPmobile()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getPmobile()%></span></p>
<p><strong>Street 1: </strong><span><% if(b.getStreet1()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getStreet1()%></span></p>
<p><strong>Street 2: </strong><span><% if(b.getStreet2()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getStreet2()%></span></p>
<p><strong>City: </strong><span><% if(b.getCity()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getCity()%></span></p>
<p><strong>ZIP: </strong><span><% if(b.getZip()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getZip()%></span></p>
<p><strong>State: </strong><span><% if(b.getState()==null)
    out.println("<span style=\"color: #ff0000\">"); %><%=b.getState()%></span></p>
<p><strong>Country: </strong><span><% if(b.getCountry()==null) out.println("<span style=\"color: #ff0000\">"); %><%=b.getCountry()%></span></p>
<p><strong>Status Account: </strong><%
    if(b.isStatus())
    {
        out.println("<span style=\"color: #31B404\">");
        out.println("Verified");
    }
    else {
        out.println("<span style=\"color: #ff0000\">");
        out.println("No verified<br><br>" +
                    "<form name=\"form1\" method=\"post\" action=\"RServlet\">\n" +
                    "<button name=\"value\" type=\"input\" class=\"btn btn-success\" value=\"SignIn/activate.jsp\">Activate Account</button> "+
                    "</form>");

    }
%></p></span>

<%}%>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

</body>
</html>
