<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/7/2023
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to Product list</a>
</p>
<form  method="post">
    <fieldset>
        <legend>Product Information</legend>
<table>
    <tr>
        <td>Name:</td>
        <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
    </tr>
    <tr>
        <td>Price :</td>
        <td><input type="text" name="price" id="price" value="${product.getPrice()}"></td>
    </tr>
    <tr>
        <td>Description :</td>
        <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
    </tr>
    <tr>
        <td>Producer :</td>
        <td><input type="text" name="producer" id="producer" value="${product.getProducer()}"></td>
    </tr>
    <tr>
        <td>Status :</td>
        <td><input type="text" name="status" id="status" value="${product.getStatus()}"></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="submit" value="Update product"></td>
    </tr>
</table>
    </fieldset>
</form>
</body>
</html>
