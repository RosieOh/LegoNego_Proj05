<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <title>Tsherpa</title>

    <jsp:include page="../common/head.jsp"/>
</head>
<body>

<!-- ======= Top Bar ======= -->
<jsp:include page="../common/topbar.jsp"/>

<!-- ======= Header ======= -->
<jsp:include page="../common/header.jsp"/>
<!-- End Header -->

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<style>
    .breadcrumb a { color: #464646; }

    .hero .nav, .hero.is-success .nav {
        -webkit-box-shadow: none;
        box-shadow: none;
    }

    .avatar {
        margin-top: -70px;
        padding-bottom: 20px;
    }
    .avatar img {
        padding: 5px;
        background: #fff;
        border-radius: 50%;
        -webkit-box-shadow: 0 2px 3px rgba(10,10,10,.1), 0 0 0 1px rgba(10,10,10,.1);
        box-shadow: 0 2px 3px rgba(10,10,10,.1), 0 0 0 1px rgba(10,10,10,.1);
    }

    .field{
        padding-bottom: 10px;
    }

    .field .input {
        font-size: 1rem;
    }
</style>


<div class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9; height: 200px;" aria-label="breadcrumbs">
    <div class="container-fluid" style="background: #f1f4f9;">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background: #f1f4f9;">
            <a class="navbar-brand" href="${path1}/"><i class="xi-home is-size-3"></i> Home</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${path1}/user/login">로그인</a>
                </li>
            </ul>
        </nav>
        <div class="container mt-5">
            <h2 class="text-center">로그인</h2>
        </div>
    </div>
</div>


<div class="w-25 m-auto mt-5 pt-5" style="min-height: 50vh">
    <main class="form-signin w-100 m-auto">
        <form action="${path1}/auth" method="post">
            <h1 class="h3 mb-3 fw-normal"> Login </h1>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <div class="form-floating">
                <input type="text" class="form-control" id="name" name="name" placeholder="아이디를 입력해주세요" autocomplete="off" required>
                <label for="name"> ID </label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" autocomplete="off" required>
                <label for="password">Password</label>
            </div>

            <div class="form-check text-start my-3">
                <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    Remember me
                </label>
            </div>
            <button class="btn btn-primary w-100 py-2" type="submit"> 로그인 </button>
            <p class="d-flex justify-content-center mt-3"> 회원이 아니신가요? &nbsp; <a href="${path1}/user/join" class="text-secondary"> 회원가입하기 </a></p>
        </form>
    </main>
</div>

<!-- ======= Footer ======= -->
<jsp:include page="../common/footer.jsp" />
<!-- End Footer -->

</body>
</html>