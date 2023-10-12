<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
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
			  margin-top : 100px;
			}
			.bd-sidebar-body .nav {
			  display: block;
			}
			.bd-sidebar-body .nav>li>a {
			  display: block;
			  padding: .25rem 1.5rem;
			  font-size: 120%;
			}
			.bd-sidebar-footer {
			  padding: 1rem;
			  background: #ddd;
			}
			.bd-content {
				margin-top : 50px;
			}
			.main {
				margin : 0 auto;
			}
			.main-logo{
				margin-top: 50px;
				margin-bottom : 50px;
			 	text-align: center;
			}
			table {
				margin-top: 50px;
				margin: 0 auto;
				border-collapse: separate;
				border-spacing: 5px; /* 간격을 5px로 설정 */
				border-bottom : 1px solid; black;
				text-align : center;
			}
			table th {
				border-bottom : 1px solid; black;
			}
			.pageNav {
				margin-top : 10px;
			  	text-align: center;
			}
			.search {
				margin : 0 auto;
				margin-bottom : 15px;
				width : 900px;
				text-align: right; 
			}
			.nav {
				text-align : center;
				margin-top : 100px;
			}
		</style>
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
		          <li><a href="/admin/memberList.do">회원관리</a></li>
		          <li><a href="/admin/noticeList.do">모임방 관리</a></li>
		          <li><a href="#">공지게시판 관리</a></li>
		          <li><a href="#">질문게시판 관리</a></li>
		        </ul>
		        <br>
		      </div>
		    </div>
		    <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
		    	<h1 class="main-logo">공지게시판 관리</h1>
		    	<div class="search">
		    		<input type="text" placeholder="search">
		    	</div>
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
		    			<tr>
		    				<td>1</td>
		    				<td>제목</td>
		    				<td>23/09/18</td>
		    			</tr>
		    			<tr>
		    				<td>1</td>
		    				<td>제목</td>
		    				<td>23/09/18</td>
		    			</tr>
		    			<tr>
		    				<td>1</td>
		    				<td>제목</td>
		    				<td>23/09/18</td>
		    			</tr>
		    			<tr>
		    				<td>1</td>
		    				<td>제목</td>
		    				<td>23/09/18</td>
		    			</tr>
		    			<tr>
		    				<td>1</td>
		    				<td>제목</td>
		    				<td>23/09/18</td>
		    			</tr>
		    			<tr>
		    				<td>1</td>
		    				<td>제목</td>
		    				<td>23/09/18</td>
		    			</tr>
		    		</tbody>
		    		<tfoot>
		    		</tfoot>
		    	</table>
		    	<div class="pageNav">
		    		1 2 3 4 5
		    	</div>
		    </main>
		  </div>
		</div>
	</body>
</html>