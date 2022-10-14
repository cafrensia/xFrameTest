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
	setLnb(4);
	setSnb(0);
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
		<%@ include file="/resource/admin/Includes/Aside_Company.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">Company관리</a></li>
					<li class="active">영업/판매사업장 관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>영업/판매사업장 관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Tab -->
				<ul class="tab four_up">
					<li class="on"><a href="#">국문</a></li>
					<li><a href="#">영문</a></li>
					<li><a href="#">중문</a></li>
					<li><a href="#">일문</a></li>
				</ul>
				<!--// Tab -->
				
				<!-- Board Write -->
				<form name="WriteFrm" id="WriteFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>게시물등록</strong>
							<p>구분, 제목, 작성자, 등록일자, 게시여부, 썸네일이미지, 첨부파일, 내용</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sArea">지역구분</label></th>
								<td colspan="3">
									<select name="sArea" id="sArea" title="지역구분선택" class="size115">
										<option value="0">전체</option>
										<option value="1">서울특별시</option>
										<option value="2">충청도</option>
										<option value="3">전라도</option>
										<option value="4">강원도</option>
										<option value="5">대구광역시</option>
										<option value="6">부산광역시</option>
										<option value="7">경기도</option>
										<option value="8">대전광역시</option>
										<option value="9">광주광역시</option>
										<option value="10">경상도</option>
										<option value="11">울산광역시</option>
										<option value="12">제주특별자치도</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="sBranch">지점명</label></th>
								<td colspan="3">
									<input type="text" name="sBranch" id="sBranch" maxlength="30" title="지점명 입력" class="size115">
								</td>
							</tr>
							<tr>
								<th><label for="sAddr">주소</label></th>
								<td colspan="3">
									<input type="text" name="sAddr" id="sAddr" maxlength="200" title="주소 입력" class="size500">
								</td>
							</tr>							
							<tr>
								<th><label for="sMapUrl">지도 URL</label></th>
								<td colspan="3">
									<input type="text" name="sMapUrl" id="sMapUrl" maxlength="200" title="지도Url 입력" class="size500">
									<button type="button" class="btn sml gray"><span>지도 확인하기</span></button>
								</td>
							</tr>																				
							<tr>
								<th><label for="sTel">전화번호</label></th>
								<td>
									<input type="text" name="sTel" id="sTel" maxlength="15" title="전화번호 입력" class="size115">
								</td>
								<th><label for="sFax">팩스번호</label></th>
								<td>
									<input type="text" name="sFax" id="sFax" maxlength="15" title="팩스번호 입력" class="size115">								
								</td>
							</tr>
							<tr>
								<th><label for="sIsOpen">게시여부</label></th>
								<td colspan="3">
									<select name="sIsOpen" id="sIsOpen" title="게시여부선택" class="size115">
										<option value="0">전체</option>
										<option value="1">게시</option>
										<option value="2">미게시</option>
									</select>								
								</td>
							</tr>
							<tr>	
								<th><label for="sUpFilePath">사업장 사진</label></th>
								<td colspan="3">
									<span class="input_file">
										<input type="text" name="sUpFilePath" id="sUpFilePath" size="100" value="" title="첨부파일경로" class="size500" readonly>
										<input type="file" name="sUpFile" id="sUpFile" title="첨부파일선택" onChange="javascript:setFilePath('sUpFile','sUpFilePath');">
									</span>
									<label for="sUpFile" title="첨부파일선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
									<span class="mar_l10"><span class="blue">*</span> 이미지 권장 사이즈 : 500 x 350</span>
								</td>
							</tr>
						</tbody>	
					</table>
					<div class="btn_wrap right mar_t20">
						<button type="submit" class="btn mid black"><span>등록</span></button>
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
