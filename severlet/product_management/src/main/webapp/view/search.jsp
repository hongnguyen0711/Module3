<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/8/2023
  Time: 1:10 AM
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
    <span><label for="search" style="color: #0dcaf0">Search by name:</label></span>
    <input type="text" name="search" id="search" placeholder="Enter name">
    <input type="submit" value="Search">
</form>
<p><a href="/products">Back to Product List</a></p>
<c:if test="${product != null}">
    <hr>
    <h1>Result: </h1>
    <table class="table table-hover table-bordered table-responsive table-light" >
        <tr>
            <td><label for="name">Name:</label></td>
            <td id="name">${product.getName()}</td>
        </tr>
        <tr>
            <td><label for="desc">Description:</label></td>
            <td id="desc">${product.getDescription()}</td>
        </tr>
        <tr>
            <td><label for="brand">Producer:</label></td>
            <td id="brand">${product.getProducer()}</td>
        </tr>
        <tr>
            <td><label for="price">Price:</label></td>
            <td id="price">${product.getPrice()}</td>
        </tr>
    </table>
</c:if>
</body>
</html>
