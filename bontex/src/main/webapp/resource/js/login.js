jQuery(document).ready(function(e) {
	var option ={
		dataType: 'json',
		beforeSubmit : checkVal,
        success : function(returnData){
        	if(returnData.hMap.chk == "success"){
        		location.href = "/dmcAdmin/smsCert.do";
			}else{
				alert(returnData.hMap.message);
				$("#sPwd").val("");
				$("#sID").val("");
				$("#sID").focus();
			}
        },
        error : function(){
        	alert("에러가 발생하였습니다.");
        }
	}
	$('#loginFrm').ajaxForm(option);   /* 등록 실행 */
});

//로그인 전 체크
function checkVal(){
	
	if($("#sId").val() == ""){
		alert("아이디를 입력하세요.");
		$("#sId").focus();
		return false;
	}
	
	if($("#sPw").val() == ""){
		alert("패스워드를 입력하세요.");
		$("#sPw").focus();
		return false;
	}
	
	return true;
}