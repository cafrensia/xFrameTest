<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="/resource/admin/Includes/Meta.jsp" %>
<title>동원F&amp;B - 관리자페이지</title>
<%@ include file="/resource/admin/Includes/Styles.jsp" %>
<%@ include file="/resource/admin/Includes/Scripts.jsp" %>
<script type="text/javascript">
jQuery(document).ready(function(e) {
	setLnb(0);
	setSnb(1);
});
</script>
</head>

<body>
<div id="Wrap">
	<!-- Header Wrap -->
	<%@ include file="/resource/admin/Includes/Header.jsp" %>
	<!--// Header Wrap -->
	<hr>
	
	<!-- Container -->
	<div id="Container">
		<!-- Aside -->
		<%@ include file="/resource/admin/Includes/Aside_Site.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">사이트관리</a></li>
					<li class="active">마이페이지</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>마이페이지</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board Write -->
				<form name="EditFrm" id="EditFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>관리자정보 등록</strong>
							<p>권한선택, 상태, 관리자ID, 비밀번호, 비밀번호확인, 이름, 소속부서, 전화번호, 이메일</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sID" class="ast">관리자ID</label></th>
								<td>admin11</td>
							</tr>																				
							<tr>
								<th><label for="sPwd" class="ast">비밀번호</label></th>
								<td>
									<input type="password" name="sPwd" id="sPwd" maxlength="20" title="비밀번호입력" class="size115">
									<span class="mar_l10">띄어쓰기 없이 영문 대/소문자, 숫자조합 6~12자</span>
								</td>
							</tr>
							<tr>
								<th><label for="sPwd2" class="ast">비밀번호</label></th>
								<td>
									<input type="password" name="sPwd2" id="sPwd2" maxlength="20" title="비밀번호확인 입력" class="size115">
									<span class="mar_l10">입력한 비밀번호와 동일한 비밀번호를 입력해 주세요.</span>
								</td>
							</tr>
							<tr>
								<th><label for="sName" class="ast">이름</label></th>
								<td>
									<input type="text" name="sName" id="sName" maxlength="20" value="홍길동" title="이름입력" class="size115">
								</td>
							</tr>														
							<tr>	
								<th><label for="sDepartment" class="ast">소속부서</label></th>
								<td>
									<select name="sDepartment" id="sDepartment" title="소속부서 선택" class="size115">
										<option value="0">홍보팀</option>
										<option value="1">CS팀</option>
										<option value="2">마케팅지원팀</option>
										<option value="3">정보전략팀</option>
									</select>								
								</td>
							</tr>						
							<tr>
								<th><label for="sTel1" class="ast">전화번호</label></th>	
								<td colspan="3">		
									<input type="text" name="sTel1" id="sTel1" maxlength="4" value="010" title="전화번호 첫째자리 입력" class="size115">
									-
									<input type="text" name="sTel2" id="sTel2" maxlength="4" value="1234" title="전화번호 둘째자리 입력" class="size115">
									-
									<input type="text" name="sTel3" id="sTel3" maxlength="4" value="5678" title="전화번호 세째자리 입력" class="size115">
								</td>	
							</tr>
							<tr>
								<th><label for="sEmail" class="ast">이메일</label></th>
								<td>
									<input type="text" name="sEmail" id="sEmail" maxlength="50" value="admin1111" title="이메일입력" class="size115"> @ dongwon.com
								</td>
							</tr>							
						</tbody>	
					</table>
					<div class="btn_wrap right mar_t20">
						<button type="submit" class="btn mid black"><span>수정</span></button>
						<button type="button" class="btn mid black"><span>삭제</span></button>
						<button type="button" onClick="javascript:history.back();" class="btn mid black"><span>취소</span></button>
					</div>
				</div>
				</form>
				<!--// Board Write -->						
				
			</div>
			<!--// Contents body -->
		</div>		
		<!--// Contents -->
	</div>	
	<!--// Container -->
	<hr>
	
	<!-- Footer Wrap -->
	<%@ include file="/resource/admin/Includes/Footer.jsp" %>
	<!--// Footer Wrap -->
</div>
</body>
</html>
