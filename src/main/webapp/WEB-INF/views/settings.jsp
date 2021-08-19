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

                <section class="">
                    <h2>Ustawienia</h2>
                </section>
            </div>

            <%@ include file = "notifications.jsp" %>

        </div>
    </div>

    <%@ include file = "js.jsp" %>
</body>
</html>
