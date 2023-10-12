<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <link rel="stylesheet" href="/resources/css/reset.css">
      <link rel="stylesheet" href="/resources/css/moim.css">
      <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <title>Special Alone</title>
   </head>
   <body>
      <header class="navbar navbar-expand navbar-dark bg-dark bd-navbar sticky-top">
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
		      <h1>출결 관리</h1>
		      <hr>
		      <label for="datepicker">날짜 선택:</label>
    		  <input type="text" id="datepicker" onchange="changeDate();">
		      <h1 class="titleDate"></h1>
			  <p id="p1"></p>
		    </main>
		  </div>
		</div>
	<script>
        // jQuery UI의 datepicker를 활성화
        $(function() {
            $("#datepicker").datepicker();
        });
        
        function changeDate(){
        	const dataVal = document.querySelector("#datepicker").value;
        	document.querySelector(".titleDate").innerText = dataVal;
        	var data = {'dataVal': dataVal};
        	$.ajax({
    	        url : '/moim/teamWorkingTime.do',
    	        data : data,
    	        type : 'GET',
    	        dataType : "text",
    	        success : function (data) {
    	        	let str = "";
    	        	if(data == "noData"){
    	        		str = "해당날짜에 출/퇴근 기록이 없습니다.";
    	        		$("#p1").html(str);
    	        	} else {
    	        		const dataArray = JSON.parse(data);
    	        		str += dataArray;
    	        		for(let i = 0; i < dataArray.length; i++){
							str += "참가자 : " + dataArray[i].userId + ", 출근 : " + dataArray[i].startWork + ", 퇴근 : " + dataArray[i].endWork + "<br>";
						}
    	        		str+=dataArray.length;
    	        		$("#p1").html(str);
    	        	}
    	         }, error : function(){
						alert("Ajax 오류! 관리자에게 문의하세요.");
					}
    	     })
        }
    </script>
   </body>
</html>