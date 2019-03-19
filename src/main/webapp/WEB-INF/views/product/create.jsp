<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"/>
<body>
<h1>Tao moi product</h1>

<form:form method="post" action="./create" modelAttribute="product" enctype="multipart/form-data">
    <table>
        <tr>
            <td><form:label path="category.id">Category</form:label></td>
            <td>
                <form:select path="category.id">
                    <option value="-1">Select a cate</option>
                    <c:forEach items="${listCate}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </form:select>
            </td>
        </tr>
        <tr>
            <td><form:label path="name">Name</form:label></td>
            <td><form:input path="name"/> </td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description"/> </td>
        </tr>
        <tr>
            <td><form:label path="price">Price</form:label></td>
            <td><form:input path="price"/> </td>
        </tr>
        <tr>
            <td><form:label path="amount">Amount</form:label></td>
            <td><form:input path="amount"/> </td>
        </tr>
        <tr>
            <td>Upload image:</td>
            <td><input type="file" name="file"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="SUBMIT" /></td>
        </tr>
    </table>
</form:form>
</body>
</html>