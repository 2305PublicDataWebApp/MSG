<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세</title>
	</head>
	<body>
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
					<input class="detail-input" type="text" name="noticeSubject" value="${notice.noticeSubject }" readonly >
				</li>
				<li>
					<label class="detail-label">내용</label>
					<p class="detail-content">${notice.noticeContent }</p>
				</li>
			</ul>
	</body>
</html>