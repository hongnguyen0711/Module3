<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/7/2023
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test="${message != null}">
        <span>${message}</span>
    </c:if>
</p>
<p>
    <a href="/products"> Back to products list</a>
</p>

<form action="" method="post">
    <fieldset>
        <legend> Product information</legend>
        <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" id="price"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><input type="text" name="description" id="description"></td>
        </tr>
        <tr>
            <td>Producer</td>
            <td><input type="text" name="producer" id="producer"></td>
        </tr>
            <tr>
                <td>Available</td>
                <td><input type="text" name="status" id="status"></td>
            </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create"></td>
        </tr>
        </table>
    </fieldset>

</form>
</body>
</html>
