<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title>404 <spring:message code="errorpage.title404"/> - Stop Heracleum</title>
    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">

</head>
<body>

<div class="container">
    <div class="jumbotron">

        <div class="text-center"><i class="fa fa-5x fa-frown-o" style="color:#d9534f;"></i></div>
        <h1 class="text-center"><spring:message code="errorpage.title404"/><br>
        <p><small class="text-center"> <spring:message code="errorpage.broken404"/></small></p></h1>
        <p class="text-center"><spring:message code="errorpage.tip404"/></p>
        <p class="text-center"><a class="btn btn-default btn-lg" href="/"><i class="fa fa-home"></i><spring:message code="errorpage.homebutton"/></a></p>
    </div>
</div>
<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
