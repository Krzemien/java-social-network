<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
                <form>
                    <div class="form-group">
                        <label>Imię</label>
                        <input type="text" class="form-control" placeholder="Podaj swoje imię">
                    </div>
                    <div class="form-group">
                        <label>Nazwisko</label>
                        <input type="text" class="form-control" placeholder="Podaj swoje nazwisko">
                    </div>
                    <div class="form-group">
                        <label>Data urodzenia</label>
                        <input type="date" class="form-control" placeholder="Podaj swoją datę urodzenia">
                    </div>
                    <div class="form-group">
                        <label>Płeć</label>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="sex" id="sexRadio1">
                            <label class="form-check-label" for="sexRadio1">
                                Mężczyzna
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="sex" id="sexRadio2">
                            <label class="form-check-label" for="sexRadio2">
                                Kobieta
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Nazwa użytkownika</label>
                        <input type="text" class="form-control" placeholder="Podaj nazwę użytkownika">
                    </div>
                    <div class="form-group">
                        <label>Adres email</label>
                        <input type="text" class="form-control" placeholder="Podaj email">
                    </div>
                    <div class="form-group">
                        <label>Hasło</label>
                        <input type="password" class="form-control" placeholder="Podaj hasło">
                    </div>

                    <button type="submit" class="btn btn-success">Zarejestruj się</button>
                    <a href="<c:url value="/login" />" class="btn btn-primary">Logowanie</a>
                </form>
            </div>
        </div>
    </div>

    <%@ include file = "js.jsp" %>
</body>
</html>
