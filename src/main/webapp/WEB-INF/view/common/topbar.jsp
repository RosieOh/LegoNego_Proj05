<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
    <sec:authentication property="authorities" var="authorities"/> <!-- https://twoline.tistory.com/100 -->
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath}" />

<section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
        <div class="contact-info d-flex align-items-center">
        </div>
        <div class="social-links d-none d-md-flex align-items-center">
        </div>
        <div class="column is-6-desktop is-8-tablet" style="padding-right: 50px;">
            <c:if test="${empty principal}">
                <a href="${path1}/join" class="btn btn-light" style="background: #FCB9AA"> 회원가입 </a>
                <a href="${path1}/login" class="btn btn-light" style="background: #FCB9AA"> 로그인 </a>
            </c:if>
            <c:if test="${not empty principal}">
                <form action="/logout" method="post" class="d-inline">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="btn btn-light"> 로그아웃 </button>
                </form>
            </c:if>
            <c:if test="${authorities eq '[ADMIN]'}">
                <a href="${path1}/join" class="btn btn-light"> 관리자 페이지 </a>
            </c:if>
            <c:if test="${authorities eq '[TEACHER]'}">
                <a href="${path1}/join" class="btn btn-light"> 교사용 페이지 </a>
            </c:if>
            <c:if test="${authorities eq '[USER]'}">
                <a href="${path1}/get?id=${principal}" class="btn btn-light"> 마이페이지 </a>
            </c:if>
            <%-- 관리자 권한 부여 문제 해결해야함 --%>

        </div>
    </div>
</section>