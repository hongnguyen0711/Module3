<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/7/2023
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            width: 700px;
            height: 500px;
            text-align: center;
        }
        table, tr, td {
            border: solid white;
            background-color: gray;
            margin: auto;
        }
        img {
            width: 100px;
            height:100px;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
<h2>Customer List</h2>
    <table>
        <tr>
            <td> Name</td>
            <td> Date of birth</td>
            <td> Address</td>
            <td> Avatar</td>
        </tr>
        <c:forEach var="element" items="${customer}" >
            <tr>
                <td>${element.name}</td>
                <td>${element.date}</td>
                <td> ${element.address}</td>
                <td><img src="${element.image}"></td>
            </tr>
        </c:forEach>
        
    </table>
</body>
</html>
