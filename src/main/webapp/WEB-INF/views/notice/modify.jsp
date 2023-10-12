<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	  	integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">
	  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
		integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
		<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	  	<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>공지사항 수정</h1>
    <form action="/notice/modify.do" method="post">
        <input type="hidden" name="noticeNo" value="${notice.noticeNo}" >
        <ul>
            <li>
                <label>제목</label>
                <input type="text" name="noticeTitle" value="${notice.noticeTitle}">
            </li>
            <li>
                <label>내용</label>
                <textarea id="summernote" class="noticeContent" name="noticeContent">${notice.noticeContent}</textarea>
            </li>
        </ul>
        <div>
<%--             <c:choose> --%>
<%-- <%--                 <c:when test="${qna.userId eq userId}"> --%>
<!--                     <input type="submit" value="수정완료"> -->
<%-- <%--                 </c:when> --%> 
<%--                 <c:otherwise> --%>
<!--                     <p>게시글 수정 권한이 없습니다.</p> -->
<%--                 </c:otherwise> --%>
<%--             </c:choose> --%>
			<input type="submit" value="수정완료">
            <button type="button" onclick="showNoticeList();">목록으로</button>
            <button type="button" onclick="javascript:history.go(-1);">뒤로가기</button>
        </div>
    </form>
    <script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
		integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
		integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
		
		<!-- language pack -->
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
		integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		  integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script>
	      $('#summernote').summernote({
	        placeholder: '글을 등록하세요',
	        tabsize: 2,
	        height: 200,
	        lang: 'ko-KR'
	      });
    
	    function showNoticeList() {
	        location.href="/notice/list.do";
	    }
	    
	      
	      
	      
    </script>
</body>
</html>
