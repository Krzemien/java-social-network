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
            <div class="col-lg-3 left">
                <h4>${name}</h4>
                <hr />

                <section class="menu">
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" href="<c:url value="/"/>" aria-selected="true">Strona gówna</a>
                        <a class="nav-link" href="#" aria-selected="false">Twój profil</a>
                        <a class="nav-link" href="#" aria-selected="false">Ustawienia</a>
                        <form action="<c:url value="/logout"/>" method="post" class="nav-link">
                            <div class="btn-group btn-group-sm" role="group" aria-label="First group">
                                <button type="submit" class="btn btn-primary">Wyloguj</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </div>
                        </form>
                    </div>
                </section>
            </div>

            <div class="col-lg-6 wall">
                <section class="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Kogo chcesz wyszukać?">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">szukaj</button>
                        </div>
                    </div>
                </section>

                <section class="new-post">
                    <form:form method="post" modelAttribute="post" action="/post">
                        <div class="form-group">
                            <label for="new-post">Dodaj nowy post</label>
                            <form:textarea path="content" class="form-control" id="new-post" rows="4"></form:textarea>
                        </div>
                        <form:errors path="content" cssClass="alert alert-warning" element="div" />
                        <div class="form-group">
                            <button class="btn btn-success">dodaj post</button>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </section>

                <c:forEach var="post" items="${posts}">
                <section class="post">
                    <div class="post-user">
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="avatar">
                                    <div class="avatar-letters">
                                            ${post.user.firstName.charAt(0)}${post.user.lastName.charAt(0)}
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-10">
                                <div class="name">${post.user.firstName} ${post.user.lastName}</div>
                                <div class="nick">
                                    <a href="#">
                                        @${post.user.userName}
                                    </a>
                                </div>
                                <div class="info">
                                    <a href="#">
                                        #${post.id} ${post.createdOn}
                                    </a>
                                </div>
                                <div class="float-right">
                                    <!-- Button trigger modal -->
<%--                                    <button type="button" class="btn btn-dark btn-sm" data-toggle="modal" data-target="#post-modal-${post.id}">--%>
<%--                                        edytuj--%>
<%--                                    </button>--%>
                                    <a href="#" class="btn btn-dark btn-sm">edytuj</a>
                                    <a href="#" class="btn btn-dark btn-sm">usuń</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="post-content">
                        ${post.content}
                    </div>
                    <div class="post-links">
                        <a href="#" class="btn btn-link btn-sm">polub</a>
                        <span class="badge badge-primary badge-pill">14</span>
                        <a href="#" class="btn btn-link btn-sm">komentarze</a>
                        <span class="badge badge-secondary badge-pill">14</span>
                    </div>
                    <hr>
                    <div class="post-add-comment">
                        <form>
                            <div class="form-group">
                                <textarea class="form-control" rows="2"></textarea>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success">dodaj komentarz</button>
                            </div>
                        </form>
                    </div>
                </section>

                <!-- Modal -->
<%--                <div class="modal fade" id="post-modal-${post.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--                    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <h5 class="modal-title" id="exampleModalLongTitle">Edycja posta</h5>--%>
<%--                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                    <span aria-hidden="true">&times;</span>--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body">--%>
<%--                                <form>--%>
<%--                                    <div class="form-group">--%>
<%--                                        <textarea class="form-control" rows="4">${post.content}</textarea>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <button type="button" class="btn btn-secondary" data-dismiss="modal">zamknij</button>--%>
<%--                                <button type="button" class="btn btn-success">edytuj</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

                </c:forEach>

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

                <section class="more-notonotifications">
                    <div>
                        <a href="#" class="btn btn-primary">więcej powiadomień</a>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <%@ include file = "js.jsp" %>
</body>
</html>
