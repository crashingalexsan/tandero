<%--
  Created by IntelliJ IDEA.
  User: Alejandro
  Date: 04/12/2014
  Time: 06:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Buscador || TANDERO</title>
  <meta charset="UTF-8">
  <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap.min.css") %>'>
  <link rel='stylesheet' href='<%= org.webjars.AssetLocator.getWebJarPath("css/bootstrap-theme.min.css") %>'>
</head>
<body>

<h1> Search People </h1>

<table>
  <form action="searchServlet" method="post">
    <fieldset style="width: 300px">

      <tr>
        <td>User Email:</td>
        <td><input type="text" name="emailBuscar" required="required" /></td>
      </tr>
      <tr>
        <td>
          <input type="submit" name="" class="btn btn-danger" value="Search" />
    </fieldset>
  </form>
  </td>
  </tr>
</table>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("jquery.min.js") %>'></script>
<script type='text/javascript' src='<%= org.webjars.AssetLocator.getWebJarPath("js/bootstrap.min.js") %>'></script>
</body>
</html>
