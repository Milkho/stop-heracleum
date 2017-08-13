<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
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
                    <a class="navbar-brand" href="${contextPath}/">Stop Heracleum</a>
                </li>
                <li>
                    <a href="${contextPath}/map">Map</a>
                </li>
                <li>
                    <a href="${contextPath}/points">Points</a>
                </li>
                <li>
                    <a href="${contextPath}contact.html">Contact</a>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="isAuthenticated()">
                    <li>
                        <a href="${contextPath}/profile">Profile</a>
                    </li>

                    <li>
                        <a onclick="document.forms['logoutForm'].submit()">Log out</a>
                    </li>
                </sec:authorize>
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                </form>
                <sec:authorize access="isAnonymous()">
                    <li>
                        <a href="${contextPath}/login">Log in</a>
                    </li>
                    <li>
                        <a href="${contextPath}/registration">Sign up</a>
                    </li>
                </sec:authorize>

            </ul>
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>