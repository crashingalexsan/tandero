<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 30/10/14
  Time: 09:39 AM
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
    <title>Edit your Profile | Tandero.com</title>
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
<h1>Edit your Profile</h1>
<p style="color: #ff0000">${sessionScope['error']}</p>
<% if(session.getAttribute("ok")==null)  {%>
<% if(session.getAttribute("ok2")!=null) { %>
<p style="color: #31B404">${sessionScope['ok2']}</p>
<% session.setAttribute("ok", null);
    session.setAttribute("ok2", null);%>
<%} else {%>
<form name="form" method="post" action="EditProfileServlet">
    <table width="846" border="0">
        <tbody>
        <tr>
            <td width="162"><label>Name:</label></td>
            <td width="253">
                <%=b.getName()%></td>
            <td width="162"><label>Last Name:</label></td>
            <td width="259">
                <%=b.getLastname()%></td>
            <td width="20">&nbsp;</td>
        </tr>
        <tr>
            <td><label>E-mail:</label></td>
            <td>
                <%=b.getEmail()%></td>
            <td><label for="nick2">Nickname:</label></td>
            <td>
                <input type="text" name="nick2" id="nick2" value="<%=b.getNick()%>"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><strong>Contact Information</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="phome2">Phone Home:</label></td>
            <td>
                <input type="tel" name="phome2" id="phome2" maxlength="10" value="<%=b.getPhome()%>"></td>
            <td><label for="poffice2">Phone Office:</label></td>
            <td>
                <input type="tel" name="poffice2" id="poffice2" maxlength="10" value="<%=b.getPoffice()%>"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="pmobile2">Phone Mobile:</label></td>
            <td>
                <input type="tel" name="pmobile2" id="pmobile2" maxlength="10" value="<%=b.getPmobile()%>"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="street12">Street 1:</label></td>
            <td>
                <input type="text" name="street12" id="street12" value="<%=b.getStreet1()%>"></td>
            <td><label for="city2">City:</label></td>
            <td>
                <input type="text" name="city2" id="city2" value="<%=b.getCity()%>"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="street22">Street 2:</label></td>
            <td>
                <input type="text" name="street22" id="street22" value="<%=b.getStreet2()%>"></td>
            <td><label for="zip2">Zip:</label></td>
            <td>
                <input type="number" name="zip2" id="zip2" maxlength="6" value="<%=b.getZip()%>"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="state2">State:</label></td>
            <td>
                <input type="text" name="state2" id="state2" value="<%=b.getState()%>"></td>
            <td><label for="country2">Country:</label></td>
            <td>
                <input type="text" name="country2" id="country2" value="<%=b.getCountry()%>"></td>
            <td><label for="image">Image:</label></td>
            <td>
                <input type="text" name="image" id="image" value="<%=b.getImage()%>"></td>

            <td>&nbsp;</td>
        </tr>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <p>
        <input type="submit" name="submit2" id="submit2" value="Update Profile">
    </p>
</form>
<p>&nbsp;</p>

<%}
}%>

<% if(session.getAttribute("ok")!=null) { %>
<form name="form1" method="post" action="EditProfileServlet">
    <table width="846" border="0">
        <tbody>
        <tr>
            <td width="162"><label>Name:</label></td>
            <td width="253">
                <%=b.getName()%></td>
            <td width="162"><label>Last Name:</label></td>
            <td width="259">
                <%=b.getLastname()%></td>
            <td width="20">&nbsp;</td>
        </tr>
        <tr>
            <td><label>E-mail:</label></td>
            <td>
                <%=b.getEmail()%></td>
            <td><label for="nick">Nickname:</label></td>
            <td>
                <input type="text" name="nick" id="nick" value="<%=session.getAttribute("nick")%>" readonly></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><strong>Contact Information</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="phome">Phone Home:</label></td>
            <td>
                <input type="tel" name="phome" id="phome" maxlength="10" value="<%=session.getAttribute("phome")%>" readonly></td>
            <td><label for="poffice">Phone Office:</label></td>
            <td>
                <input type="tel" name="poffice" id="poffice" maxlength="10" value="<%=session.getAttribute("poffice")%>" readonly></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="pmobile">Phone Mobile:</label></td>
            <td>
                <input type="tel" name="pmobile" id="pmobile" maxlength="10" value="<%=session.getAttribute("pmobile")%>" readonly></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="street1">Street 1:</label></td>
            <td>
                <input type="text" name="street1" id="street1" value="<%=session.getAttribute("street1")%>" readonly></td>
            <td><label for="city">City:</label></td>
            <td>
                <input type="text" name="city" id="city" value="<%=session.getAttribute("city")%>" readonly></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="street2">Street 2:</label></td>
            <td>
                <input type="text" name="street2" id="street2" value="<%=session.getAttribute("street2")%>" readonly></td>
            <td><label for="zip">Zip:</label></td>
            <td>
                <input type="number" name="zip" id="zip" maxlength="6" value="<%=session.getAttribute("zip")%>" readonly></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="state">State:</label></td>
            <td>
                <input type="text" name="state" id="state" value="<%=session.getAttribute("state")%>" readonly></td>
            <td><label for="country">Country:</label></td>
            <td>
                <input type="text" name="country" id="country" value="<%=session.getAttribute("country")%>" readonly></td>

            <td><label for="image">Image:</label></td>
            <td>
                <input type="text" name="image" id="image" value="<%=session.getAttribute("image")%>" readonly></td>
            <td>&nbsp;</td>
        </tr>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <p>
    <p style="color: #0a62b4">${sessionScope['ok']}</p>
    <%  session.setAttribute("phome",null);
        session.setAttribute("poffice",null);
        session.setAttribute("pmobile",null);
        session.setAttribute("zip",null);
        session.setAttribute("nick",null);
        session.setAttribute("stree1",null);
        session.setAttribute("stree2",null);
        session.setAttribute("city",null);
        session.setAttribute("state",null);
        session.setAttribute("country",null);
        session.setAttribute("image",null);%>
    <input type="submit" name="submit" id="submit" value="Save changes">
</form>
<form name="form1" method="post" action="CancelEditProfileServlet">
    <input type="submit" name="Cancel" id="Cancel" value="Cancel">
</form>
<p>&nbsp;</p>
<%}%>


<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

</body>
</html>
