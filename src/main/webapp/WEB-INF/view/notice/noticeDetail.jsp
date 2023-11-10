<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
    <sec:authentication property="authorities" var="authorities"/>
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
    <title>공지사항 상세보기</title>

    <jsp:include page="../common/head.jsp"/>
</head>
<style>
    .breadcrumb a { color: #464646; }

    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

    .single-blog-item {
        min-height: 35vh;
    }

    .blog-item-content hr {
        margin-top: 0;
    }

    .blog-item-content p {
        color: black;
        font-size: 1.25rem;
    }

    .btns .button {
        width: 6rem;
    }
</style>
<body>

<!-- ======= Top Bar ======= -->
<jsp:include page="../common/topbar.jsp"/>

<!-- ======= Header ======= -->
<jsp:include page="../common/header.jsp"/>
<!-- End Header -->

<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a >커뮤니티</a></li>
        <li><a href="${path1}/notice/list.do">공지사항</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">공지사항</p>
</nav>

<div class="container">
    <div class="columns is-multiline mt-1">
        <div class="column is-12 mb-5 border-top">
            <div class="single-blog-item">
                <div class="blog-item-content ml-6 mt-3">
                    <%--<h2 class="mt-4">A place where start new life with peace</h2>--%>
                    <p class="has-text-black has-text-weight-semibold mt-1" style="font-size: 1.75rem;">${domain.title }</p>

                    <div class="blog-item-meta py-2 mb-4">
                        <span class="is-size-6 mr-3">작성자
                            <span class="is-size-6 has-text-grey ml-1">관리자</span>
                        </span> |
                        <span class="is-size-6 mx-3">작성일
                            <span class="is-size-6 has-text-grey ml-1">${domain.resdate }</span>
                        </span> |
                        <span class="is-size-6 mx-3">조회수
                            <span class="is-size-6 has-text-grey ml-1">${domain.visit}</span>
                        </span>
                    </div>
                    <hr>
                    <p>
                        ${domain.content }
                    </p>
                </div>
            </div>
            <div class="btns has-text-centered">
                <c:choose>
                    <c:when test="${authorities eq '[ADMIN]'}">
                        <a class="button mx-1" style="background-color: #2B3A55; color: #fff;" href="${path1 }/notice/list.do">목록</a>
                        <a class="button is-info mx-1" href="${path1 }/notice/edit.do?no=${domain.no}">수정</a>
                        <a class="button is-danger mx-1" href="${path1 }/notice/delete.do?no=${domain.no}">삭제</a>
                    </c:when>
                    <c:otherwise>
                        <a class="button mx-1" style="background-color: #2B3A55; color: #fff;" href="${path1 }/notice/list.do">목록</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<!-- ======= Footer ======= -->
<jsp:include page="../common/footer.jsp" />
<!-- End Footer -->

</body>
</html>