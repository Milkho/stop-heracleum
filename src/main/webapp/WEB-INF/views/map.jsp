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
    <meta name="author" content="Mykhailo Khoroshun, Михайло Хорошун, Михаил Хорошун">

    <title><spring:message code ="navbar.map"/> - <spring:message code="indexpage.maintitle"/> </title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">
    <!--Custom fonts-->
    <link href="<c:url value="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"/>" rel="stylesheet">
</head>
<body>


<%@include file="fragments/navbar.jsp" %>

<div id="map"></div>
<sec:authorize access="isAuthenticated()">
    <%@include file="fragments/sidebar.jsp" %>
</sec:authorize>
<script>

    var map;

    var markerId = [
        <c:forEach var="m" items="${points}">
        <c:out value="${m.id}"/>,
        </c:forEach>
    ];
    var markerLat = [
        <c:forEach var="m" items="${points}">
        <c:out value="${m.latitude}"/>,
        </c:forEach>
    ];

    var markerLong = [
        <c:forEach var="m" items="${points}">
        <c:out value="${m.longitude}"/>,
        </c:forEach>
    ];

    var markerDesc = [
        <c:forEach var="m" items="${points}">
        <c:out value= "\"${m.description}\"" escapeXml="false"/>,
        </c:forEach>
    ];

    var markerPhotoLink = [
        <c:forEach var="m" items="${points}">
        <c:out value= "\"${m.photoLink}\"" escapeXml="false"/>,
        </c:forEach>
    ];

    var markerTime = [
        <c:forEach var="m" items="${points}">
        <c:out value= "${m.datetime.time}"/>,
        </c:forEach>
    ];

    var markerUserId = [
        <c:forEach var="m" items="${points}">
        <c:out value= "${m.user.id}" />,
        </c:forEach>
    ];


    function initMap() {

        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 48.981316, lng: 30.449277},
            zoom: 6
        });

        var infoWindow = new google.maps.InfoWindow();
        var marker;
        var iconBase = 'http://maps.gstatic.com/mapfiles/ridefinder-images/';

        for (var i = 0; i < markerLat.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(markerLat[i], markerLong[i]),
                map: map,
                icon: iconBase + 'mm_20_green.png'
            });

            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                    return function () {
                        var content = "";
                        if (markerDesc[i] !== "") {
                            content += "<spring:message code="map.desc"/>:" + markerDesc[i] + " <br> ";
                        }
                        if (markerPhotoLink[i] !== "") {
                            content += "<spring:message code="map.photo"/>: <a href=\"" + markerPhotoLink[i] + "\"><img class=\"my-image-preview\" src=\"" + markerPhotoLink[i] + "\"></a><br> ";
                        }

                        content += "<spring:message code="map.date"/>:" + new Date(markerTime[i]).toLocaleString() + "<br>";
                        if (markerUserId[i].toString() === "${currentUserId}") {
                            content += '<form action = "${contextPath}/map/remove-point" method="POST"><input name="pointId" type="hidden" value="'+ markerId[i] +'"/> <input type="submit" value="<spring:message code="map.delete"/>><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></form>';
                        }
                        infoWindow.setContent(content);

                        infoWindow.open(map, marker);
                    }
                })
                (marker, i)
            )
            ;
        }

        <sec:authorize access="isAuthenticated()">
        google.maps.event.addListener(map, 'click', function (event) {
            addLatLng(event.latLng, map);
        });

        function addLatLng(location, map) {
            document.getElementById("lat").value = +location.lat();
            document.getElementById("lng").value = +location.lng();
        }

        </sec:authorize>
    }

</script>

<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/custom/sidebar-slider.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAr8YuEDjaiyVXYhUsPfe8yWmL_1RfP0C8&callback=initMap"
        async defer></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>