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
    <title>Tsherpa</title>

    <jsp:include page="../common/head.jsp"/>
    <script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
    <script type="text/javascript" src="${path1 }/resources/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<style>
    .breadcrumb a { color: #464646; }

    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
    .table th {
        white-space: nowrap;
        vertical-align: middle;
    }
    .table input[type="file"] {
        width: 28rem;
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
        <li><a>자료실</a></li>
        <li><a href="${path1}/file/list.do">파일 자료 등록</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">자료실</p>
</nav>
<div class="container">
    <div class="columns">
        <div class="column is-10 is-offset-1">
            <form enctype="multipart/form-data" method="post" action="${path1}/file/fileupload1.do">
                <table class="table is-centered is-fullwidth">
                    <tbody>
                    <tr class="border-top">
                        <th class="has-text-centered">제목 </th>
                        <td>
                            <%-- 히든 걸어놔야 파일 제목 수정 돌아가는 원리 --%>
                            <input type="hidden" name="no" id="no" value="${fileboard.fileBoard.title}">
                            <input type="text" name="title" id="title" class="input" placeholder="제목" value="${fileboard.fileBoard.title}" maxlength="98" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="has-text-centered">내용</th>
                        <td>
                            <textarea name="content" class="textarea" id="content" placeholder="내용" rows="8" cols="100" maxlength="800" required>${fileboard.fileBoard.content}</textarea>
                            <script>
                                CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/file/imageUpload.do'});
                            </script>
                        </td>
                    </tr>
                    <tr class="border-bottom">
                        <th class="has-text-centered">파일</th>
                        <td>
                            <div class="control">
                                <label for="file1" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일1 : </span>
                                    <input type="file" name="file1" id="file1" class="file-input" required>
                                    <span class="file-cta">
                                                <span class="file-icon">
                                                    <i class="fas fa-upload"></i>
                                                </span>
                                                <span class="file-label">
                                                    <span id="file1Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                            </div>
                            <div class="control">
                                <label for="file2" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일2 : </span>
                                    <input type="file" name="file2" id="file2" class="file-input">
                                    <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file2Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                            </div>
                            <div class="control">
                                <label for="file3" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일3 : </span>
                                    <input type="file" name="file3" id="file3" class="file-input">
                                    <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file3Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                                <script>
                                    document.getElementById('file1').addEventListener('change', function () {
                                        document.getElementById('file1Name').textContent = this.files[0].name;
                                    });

                                    document.getElementById('file2').addEventListener('change', function () {
                                        document.getElementById('file2Name').textContent = this.files[0].name;
                                    });

                                    document.getElementById('file3').addEventListener('change', function () {
                                        document.getElementById('file3Name').textContent = this.files[0].name;
                                    });
                                </script>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="has-text-centered">
                    <button type="submit" class="button is-link mb-5 p-5" style="border-radius: 1.5rem;">등록하기</button>
                </div>
            </form>
        </div>
        <div class="column is-1"></div>
    </div>
</div>
<!-- Content Close -->

<!-- ======= Footer ======= -->
<jsp:include page="../common/footer.jsp" />
<!-- End Footer -->

</body>
</html>