<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath}" />

<!-- Favicons -->
<link href="${path1}/resource/img/favicon.png" rel="icon">
<link href="${path1}/resource/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${path1}/resource/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${path1}/resource/vendor/aos/aos.css" rel="stylesheet">
<link href="${path1}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${path1}/resource/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${path1}/resource/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${path1}/resource/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${path1}/resource/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${path1}/resource/css/style.css" rel="stylesheet">

<!-- Vendor JS Files -->
<script src="${path1}/resource/vendor/aos/aos.js"></script>
<script src="${path1}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path1}/resource/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${path1}/resource/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${path1}/resource/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${path1}/resource/vendor/waypoints/noframework.waypoints.js"></script>
<script src="${path1}/resource/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${path1}/resource/js/main.js"></script>