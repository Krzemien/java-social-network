<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Rejestracja</title>

    <%@ include file = "css.jsp" %>
</head>
<body>
    <div class="container register">
        <div class="row">
            <div class="col-sm">
                <h3>Java Social Network - portal społecznościowy napisany w technologii Java 11 z wykorzystaniem frameworka Spring.</h3>
                <br />
                <img src="https://cdn.pixabay.com/photo/2014/04/03/11/08/tea-311844_960_720.png" class="img-fluid" alt="">
            </div>
            <div class="col-sm">
                <form:form method="post" modelAttribute="user">
                    <c:if test="${error}">
                        <div class="form-group">
                            <div class="alert alert-danger" role="alert">
                                Popraw błędy w formularzu!
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${isExists.length() > 0}">
                        <div class="form-group">
                            <div class="alert alert-danger" role="alert">
                                    ${isExists}
                            </div>
                        </div>
                    </c:if>

                    <div class="form-group">
                        <label for="firstName">Imię</label>
                        <form:input path="firstName" type="text" class="form-control" placeholder="Podaj swoje imię" />
                    </div>
                    <form:errors path="firstName" cssClass="alert alert-warning" element="div" />

                    <div class="form-group">
                        <label for="lastName">Nazwisko</label>
                        <form:input path="lastName" type="text" class="form-control" placeholder="Podaj swoje nazwisko" />
                    </div>
                    <form:errors path="lastName" cssClass="alert alert-warning" element="div" />


                    <div class="form-group">
                        <label for="userName">Nazwa użytkownika</label>
                        <form:input path="userName" type="text" class="form-control" placeholder="Podaj nazwę użytkownika" />
                    </div>
                    <form:errors path="userName" cssClass="alert alert-warning" element="div" />


                    <div class="form-group">
                        <label for="email">Adres email</label>
                        <form:input path="email" type="text" class="form-control" placeholder="Podaj swój email" />
                    </div>
                    <form:errors path="email" cssClass="alert alert-warning" element="div" />


                    <div class="form-group">
                        <label for="password">Hasło</label>
                        <form:input path="password" type="password" class="form-control" placeholder="Podaj hasło" />
                    </div>
                    <form:errors path="password" cssClass="alert alert-warning" element="div" />

                    <div class="form-group">
                        <label>Płeć</label>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <form:radiobutton path="sex" class="form-check-input" id="male" value="MALE" />
                            <label class="form-check-label" for="male">
                                Mężczyzna
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <form:radiobutton path="sex" class="form-check-input" id="female" value="FEMALE" />
                            <label class="form-check-label" for="female">
                                Kobieta
                            </label>
                        </div>
                    </div>
                    <form:errors path="sex" cssClass="alert alert-warning" element="div" />

                    <div class="form-group">
                        <label for="age">Data urodzenia</label>
                        <form:input path="age" type="date" class="form-control" placeholder="Podaj swoją datę urodzenia" />
                    </div>
                    <form:errors path="age" cssClass="alert alert-warning" element="div" />

                    <button type="submit" class="btn btn-success">Zarejestruj się</button>
                    <a href="<c:url value="/login" />" class="btn btn-primary">Logowanie</a>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form:form>
            </div>
        </div>
    </div>

    <%@ include file = "js.jsp" %>
</body>
</html>
