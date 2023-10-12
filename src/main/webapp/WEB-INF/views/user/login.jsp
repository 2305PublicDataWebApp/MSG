<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>환영합니다.</h1>
		<c:if test="${memberId eq null }">
							
			<form action="/member/login.kh" method="post">
				ID : <input type="text" name="memberId"><br>
				PW : <input type="password" name="memberPw"><br>
				<input type="submit" value="로그인">
			</form>
				<a href="#" class="btn btn-primary btn-user btn-block" onclick="return frmCheck();">로그인</a>
<hr>
<a href="/account/register" class="btn btn-google btn-user btn-block">회원가입</a> 
<a href="/account/search_id" class="btn btn-facebook btn-user btn-block">아이디  찾기</a>
<a href="/account/search_pwd" class="btn btn-warning btn-user btn-block">비밀번호찾기 찾기</a>	
					
					<button type="button" onClick="/member/mypage.kh?register.kh'">회원가입</button>
			
					<a href="/member/register2.kh">회원가입</a>
		</c:if>
		<c:if test="${memberId ne null }">
			${memberName }님 환영합니다. <a href="/member/logout.kh">로그아웃</a><br>
<!-- 			a태그 .kh 뒤에 ?가 필요한가 고민, 쿼리문 생각해보면 필요함 -->
			<a href="/member/mypage.kh?memberId=${memberId }">마이페이지</a>
			<button onclick="/member/mypage.kh?register.kh">회원가입</button>
		</c:if>
		<button type="button" onClick="/member/mypage.kh?register.kh'">회원가입</button>
		<a href="/member/mypage.kh?register.kh">회원가입</a>
		
</body>
</html>