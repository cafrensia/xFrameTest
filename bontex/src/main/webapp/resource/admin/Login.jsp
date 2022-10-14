<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="/resource/admin/Includes/Meta.jsp" %>
<title>동원F&amp;B - 관리자페이지</title>
<%@ include file="/resource/admin/Includes/Styles.jsp" %>
<%@ include file="/resource/admin/Includes/Scripts.jsp" %>
<script type="text/javascript">
<!--
function checkLogin() {
	var oFrm = document.LoginFrm;
	
/*	if ($.trim(oFrm.sID.value) == ""){
		alert("아이디를 입력해 주세요!");
		oFrm.sID.focus();
		return false;
	}
	
	if ($.trim(oFrm.sPwd.value) == ""){
		alert("패스워드를 입력해 주세요!");
		oFrm.sPwd.focus();
		return false;
	}*/
	
	oFrm.target = "_self";
	oFrm.action = "./Site/Admin/Admin_List.jsp";
	oFrm.submit();
}
//-->
</script>
</head>

<body>
<div id="Wrap" class="wrap_login">
	<div class="login_wrap">
		<p class="logo_login"><img src="./Images/Common/logo_login.gif" alt="동원 F&B"></p>
		<fieldset class="box_login">			
			<legend>Admin Login</legend>
			<form name="LoginFrm" id="LoginFrm" method="post" onSubmit="javascript:checkLogin(); return false;">
			<h1><img src="./Images/Common/h1_login.gif" alt="DONGWON F&B ADMIN"></h1>
			<div class="login_input_wrap">
				<ul class="login_input">
					<li><span class="input_wrap placeholder">
							<input type="text" name="sID" id="sID" maxlength="20" value="" placeholder="아이디" title="아이디입력">
							<label for="sID">아이디</label>
						</span>	
					</li>
					<li><span class="input_wrap placeholder">
							<input type="password" name="sPwd" id="sPwd" maxlength="20" value="" placeholder="비밀번호" title="비밀번호입력">
							<label for="sPwd">비밀번호</label>
						</span>	
					</li>
				</ul>
				<button type="submit" class="btn blue btn_login"><span>로그인</span></button>
				<p class="saveID"><input type="checkbox" name="saveID" id="saveID" value="Y"><label for="saveID">아이디저장</label></p>				
			</div>
			</form>
			<ul class="login_guide">
				<li>여러 명이 함께 사용하는 PC라면 사용 후에<br>
					반드시 로그아웃이나 브라우저를 종료하십시요.</li>
				<li>로그인이 유지되면 타인이 회원님의 계정을 이용하여<br>
					개인정보를 변경할 수도 있습니다.</li>						
			</ul>
		</fieldset>
	</div>
</div>
</body>
</html>
