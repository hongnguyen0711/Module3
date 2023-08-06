<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/8/2023
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-5.2.3-dist/css/bootstrap.css">
</head>
<body>
<div class="container-fluid">
    <form method="post">
        <h2>Account Information</h2>
        <p style="color: #0d6efd">${message}</p>
        <p style="color: red ">${error}</p>
        <table class="table caption-top">

          <fieldset disabled>
                    <div class="input-group mb-3" style="width: 20%; margin-left: auto; margin-right: auto">
                        <span class="input-group-text">Id </span>
                        <input  type="text" value="${account.getId()}" class="form-control"
                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" readonly>
                    </div></fieldset>

            <tr>
                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">User Name</span>
                        <input type="text" value="${account.getUsername()}" name="user" class="form-control"
                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
                    </div>
                </td>
                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Status</span>
                        <select name="status" required>
                            <option value="0"
                                    <c:if test="${account.getStatus()==0}">selected</c:if>
                            >Available</option>

                            <option value="1"
                                    <c:if test="${account.getStatus()==1}">selected</c:if>
                            >Not Available</option>
                        </select>
<%--                        <input type="text" value="${account.getStatus()}" name="status" class="form-control"--%>
<%--                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>--%>
                    </div>
                </td>

            </tr>
            <tr>
                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Pass  Word</span>
                        <input type="text" value="${account.getPassword()}" name="pass" class="form-control"
                               aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
                    </div>
                </td>


                <td>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Role</span>
                        <select name="role" required>

                            <c:forEach items="${role}" var="role">
                                <option value="${role.getRoleId()}"
                                        <c:if test="${role.getRoleId() == account.getRole()}">selected</c:if>
                                >${role.getRoleName()}</option>
                            </c:forEach>

                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                <button type="submit" class="btn btn-secondary">Update</button>
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
