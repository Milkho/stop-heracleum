<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <title>${pageContext.request.userPrincipal.name} - <spring:message code="indexpage.maintitle"/> </title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">
</head>
<body>


<div class="container">

    <%@include file="fragments/navbar.jsp" %>
    <div class="row">
        <div class="col-md-8">
            <form:form method="POST" modelAttribute="userForm" class="orm-horizontal">
                <br>
                <legend>Edit your profile</legend>
                <spring:bind path="firstName">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <label class="col-lg-2 control-label">First name:</label>
                        <div class="col-lg-8">
                            <form:input type="text" path="firstName" class="form-control" value="${userForm.firstName}"
                                        onfocus="true"/>
                            <form:errors path="firstName"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="lastName">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <label class="col-lg-2 control-label">Last name:</label>
                        <div class="col-lg-8">
                            <form:input type="text" path="lastName" class="form-control" value="${userForm.lastName}"/>
                            <form:errors path="lastName"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="email">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <label class="col-lg-2 control-label">Email:</label>
                        <div class="col-lg-8">
                            <form:input type="email" path="email" class="form-control" placeholder="${userForm.email}"/>
                            <form:errors path="email"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="username">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <label class="col-lg-2   control-label">Username:</label>
                        <div class="col-lg-8">
                            <form:input type="text" path="username" class="form-control" placeholder="${userForm.username}"/>
                            <form:errors path="username"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="password">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <label class="col-lg-2 control-label">Password*:</label>
                        <div class="col-lg-8">
                            <form:input type="password" path="password" class="form-control" value="" placeholder="Enter your password"/>
                            <form:errors path="password"/>
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="confirmPassword">
                    <div class="form-group col-md-12 ${status.error ? 'has-error' : ''}">
                        <label class="col-lg-2 control-label">Confirm password*:</label>
                        <div class="col-lg-8">
                        <form:input type="password" path="confirmPassword" class="form-control"
                                    placeholder="Confirm your password"/>
                        <form:errors path="confirmPassword"/>
                    </div>
                    </div>
                </spring:bind>
                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-8">
                        <input type="submit" class="btn btn-default" value="Save Changes">
                        <span></span>
                        <input type="reset" class="btn btn-default" value="Cancel">
                    </div>
                </div>
            </form:form>
        </div>

    </div>

</div>
<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>