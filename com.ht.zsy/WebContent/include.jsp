
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- Jquery -->
<script src="${ctx}/js/jquery-2.2.3.min.js" type="text/javascript"></script>

<!-- Bootstrap -->
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet"/>
<script src="${ctx}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>

<script>
    function toIndex() {
        window.location.href = '${ctx}/';
    }
</script>