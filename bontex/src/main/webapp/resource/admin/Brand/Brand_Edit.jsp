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
	setLnb(1);
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
		<%@ include file="/resource/admin/Includes/Aside_Brand.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">브랜드관리</a></li>
					<li class="active">브랜드관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>브랜드관리</h2>
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
							<p>브랜드명, 게시여부, 브랜드리스트썸네일, 배경이미지, 본문타이틀, 본문상세, 버튼</p>
						</caption>
						<colgroup>
							<col width="160">
							<col width="*">						
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sBrand">브랜드명</label></th>
								<td>
									<input type="text" name="sBrand" id="sBrand" maxlength="20" value="동원" title="브랜드명입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sOpen">게시여부</label></th>
								<td>
									<select name="sOpen" id="sOpen" title="게시여부선택" class="size115">
										<option value="0" selected>게시</option>
										<option value="1">미게시</option>
									</select>
								</td>
							</tr>
							<tr>	
								<th><label for="sThumbnailPath">브랜드리스트썸네일</label></th>
								<td>
									<span class="input_file">
										<input type="text" name="sThumbnailPath" id="sThumbnailPath" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
										<input type="file" name="sThumbnail" id="sThumbnail" title="썸네일이미지 선택" onChange="javascript:setFilePath('sThumbnail','sThumbnailPath');">
									</span>
									<label for="sThumbnail" title="썸네일이미지 선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
									<span class="mar_l10"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</span>																
								</td>
							</tr>
							<tr>	
								<th><label for="sUpFilePath">배경이미지</label></th>
								<td>
									<span class="input_file">
										<input type="text" name="sUpFilePath" id="sUpFilePath" size="100" value="" title="첨부파일경로" class="size500" readonly>
										<input type="file" name="sUpFile" id="sUpFile" title="첨부파일선택" onChange="javascript:setFilePath('sUpFile','sUpFilePath');">
									</span>
									<label for="sUpFile" title="첨부파일선택" tabindex="0" class="btn sml gray "><span>파일선택</span></label>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
									<span class="mar_l10"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</span>								
								</td>
							</tr>															
							<tr>
								<th><label for="sTitle">본문타이틀</label></th>
								<td>
									<input type="text" name="sTitle" id="sTitle" maxlength="100" value="Everyday Good Food" title="글 제목입력" class="size500">
								</td>
							</tr>																										
							<tr>
								<th><label for="sContent">본문상세</label></th>	
								<td>		
									<textarea name="sContent" id="sContent" rows="10" cols="130" class="size100p">본문상세내용</textarea>
									<div class="mar_t5"><strong id="bytes">200</strong> / 800자</div>
								</td>	
							</tr>
							<tr>
								<th><label>버튼</label></th>
								<td>
									<table class="table_row_type1">
										<tr>
											<th>제품 전체보기</th>
											<td>
												<input type="radio" name="sProdOpen" id="sProdOpen1" title="게시" value="Y" checked> <label for="sProdOpen1">게시</label>
												<input type="radio" name="sProdOpen" id="sProdOpen2" title="게시" value="N" checked class="mar_l15"> <label for="sProdOpen2">미게시</label>
											</td>
										</tr>
										<tr>
											<th>브랜드 사이트</th>
											<td>
												<div class="mar_b10">
													<input type="radio" name="sBranOpen" id="sBranOpen1" title="게시" value="Y" checked> <label for="sBranOpen1">게시</label>
													<input type="radio" name="sProdOpen" id="sBranOpen2" title="게시" value="N" checked class="mar_l15"> <label for="sBranOpen2">미게시</label>
												</div>
												<div>
													URL <input type="text" name="sBrandUrl" id="sBrandUrl" maxlength="100" title="브랜드사이트 Url입력" class="size500 mar_l5">
													<a href="#" target="_blank" class="link blue mar_l10">URL확인</a>
												</div>	
											</td>
										</tr>										
									</table>
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
						<button type="button" onClick="javascript:lp_open('/Popup/LP_ProductSelList.jsp');" class="btn sml gray"><span>주요 제품 추가</span></button>
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
					<div class="btn_wrap left mar_t10">
						<button type="button" onClick="javascript:lp_open('/Popup/LP_RecipeSelList.jsp');" class="btn sml gray"><span>레시피추가</span></button>
					</div>				
				</div>
				<!--// 연관레시피 선택 -->				
				
				<!-- 홍보 CF -->
				<div class="section">
					<div class="section_header">
						<h3>홍보CF</h3>
						<div class="btn_group">
							<button type="button" class="btn sml gray"><span>위로</span></button>
							<button type="button" class="btn sml gray"><span>아래로</span></button>
						</div>
					</div>
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>홍보CF 선택</strong>
							<p>선택, 썸네일이미지, 제목, 삭제</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="110">
							<col width="*">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">썸네일이미지</th>
								<th scope="col">제목</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번 항목선택"></td>
								<td><img src="/Images/Common/img_noVideo.gif" alt="NO Video"></td>
								<td class="l15">홍보CF제목</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="1번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="2번 항목선택"></td>
								<td><img src="/Images/Common/img_noVideo.gif" alt="NO Video"></td>
								<td class="l15">홍보CF제목</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="2번 항목삭제"></a></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="3번 항목선택"></td>
								<td><img src="/Images/Common/img_noVideo.gif" alt="NO Video"></td>
								<td class="l15">홍보CF제목</td>
								<td><a href="#"><img src="/Images/Common/btn_delete.gif" alt="3번 항목삭제"></a></td>
							</tr>																																																																					
						</tbody>
					</table>
					<div class="btn_wrap mar_t10">
						<span class="btn_left"><button type="button" onClick="javascript:lp_open('/Popup/LP_CFSelList.jsp');" class="btn sml gray"><span>CF 추가</span></button></span>
						<span class="btn_right">
							<button type="submit" class="btn mid black"><span>수정</span></button>
							<button type="submit" class="btn mid black"><span>삭제</span></button>
							<button type="button" onClick="javascript:history.back();" class="btn mid black"><span>목록</span></button>						
						</span>
					</div>				
				</div>
				<!--// 홍보 CF -->			
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
