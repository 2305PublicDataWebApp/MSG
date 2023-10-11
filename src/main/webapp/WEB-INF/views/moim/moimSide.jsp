<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	  	integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
		integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
      <link rel="stylesheet" href="/resources/css/reset.css">
      <link rel="stylesheet" href="/resources/css/moim.css">
      <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
      <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	  <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	  <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
      <title>Special Alone</title>
   </head>
   <body>
      <header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
		  <a class="navbar-brand" href="#">MSG</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav">
		      <li class="nav-item active"><a class="nav-link" href="#">홈</a></li>
		      <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
		      <li class="nav-item"><a class="nav-link" href="#">질문게시판</a></li>
		    </ul>
		  </div>
		</header>

		<div class="container-fluid">
		  <div class="row flex-nowrap">
		    <div class="col-3 bd-sidebar">
		      <div class="bd-sidebar-body">
		        <ul class="nav">
		          <li><a href="/moim/moimSide.do">회의방</a></li>
		          <li><a href="/moim/workingSchedule.do">출결 관리</a></li>
		          <li><a>대화방 추가+</a></li>
		        </ul>
		        <br>
		      </div>
		      <div class='bd-sidebar-footer'>
		        참가자
		        <br>
		        jys
		      </div>
		    </div>
		    <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
		      <h1>회의방</h1>
		      <hr>
		      <h1>Main 2</h1>
		      <h1>Main 3</h1>
		      <div class="summer">
				  <form action="/noticeEvent/write.do" method="post" enctype="multipart/form-data" onsubmit="return blankValid();">
		                <textarea id="summernote" class="content" name="boardContent"></textarea>
		                <label>첨부파일</label>
						<input type="file" name="uploadFile" class="file"><br><br>
		                <button type="submit" class="writeBtn success"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;글 등록</button>
	              </form>	
              </div>
		    </main>
		  </div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
		integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
		integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
		
		<!-- language pack -->
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
		integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		  integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script>
	      $('#summernote').summernote({
	        placeholder: '글을 등록하세요',
	        tabsize: 2,
	        height: 200,
	        lang: 'ko-KR'
	      });
	    </script>
   </body>
</html>