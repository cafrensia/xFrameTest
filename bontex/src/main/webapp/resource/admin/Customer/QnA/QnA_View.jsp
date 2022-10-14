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
	setSnb(2);	
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
					<li class="active">고객의 소리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>고객의 소리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">
			
				<!-- Board Write -->
				<form name="EditFrm" id="EditFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>게시물상세</strong>
							<p>구분, 상태, 고객명, 등록일자, 전화번호, 이메일, 주소, 제목, 첨부파일, 내용, 답변, 관리자메모</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="370">
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label>구분</label></th>
								<td>소비자 클레임</td>
								<th><label for="sStatus1">상태</label></th>
								<td>
									<input type="radio" name="sStatus" id="sStatus1" value="0" title="접수완료" checked> <label for="sStatus1">접수완료</label>
									<input type="radio" name="sStatus" id="sStatus2" value="1" title="처리중" class="mar_l15"> <label for="sStatus2">처리중</label>
									<input type="radio" name="sStatus" id="sStatus3" value="2" title="처리완료" class="mar_l15"> <label for="sStatus3">처리완료</label>
								</td>								
							</tr>
							<tr>
								<th><label>고객명</label></th>
								<td>홍길동</td>
								<th><label>등록일자</label></th>
								<td>2015.09.11</td>								
							</tr>
							<tr>
								<th><label>전화번호</label></th>
								<td>010-1234-5678</td>
								<th><label>이메일</label></th>
								<td>abc111@naver.com</td>								
							</tr>
							<tr>
								<th><label>주소</label></th>
								<td colspan="3">서울시 종로구 도림동 도림빌딩 2층</td>
							</tr>
							<tr>
								<th><label>제목</label></th>
								<td colspan="3">동원참치 너무 맛있네요</td>
							</tr>
							<tr>
								<th><label>첨부파일</label></th>
								<td colspan="3">abcdefg.jpg <button type="button" class="btn sml gray mar_l5"><span>다운로드</span></button></td>
							</tr>
							<tr>
								<th><label>내용</label></th>
								<td colspan="3">동원참치가 너무 맛있어서 대량 구매하고 싶어요~</td>
							</tr>																																			
							<tr>
								<th><label for="sContent">답변</label></th>	
								<td colspan="3">		
									<textarea name="sContent" id="sContent" rows="15" cols="130" class="size100p"></textarea>
								</td>	
							</tr>
							<tr>
								<th><label for="sMemo">관리자메모</label></th>	
								<td colspan="3">		
									<textarea name="sMemo" id="sMemo" rows="10" cols="130" class="size100p"></textarea>
								</td>	
							</tr>							
						</tbody>	
					</table>
					<div class="btn_wrap right mar_t20">
						<button type="submit" class="btn mid black"><span>메일재발송</span></button>
						<button type="button" class="btn mid black"><span>등록</span></button>
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