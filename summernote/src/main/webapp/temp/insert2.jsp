<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summernote editor</title>
<!-- include libraries(jQuery, bootstrap) -->
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

<style>
#summer {
	width: 800px;
	margin: 30px auto;
}

@
keyframes spinner {
	to {transform: rotate(360deg);
}

}
.spinner:before {
	z-index: 100;
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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

</head>
<body>
	<div id='summer'>

		<h2>SUMMERNOTE Editor</h2>
		<form name='frm_summbernote' method='post' id='sm_note'
			action='result.jsp'>
			<label>작성자 : <input type='text' name='worker' value='hong'></label>
			<br />
			<textarea id='summernote' name='doc'></textarea>

			<button>SAVE</button>
		</form>
	</div>

	<script>
		var fonts = [ '맑은 고딕', '돋움', '궁서', '굴림', '굴림체', '궁서체', '바탕', '바탕체',
				'HY견고딕', 'HY견명조', 'HY엽서M', '휴먼옛체' ];
		fonts.sort();
		var loadInterval = [];
		$('#summernote').summernote({
			width : 800,
			height : 300, // set editor height
			focus : true, // set focus to editable area after initializing summernote
			fontNames : fonts,

			callbacks : {
				onMediaDelete : function(target) {
					deleteFile(target[0].src);
				},

				onImageUpload : function(files, editor, welEditable) {
					
					loadInterval.length = files.length;

					$('#summer').addClass('spinner');//spinner
					
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(i, files[i], this);
					}
					
					
				}
			}

		})

		function sendFile(intervalPos, file, el) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : 'upload.up',
				enctype : 'multipart/form-data',
				cache : false,
				contentType : false,
				processData : false,
				success : function(img_name) {
				
					loadInterval[intervalPos] = setInterval(loadCheck.bind(
							null, intervalPos, img_name), 1500);
				}
				
			});
		}

		function loadCheck(intervalPos, img) {
			
			var t = new Image();
			t.onload = function() {
				clearInterval(loadInterval[intervalPos]);
				$('#summernote').summernote('editor.insertImage', img);
				$('#summer').removeClass('spinner');//spinner
			}
			t.src = img;
		
		}
	</script>
</body>
</html>