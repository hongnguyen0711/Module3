<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/7/2023
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/products">Back to customer list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Name : </td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Price : </td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Description : </td>
                <td>${product.getDescription()}</td>
            </tr>
            <tr>
                <td>Producer : </td>
                <td>${product.getProducer()}</td>
            </tr>
            <tr>
                <td>Status : </td>
                <td>${product.getStatus()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete customer"></td>
                <td><a href="/products">Back to products List</a></td>
            </tr>
        </table>
    </fieldset>


</form>
</body>
</html>
