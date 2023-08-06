<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/8/2023
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
</head>

<body>

<table id="table">
    <h2 style="text-align: center; margin-top: 2%">List of Account</h2>
    <thead>
    <tr>
        <th>#</th>
        <th>User Name</th>
        <th>Pass Word</th>
        <th>Status</th>
        <th>Role</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${accounts}" var="account">
        <tr>
            <td>${account.getId()}</td>
            <td>${account.getUsername()}</td>
            <td>${account.getPassword()}</td>
            <td>${account.getStatus()}</td>
            <td>${account.getRole()}</td>
            <td><a href="/account?action=edit&id=${account.getId()}"><button type="button" class="btn btn-secondary btn-md">Edit</button></a></td>
            <td><a href="/account?action=delete&id=${account.getId()}"><button type="button" class="btn btn-secondary btn-md">Delete</button></a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
        crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
    new DataTable('#table');
</script>
</body>

</html>
