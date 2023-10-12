<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/resources/css/reset.css">
      <link rel="stylesheet" href="/resources/css/moim.css">
      <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
      <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	  <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
      <title>Special Alone</title>
   </head>
   <body>
	<div class="total">
      <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

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
		        jys <button>알림 문자</button>
		      </div>
		    </div>
		    <main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
		      <h1>Group A</h1>
		      <hr>
		      <div class="mainFlex">
			      <div class="profile"></div>
			      <div class="calrender"></div>
			      <div class="right">
				      <div class="workingTime">
				      	<input type="button" value="출근" class="addStartTime">
				      	<input type="button" value="퇴근" class="addEndTime">
				      	<p class="workingInfo">
				      		
				      	</p>
				      </div>
				      <div class="calDetail"></div>
				  </div>
			  </div>
		    </main>
		  </div>
		</div>
	</div>
	<script>
	document.querySelector(".addStartTime").addEventListener("click", () => {
		var data = {'userId': "khuser01",'projectNo':"2"};
		$.ajax({
	        type : 'GET',
	        url : '/moim/addStartTime.do',
	        data : data,
	        dataType : 'text',
	        success : function (data) {
	        	const workingInfoElement = document.querySelector(".workingInfo");
	        	workingInfoElement.innerHTML = data;
	            }
	        });
	});
		
	document.querySelector(".addEndTime").addEventListener("click", () => {
		var data = {'userId': "khuser01",'projectNo':"2"};
		$.ajax({
	        type : 'GET',
	        url : '/moim/addEndTime.do',
	        data : data,
	        dataType : 'text',
	        success : function (data) {
	        	const workingInfoElement = document.querySelector(".workingInfo");
	        	workingInfoElement.innerHTML = data;
	            }
	        });
	});
	</script>
   </body>
</html>