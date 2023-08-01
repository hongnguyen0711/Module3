
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/7/2023
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create"> Create new product</a>
</p>
<p>
    <a href="/products?action=search">Search Product</a>
</p>
<table border="1px">
<tr>
    <td>Id</td>
    <td>Name</td>
    <td>Price</td>
    <td>Description</td>
    <td>Producer</td>
    <td>Edit</td>
    <td>Delete</td>
    <td>Available</td>
</tr>
    <c:forEach items="${products}" var="product">
    <tr>
        <td>${product.getId()}</td>
        <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
        <td>${product.getPrice()}</td>
        <td>${product.getDescription()}</td>
        <td>${product.getProducer()}</td>
        <td><a href="/products?action=edit&id=${product.getId()}">Edit</a></td>
        <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
        <td>
            <c:if test="${product.getStatus() == 0}">Available</c:if>
            <c:if test="${product.getStatus() == 1}">Not Available</c:if>
        </td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
