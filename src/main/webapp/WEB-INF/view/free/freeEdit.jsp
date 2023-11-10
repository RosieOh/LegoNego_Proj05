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
    <title>공지사항 수정하기</title>

    <jsp:include page="../common/head.jsp"/>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

    .table th {
        white-space: nowrap;
        vertical-align: middle;
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
        <li><a style="color: black;" href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a style="color: black;">커뮤니티</a></li>
        <li><a style="color: black; " href="${path1}/free/list.do">자유게시판</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">자유게시판</p>
</nav>s

<div class="container">
    <div class="columns">
        <div class="column is-10 is-offset-1">
            <form action="${path1 }/free/edit.do" method="post">
                <table class="table is-centered is-fullwidth">
                    <tbody>
                    <tr class="border-top">
                        <th class="has-text-centered">제목</th>
                        <td>
                            <input type="hidden" name="no" id="no" value="${domain.fno }">
                            <input type="text" name="title" id="title" class="input" placeholder="제목 입력"
                                   value="${domain.title }"
                                   maxlength="98" required>
                        </td>
                    </tr>
                    <tr class="border-bottom">
                        <th class="has-text-centered">내용</th>
                        <td>
                            <textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100"  maxlength="800"  required>
                                ${domain.content }
                            </textarea>
                            <script>
                                CKEDITOR.replace('content', {filebrowserUploadUrl: '${path1}/free/imageUpload.do'});
                            </script>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="has-text-centered">
                    <button type="submit" class="button is-link mb-5 p-5" style="border-radius: 1.5rem;">수정하기</button>
                </div>
            </form>
        </div>
        <div class="column is-1"></div>
    </div>
</div>

<!-- ======= Footer ======= -->
<jsp:include page="../common/footer.jsp" />
<!-- End Footer -->

</body>
</html>