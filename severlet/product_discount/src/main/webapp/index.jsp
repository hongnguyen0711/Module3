<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/calculator" method="post">
<h2>Product Description</h2>
<label for="pr">List Price: </label><br/>
<input type="text" name="price" id="pr" placeholder="price" value="0"/><br/>
<label for="pe">Discount Percent: </label><br/>
<input type="text" name="percent" id="pe" placeholder="%" value="0"/><br/>
<input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>