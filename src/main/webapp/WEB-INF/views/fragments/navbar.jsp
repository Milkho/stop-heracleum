<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top black-navbar" role="navigation">
    <div class="container">

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="${contextPath}/"><spring:message
                    code="navbar.index"/></a>
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">

                <li>
                    <a href="${contextPath}/map"><spring:message
                            code="navbar.map"/></a>
                </li>
                <li>
                    <a href="${contextPath}/contact"><spring:message
                            code="navbar.contact"/></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <form id="logoutForm" class="hidden" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <sec:authorize access="isAuthenticated()">
                    <li>
                        <a>${pageContext.request.userPrincipal.name}</a>
                    </li>
                    <li>
                        <a onclick="document.forms['logoutForm'].submit()"><spring:message
                                code="navbar.logout"/></a>
                    </li>
                </sec:authorize>

                <sec:authorize access="isAnonymous()">
                    <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    </form>
                    <li>
                        <a href="${contextPath}/login"><spring:message
                                code="navbar.login"/></a>
                    </li>
                    <li>
                        <a href="${contextPath}/registration"><spring:message
                                code="navbar.signup"/></a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

