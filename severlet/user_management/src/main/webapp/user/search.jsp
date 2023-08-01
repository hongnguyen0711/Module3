<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/8/2023
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Search Product</h1>
<form method="post">
    <span><label for="search" style="color: #0dcaf0">Search by country:</label></span>
    <input type="text" name="search" id="search" placeholder="Enter country">
    <input type="submit" value="Search">
</form>
<p><a href="/users">Back to User List</a></p>
<c:if test="${user != null}">
    <hr>
    <h1>Result: </h1>
    <table class="table table-hover table-bordered table-responsive table-light" >
        <tr>
            <td><label for="price">Id:</label></td>
            <td id="price">${user.getId()}</td>
        </tr>
        <tr>
            <td><label for="name">Name:</label></td>
            <td id="name">${user.getName()}</td>
        </tr>
        <tr>
            <td><label for="desc">Email:</label></td>
            <td id="desc">${user.getEmail()}</td>
        </tr>
        <tr>
            <td><label for="brand">Country:</label></td>
            <td id="brand">${user.getCountry()}</td>
        </tr>

    </table>
</c:if>
</body>
</html>
