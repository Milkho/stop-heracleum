<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="log in page, stop heracleum">
    <meta name="author" content="Mykhailo Khoroshun">

    <title><spring:message code="userform.login"/> - <spring:message code="indexpage.maintitle"/> </title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">

</head>

<body>

<%@include file="fragments/navbar.jsp" %>


<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form method="POST" action="${contextPath}/login" class="my-form">
                <br>
                <legend><spring:message code="userform.logtitle"/></legend>

                <div class="form-group col-md-12">
                    <input name="username" type="text" class="form-control"
                           placeholder="<spring:message code="userform.username"/>"
                           autofocus="true"/>
                </div>

                <div class="form-group col-md-12">
                    <input name="password" type="password" class="form-control"
                           placeholder="<spring:message code="userform.password"/>">
                </div>

                <div class="form-group">
                       <c:if test="${not empty error}">
                           <span><spring:message code="${error}"/></span>
                       </c:if>
                    <input type="hidden" class="error" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <div class="text-center">
                        <button type="submit" class="btn btn-default btn-block btn-lg"><spring:message
                                code="userform.login"/></button>
                        <br>
                        <a href="${contextPath}/registration"><spring:message code="userform.loginmsg"/></a>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<%@include file="fragments/footer.jsp" %>
<!-- /container -->


<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
