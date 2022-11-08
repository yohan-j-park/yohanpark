<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student_inupt_form</title>
<link rel='stylesheet' href='./css/student.css'>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<script defer src='js/student.js'></script>

</head>
<body>

<div id='std_input'>
    <h2>학생 정보 입력</h2>
    <form name='frm_input'  method='post' 
          onsubmit='return chkForm(this)'>
        <span>*아이디</span>
        <input type='search' name='id' size='20' value='a123' 
               autocomplete='off' maxLength='20' required
               placeholder="영어로 시작하고 영숫자만."
               pattern="^[a-zA-Z]\w{3,19}$"/>
        <br/>
        <span>*성 명</span>
        <input type='search' name='name' size='20' value='hong' maxLength='20' required/>
        <br/>
        <span>*성별</span>
        <label><input type='radio' name='gender' value='m' checked>남자</label>
        <label><input type='radio' name='gender' value='f'>여자</label>
        <br/>
        <span>*암호</span>
        <input type='password' name='pwd' size='15' value='1111' maxLength='15' required/>
        <br/>
        <span>*암호 확인</span>
        <input type='password' name='pwd2' size='15' value='1234' maxLength='15' required/>
        <br/>
        <span>*연락처</span>
        <input type='search' name='phone' size='20' maxLength='20' required
                value='02-123-1234'
               placeholder='[xx|xxx]-[xxx|xxxx]-xxxx' 
               pattern="^\d{2,3}-\d{3,4}-\d{4}$"/>
        <br/>
        <span>*우편번호</span>
        <input type='text' name='zipcode' value='' size='5' required readonly/>
        <input type='button' value='우편번호 검색' name='btnFindZip'/>
        <br/>
        <span>*주소</span>
        <input type='text' name='address' value = '' size='40' required/>
        <br/>
        <span>상세주소</span>
        <input type='text' name='address2' size='30'/>
        <br/>
        <span>이메일</span>
        <input type='email' name='email' value='abc@abc.kr'/>
        <br/>
        <div class='btnZone'>
	        <span></span>
	        <input type='button' value='저장' name='btnSave'/>
	        <input type='button' value='취소' name='btnCancel'/>
        </div>    
        <input type='text' name='findStr' value='${pageVo.findStr }'/>  
        <input type='text' name='nowPage' value='${pageVo.nowPage }'/>  
    </form>


</div>
<script>
var frm = document.frm_input;

frm.btnFindZip.onclick = function(){// 우편번호
    new daum.Postcode({
       oncomplete : function(data){
          frm.address.value = data.address;
          frm.zipcode.value = data.zonecode;
       }
    }).open();
 }

function chkForm(frm){
	let b=true;
	if(frm.pwd.value != frm.pwd2.value){
		b=false;
		alert('암호를 일치시켜 주세요~')
	}
	return b;
}
</script>
</body>


</html>
