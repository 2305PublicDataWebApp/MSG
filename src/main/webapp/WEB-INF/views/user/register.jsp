<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 폼</title>
		<link rel="stylesheet" href="../resources/css/main.css">
			 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
	</head>
	<body>
		<form action="/member/register.kh" method="post" id="regForm">
			<fieldset>
				<legend>회원가입</legend>
				<ul>
					<li>
						<label for="memberId">아이디 *</label>
						<input type="text" id ="memberId" name="memberId">
						<button type="button" id ="idChk" onclick="fn_idChk()" value="N"></button>
					</li>
					<li>
						<label for= "memberPw">비밀번호 *</label>					
						<input type="password" id="userPass"name="memberPw"/>
					</li>
					<li>
						<label>비밀번호 확인 *</label>					
						<input type="password" name="memberPw">
					</li>
					<li>
						<label>이름 *</label>					
						<input type="text" name="memberName">
					</li>
					<li>
						<label>나이</label>					
						<input type="text" name="memberAge">
					</li>
					<li>
						<label>성별</label>					
						남 <input type="radio" name="memberGender" value="M">
						여 <input type="radio" name="memberGender" value="F">
					</li>
					<li>
						<label>이메일</label>					
						<input type="text" name="memberEmail">
					</li>
					<li>
						<label>전화번호</label>					
						<input type="text" name="memberPhone">
					</li>
					<li>
						<label>주소</label>					
						<input type="text" id="memberAddr" name="memberAddr"> 
						<input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">
					</li>
					<li>
						<label>취미</label>					
						<input type="text" name="memberHobby">
					</li>
				</ul>
			</fieldset>
			<div>
				<input type="submit" value="가입">
			</div>
			<ul>
				<li onclick="kakaoLogin();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그인</span>
			      </a>
				</li>
				<li onclick="kakaoLogout();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그아웃</span>
			      </a>
				</li>
			</ul>
		</form>
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		Kokko.init('43ed89853b9be1beaa37efa5682be40c')</script>
	
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
		
		
		
		
		
		
		
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
		
		
		
			function sample4_execDaumPostcode() {
				new daum.Postcode({
					oncomplete : function(data) {
						document.querySelector("#memberAddr")
						.value = "("+data.zonecode +") "+data.autoJibunAddress+", "+data.buildingName;
					}
				}).open();
			}
		</script>
	</body>
</html>




















