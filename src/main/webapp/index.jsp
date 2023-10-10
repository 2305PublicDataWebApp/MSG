<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to MSG!!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/main.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
	/* 코드팬 테스트 */
	function scrollFooter(scrollY, heightFooter) {
		console.log(scrollY);
		console.log(heightFooter);

		if (scrollY >= heightFooter) {
			$('.footer').css({
				'bottom' : '0px'
			});
		} else {
			$('.footer').css({
				'bottom' : '-' + heightFooter + 'px'
			});
		}
	}
	
	$(window).load(
		function() {
			var windowHeight = $(window).height(), footerHeight = $(
					'.footer').height(), heightDocument = (windowHeight)
					+ ($('.main-content').height())
					+ ($('.footer').height()) - 10
					- ($('.main-header').height());

			$('#scroll-animate, #scroll-animate-main').css({
				'height' : heightDocument + 'px'
			});

			$('.main-img').css({
				'height' : windowHeight + 'px',
				'line-height' : windowHeight + 'px'
			});

			$('.wrapper-parallax').css({
				'margin-top' : windowHeight + 'px'
			});

			scrollFooter(window.scrollY, footerHeight);

			window.onscroll = function() {
				var scroll = window.scrollY;

				$('#scroll-animate-main').css({
					'top' : '-' + scroll + 'px'
				});

				$('.main-img').css(
						{
							'background-position-y' : 50
									- (scroll * 100 / heightDocument) + '%'
						});
				scrollFooter(scroll, footerHeight);
			}
		});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div id="scroll-animate">
		<div id="scroll-animate-main">
			<div class="wrapper-parallax">
				<div class="main-img">
					<img src="resources/images/admin-img.png" alt="메인이미지" />
				</div>
				<main class="main-content">
					<div></div>
				</main>
			</div>
		</div>
	</div>
	<footer>
	</footer>
</body>
</html>