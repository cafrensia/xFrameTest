jQuery(document).ready(function(e) {
});

function checkAuthNum(type){
	$("#type").val(type);
	if(type == "2"){
		
		if($("#noAdmnScrtEx").val() == ""){
			alert("기존 비밀번호를 입력하세요.");
			$("#noAdmnScrtEx").focus();
			return false;
		}
		var reg_pw = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,14}$/;
		if(reg_pw.test($("#noAdmnScrtEx").val()) == false){
			alert("기존 비밀번호는 10~14자리 사이의 영문, 숫자로 입력하세요.");
			$("#noAdmnScrtEx").focus();
			return false;
		}
		
		if(isAlphaNumericSame(document.getElementById("noAdmnScrtEx"))){
			$("#noAdmnScrtEx").focus();
			return false;
		}
		
		if($("#noAdmnScrt").val() == ""){
			alert("새 비밀번호를 입력하세요.");
			$("#noAdmnScrt").focus();
			return false;
		}
		var reg_pw = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,14}$/;
		if(reg_pw.test($("#noAdmnScrt").val()) == false){
			alert("새 비밀번호는 10~14자리 사이의 영문, 숫자로 입력하세요.");
			$("#noAdmnScrt").focus();
			return false;
		}
		
		if(isAlphaNumericSame(document.getElementById("noAdmnScrt"))){
			$("#noAdmnScrt").focus();
			return false;
		}
		
		if($("#noAdmnScrtRe").val() == ""){
			alert("새 비밀번호 확인을 입력하세요.");
			$("#noAdmnScrtRe").focus();
			return false;
		}
		var reg_pw = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
		if(reg_pw.test($("#noAdmnScrtRe").val()) == false){
			alert("새 비밀번호 확인은 10~14자리 사이의 영문, 숫자로 입력하세요.");
			$("#noAdmnScrtRe").focus();
			return false;
		}
		
		if(isAlphaNumericSame(document.getElementById("noAdmnScrtRe"))){
			$("#noAdmnScrtRe").focus();
			return false;
		}
		
		if($("#noAdmnScrt").val() != $("#noAdmnScrtRe").val()){
			alert("새 비밀번호 확인을 새 비밀번호와 동일하게 입력하세요.");
			return false;
		}
		
	}
	
	var certFrm = $("#certFrm").serialize();
	
	$.ajax({
		url      : "/dmcAdmin/cert/pwdProg.do",
		type     : "post",
		dataType : "json",
		data     : certFrm,
		success: function(returnData) {
			if(returnData.hMap.chk == "fail"){
				alert(returnData.hMap.message);
				$("#noAdmnScrtEx").val("");
				$("#noAdmnScrt").val("");
				$("#noAdmnScrtRe").val("");
			}else{
				location.href = $("#url").val();
			}
		}
	});
}
