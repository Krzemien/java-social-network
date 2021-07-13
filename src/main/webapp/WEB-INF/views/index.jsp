<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>

    <%@ include file = "css.jsp" %>
</head>
<body>
    <div class="container main">
        <div class="row">
            <div class="col-lg-3 left">
                <h4>Menu</h4><hr />

                <section class="menu">
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" href="<c:url value="/home"/>" aria-selected="true">Strona gówna</a>
                        <a class="nav-link" href="#" aria-selected="false">Twój profil</a>
                        <a class="nav-link" href="#" aria-selected="false">Ustawienia</a>
                        <form action="<c:url value="/logout"/>" method="post" class="nav-link">
                            <div class="btn-group btn-group-sm" role="group" aria-label="First group">
                                <button type="submit" class="btn btn-success">Wyloguj</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </div>
                        </form>
                    </div>
                </section>
            </div>

            <div class="col-lg-6 wall">
                <section class="new-post">
                    <form>
                        <div class="form-group">
                            <label for="new-post">Dodaj nowy post</label>
                            <textarea class="form-control" id="new-post" rows="4"></textarea>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success">dodaj post</button>
                        </div>
                    </form>
                </section>

                <section class="post">
                    <div class="post-user">
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="avatar">
                                    <div class="avatar-letters">
                                        FK
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-10">
                                <div class="name">Filip Krzyminski</div>
                                <div class="nick">@krzemien</div>
                                <div class="date">11-11-1111</div>
                                <div class="float-right">
                                    <a href="" class="btn btn-dark btn-sm">edytuj post</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="post-content">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                            Culpa cumque id officiis ut voluptatem? Blanditiis debitis dolore eum excepturi,
                            libero natus, officia quis rem sint tempore totam voluptate.
                            Aliquid dolor dolorem dolorum eligendi et ipsam iusto nam neque non nulla.
                    </div>
                    <div class="post-links">
                        <a href="" class="btn btn-link btn-sm">polub</a>
                        <span class="badge badge-primary badge-pill">14</span>
                        <a href="" class="btn btn-link btn-sm">komentarze</a>
                        <span class="badge badge-secondary badge-pill">14</span>
                    </div>
                    <hr>
                    <div class="post-add-comment">
                        <form>
                            <div class="form-group">
                                <textarea class="form-control" rows="4"></textarea>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success">dodaj komentarz</button>
                            </div>
                        </form>
                    </div>
                </section>

            </div>

            <div class="col-lg-3 right">
                <h4>Powiadomienia</h4><hr />

                <section class="notification">
                    <div class="alert alert-info" role="alert">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, tempore!
                    </div>
                </section>
                <section class="notification">
                    <div class="alert alert-info" role="alert">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, tempore!
                    </div>
                </section>
            </div>
        </div>
    </div>

    <%@ include file = "js.jsp" %>
</body>
</html>
