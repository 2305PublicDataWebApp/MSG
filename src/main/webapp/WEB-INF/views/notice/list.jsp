<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 리스트</title>
	</head>
	<body>
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
				<td><a href="/notice/detail.do?noticeNo=${notice.noticeNo }">${notice.noticeSubject }</a></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreateDate }"/></td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
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