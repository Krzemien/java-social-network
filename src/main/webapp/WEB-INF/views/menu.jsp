<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-lg-3 left">
    <h4>${userData.firstName} ${userData.lastName}</h4>
    <hr />

    <section class="menu">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" href="<c:url value="/"/>" aria-selected="true">Strona gówna</a>
            <a class="nav-link" href="<c:url value="/user/${userData.userName}"/>" aria-selected="false">Twój profil</a>
            <a class="nav-link" href="<c:url value="/user/edit"/>" aria-selected="false">Ustawienia</a>
            <form action="<c:url value="/logout"/>" method="post" class="nav-link">
                <div class="btn-group btn-group-sm" role="group" aria-label="First group">
                    <button type="submit" class="btn btn-primary">Wyloguj</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </div>
            </form>
        </div>
    </section>
</div>