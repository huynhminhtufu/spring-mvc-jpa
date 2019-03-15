<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <h1>create new category!</h1>

        <form:form method="post" action="./create" modelAttribute="cate">
            <table>
                <tr>
                    <td><form:label path="name">Name</form:label></td>
                    <td><form:input path="name"/> </td>
                </tr>
                <tr>
                    <td><input type="submit" value="SUBMIT" /></td>
                </tr>
            </table>
        </form:form>
    </body>
</html>
