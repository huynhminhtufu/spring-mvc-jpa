<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-15
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"/>
<body>
<h1>Details Product</h1>
<table>
    <tr>
        <td>ID:</td>
        <td>${product.id}</td>
    </tr>
    <tr>
        <td>Category:</td>
        <td>${product.category.name}</td>
    </tr>
    <tr>
        <td>Name:</td>
        <td>${product.name}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${product.description}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.price}</td>
    </tr>
    <tr>
        <td>Amount:</td>
        <td>${product.amount}</td>
    </tr>
    <tr>
        <td>Thumbnail:</td>
        <td><img src="../../hinhanh/${row.thumbnail}" style="max-width: 100px;"/></td>
    </tr>
</table>
</body>
</html>
