<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-15
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<h1>Danh sach Product</h1>
<a href="./create">Create</a>
<s:if test="listProduct.size() >0">
    <table BORDER="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Category</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Amount</th>
            <th>Thumbnail</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbod
        <c:forEach var="row" items="${listProduct}">
            <tr>
                <td><c:out value="${row.id}"/></td>
                <td><c:out value="${row.category.name}"/></td>
                <td><c:out value="${row.name}"/></td>
                <td><c:out value="${row.description}"/></td>
                <td><c:out value="${row.price}"/></td>
                <td><c:out value="${row.amount}"/></td>
                <td><img src="../../hinhanh/${row.thumbnail}" style="max-width: 100px;"/></td>
                <td>
                    <a href="./details?id=${row.id}">Details</a>
                    <a href="./edit?id=${row.id}">Edit</a>
                    <a href="./delete?id=${row.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</s:if>
</body>
</html>