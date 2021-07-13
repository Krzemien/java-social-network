<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Logowanie</title>

    <%@ include file = "css.jsp" %>
</head>
<body>
    <div class="container login">
        <div class="row">
            <div class="col-sm">
                <h3>Java Social Network - portal społecznościowy napisany w technologii Java 11 z wykorzystaniem frameworka Spring.</h3>
                <br />
                <img src="https://cdn.pixabay.com/photo/2014/04/03/11/08/tea-311844_960_720.png" class="img-fluid" alt="">
            </div>
            <div class="col-sm">
                <form method="post">
                    <c:if test="${error}">
                        <div class="form-group">
                            <div class="alert alert-danger" role="alert">
                                Błędne dane!
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${logout}">
                        <div class="form-group">
                            <div class="alert alert-info" role="alert">
                                Wylogowano!
                            </div>
                        </div>
                    </c:if>

                    <div class="form-group">
                        <label for="userNameInput">Adres email</label>
                        <input type="text" class="form-control" name="username" id="userNameInput" aria-describedby="emailHelp" placeholder="Podaj swój email" autofocus>
                    </div>

                    <div class="form-group">
                        <label for="passwordInput">Hasło</label>
                        <input type="password" class="form-control" name="password" id="passwordInput" placeholder="Podaj swoje hasło">
                    </div>

                    <button type="submit" class="btn btn-success">Zaloguj się</button>
                    <a href="<c:url value="/register" />" class="btn btn-primary">Rejestracja</a>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>

    <%@ include file = "js.jsp" %>
</body>
</html>
