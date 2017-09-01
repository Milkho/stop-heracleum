<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang=uk_UA>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><spring:message code="indexpage.maintitle"/> </title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">
<link href="<c:url value="//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css"/>" rel="stylesheet">
</head>

<body>

<%@include file="fragments/navbar.jsp" %>

<!-- Header Carousel -->
<header class="carousel slide">
    <div class="fill"
         style="background-image:url(${contextPath}/resources/images/heracleum.jpg);"></div>

</header>


<!-- Page Content -->
<div class="container">

    <!-- Marketing Icons Section -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                <spring:message code="indexpage.maintitle"/>
            </h1>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><span class="glyphicon glyphicon-search" aria-hidden="true"></span>   <spring:message code="indexpage.firsttitle"/>    </h4>
                </div>
                <div class="panel-body">
                    <p><spring:message code="indexpage.firsttext"/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><span class="glyphicon glyphicon-camera" aria-hidden="true"></span>  <spring:message code="indexpage.secondtitle"/></h4>
                </div>
                <div class="panel-body">
                    <p><spring:message code="indexpage.secondtext"/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>  <spring:message code="indexpage.thirdtitle"/></h4>
                </div>
                <div class="panel-body">
                    <p><spring:message code="indexpage.thirdtext"/></p>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header"><spring:message code="indexpage.finallytitle"/></h2>
        </div>
        <div class="col-md-6">
            <p><spring:message code="indexpage.finallytext"/></p>

        </div>
        <div class="col-md-6 hidden-xs hidden-sm">
            <img class="img-responsive my-image-bordered " src="${contextPath}/resources/images/kids.jpg" alt="kids on grass">
        </div>
    </div>
    <!-- /.row -->
    <div class="push"></div>
</div>


<%@include file="fragments/footer.jsp" %>
<!-- /.container -->

<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>

</html>
