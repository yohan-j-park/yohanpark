<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summernote editor</title>
<!-- include libraries(jQuery, bootstrap) -->
<link rel='stylesheet' type='text/css' href='./css/sn.css'>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



</head>
<body>
	<div id='summer'>
		<h2>SUMMERNOTE Editor</h2>
		<form name='frm_summbernote' method='post' action='result.jsp'>
			<label>제목 : <input type='text' size='90' name='subject'
				value='반갑습니다!! IT여행자입니다.'></label> <br />
			<textarea id='summernote' name='doc'>IT 여행자의 수첩입니다.</textarea>

			<button>SAVE</button>
			<a href='list.jsp'>목록으로</a>
		</form>
	</div>

	<script src='./js/sn.js'></script>
</body>
</html>