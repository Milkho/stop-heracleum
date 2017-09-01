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

    <title><spring:message code="contact.title"/> - <spring:message code="indexpage.maintitle"/></title>
    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">

</head>
<body>

<%@include file="fragments/navbar.jsp" %>

<div class="container">

    <div class="page-header">
        <h1> <spring:message code="contact.title"/> </h1>
    </div>

    <div class="well"><spring:message code="contact.tip"/></div>

    <form action="https://formspree.io/michael.khoroshun@gmail.com" class="form-horizontal" method="post" role="form">
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label"><spring:message code="contact.email"/></label>
            <div class="col-sm-4">
                <input type="email" class="form-control" id="email" name="email" placeholder="<spring:message code="contact.emailhover"/>" required autofocus>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-2 control-label"><spring:message code="contact.name"/></label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="name" name="name" placeholder="<spring:message code="contact.namehover"/>" required>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-2 control-label"><spring:message code="contact.message"/></label>
            <div class="col-sm-6">
                <textarea id="message" name="message" class="form-control" placeholder="<spring:message code="contact.msghover"/>" rows="5" required></textarea>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <button type="submit" class="btn btn-default"><spring:message code="contact.sndmsg"/></button>
            </div>
        </div>
    </form>

</div>

<%@include file="fragments/footer.jsp" %>
<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
