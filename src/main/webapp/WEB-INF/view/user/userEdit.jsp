<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <title> 마이페이지 </title>
    <jsp:include page="../commin/head.jsp" />
    <c:if test="${not empty msg}">
        <script>
            alert("${msg}");
        </script>
    </c:if>
</head>
<body class="bg-body-tertiary">
<jsp:include page="../common/header.jsp" />

<div class="container pt-5 pb-5">
    <div class="w-50 m-auto">
        <form action="${path}/userEdit" method="post">
            <label for="name" class="mt-3"> 아이디 </label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly>

            <label for="name" class="mt-3"> 비밀번호 </label>
            <input type="text" class="form-control" id="password" name="password">

            <label for="username" class="mt-3"> 이름 </label>
            <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>

            <label for="email" class="mt-3"> 이메일 </label>
            <input type="text" class="form-control" id="email" name="email" value="${user.email}" required>

            <label for="address" class="mt-3"> 주소 </label>
            <input type="text" class="form-control" id="address" name="address" value="${user.address}" required>

            <label for="tel" class="mt-3"> 전화번호 </label>
            <input type="text" class="form-control" id="tel" name="tel" value="${user.tel}" required>

            <input type="submit" class="btn btn-dark w-100 mt-3" value="수정하기">
        </form>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>