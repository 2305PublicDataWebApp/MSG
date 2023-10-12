<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 리스트</title>
		<link rel="stylesheet" href="/resources/css/reset.css?after" />
		<link rel="stylesheet" href="/resources/css/nList.css?after" />
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
		<h1>공지사항</h1>
		<table>
			<colgroup>
				<col width="10%">
				<col width="60%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${nList }" varStatus="i">
				<tr>
				<td>${i.count }</td>
				<c:url var="detailUrl" value="/notice/detail.do">
					<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
				</c:url>
				<td><a href="/notice/detail.do?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreateDate }"/></td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			<tr align="center">
					<td colspan="5">
					<c:if test="${pInfo.startNavi != 1 }">
					<c:url var="prevUrl" value="/board/list.kh">
						<c:param name="page" value="${pInfo.startNavi - 1 }"></c:param>
					</c:url>
					<a href="${prevUrl }">[이전]</a>
					</c:if>
						<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
							<c:url var="pageUrl" value="/board/list.kh">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<a href="${pageUrl }">${p }</a>&nbsp;
						</c:forEach>
					<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
						<c:url var="nextUrl" value="/board/list.kh">
							<c:param name="page" value="${pInfo.endNavi + 1 }"></c:param>
						</c:url>
					<a href="${nextUrl }">[다음]</a>
					</c:if>
						
					</td>
				</tr>
				<tr>
				<td colspan="4">
					<form action="/board/search.kh" method="get">
						<select name="searchCondition">
							<option value="all"<c:if test="${searchCondition == 'all' }">selected</c:if>>전체</option>
							<option value="writer" <c:if test="${searchCondition == 'writer' }">selected</c:if>>작성자</option>
							<option value="title" <c:if test="${searchCondition == 'title' }">selected</c:if>>제목</option>
							<option value="content" <c:if test="${searchCondition == 'content' }">selected</c:if>>내용</option>
						</select>
						<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
						<input type="submit" value="검색">
					</form>
					</td>
					<td>
						<button type="button" onclick="showRegisterForm();">공지등록</button>
					</td>
				</tr>
			</tfoot>
		</table>
		<script>
        const showRegisterForm = () => {
            location.href = "/notice/write.do";
        }
    </script>
	</body>
</html>