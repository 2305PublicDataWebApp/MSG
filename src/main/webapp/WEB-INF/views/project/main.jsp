<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel="stylesheet" href="resources/css/reset.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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
      <h1>Main 1</h1>
      <h1>Main 2</h1>
      <h1>Main 3</h1>
      <h1>Main 4</h1>
      <h1>Main 5</h1>
      <h1>Main 6</h1>
      <h1>Main 7</h1>
      <h1>Main 8</h1>
    </main>
</body>
</html>