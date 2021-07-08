<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>

    <%@ include file = "css.jsp" %>
</head>
<body>
    <div class="container">
        <a href="<c:url value="/home"/>">home</a>

        <h1>hello</h1>

        <form action="<c:url value="/logout"/>" method="post">
            <input class="fa fa-id-badge" type="submit" value="Wyloguj">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>

    <%@ include file = "js.jsp" %>
</body>
</html>
