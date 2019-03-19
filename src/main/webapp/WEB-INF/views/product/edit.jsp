<%--
  Created by IntelliJ IDEA.
  User: tuhuynh
  Date: 2019-03-15
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"/>
<body>
<h1>Edit product @</h1>
<form:form method="post" action="./edit" modelAttribute="product">
    <table>
        <tr>
            <td>
                <form:label path="id">ID</form:label>
            </td>
            <td>
                <input name="id" value="${product.id}" readonly="true"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="category.id">
                    Category
                </form:label>
            </td>
            <td>
                <form:select path="category.id">
                    <option value="-1">Select category</option>
                    <c:forEach items="${listCate}" var="item">
                        <c:choose>
                            <c:when test="${item.id == product.category.id}">
                                <option value="${item.id}" selected="true">
                                    ${item.name}
                                </option>
                            </c:when>
                            <c:otherwise>
                                <option value="${item.id}">
                                    ${item.name}
                                </option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="name">Name</form:label>
            </td>
            <td>
                <input name="name" value="${product.name}"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">Description</form:label>
            </td>
            <td>
                <input name="description" value="${product.description}"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">Price</form:label>
            </td>
            <td>
                <input name="price" value="${product.price}"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="amount">Amount</form:label>
            </td>
            <td>
                <input name="amount" value="${product.amount}"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="thumbnail">Thumbnail</form:label>
            </td>
            <td>
                <input name="thumbnail" value="${product.thumbnail}"/>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="SUBMIT"/></td>
        </tr>
    </table>
</form:form>

</body>
</html>