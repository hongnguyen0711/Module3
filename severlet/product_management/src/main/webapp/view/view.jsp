<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/7/2023
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>
<p><a href="/products">Back to Product List</a></p>
<table>
    <tr>
        <td>Name :</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price :</td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Description :</td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>Producer :</td>
        <td>${product.getProducer()}</td>
    </tr>

</table>
</body>
</html>
