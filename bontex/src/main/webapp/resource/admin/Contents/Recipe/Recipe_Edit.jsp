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
	setSnb(2);
});

function addCookFlow() {
	var dataString = $("#WriteFrm").serialize();
	var listLen = $(".cookFlow_list>tbody>tr").length;
	
	$(".cookFlow_list>tbody").append("<tr></tr>");	
	$(".cookFlow_list>tbody>tr:last-child").load('Ajax_CookFlow.jsp',function(){
		$(".cookFlow_list>tbody>tr:last-child").find(">th>label").text("조리과정 "+ (listLen+1));
	});		
}
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
					<li class="active">레시피관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>레시피 관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board Write -->
				<form name="WriteFrm" id="WriteFrm" method="post" onSubmit="">
				<!-- 기초정보 등록 -->
				<div class="section">
					<h3>기초정보 등록</h3>
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>기초정보등록</strong>
							<p>종류선택, 테마선택, 게시여부, 레시피명, 요약정보, 난위도, 조리시간, 재료, 태그, 썸네일등록</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">	
							<col width="120">
							<col width="*">	
							<col width="120">
							<col width="*">																			
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sKind">종류</label></th>
								<td>
									<select name="sKind" id="sKind" title="종류 선택" class="size115">
										<option value="0">전체</option>
										<option value="1" selected>밥/죽/스프</option>
										<option value="2">국/찌게/탕</option>
										<option value="3">밑반찬</option>
										<option value="4">볶음/조림/찜</option>
										<option value="5">구이/튀김</option>
										<option value="6">도시락/간식/안주/샐러드</option>
									</select>
								</td>
								<th><label for="sTheme">테마</label></th>
								<td>
									<select name="sTheme" id="sTheme" title="테마 선택" class="size115">
										<option value="0">전체</option>
										<option value="1" selected>야식</option>
										<option value="2">캠핑</option>
										<option value="3">피크닉</option>
										<option value="4">집들이</option>
										<option value="5">Kids</option>
										<option value="6">한그릇 음식</option>
										<option value="7">왕초보</option>
									</select>								
								</td>
								<th><label for="sOpen">게시여부</label></th>
								<td>
									<select name="sOpen" id="sOpen" title="게시여부선택" class="size115">
										<option value="0" selected>게시</option>
										<option value="1">미게시</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="sTitle">레시피 명</label></th>
								<td colspan="5">
									<input type="text" name="sTitle" id="sTitle" maxlength="100" value="볶음참치밥이 왔어요~" title="레시피명 입력" class="size500">
								</td>
							</tr>							
							<tr>
								<th><label for="sSummary">요약정보</label></th>
								<td colspan="5">
									<input type="text" name="sSummary" id="sSummary" maxlength="100" value="요약정보입니다." title="요약정보 입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sClass1">난위도</label></th>
								<td>
									<input type="radio" name="sClass" id="sClass1" value="0" title="상"> <label for="sClass1">상</label>
									<input type="radio" name="sClass" id="sClass2" value="1" title="중" checked class="mar_l15"> <label for="sClass2">중</label>
									<input type="radio" name="sClass" id="sClass3" value="2" title="하" class="mar_l15"> <label for="sClass3">하</label>
								</td>
								<th><label for="sCookTime1">조리시간</label></th>
								<td colspan="3">
									<input type="text" name="sCookTime1" id="sCookTime1" maxlength="3" value="10" title="조리시작시간입력" class="size115"> 분
									~
									<input type="text" name="sCookTime2" id="sCookTime2" maxlength="3" value="30" title="조리종료시간입력" class="size115"> 분
								</td>
							</tr>	
							<tr>
								<th><label for="sMaterial ">재료</label></th>
								<td colspan="5">
									<input type="text" name="sMaterial" id="sMaterial" maxlength="100" value="양파, 파, 마늘, 고추장" title="재료 입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sTag1">태그</label></th>	
								<td colspan="5">
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
							<tr>	
								<th><label for="sThumbnailPath">썸네일등록</label></th>
								<td colspan="5">
									<span class="input_file">
										<input type="text" name="sThumbnailPath" id="sThumbnailPath" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
										<input type="file" name="sThumbnail" id="sThumbnail" title="썸네일이미지 선택" onChange="javascript:setFilePath('sThumbnail','sThumbnailPath');">
									</span>
									<label for="sThumbnail" title="썸네일이미지 선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
									<span class="mar_l10"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</span>																
								</td>
							</tr>																																								
						</tbody>	
					</table>
				</div>
				<!--// 기초정보 등록 -->
				
				<!-- 조리과정 등록 -->
				<div class="section">
					<h3>조리과정 등록</h3>
					<table border="1" cellspacing="0" class="board_view cookFlow_list">
						<caption>
							<strong>조리과정등록</strong>
							<p>조리과정, 썸네일등록</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th><label class="cookFlowNum">조리과정 1</label></th>
								<td>
									<table border="1" cellspacing="0" class="table_row_type1">
										<tr>
											<th><label for="sCookFlow1">조리방법</label></th>
											<td><input type="text" name="sCookFlow1" id="sCookFlow1" maxlength="200" title="조리방법 입력" class="size500"></td>
										</tr>
										<tr>	
											<th><label for="sImgPath_Flow1" class="mar_r10">썸네일등록</label></th>
											<td>
												<span class="input_file">
													<input type="text" name="sImgPath_Flow1" id="sImgPath_Flow1" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
													<input type="file" name="sFlowThumb1" id="sFlowThumb1" title="썸네일이미지 선택" onChange="javascript:setFilePath('sFlowThumb1','sImgPath_Flow1');">
												</span>
												<button type="button" onClick="javascript:selUpFile('sFlowThumb1');" title="썸네일이미지 선택" class="btn sml gray "><span>파일선택</span></button>
												<p class="mar_t5"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</p>
											</td>
										</tr>	
									</table>											
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap left mar_t10">
						<button type="button" onClick="javascript:addCookFlow();" class="btn sml gray"><span>행추가</span></button>
					</div>
				</div>
				<!--// 조리과정 등록 -->
				
				<!-- 관련제품 선택 -->
				<div class="section">
					<div class="section_header">
						<h3>관련제품 선택</h3>
						<div class="btn_group">
							<button type="button" class="btn sml gray"><span>위로</span></button>
							<button type="button" class="btn sml gray"><span>아래로</span></button>
						</div>
					</div>
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>관련제품 선택</strong>
							<p>선택, 썸네일이미지, 브랜드, 카테고리, 제품명, 요약정보, 삭제</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="110">
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="*">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">썸네일이미지</th>
								<th scope="col">브랜드</th>
								<th scope="col">카테고리</th>
								<th scope="col">제품명</th>
								<th scope="col">요약정보</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>동원</td>
								<td>밥/죽/스프</td>
								<td>퀴노아밥</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="1번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>동원</td>
								<td>밥/죽/스프</td>
								<td>퀴노아밥</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="2번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>동원</td>
								<td>밥/죽/스프</td>
								<td>퀴노아밥</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="3번 항목삭제"></a></td>
							</tr>																																																																				
						</tbody>
					</table>
					<div class="btn_wrap left mar_t10">
						<button type="button" onClick="javascript:lp_open('/Popup/LP_ProductSelList.jsp');" class="btn sml gray"><span>제품추가</span></button>
					</div>					
				</div>
				<!--// 주요제품 선택 -->
				
				<!-- 관련레시피 선택 -->
				<div class="section">
					<div class="section_header">
						<h3>관련레시피 선택</h3>
						<div class="btn_group">
							<button type="button" class="btn sml gray"><span>위로</span></button>
							<button type="button" class="btn sml gray"><span>아래로</span></button>
						</div>
					</div>
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>관련레시피 선택</strong>
							<p>선택, 썸네일이미지, 종류, 테마, 레시피명, 요약정보, 삭제</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="110">
							<col width="150">
							<col width="150">
							<col width="150">
							<col width="*">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">썸네일이미지</th>
								<th scope="col">종류</th>
								<th scope="col">테마</th>
								<th scope="col">레시피명</th>
								<th scope="col">요약정보</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>밥/죽/스프</td>
								<td>야식</td>
								<td>퀴노아밥</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="1번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>밥/죽/스프</td>
								<td>야식</td>
								<td>퀴노아밥</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="2번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>밥/죽/스프</td>
								<td>야식</td>
								<td>퀴노아밥</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="3번 항목삭제"></a></td>
							</tr>																																																																				
						</tbody>
					</table>
					<div class="btn_wrap mar_t10">
						<span class="btn_left"><button type="button" onClick="javascript:lp_open('/Popup/LP_RecipeSelList.jsp');" class="btn sml gray"><span>레시피추가</span></button></span>
						<span class="btn_right">
							<button type="submit" class="btn mid black"><span>수정</span></button>
							<button type="button" class="btn mid black"><span>삭제</span></button>
							<button type="button" onClick="javascript:history.back();" class="btn mid black"><span>목록</span></button>						
						</span>
					</div>				
				</div>
				<!--// 관련레시피 선택 -->			
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
