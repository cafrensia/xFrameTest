<%@ page pageEncoding="utf-8"%>
<!-- 개발시 삭제영역 -->
<%@ include file="/resource/admin/Includes/Styles.jsp" %>
<!--// 개발시 삭제 영역 -->

<div id="LP_RecipeSelList" class="lp_wrap lp_recipeSelList">
	<!-- LP Header -->
	<div class="lp_header">
		<h2>주요레시피 선택</h2>
	</div>
	<!--// LP Header -->
	
	<!-- LP Container -->
	<div class="lp_body">
		<!-- Board Search -->
		<div class="lp_section">
			<table border="1" cellspacing="0" class="board_search">
				<caption>
					<strong>게시물검색</strong>
					<p>브랜드, 카테고리, 조회기간, 검색어 입력</p>
				</caption>
				<colgroup>
					<col width="120">
					<col width="*">						
				</colgroup>
				<tbody>
					<tr>
						<th><label for="sBrand">브랜드</label></th>
						<td>
							<select name="sBrand" id="sBrand" title="브랜드선택" class="size115">
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
					</tr>
					<tr>	
						<th><label for="sKind">카테고리</label></th>
						<td>
							<select name="sKind" id="sKind" title="종류 선택" class="size115">
								<option value="0">전체</option>
								<option value="1">밥/죽/스프</option>
								<option value="2">국/찌게/탕</option>
								<option value="3">밑반찬</option>
								<option value="4">볶음/조림/찜</option>
								<option value="5">구이/튀김</option>
								<option value="6">도시락/간식/안주/샐러드</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><label for="sTheme">테마</label></th>
						<td>
							<select name="sTheme" id="sTheme" title="테마 선택" class="size115">
								<option value="0">전체</option>
								<option value="1">야식</option>
								<option value="2">캠핑</option>
								<option value="3">피크닉</option>
								<option value="4">집들이</option>
								<option value="5">Kids</option>
								<option value="6">한그릇 음식</option>
								<option value="7">왕초보</option>
							</select>								
						</td>						
					</tr>
					<tr>
						<th><label for="sStartDate">조회기간</label></th>
						<td>
							<span class="input_date"><input type="text" name="sStartDate" id="sStartDate" maxlength="10" title="검색 시작일자 입력" readonly class="size115 datepicker"><button type="button" onClick="javascript:openCal('sStartDate');" class="btn_datepicker"><span>시작날짜선택</span></button></span>
							~
							<span class="input_date"><input type="text" name="sEndDate" id="sEndDate" maxlength="10" title="검색 종료일자 입력" readonly class="size115 datepicker"><button type="button" onClick="javascript:openCal('sEndDate');" class="btn_datepicker"><span>종료날짜선택</span></button></span>
							
							<span class="btn_wrap">
								<button type="button" onClick="javascript:setSearchDate('1','sStartDate','sEndDate');" class="btn sml gray"><span>1개월</span></button>
								<button type="button" onClick="javascript:setSearchDate('3','sStartDate','sEndDate');" class="btn sml gray"><span>3개월</span></button>
								<button type="button" onClick="javascript:setSearchDate('6','sStartDate','sEndDate');" class="btn sml gray"><span>6개월</span></button>
								<button type="button" onClick="javascript:setSearchDate('12','sStartDate','sEndDate');" class="btn sml gray"><span>12개월</span></button>
							</span>
						</td>
					</tr>					
					<tr>
						<th><label for="sKey">검색어입력</label></th>	
						<td>		
							<select name="sKey" id="sKey" title="검색옵션선택" class="size115">
								<option value="">전체</option>
								<option value="sTitle">제목</option>
								<option value="sContents">내용</option>
							</select>
							<input type="text" name="sSearchString" id="sSearchString" maxlength="50" title="검색어입력" class="size220">
							<button type="button" class="btn mid blue"><span>검색</span></button>
						</td>	
					</tr>
				</tbody>	
			</table>
		</div>
		<!--// Board Search -->
		
		<!-- Board List -->
		<div class="lp_section">
			<div class="board_scroll_wrap">
				<table border="1" cellspacing="0" class="board_list_type1 board_list_scroll">
					<caption>
						<strong>주요레시피선택 리스트</strong>
						<p>선택, 썸네일, 브랜드, 테마, 제목, 등록일, 미리보기</p>
					</caption>
					<thead>
						<tr>
							<th width="40" scope="col">선택</th>
							<th width="110" scope="col">썸네일</th>
							<th width="90" scope="col">브랜드</th>
							<th width="90" scope="col">테마</th>
							<th width="110" scope="col">제목</th>
							<th width="90" scope="col">등록일</th>
							<th width="110" scope="col">미리보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="40"><input type="checkbox" name="sListCheck" id="sListCheck5" title="5번항목선택"></td>
							<td width="110"><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
							<td width="90">동원</td>
							<td width="90">야식</td>
							<td width="110" class="l15">볶음참치밥이 왔어요~</td>
							<td width="90">2015-09-12</td>
							<td width="90"><button type="button" class="btn sml gray"><span>미리보기</span></button></td>									
						</tr>																																																																									
					</tbody>
				</table>
			</div>	
		</div>
		<!--// Board List -->
		
		<div class="btn_wrap mar_t20">
			<button type="button" class="btn mid black"><span>확인</span></button>
			<button type="button" onClick="javascript:lp_close();" class="btn mid black"><span>취소</span></button>
		</div>
	</div>
	<!--// LP Container -->
	<a href="#this" onClick="javscript:lp_close();" class="btn_lp_close">레이어팝업닫기</a>
</div>