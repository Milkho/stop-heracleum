<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Log in - Stop Heracleum</title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${contextPath}/resources/css/modern-business.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <!--<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">-->
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">
</head>

<body>

<%@include file="fragments/navbar.jsp" %>


<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form method="POST" action="${contextPath}/login" class="form-signin">
                <br>
                <legend>Log in with your account</legend>

                <span>${message}</span>
                <div class="form-group col-md-12">
                    <input name="username" type="text" class="form-control" placeholder="Username"
                           autofocus="true"/>
                </div>

                <div class="form-group col-md-12">
                    <input name="password" type="password" class="form-control" placeholder="Password">
                </div>

                <div class="form-group">
                    <span>${error}</span>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="text-center">
                        <button type="submit" class="btn btn-default btn-block btn-lg">Log in</button>
                        <br>
                        <a href="${contextPath}/registration">Register an account</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /container -->


<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
