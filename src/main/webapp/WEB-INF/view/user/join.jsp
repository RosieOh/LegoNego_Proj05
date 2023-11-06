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


<div class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9; height: 200px;" aria-label="breadcrumbs">
    <div class="container-fluid" style="background: #f1f4f9;">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background: #f1f4f9;">
            <a class="navbar-brand" href="${path1}/"><i class="xi-home is-size-3"></i> Home</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${path1}/user/join"> 회원가입 </a>
                </li>
            </ul>
        </nav>
        <div class="container mt-5">
            <h2 class="text-center"> 회원가입 </h2>
        </div>
    </div>
</div>

    <div class="w-50 m-auto mt-5 pt-5" style="min-height: 50vh">
        <main class="form-signin w-100 m-auto">
            <form action="${path1}/joinPro" method="post" onsubmit="return joinConfirm(this)">
                <h1 class="h3 mb-3 fw-normal"> 환영합니다~! </h1>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <div class="d-flex justify-content-between">
                    <div class="form-floating w-75">
                        <input type="text" class="form-control" id="name" name="name" placeholder="아이디를 입력해주세요" autocomplete="off" pattern="^[a-z0-9]*$" required>
                        <label for="name"> ID </label>
                    </div>
                    <button type="button" class="btn btn-primary" id="idCheckBtn"> 중복체크 </button>
                    <input type="hidden" name="idCheck" id="idCheck" value="false">
                </div>
                <div id="msg" class="mb-2"></div>

                <div class="form-floating mt-1">
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" autocomplete="off" pattern="^\d{4,}(?:[a-z@^*]*)?$" required>
                    <label for="password">Password</label>
                </div>

                <div class="form-floating mt-1">
                    <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호를 다시 입력해주세요" autocomplete="off"  pattern="^\d{4,}(?:[a-z@^*]*)?$" required>
                    <label for="password2">Password Confirm</label>
                </div>

                <div class="form-floating mt-1">
                    <input type="text" class="form-control" id="username" name="username" placeholder="이름을 입력해주세요" autocomplete="off" pattern="^[가-힣]+$" required>
                    <label for="password2">name</label>
                </div>

                <div class="form-floating mt-1">
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요" autocomplete="off" pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}" required>
                    <label for="email">email</label>
                </div>

                <div class="form-floating mt-1">
                    <input type="text" class="form-control" id="address" name="address" placeholder="주소를 입력해주세요" autocomplete="off" pattern="^[가-힣a-zA-Z0-9\s]*$" required>
                    <label for="address">address</label>
                </div>

                <div class="form-floating mt-1">
                    <input type="tel" class="form-control" id="tel" name="tel" placeholder="전화번호를 입력해주세요" autocomplete="off" pattern="\d{2,4}-\d{3,4}-\d{4}" required>
                    <label for="tel">tel</label>
                </div>

                <button class="btn btn-primary w-100 py-2 mt-4" type="submit"> 회원가입 </button>
                <p class="d-flex justify-content-center mt-3"> 이미 회원이신가요? &nbsp; <a href="${path}/login" class="text-secondary"> 로그인하기 </a></p>
            </form>
            <script>
                $(document).ready(function(){
                    $("#idCheckBtn").click(function(){
                        if($("#name").val()==""){
                            $("#msg").html("<strong style='color:red'> 아이디를 입력해주세요. </strong>");
                            $("#name").focus();
                            return;
                        }
                        let name = { name : $("#name").val() };

                        $.ajax({
                            url:"${path}/idCheck",	//아이디가 전송되어질 곳
                            type:"post",		//전송방식
                            data:JSON.stringify(name),
                            dataType:"json",
                            contentType: "application/json",
                            success:function(result){
                                console.log("성공");
                                console.log(result);
                                var idChk = result;	//true 또는 false를 받음
                                if(idChk==false){	//사용할 수 없는 아이디
                                    $("#idCheck").val("false");
                                    $("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디 입니다. 다시 입력하시기 바랍니다.</strong>");
                                    $("#id").focus();
                                } else if(idChk==true){	//사용 가능한 아이디
                                    $("#idCheck").val("true");
                                    $("#msg").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
                                } else if(idChk==""){
                                    $("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
                                }
                            },
                            error: function(err) {
                                console.log("실패");
                                console.log(err);
                            }
                        });
                    });
                    $("#emailCheckBtn").click(function(){
                        if($("#email").val()==""){
                            alert("이메일을 입력하지 않으셨습니다.");
                            $("#email").focus();
                            return;
                        }
                        var params = {	email : $("#email").val()	} //전송되어질 데이터를 객체로 묶음
                        $.ajax({
                            url:"${path }/emailCheck",	//아이디가 전송되어질 곳
                            type:"post",		//전송방식
                            dataType:"json",	//데이터 반환 방식
                            data:params,		//전송방식이 post인 경우 객체로 묶어서 전송
                            success:function(result){
                                console.log(result);
                                var emailChk = result;	//true 또는 false를 받음
                                if(emailChk==false){	//사용할 수 없는 이메일
                                    $("#emailCheck").val("false");
                                    $("#msg2").html("<strong style='color:red'>기존에 사용되고 있는 이메일 입니다. 다시 입력하시기 바랍니다.</strong>");
                                    $("#email").focus();
                                } else if(emailChk==true){	//사용 가능한 이메일
                                    $("#emailCheck").val("true");
                                    $("#msg2").html("<strong style='color:blue'>사용가능한 이메일입니다.</strong>");
                                } else if(emailChk==""){
                                    $("#msg2").html("<strong>이메일이 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
                                }
                            }
                        });
                    });
                });
            </script>
            <script>
                function joinConfirm(f){
                    if(f.password.value!=f.password2.value){
                        alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                        f.password.focus();
                        return false;
                    }
                    if(f.idCheck.value!="true"){
                        alert("아이디 중복 체크를 하지 않으셨습니다.");
                        return false;
                    }
                    if(f.emailCheck.value!="true"){
                        alert("아이디 중복 체크를 하지 않으셨습니다.");
                        return false;
                    }
                }
            </script>
        </main>
    </div>
</div>

<!-- ======= Footer ======= -->
<jsp:include page="../common/footer.jsp" />
<!-- End Footer -->

</body>
</html>



