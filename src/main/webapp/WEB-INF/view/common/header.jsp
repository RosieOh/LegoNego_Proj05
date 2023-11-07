<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath}" />

<header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">
        <div class="logo" style="padding-left: 50px;">
            <h1 class="text-light"><a href="${path1}/">LegoNego</a></h1>
        </div>

        <nav id="navbar" class="navbar" style="padding-right: 50px;">
            <ul>
                <li><a class="active" href="${path1}/">Home</a></li>
                <li class="dropdown"><a href="#"><span> 상품 보기 </span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li class="dropdown"><a href="#"><span>초등</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#"> 국어 </a></li>
                                <li><a href="#"> 수학 </a></li>
                                <li><a href="#"> 영어 </a></li>
                                <li><a href="#"> 탐구</a></li>
                                <li><a href="#"> 예체능</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span> 중등 </span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#"> 국어 </a></li>
                                <li><a href="#"> 수학 </a></li>
                                <li><a href="#"> 영어 </a></li>
                                <li><a href="#"> 탐구</a></li>
                                <li><a href="#"> 예체능</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span> 고등 </span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#"> 국어 </a></li>
                                <li><a href="#"> 수학 </a></li>
                                <li><a href="#"> 영어 </a></li>
                                <li><a href="#"> 탐구</a></li>
                                <li><a href="#"> 예체능</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#"><span> 커뮤니티 </span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li class="dropdown"><a href="${path1}/notice/list.do"><span> 공지사항 </span></a></li>
                        <li class="dropdown"><a href="#"><span> 자유게시판 </span></a></li>
                        <li class="dropdown"><a href="${path1}/faq/list.do"><span> 자주 묻는 질문 </span></a></li>
                        <li class="dropdown"><a href="#"><span> 고객의 소리 </span></a></li>
                    </ul>
                <li><a href="#"> 고객센터 </a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>