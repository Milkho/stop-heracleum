<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stop Heracleum</title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->

    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">


</head>

<%@include file="fragments/navbar.jsp" %>

<div id="map"></div>


<sec:authorize access="isAuthenticated()">
<div class="sidebar">
    <div class="row">
        <div class="col-lg-12">
            <form:form method="POST" modelAttribute="pointForm" class="my-form">
                <spring:bind path="latitude">
                    <label for="lat" class="my-label">Latitude*</label>
                    <div class="form-group ${status.error ? 'has-error' : ''}">

                        <form:input type="text" id="lat" path="latitude" class="form-control"/>
                        <form:errors path="latitude"/>
                    </div>
                </spring:bind>
                <spring:bind path="longitude">

                    <label for="lng" class="my-label">Longitude*</label>

                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" id="lng" path="longitude" class="form-control"/>
                        <form:errors path="longitude"/>
                    </div>
                </spring:bind>

                <spring:bind path="photoLink">

                    <label for="photo-link" class="my-label">Photo link</label>

                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" id="photo-link" path="photoLink" class="form-control"/>
                        <form:errors path="photoLink"/>
                    </div>
                </spring:bind>

                <spring:bind path="description">
                    <label for="description" class="my-label">Description</label>
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:textarea rows="6" type="text" id="description" path="description" class="form-control vertical-resize"/>
                        <form:errors path="description"/>
                    </div>
                </spring:bind>

                <div class="form-group">
                    <div class="text-center">
                        <button type="submit" class="btn btn-default btn-block ">Submit</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

</sec:authorize>

<script>
    var map;
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 56.981316, lng: 32.449277},
            zoom: 6
        });

        google.maps.event.addListener(map, 'click', function (event) {
            addLatLng(event.latLng, map);
        });

        function addLatLng(location, map) {
            document.getElementById("lat").value = +location.lat();
            document.getElementById("lng").value = +location.lng();
        }

    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAr8YuEDjaiyVXYhUsPfe8yWmL_1RfP0C8&callback=initMap"
        async defer></script>
</body>
</html>