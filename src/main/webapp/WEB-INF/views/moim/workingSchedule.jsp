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
      <link rel="stylesheet" href="/resources/css/project/project.css">
      <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <title>모임페이지</title>
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
		          <li><a href="/project/subProject.do">회의방</a></li>
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
			  <table width="50%" border="1" id="workingTimeTable">
			  <thead></thead>
			  <tbody></tbody>
			  </table>
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
        	var data = {'dateWithId': dataVal, 'projectNo': 2};
        	$.ajax({
    	        url : '/moim/teamWorkingTime.do',
    	        data : data,
    	        type : 'GET',
    	        success : function (data) {
    	        	let str = "";
   	        		const tableBody = $("#workingTimeTable tbody");
   	        		const tableHead = $("#workingTimeTable thead");
    	        	if(data.length == 0){
    	        		tableBody.empty();
	    	        	tableHead.empty();
    	        		str = "해당날짜에 출/퇴근 기록이 없습니다.";
    	        		$("#p1").html(str);
    	        	} else {
	    	        	tableBody.empty();
	    	        	tableHead.empty();
						let tr;
						let trH;
						let user;
						let userH;
						let start;
						let startH;
						let end;
						let endH;
						let hours;
						let hoursH;
						trH = $("<tr>");
						userH = $("<th>").text("참가자");
        				startH = $("<th>").text("출근");
        				endH = $("<th>").text("퇴근");
        				hoursH = $("<th>").text("근무시간");
        				trH.append(userH);
        				trH.append(startH);
        				trH.append(endH);
        				trH.append(hoursH);
        				tableHead.append(trH);
    	        		for(let i = 0; i < data.length; i++){
    	        			const startWorkDate = new Date(data[i].startWork);
    	        			if(data[i].endWork == "퇴근 미처리"){
    	        				//str += "참가자 : " + data[i].userId + ", 출근 : " + data[i].startWork + ", 퇴근 : 미처리<br>";
    	        				tr = $("<tr>");
    	        				user = $("<td>").text(data[i].userId);
    	        				start = $("<td>").text(data[i].startWork);
    	        				end = $("<td>").text("미처리");
    	        				hours = $("<td>").text("-");
    	        				tr.append(user);
								tr.append(start);
								tr.append(end);
								tr.append(hours);
								tableBody.append(tr);
    	        			} else {
	    	        			const endWorkDate = new Date(data[i].endWork);
	    	        			const timeDifferenceMillis = endWorkDate - startWorkDate;
	    	        			const timeDifferenceHours = timeDifferenceMillis / (1000 * 60 * 60);
								//str += "참가자 : " + data[i].userId + ", 출근 : " + data[i].startWork + ", 퇴근 : " + data[i].endWork + ", 근무시간 : " + timeDifferenceHours.toFixed(2) + "시간<br>";
								tr = $("<tr>");
    	        				user = $("<td>").text(data[i].userId);
    	        				start = $("<td>").text(data[i].startWork);
    	        				end = $("<td>").text(data[i].endWork);
    	        				hours = $("<td>").text(timeDifferenceHours.toFixed(2)+"시간");
    	        				tr.append(user);
								tr.append(start);
								tr.append(end);
								tr.append(hours);
								tableBody.append(tr);
    	        			}
						}
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