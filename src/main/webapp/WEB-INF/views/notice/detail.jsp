<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세</title>
		<link rel="stylesheet" href="/resources/css/reset.css?after" />
		<link rel="stylesheet" href="/resources/css/nDetail.css?after" />
		<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
		rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
		crossorigin="anonymous">
	</head>
	<body>
	<header class="p-3 main-header">
	<div class="container main-header-container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start main-items">
			<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none main-logo-link">
				<img src="resources/images/logo-img.png" class="logo-img"/>
			</a>
		
			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 main-menu-list">
		        <li><a href="#" class="nav-link px-2 text-dark">공지사항</a></li>
		        <li><a href="#" class="nav-link px-2 text-dark">질문페이지</a></li>
		        <li><a href="/project/main.do" class="nav-link px-2 text-dark">모임페이지</a></li>
			</ul>
		
			<div class="text-end main-login-container">
				<button type="button" class="btn btn-outline-dark me-2 login-btn">Login</button>
				<button type="button" class="btn btn-warning sign-up-btn">Sign-up</button>
			</div>
		</div>
	</div>
</header>
		<h1 class="detail-title">공지사항</h1>
			<ul class="detail-list">
				<li>
					<label class="detail-label">작성일</label>
					<p class="detail-date">
                		<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreateDate}" />
           		 	</p>
				</li>
				<li>
					<label class="detail-label">제목</label>
					<input class="detail-input" type="text" name="noticeTitle" value="${notice.noticeTitle }"  >
				</li>
				<li>
					<label class="detail-label">내용</label>
					<p class="detail-content">${notice.noticeContent }</p>
				</li>
			</ul>
			<c:url var="noticeDelUrl" value="/notice/delete.do">
		        <c:param name="noticeNo" value="${notice.noticeNo}"></c:param>
		    </c:url>
		    <c:url var="modifyUrl" value="/notice/modify.do">
		        <c:param name="noticeNo" value="${notice.noticeNo}"></c:param>
		    </c:url>
	    <div>
<%-- 	        <c:if test="${userId eq 'admin'}"> --%>
	            <button type="button" onclick="showModifyPage('${modifyUrl}');">수정하기</button>
	            <button type="button" onclick="deleteNotice('${noticeDelUrl}');">삭제하기</button>
<%-- 	        </c:if> --%>
	        <button type="button" onclick="showNoticeList();">목록으로</button>
	        <button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
	    </div>
			
			<script>
// 			const imageUpload = document.getElementById("imageUpload");

// 		    const imagePreview = document.getElementById("imagePreview");
// 		    imageUpload.addEventListener("change", function () {
// 		        const file = this.files[0];

// 		        if (file) {
// 		            const reader = new FileReader();
// 		            reader.onload = function (e) {
// 		                imagePreview.src = e.target.result;
// 		            };
// 		            reader.readAsDataURL(file);
// 		        } else {
// 		            imagePreview.src = "#";
// 		        }
// 		    });

				function deleteNotice(url){
					location.href=url;
				}
				
				function showModifyPage(modifyUrl){
					location.href=modifyUrl;
				}
				function showNoticeList(){
					location.href="/notice/list.do";
				}
						
			</script>
	</body>
</html>