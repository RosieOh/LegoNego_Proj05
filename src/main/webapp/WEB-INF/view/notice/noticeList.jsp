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
    <title> 공지사항 </title>

    <jsp:include page="../common/head.jsp"/>
</head>
<body>

<!-- ======= Top Bar ======= -->
<jsp:include page="../common/topbar.jsp"/>

<!-- ======= Header ======= -->
<jsp:include page="../common/header.jsp"/>
<!-- End Header -->

<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a>커뮤니티</a></li>
        <li><a href="${path1}/notice/list.do">공지사항</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">공지사항</p>
    <%--    <h3 class="contents">일정 및 행사 안내, 이벤트 발표, 채널 등 해법의 커뮤니티 게시판입니다.</h3>--%>
</nav>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <form action="${path1}/notice/list.do" method="get" class="form-inline">
                <div class="form-group">
                    <select class="form-control" id="type" name="type">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}">
                </div>
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
        <div class="col-md-8 text-right">
            <c:if test="${sid.equals('admin')}">
                <a class="btn btn-primary" href="${path1}/notice/insert.do?site=user">글쓰기</a>
            </c:if>
        </div>
    </div>
    <div class="table-responsive mt-3">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th class="item1">No</th>
                <th class="item2 text-center">제목</th>
                <th class="item3 text-center">등록일</th>
                <th class="item4 text-center">작성자</th>
                <th class="item5 text-center">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="noti" items="${noticeList}" varStatus="status">
                <tr>
                    <td>${total - ((curPage - 1) * page.postCount + status.index)}</td>
                    <td>
                        <a href="${path1}/notice/detail.do?no=${noti.no}" class="alert-link">${noti.title}</a>
                    </td>
                    <fmt:parseDate value="${noti.resdate}" pattern="yyyy-MM-dd" var="formattedDate" />
                    <td class="text-center"><fmt:formatDate value="${formattedDate}" pattern="yyyy.MM.dd"/></td>
                    <td class="text-center">관리자</td>
                    <td class="text-center">${noti.visit}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
    <c:if test="${curPage > page.pageCount }">
        <a href="${path1 }/notice/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
    </c:if>
    <c:if test="${page.blockLastNum < page.totalPageCount }">
        <a href="${path1 }/notice/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
    </c:if>

    <ul class="pagination-list">
        <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
            <c:choose>
                <c:when test="${i == curPage }">
                    <li>
                        <a href="${path1 }/notice/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="${path1 }/notice/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
</nav>

<!-- ======= Footer ======= -->
<jsp:include page="../common/footer.jsp" />
<!-- End Footer -->

</body>
</html>