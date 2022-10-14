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
	setLnb(3);
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
		<%@ include file="/resource/admin/Includes/Aside_Contents.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">콘텐츠관리</a></li>
					<li class="active">소셜콘텐츠관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>소셜 콘텐츠 관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board Write -->
				<form name="EditFrm" id="EditFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>소셜켄텐츠 수정</strong>
							<p>SNS구분, 날짜, 카테고리, 게시여부, 제목, 요약정보, 링크, 동영상링크, 태그</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label>SNS구분</label></th>
								<td>
									블로그 &gt; 카테고리정보
								</td>
								<th><label>날짜</label></th>
								<td>2015.05.01 13:00</td>
							</tr>
							<tr>
								<th><label for="sCategory1" class="ast">제품카테고리</label></th>
								<td>
									<select name="sCategory1" id="sCategory1" title="카테고리 1차분류 선택" class="size115">
										<option value="">1차분류</option>
										<option value="1" selected>동원스토리</option>
										<option value="2">웰빙스토리</option>
									</select>
									<select name="sCategory2" id="sCategory2" title="카테고리 2차분류 선택" class="size115">
										<option value="">2차분류</option>
										<option value="1" selected>현장스케치</option>
										<option value="2">광고/브랜드 이야기</option>
									</select>																	
								</td>
								<th><label for="sIsOpen" class="ast">게시여부</label></th>
								<td>
									<select name="sIsOpen" id="sIsOpen" title="게시여부선택" class="size115">
										<option value="0">전체</option>
										<option value="1" selected>게시</option>
										<option value="2">미게시</option>
									</select>								
								</td>
							</tr>	
							<tr>
								<th><label for="sTitle" class="ast">제목</label></th>
								<td colspan="3">
									<input type="text" name="sTitle" id="sTitle" maxlength="100" value="글제목입니다." title="글 제목입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sSummary">요약정보</label></th>
								<td colspan="3">
									<textarea name="sSummary" id="sSummary" cols="100" rows="10" class="size100p">요약정보내용입니다.</textarea>
								</td>
							</tr>																				
							<tr>
								<th><label for="sLinkUrl">링크</label></th>
								<td colspan="3">
									<input type="text" name="sLinkUrl" id="sLinkUrl" maxlength="200" value="http://www.google.com" title="링크" class="size500">
									<select name="sLinkTarget" id="sLinkTarget" title="새창열림 여부" class="size115">
										<option value="0" selected>새창</option>
										<option value="1">페이지이동</option>
									</select>									
								</td>
							</tr>
							<tr>	
								<th><label for="sThumbnailPath" class="ast">썸네일이미지</label></th>
								<td colspan="3">
									<span class="input_file">
										<input type="text" name="sThumbnailPath" id="sThumbnailPath" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
										<input type="file" name="sThumbnail" id="sThumbnail" title="썸네일이미지 선택" onChange="javascript:setFilePath('sThumbnail','sThumbnailPath');">
									</span>
									<label for="sThumbnail" title="썸네일이미지 선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
									<span class="mar_l20"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</span>																
								</td>
							</tr>
							<tr>
								<th><label for="sVideoUrl">동영상링크</label></th>
								<td colspan="3">
									<input type="text" name="sVideoUrl" id="sVideoUrl" maxlength="200" title="동영상링크" class="size500">
								</td>
							</tr>															
							<tr>
								<th><label for="sTag1">태그</label></th>	
								<td colspan="3">
									<div class="mar_b5">
										<input type="text" name="sTag" id="sTag1" maxlength="20" value="태그1" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag2" maxlength="20" value="태그2" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag3" maxlength="20" value="태그3" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag4" maxlength="20" value="태그4" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag5" maxlength="20" value="태그5" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag6" maxlength="20" value="" title="태그명입력" class="size100">
									</div>
									<div>
										<input type="text" name="sTag" id="sTag7" maxlength="20" value="" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag8" maxlength="20" value="" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag9" maxlength="20" value="" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag10" maxlength="20" value="" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag11" maxlength="20" value="" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag12" maxlength="20" value="" title="태그명입력" class="size100">
									</div>										
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
