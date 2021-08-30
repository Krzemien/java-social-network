<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home</title>

    <%@ include file = "css.jsp" %>
</head>
<body>
<div class="container main">
    <div class="row">
        <%@ include file = "menu.jsp" %>

        <div class="col-lg-6 wall">
            <%@ include file = "search.jsp" %>

            <c:if test="${userExist==true}">
                <section class="">
                    <h1>Lista osób, które obserwują użytkownika ${userData2.userName}</h1>

                    <c:forEach var="followers" items="${followers}">
                        <a href="<c:url value="/user/${followers.userName}"/>">
                            <p>${followers.userName}</p>
                        </a>
                    </c:forEach>
                </section>
            </c:if>

            <c:if test="${userExist==false}">
                <h2>Taki użytkownik nie istnieje.</h2>
            </c:if>

        </div>

        <%@ include file = "notifications.jsp" %>

    </div>
</div>

<%@ include file = "js.jsp" %>
</body>
</html>
