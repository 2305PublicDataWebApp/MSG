<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg="
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg="
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/project/project.css">
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<title>모임페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<div class="bd-sidebar-body">
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false">Dashboard</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Overview</a></li>
								<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Weekly</a></li>
								<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a></li>
								<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a></li>
							</ul>
						</div>
					</li>
				</div>
				<div class='bd-sidebar-footer'>
					참가자 <br> jys
				</div>
			</div>
			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<div class="bd-content-title">
					<h1>회의방</h1>
					<hr>
				</div>
				<div class="bd-content-content">
					<h1>Main 2</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
					<h1>Main 3</h1>
				</div>
			</main>
			<div class="summer">
				<form action="/noticeEvent/write.do" method="post" enctype="multipart/form-data" onsubmit="return blankValid();">
					<textarea id="summernote" class="content" name="boardContent"></textarea>
					<label>첨부파일</label> <input type="file" name="uploadFile" class="file"><br>
					<br>
					<button type="submit" class="writeBtn success">
						<i class="fa-solid fa-check"></i>&nbsp;&nbsp;글 등록
					</button>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
		integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
		integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw="
		crossorigin="anonymous"></script>

	<!-- language pack -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
		integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script>
		$('#summernote').summernote({
			placeholder : '글을 등록하세요',
			tabsize : 2,
			height : 200,
			lang : 'ko-KR'
		});
	</script>
</body>
</html>