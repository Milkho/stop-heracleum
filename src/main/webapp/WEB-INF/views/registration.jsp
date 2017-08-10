<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">

</head>

<body>

<%@include file="fragments/navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form:form method="POST" modelAttribute="userForm" class="form-signin">
                <br>

                <legend>Create your account</legend>

                <spring:bind path="firstName">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="firstName" class="form-control" placeholder="First Name"
                        onfocus="true"/>
                        <form:errors path="firstName"/>
                    </div>
                </spring:bind>

                <spring:bind path="lastName">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="lastName" class="form-control" placeholder="Last Name"/>
                        <form:errors path="lastName"/>
                    </div>
                </spring:bind>

                <spring:bind path="email">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <form:input type="email" path="email" class="form-control" placeholder="Email"/>
                        <form:errors path="email"/>
                    </div>
                </spring:bind>

                <spring:bind path="username">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="Username"/>
                        <form:errors path="username"/>
                    </div>
                </spring:bind>

                <spring:bind path="password">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password" class="form-control" placeholder="Password"/>
                        <form:errors path="password"/>
                    </div>
                </spring:bind>

                <spring:bind path="confirmPassword">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="confirmPassword" class="form-control"
                                    placeholder="Reenter password"/>
                        <form:errors path="confirmPassword"/>
                    </div>
                </spring:bind>

                <div class="form-group">
                    <div class="col-md-12 text-center">
                        <button class="btn btn-default btn-block btn-lg" type="submit">Submit</button>
                        <br>
                        <a href="${contextPath}/login">Already have an account?</a>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
<!-- /container -->


<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>