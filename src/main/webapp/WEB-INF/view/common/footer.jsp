<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<c:set var="path1" value="${pageContext.request.contextPath}" />

<footer id="footer">

    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-6 footer-contact">
                    <h3>LegoNego</h3>
                    <p>
                        서울특별시 금천구 가산동<br>
                        New York, NY 535022<br>
                        United States <br><br>
                        <strong>Phone:</strong> +82 010 - 7329 - 7484<br>
                        <strong>Email:</strong> dhxogns920@naver.com<br>
                    </p>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#"> Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#"> 상품보기 </a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#"> 커뮤니티 </a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#"> 고객센터 </a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#"> contact </a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Our Services</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Enjoy Our Services</h4>
                    <p>당신의 안쓰는 물건을 보다 합리적인 가격으로 판매와 소비자를 만족하는 우리는 <b>LegoNego</b> 입니다.</p>
                    <form action="" method="post">
                        <input type="email" name="email"><input type="submit" value="Subscribe">
                    </form>
                </div>

            </div>
        </div>
    </div>

    <div class="container d-md-flex py-4">

        <div class="me-md-auto text-center text-md-start">
            <div class="copyright">
                &copy; Copyright <strong><span> LegoNego </span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                Designed by <a href="https://github.com/RosieOh">Rosie Oh</a>
            </div>
        </div>
        <div class="social-links text-center text-md-right pt-3 pt-md-0">
            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            <a href="#" class="github"><i class="bx bxl-github"></i></a>
        </div>
    </div>
</footer>