<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@
keyframes spinner {
	to {transform: rotate(360deg);
}

}
.spinner:before {
	content: '';
	box-sizing: border-box;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 70px;
	height: 70px;
	margin-top: -15px;
	margin-left: -15px;
	border-radius: 50%;
	border: 3px solid #ccc;
	border-top-color: #07d;
	animation: spinner .6s linear infinite;
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

	<div id="mySpinner">
		Spinner 1
		<div class="spinner"></div>
	</div>

	<script>
$('#mySpinner').addClass('spinner');
$('#mySpinner').removeClass('spinner');
</script>

</body>
</html>