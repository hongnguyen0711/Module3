<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/calculate" method="post">
    <h1>Simple calculate</h1>
    <table>
        <tr>
            <td><label for="op">Fist Operand:</label></td>
            <td><input type="text" name="first-operand" id="op"></td>
        </tr>
        <tr>
            <td><label for="opt"> Operator:</label></td>
            <td>
                <select name="operator" id="opt">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="op1">Second Operand:</label></td>
            <td><input type="text" name="second-operand" id="op1"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" id="submit" value="Calculate"></td>
        </tr>
    </table>
</form>
</body>
</html>