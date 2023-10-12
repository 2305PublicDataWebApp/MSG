<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<link rel="stylesheet" href="../resources/css/main.css">
			<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
		<style>
.bd-navbar {
  position: sticky;
  top: 0;
  z-index: 1071;
  min-height: 4rem;
  box-shadow: 0 0.5rem 1rem rgba(0,0,0,.05), inset 0 -1px 0 rgba(0,0,0,.1);
}
.bd-sidebar {
  position: sticky;
  top: 4rem;
  z-index: 1000;
  height: calc(100vh - 4rem);
  background: #eee;
  border-right: 1px solid rgba(0,0,0,.1);
  max-width: 220px;
  display: flex;
  padding: 0;
  overflow-y: hidden;
  flex-direction: column;
}
.bd-sidebar-body {
  height: 100%;
  overflow-y: auto;
  display: block;
}
.bd-sidebar-body .nav {
  display: block;
}
.bd-sidebar-body .nav>li>a {
  display: block;
  padding: .25rem 1.5rem;
  font-size: 90%;
}
.bd-sidebar-footer {
  padding: 1rem;
  background: #ddd;
}
</style>
			<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
			
		</head>
	<body>
			<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
		  <a class="navbar-brand" href="#">Navbar</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav">
		      <li class="nav-item active"><a class="nav-link" href="#">홈</a></li>
		      <li class="nav-item"><a class="nav-link" href="#">1번 메뉴</a></li>
		      <li class="nav-item"><a class="nav-link" href="#">2번 메뉴</a></li>
		    </ul>
		  </div>
		</header>
		<div class="container-fluid">
		  <div class="row flex-nowrap">
		    <div class="col-3 bd-sidebar">
		      <div class="bd-sidebar-body">
		        <ul class="nav">
		          <li><a>Side 1</a></li>
		          <li><a>Side 2</a></li>
		          <li><a>Side 3</a></li>
		          <li><a>Side 4</a></li>
		          <li><a>Side 5</a></li>
		          <li><a>Side 6</a></li>
		          <li><a>Side 7</a></li>
		          <li><a>Side 8</a></li>
		        </ul>
		        <br>
		      </div>
		      <div class='bd-sidebar-footer'>
		        Sidebar Footer
		      </div>
		    </div>
		      <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<fieldset>
					<legend>마이페이지</legend>
					<div>
						<div>
							<label>아이디 *</label>					
							<span>${member.memberId }</span>
						</div>
						<div>
							<label>이름 *</label>
							<span>${member.memberName }</span>			
						</div>
						<div>
							<label>나이</label>		
							<span>${member.memberAge }</span>			
						</div>
						<div>
							<label>성별</label>		
							<c:if test="${member.memberGender eq 'M' }"><span>남</span></c:if>			
							<c:if test="${member.memberGender eq 'F' }"><span>여</span></c:if>
						</div>
						<div>
							<label>이메일</label>	
							<span>${member.memberEmail }</span>				
						</div>
						
						<div>
							<label>주소</label>
							<span>${member.memberAddr }</span>			
						</div>
						
					</div>
				</fieldset>
				</main>
			  </div>
			</div>
		<a href="/index.jsp">메인으로 이동</a><br>
<!-- 		? 가 있어야 되나 없어도 되나???? -->
		<a href="/member/update.kh?memberId=${memberId }">수정하기</a>
		<a href="/member/delete.kh?memberId=${memberId }">삭제하기</a>
	</body>
</html>


























