<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 폼</title>

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

<div>
<div>
    <main class="col-5 py-md-3 pl-md-5 bd-content" role="main">
    <section id="container">
			<form action="/user/register2.do" method="post" id="regForm">
					<div class="form-group has-feedback">
						<label class="control-label" for="userId">아이디*</label>
						<input class="form-control" type="text" id="userId" name="userId" />
						<button type="button" id ="idChk" onclick="fn_idChk()" value="N">중복체크</button>
					
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userPw">패스워드*</label>
						<input class="form-control" type="password" id="userPw" name="userPw" />
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userName">성명</label>
						<input class="form-control" type="text" id="userName" name="userName" />
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userAge">나이</label>					
						<input class="form-control" type="text" id="userAge" name="userAge">
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userGender">성별</label>					
						<!-- 남 <input class="form-control" type="radio" name="userGender" id="userGender" value="M">
						여 <input class="form-control" type="radio" name="userGender" id="userGender" value="F">	 -->				
  						
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="userGender" id="userGender" value="M">
						  <label class="form-check-label" for="inlineRadio1">남</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="userGender" id="userGender" value="F">
						  <label class="form-check-label" for="inlineRadio2">여</label>
						</div>
						
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userEmail">이메일</label>
						<input class="form-control" type="text" id="userEmail" name="userEmail"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label">주소</label><br>
						<input type="text" id="userAddr" name="userAddr" />
						<input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기" >
					</div>
					
					
					
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
   		
		
    </main>
  </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
function fn_idChk() {
	
}


function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			document.querySelector("#userAddr")
			.value = "("+data.zonecode +") "+data.autoJibunAddress+", "+data.buildingName;
		}
	}).open();
}

</script>
</body>
</html>