<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <h1>Details category!</h1>
        <table>
            <tr>
                <td>ID:</td>
                <td>${cate.id}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${cate.name}</td>
            </tr>
        </table>
    </body>
</html>
