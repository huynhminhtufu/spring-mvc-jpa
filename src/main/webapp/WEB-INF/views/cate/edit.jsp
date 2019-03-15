<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <h1>Edit category!</h1>
        <form:form method="post" action="./edit" modelAttribute="cate">
            <table>
                <tr>
                    <td>
                        <form:label path="id">ID</form:label>
                        <input name="id" value="${cate.id}" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="name">Name</form:label>
                        <input name="name" value="${cate.name}"/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="SUBMIT"/></td>
                </tr>
            </table> 
        </form:form>

    </body>
</html>
