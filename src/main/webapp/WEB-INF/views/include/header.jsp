<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/header.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<header class="p-3 main-header sticky-top">
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
</body>
</html>