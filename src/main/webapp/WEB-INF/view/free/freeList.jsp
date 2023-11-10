<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>자유게시판</title>

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
        <li><a href="${path1}/" class="has-text-dark"><i class="xi-home is-size-4"></i> 홈</a></li>
        <li><span class="mx-2 has-text-grey">/</span></li>
        <li><a href="${path1}/community" class="has-text-dark">커뮤니티</a></li>
        <li><span class="mx-2 has-text-grey">/</span></li>
        <li><a href="${path1}/free/list.do" class="has-text-primary">자유게시판</a></li>
    </ul>
    <div class="has-text-centered">
        <p class="title is-size-4 mt-1">자유게시판</p>
        <p class="contents has-text-grey">일정 및 행사 안내, 이벤트 발표, 채널 등 해법의 커뮤니티 게시판입니다.</p>
    </div>
</nav>

<div class="container">
    <div class="container mt-1 mx-5">
        <div class="row">
            <div class="col-md-4">
                <form action="${path1}/free/list.do" method="get" class="input-group">
                    <div class="input-group-prepend">
                        <select class="custom-select" id="type" name="type" style="height: 38px;"> <!-- 높이 조정 -->
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                    </div>
                    <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary">검색</button>
                    </div>
                </form>
            </div>
            <div class="col-md-2 offset-md-6 text-right">
                <c:choose>
                    <c:when test="${authorities eq '[USER]'}">
                        <a class="btn btn-link btn-md" href="${path1}/free/insert.do?site=user">글쓰기</a>
                    </c:when>
                    <c:when test="${authorities eq '[ADMIN]'}">
                        <a class="btn btn-link btn-md" href="${path1}/free/insert.do?site=admin">관리자용 글쓰기</a>
                    </c:when>
                    <c:when test="${authorities eq '[TEACHER]'}">
                        <a class="btn btn-link btn-md" href="${path1}/free/insert.do?site=teacher">강사용 글쓰기</a>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <br>
    <div class="column is-12">
        <table class="table is-centered is-fullwidth">
            <thead>
            <tr>
                <th class="item1">No</th>
                <th class="item2 has-text-centered">제목</th>
                <th class="item3 has-text-centered">등록일</th>
                <th class="item4 has-text-centered">작성자</th>
                <th class="item5 has-text-centered">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="free" items="${freeList }" varStatus="status">
                <tr>
                    <td>${total - ((curPage - 1) * page.postCount + status.index) }</td>
                    <td>
                        <a href="${path1 }/free/detail.do?no=${freeList.fno }" class="al">${free.title }</a>
                    </td>
                    <fmt:parseDate value="${free.resdate}" pattern="yyyy-MM-dd" var="formattedDate" />
                    <td class="has-text-centered"><fmt:formatDate value="${formattedDate }" pattern="yyyy.MM.dd"/></td>
                    <td class="has-text-centered">관리자</td>
                    <td class="has-text-centered">${free.visit }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<br>
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