<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recaptcha-test-01</title>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<script>
		function onSubmit() {
			if (grecaptcha.getResponse().length == 0) {
				alert('reCAPTCHA를 확인해 주세요.');
				return false;
			}
			
			return true;
		}
	</script>
</head>
<body>
	<form action="http://localhost:8888/web-2022-08/index.jsp" method="POST" onsubmit="return onSubmit();">
		<div class="g-recaptcha" data-sitekey="6LffpnoUAAAAAABgLv2eqcQ34mSpD70nkO9V1LRo"></div>
		<br/>
		<input type="submit" value="Submit">
    </form>
</body>
</html>