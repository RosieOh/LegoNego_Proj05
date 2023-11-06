<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<c:set var="path0" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <title>Tsherpa</title>

    <jsp:include page="./common/head.jsp"/>
</head>
<body>

<!-- ======= Top Bar ======= -->
<jsp:include page="./common/topbar.jsp"/>

<!-- ======= Header ======= -->
<jsp:include page="./common/header.jsp"/>
<!-- End Header -->



<!-- ======= Footer ======= -->
<jsp:include page="./common/footer.jsp" />
<!-- End Footer -->

</body>
</html>