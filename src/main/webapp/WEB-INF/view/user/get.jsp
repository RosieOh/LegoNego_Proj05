<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path1" value="${pageContext.request.contextPath}" />
<sec:authorize access="isAuthenticated()">
    <!-- principal 변수에 로그인 여부 저장 -->
    <sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <title> 마이페이지 </title>
    <jsp:include page="../common/head.jsp" />
    <c:if test="${not empty principal}">
        <script>
            alert("${principal}");
        </script>
    </c:if>
</head>
<body class="bg-body-tertiary">
<jsp:include page="../common/header.jsp" />

<div class="container pt-5 pb-5">
    <div class="w-50 m-auto">
        <label for="name"> 아이디 </label>
        <input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly>

        <label for="username" class="mt-3"> 이름 </label>
        <input type="text" class="form-control" id="username" name="username" value="${user.username}" readonly>

        <label for="email" class="mt-3"> 이메일 </label>
        <input type="text" class="form-control" id="email" name="email" value="${user.email}" readonly>

        <label for="address" class="mt-3"> 주소 </label>
        <input type="text" class="form-control" id="address" name="address" value="${user.address}" readonly>

        <label for="tel" class="mt-3"> 전화번호 </label>
        <input type="text" class="form-control" id="tel" name="tel" value="${user.tel}" readonly>

        <label for="regdate" class="mt-3"> 가입일 </label>
        <input type="text" class="form-control" id="regdate" name="regdate" value="${user.regdate}" readonly>

        <div class="d-flex justify-content-end mt-3">
            <a href="${path1}/userEdit?id=${principal}" class="btn btn-dark"> 개인정보 변경 </a>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>
