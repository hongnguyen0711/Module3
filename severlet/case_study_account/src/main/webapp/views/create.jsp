<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/8/2023
  Time: 1:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-5.2.3-dist/css/bootstrap.css">
</head>
<body>
<div class="container-fluid">
    <form action="/account?action=create" method="post">
        <h2>Add New Account</h2>
        <p style="color: #0d6efd">${message}</p>
        <p style="color: red ">${error}</p>
        <table class="table caption-top">

            <tr>
                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">User Name</span>
                        <input type="text"  name="user" class="form-control"
                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
                    </div>
                </td>

                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Status</span>
                        <input type="text" name="status" class="form-control"
                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="0" readonly>
                    </div>
                </td>

            </tr>
            <tr>
                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Pass  Word</span>
                        <input type="text"  name="pass" class="form-control"
                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
                    </div>
                </td>


                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Role</span>
<%--                        <input type="text"  name="role" class="form-control"--%>
<%--                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>--%>
                        <select name="role" required>
                            <option disabled selected> Hãy chọn role</option>
                            <c:forEach items="${newRole}" var="role">
                                <option value="${role.getRoleId()}">${role.getRoleName()}</option>
                            </c:forEach>

                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="submit" class="btn btn-secondary" value="Create">Create</button>
                </td>
                <td>
                    <a href="/account">Back to Account List</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
