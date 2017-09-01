<div class="my-sidebar-wrapper">
    <div class="mini-submenu my-vertical-button  btn btn-default btn-lg"><spring:message code="sidebar.newpoint"/></div>
    <div class="my-sidebar">
        <c:if test="${not empty param.success}">
            <div class="alert alert-success fade in">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <spring:message code="sidebar.successmsg"/>
            </div>
        </c:if>
        <span class="pull-right" id="slide-submenu">
            <i class="fa fa-times fa-lg"></i>
        </span>

        <form:form method="POST" modelAttribute="pointForm" class="my-form">

            <spring:bind path="latitude">
                <label for="lat" class="my-label">
                    <spring:message code="sidebar.latitude"/>*</label>
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" id="lat" path="latitude" class="form-control"/>
                    <form:errors path="latitude"/>
                </div>
            </spring:bind>
            <spring:bind path="longitude">
                <label for="lng" class="my-label"><spring:message code="sidebar.longitude"/>*</label>
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" id="lng" path="longitude" class="form-control"/>
                    <form:errors path="longitude"/>
                </div>
            </spring:bind>

            <spring:bind path="photoLink">
                <label for="photo-link" class="my-label"><spring:message code="sidebar.photolink"/></label>
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" id="photo-link" path="photoLink" class="form-control"/>
                    <form:errors path="photoLink"/>
                </div>
            </spring:bind>

            <spring:bind path="description">
                <label for="description" class="my-label"><spring:message
                        code="sidebar.description"/></label>
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:textarea rows="6" type="text" id="description" path="description"
                                   class="form-control vertical-resize"/>
                    <form:errors path="description"/>
                </div>
            </spring:bind>

            <div class="form-group">
                <div class="text-center">
                    <button type="submit" class="btn btn-default btn-block "><spring:message
                            code="sidebar.submit"/></button>
                </div>
                </div>
            </form:form>
        </div>
</div>

<div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</div>

