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
	setSnb(5);
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
					<li class="active">팝업관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>팝업관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board Write -->
				<form name="EditFrm" id="WriteFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>팝업등록</strong>
							<p>팝업명, 게시여부, 팝업위치, 팝업사이즈, 게시기간, 팝업이미지, 링크경로, 팝업종류</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">						
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sTitle" class="ast">팝업명</label></th>
								<td>
									<input type="text" name="sTitle" id="sTitle" maxlength="100" value="시스템 정기점검 작업안내" title="팝업명입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sOpen1" class="ast">게시여부</label></th>
								<td>
									<input type="radio" name="sOpen" id="sOpen1" value="Y" title="게시" checked> <label for="sOpen1">게시</label>
									<input type="radio" name="sOpen" id="sOpen2" value="N" title="미게시" class="mar_l15"> <label for="sOpen2">미게시</label>
								</td>
							</tr>
							<tr>
								<th><label for="sPosX" class="ast">팝업위치</label></th>
								<td>
									X : <input type="text" name="sPosX" id="sPosX" maxlength="4" value="0" title="팝업 X좌표입력" class="size115 mar_r20">
									Y : <input type="text" name="sPosY" id="sPosY" maxlength="4" value="0" title="팝업 Y좌표입력" class="size115">
									
								</td>
							</tr>
							<tr>
								<th><label for="sSizwW" class="ast">팝업사이즈</label></th>
								<td>
									W : <input type="text" name="sSizeW" id="sSizeW" maxlength="4" value="300" title="팝업 폭입력" class="size115 mar_r20">
									H : <input type="text" name="sSizeY" id="sSizeY" maxlength="4" value="500" title="팝업 높이입력" class="size115">
									
								</td>
							</tr>																											
							<tr>
								<th><label for="sStartDate" class="ast">게시기간</label></th>
								<td>
									<span class="input_date"><input type="text" name="sStartDate" id="sStartDate" maxlength="10" value="2014-09-10" title="게시 시작일자 입력" readonly class="size115 datepicker"><button type="button" onClick="javascript:openCal('sStartDate');" class="btn_datepicker"><span>시작날짜선택</span></button></span>
									~
									<span class="input_date"><input type="text" name="sEndDate" id="sEndDate" maxlength="10" value="2014-09-20" title="게시 종료일자 입력" readonly class="size115 datepicker"><button type="button" onClick="javascript:openCal('sEndDate');" class="btn_datepicker"><span>종료날짜선택</span></button></span>
								</td>
							</tr>
							<tr>	
								<th><label for="sUpFilePath" class="ast">팝업이미지</label></th>
								<td colspan="3">
									<span class="input_file">
										<input type="text" name="sUpFilePath" id="sUpFilePath" size="100" value="" title="첨부파일경로" class="size500" readonly>
										<input type="file" name="sUpFile" id="sUpFile" title="첨부파일선택" onChange="javascript:setFilePath('sUpFile','sUpFilePath');">
									</span>
									<label for="sUpFile" title="첨부파일선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
									<button type="button" title="첨부파일삭제" class="btn sml gray "><span>삭제</span></button>
									<span class="mar_l20"><span class="blue">*</span> 이미지 권장 사이즈 300 x 500</span>
								</td>
							</tr>							
							<tr>
								<th><label for="sLinkUrl">링크경로</label></th>
								<td>
									<input type="text" name="sLinkUrl" id="sLinkUrl" maxlength="200" title="링크경로입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sPopType" class="ast">팝업종류</label></th>
								<td>
									<input type="radio" name="sPopType" id="sPopType1" value="W" title="윈도우팝업" checked> <label for="sPopType1">윈도우팝업</label>
									<input type="radio" name="sPopType" id="sPopType2" value="L" title="레이어팝업" class="mar_l15"> <label for="sPopType2">레이어팝업</label>
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
