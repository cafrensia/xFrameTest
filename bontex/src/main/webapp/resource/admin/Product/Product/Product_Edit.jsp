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
	setLnb(2);
	setSnb(0);
	
	$(document).on('click','.healthInfo_list .btn_list_del',function(e){
		var listLen = $(".healthInfo_list>tbody>tr").length;
		
		if (listLen > 1 ) {
			$(this).parents(".bgGray").parent("tr").remove();
		}
	})
});

function addHealthInfo() {
	var dataString = $("#WriteFrm").serialize();
	var listLen = $(".healthInfo_list>tbody>tr").length;
	
	$(".healthInfo_list>tbody").append("<tr></tr>");	
	$(".healthInfo_list>tbody>tr:last-child").load('Ajax_HealthInfo.jsp',function(){
		$(".healthInfo_list>tbody>tr:last-child").find(">th>.tit").text("건강정보 "+ (listLen+1));
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
		<%@ include file="/resource/admin/Includes/Aside_Product.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">제품관리</a></li>
					<li class="active">제품관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>제품관리</h2>
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
				<!-- 기초정보 등록 -->
				<div class="section">
					<h3>기초정보 등록</h3>
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>기초정보등록</strong>
							<p>
								제품카테고리, 브랜드명, 제품코드, 게시여부, 등록일, 제품명, <br>
								제품요약정보, 구매하기버튼 노출여부, 유형, 중량, 칼로리, 유통기한, <br>
								태그, 제품이미지, 신제품 여부
							</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="370">
							<col width="120">
							<col width="*">													
						</colgroup>
						<tbody>
							<tr>	
								<th><label for="sCategory1">제품카테고리</label></th>
								<td colspan="3">
									<select name="sCategory1" id="sCategory1" title="카테고리 1차분류 선택" class="size115">
										<option value="">1차분류</option>
										<option value="1">통조림류</option>
										<option value="2">즉석밥/죽/국밥류</option>
										<option value="3">해조류</option>
										<option value="4">김치류</option>
										<option value="5">음료/샘물</option>
										<option value="6">냉장육가공류</option>
										<option value="7">맛살/어묵류</option>
										<option value="8">냉동식품</option>
										<option value="9">조미식품</option>
										<option value="10">프리믹스</option>
										<option value="11">면류</option>
										<option value="12">디저트류</option>
										<option value="13">유가공</option>
										<option value="14">건강식품</option>
										<option value="15">펫푸드</option>
									</select>
									<select name="sCategory2" id="sCategory2" title="카테고리 2차분류 선택" class="size115">
										<option value="">2차분류</option>
										<option value="1">참치캔</option>
										<option value="2">연어캔</option>
										<option value="3">수산캔</option>
										<option value="4">축산캔</option>
										<option value="5">과일농산캔</option>
									</select>																	
								</td>
							</tr>
							<tr>
								<th><label for="sBrand">브랜드명</label></th>
								<td>
									<select name="sBrand" id="sBrand" title="브랜드명선택" class="size115">
										<option value="0">전체</option>
										<option value="1">동원</option>
										<option value="2">양반</option>
										<option value="3">리챔</option>
										<option value="4">덴마크밀크</option>
										<option value="5">소와나무</option>
										<option value="6">개성</option>
										<option value="7">Real 리얼크랩스</option>
										<option value="8">덴마크햄</option>
										<option value="9">미앤미소시지</option>
										<option value="10">보성녹차</option>
										<option value="11">쎈쿡</option>
										<option value="12">파스타를 만들자</option>
										<option value="13">잼이 된 통베리</option>
										<option value="14">뉴트리플랜</option>
										<option value="15">천지인</option>
										<option value="16">GNC</option>
									</select>
								</td>
								<th><label for="sProdCode">제품코드</label></th>
								<td>
									<input type="text" name="sProdCode" id="sProdCode" maxlength="20" title="제품코드입력" class="size115">
									<button type="button" class="btn sml gray"><span>조회</span></button>
								</td>
							</tr>
							<tr>
								<th><label for="sOpen">게시여부</label></th>
								<td>
									<select name="sOpen" id="sOpen" title="게시여부선택" class="size115">
										<option value="0">게시</option>
										<option value="1">미게시</option>
									</select>
								</td>
								<th><label for="sRegDate">등록일자</label></th>
								<td>
									<span class="input_date"><input type="text" name="sRegDate" id="sRegDate" maxlength="10" title="등록일자 입력" readonly class="size115 datepicker"><button type="button" onClick="javascript:openCal('sRegDate');" class="btn_datepicker"><span>등록일자선택</span></button></span>
								</td>								
							</tr>
							<tr>
								<th><label for="sProdName">제품명</label></th>
								<td colspan="3">
									<input type="text" name="sProdName" id="sProdName" maxlength="20" title="제품명입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sSummary">제품요약정보</label></th>	
								<td colspan="3">		
									<textarea name="sSummary" id="sSummary" rows="10" cols="130" class="size100p"></textarea>
									<div class="mar_t5"><strong id="bytes">200</strong> / 800자</div>
								</td>	
							</tr>
							<tr>
								<th><label for="sSaleBtnYN1">구매하기버튼<br>노출여부</label></th>
								<td colspan="3">
									<input type="radio" name="sSaleBtnYN" id="sSaleBtnYN1" title="노출" value="Y" checked> <label for="sSaleBtnYN1">노출</label>
									<input type="radio" name="sSaleBtnYN" id="sSaleBtnYN2" title="비노출" value="N" checked class="mar_l15"> <label for="sSaleBtnYN2">비노출</label>
								</td>
							</tr>
							<tr>
								<th><label for="sType">유형</label></th>
								<td>
									<input type="text" name="sType" id="sType" maxlength="20" title="유형 입력" class="size115">
								</td>
								<th><label for="sWeight">중량</label></th>
								<td>
									<input type="text" name="sWeight" id="sWeight" maxlength="20" title="중량 입력" class="size115">
								</td>						
							</tr>	
							<tr>
								<th><label for="sCalorie">칼로리</label></th>
								<td>
									<input type="text" name="sCalorie" id="sCalorie" maxlength="20" title="칼로리 입력" class="size115">
								</td>
								<th><label for="sExpireDate">유통기한</label></th>
								<td>
									<input type="text" name="sExpireDate" id="sExpireDate" maxlength="20" title="유통기한 입력" class="size115">
								</td>						
							</tr>
							<tr>
								<th><label for="sTag1">태그</label></th>	
								<td colspan="3">
									<div class="mar_b5">
										<input type="text" name="sTag" id="sTag1" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag2" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag3" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag4" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag5" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag6" maxlength="20" title="태그명입력" class="size100">
									</div>
									<div>
										<input type="text" name="sTag" id="sTag7" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag8" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag9" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag10" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag11" maxlength="20" title="태그명입력" class="size100">
										<input type="text" name="sTag" id="sTag12" maxlength="20" title="태그명입력" class="size100">
									</div>										
								</td>	
							</tr>																																		
							<tr>	
								<th><label for="sUpFilePath">제품이미지</label></th>
								<td colspan="3">
									<span class="input_file">
										<input type="text" name="sUpFilePath" id="sUpFilePath" size="100" value="" title="첨부파일경로" class="size500" readonly>
										<input type="file" name="sUpFile" id="sUpFile" title="첨부파일선택" onChange="javascript:setFilePath('sUpFile','sUpFilePath');">
									</span>
									<label for="sUpFile" title="첨부파일선택" tabindex="0" class="btn sml gray "><span>파일선택</span></label>
									<span class="mar_l10"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</span>								
								</td>
							</tr>																										
							<tr>
								<th><label for="sNewProdSet">신제품 여부</label></th>	
								<td colspan="3">		
									<input type="checkbox" name="sNewProdSet" id="sNewProdSet" value="Y" title="신제품여부체크">
									<span class="mar_l10"><span class="blue">※</span> 체크 시 썸네일에 New아이콘이 게시됩니다.</span>
								</td>	
							</tr>
							<tr>
								<th><label>제품특성</label></th>
								<td colspan="3">
									<ul class="featureList">
										<li><label for="sFeature1">건강정보</label> <input type="checkbox" name="sFeature" id="sFeature1" title="건강정보(영양소)" class="mar_l5">
											<table border="1" cellspacing="0" class="table_row_type1 healthInfo_list mar_t10">
												<colgroup>
													<col width="120">
													<col width="*">
												</colgroup>											
												<tbody>
													<tr>
														<th class="bgGray">
															<span class="tit">건강정보 1</span>
															<p class="mar_t10"><button type="button" class="btn sml gray btn_list_del"><span>삭제</span></button></p>
														</th>
														<td>
															<dl class="healthInfo">
																<dt><label for="sHealthTitle1">타이틀</label></dt>
																<dd>
																	<input type="text" name="sHealthTitle" id="sHealthTitle1" maxlength="100" class="size100p">
																	
																</dd>
															</dl>
															<dl	class="healthInfo">
																<dt><label for="sHealthInfo1">상세내용</label></dt>
																<dd>
																	<textarea name="sHealthInfo" id="sHealthInfo1" rows="5" cols="86" class="size100p"></textarea>
																	<div class="mar_t5"><strong id="bytes">200</strong> / 800자</div>
																</dd>
															</dl>		
														</td>
													</tr>
												</tbody>
											</table>
											<div class="btn_wrap left mar_t10">
												<button type="button" onClick="javascript:addHealthInfo();" class="btn sml gray"><span>추가</span></button>
											</div>
										</li>
										<li><label for="sFeature2">재료정보</label> <input type="checkbox" name="sFeature" id="sFeature2" title="재료정보" class="mar_l5"></li>
										<li><label for="sFeature3">맛정보</label> <input type="checkbox" name="sFeature" id="sFeature3" title="맛정보" class="mar_l5"></li>
										<li><label for="sFeature4">기술정보</label> <input type="checkbox" name="sFeature" id="sFeature4" title="기술정보" class="mar_l5"></li>
										<li><label for="sFeature5">인증정보</label> <input type="checkbox" name="sFeature" id="sFeature5" title="인증정보" class="mar_l5"></li>
										<li><label for="sFeature6">기타정보</label> <input type="checkbox" name="sFeature" id="sFeature6" title="기타정보" class="mar_l5"></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th><label class="sNote">취급시 주의사항</label></th>
								<td colspan="3">
									<textarea name="sNote" id="sNote" rows="15" cols="130" class="size100p"></textarea>
								</td>
							</tr>							
						</tbody>	
					</table>
				</div>
				<!--// 기초정보 등록 -->
				
				<!-- 주요제품 선택 -->
				<div class="section">
					<div class="section_header">
						<h3>주요제품 선택</h3>
						<div class="btn_group">
							<button type="button" class="btn sml gray"><span>위로</span></button>
							<button type="button" class="btn sml gray"><span>아래로</span></button>
						</div>
					</div>
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>주요제품 선택</strong>
							<p>선택, 썸네일이미지, 카테고리, 제품명, 삭제</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="110">
							<col width="150">
							<col width="*">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">썸네일이미지</th>
								<th scope="col">카테고리</th>
								<th scope="col">제품명</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>밥/죽/스프</td>
								<td class="l15">퀴노아밥</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="1번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="2번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>밥/죽/스프</td>
								<td class="l15">퀴노아밥</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="2번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="3번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>밥/죽/스프</td>
								<td class="l15">퀴노아밥</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="3번 항목삭제"></a></td>
							</tr>																																																																					
						</tbody>
					</table>
					<div class="btn_wrap left mar_t10">
						<button type="button" onClick="javascript:lp_open('/resource/admin/Popup/LP_ProductSelList.jsp');" class="btn sml gray"><span>주요 제품 추가</span></button>
					</div>					
				</div>
				<!--// 주요제품 선택 -->
				
				<!-- 연관레시피 선택 -->
				<div class="section">
					<div class="section_header">
						<h3>연관레시피 선택</h3>
						<div class="btn_group">
							<button type="button" class="btn sml gray"><span>위로</span></button>
							<button type="button" class="btn sml gray"><span>아래로</span></button>
						</div>
					</div>
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>연관레시피 선택</strong>
							<p>선택, 썸네일이미지, 브랜드, 테마, 제목, 삭제</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="110">
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
								<th scope="col">테마</th>
								<th scope="col">제목</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>센쿡</td>
								<td>야식</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="1번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>센쿡</td>
								<td>야식</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="2번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번 항목선택"></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>센쿡</td>
								<td>야식</td>
								<td class="l15">맛있고 건강한 참치가 왔어요~</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="3번 항목삭제"></a></td>
							</tr>																																																																				
						</tbody>
					</table>
					<div class="btn_wrap mar_t10">
						<span class="btn_left"><button type="button" onClick="javascript:lp_open('/resource/admin/Popup/LP_RecipeSelList.jsp');" class="btn sml gray"><span>레시피추가</span></button></span>
						<span class="btn_right">
							<button type="submit" class="btn mid black"><span>수정</span></button>
							<button type="button" class="btn mid black"><span>삭제</span></button>
							<button type="button" onClick="javascript:history.back();" class="btn mid black"><span>목록</span></button>						
						</span>						
					</div>				
				</div>
				<!--// 연관레시피 선택 -->												
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
