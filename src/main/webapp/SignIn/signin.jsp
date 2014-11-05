<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 30/10/14
  Time: 09:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In | Tandero.com</title>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
    <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>
<h1>Sign In</h1>
<p style="color: #31B404">${sessionScope['ok']}</p>
<p style="color: #ff0000">${sessionScope['error']}</p>
<% if(session.getAttribute("ok")==null) { %>
<form name="form1" method="post" action="SigninServlet">
    <table width="846" border="0">
        <tbody>
        <tr>
            <td width="162"><label for="name">Name (*):</label></td>
            <td width="253">
                <input type="text" name="name" id="name" required="required"></td>
            <td width="162"><label for="lastname">Last Name (*):</label></td>
            <td width="259">
                <input type="text" name="lastname" id="lastname" required="required"></td>
            <td width="20">&nbsp;</td>
        </tr>
        <tr>
            <td><label for="email">E-mail (*):</label></td>
            <td>
                <input type="email" name="email" id="email" required="required"></td>
            <td><label for="nick">Nickname:</label></td>
            <td>
                <input type="text" name="nick" id="nick"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="password">Password (*):</label></td>
            <td>
                <input type="password" name="password" id="password" pattern="(?=.*[a-zA-Z0-9]).{6,15}" title="Password must contain at least 6 characters." required="required"></td>
            <td><label for="password2">Confirm Pass (*):</label></td>
            <td>
                <input type="password" name="password2" id="password2" pattern="(?=.*[a-zA-Z0-9]).{6,15}" title="Password must contain at least 6 characters." required="required"></td>
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
                <input type="tel" name="phome" id="phome" maxlength="10"></td>
            <td><label for="poffice">Phone Office:</label></td>
            <td>
                <input type="tel" name="poffice" id="poffice" maxlength="10"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="pmobile">Phone Mobile:</label></td>
            <td>
                <input type="tel" name="pmobile" id="pmobile" maxlength="10"></td>
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
                <input type="text" name="street1" id="street1"></td>
            <td><label for="city">City:</label></td>
            <td>
                <input type="text" name="city" id="city"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="street2">Street 2:</label></td>
            <td>
                <input type="text" name="street2" id="street2"></td>
            <td><label for="zip">Zip:</label></td>
            <td>
                <input type="number" name="zip" id="zip" maxlength="6"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><label for="state">State:</label></td>
            <td>
                <input type="text" name="state" id="state"></td>
            <td><label for="country">Country:</label></td>
            <td>
                <input type="text" name="country" id="country"></td>
            <td>&nbsp;</td>
        </tr>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <p>
        <input type="submit" name="submit" id="submit" value="Send">
        <input type="reset" name="reset" id="reset" value="Clean all">
    </p>
</form>
<p>&nbsp;</p>
<p>Mandatory Fields (*).</p>

<%}%>
<%session.invalidate();%>

<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>

</body>
</html>
