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
jQuery(document).ready(function(e) {
	setLnb(5);
	setSnb(1);	
});
//-->
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
		<%@ include file="/resource/admin/Includes/Aside_Customer.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">고객센터</a></li>
					<li class="active">자주찾는 질문</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>자주찾는 질문</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">
			
				<!-- Board Write -->
				<form name="EditFrm" id="EditFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>게시물등록</strong>
							<p>구분, 게시여부, 질문, 답변</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sKind" class="ast">구분</label></th>
								<td>
									<select name="sKind" id="sKind" title="구분선택" class="size115">
										<option value="0">전체</option>
										<option value="1">동원F&amp;B</option>
										<option value="2">브랜드</option>
										<option value="3">기타</option>
									</select>
								</td>
								<th><label for="sIsOpen" class="ast">게시여부</label></th>
								<td>
									<select name="sIsOpen" id="sIsOpen" title="게시여부선택" class="size115">
										<option value="0">전체</option>
										<option value="1">게시</option>
										<option value="2">미게시</option>
									</select>								
								</td>								
							</tr>
							<tr>
								<th><label for="sTitle" class="ast">질문</label></th>
								<td colspan="3">
									<input type="text" name="sTitle" id="sTitle" maxlength="100" value="자주찾는질문게시판 질문입니다." title="질문 입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sContent" class="ast">답변</label></th>	
								<td colspan="3">		
									<textarea name="sContent" id="sContent" rows="15" cols="130" class="size100p">질문에 대한 답변입니다.</textarea>
								</td>	
							</tr>
						</tbody>	
					</table>
					<div class="btn_wrap right mar_t20">
						<button type="submit" class="btn mid black"><span>수정</span></button>
						<button type="button" class="btn mid black"><span>삭제</span></button>
						<button type="button" onClick="javascript:history.back();" class="btn mid black"><span>목록</span></button>
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