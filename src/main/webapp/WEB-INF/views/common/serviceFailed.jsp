<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>서비스 결과 실패</title>
	</head>
	<body>
		<h1>서비스 결과 실패!</h1>
		<h2>${error }</h2>
		<script>
			const result = '${msg }';
			location.href = "${url}";
			alert(result);
		</script>
	</body>
</html>