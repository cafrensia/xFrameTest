<%@ page pageEncoding="utf-8"%>
<!-- 개발시 삭제영역 -->
<%@ include file="/resource/admin/Includes/Styles.jsp" %>
<!--// 개발시 삭제 영역 -->

<div id="LP_FaqSelList" class="lp_wrap lp_faqSelList">
	<!-- LP Header -->
	<div class="lp_header">
		<h2>자주찾는 질문</h2>
	</div>
	<!--// LP Header -->
	
	<!-- LP Container -->
	<div class="lp_body">
		<!-- Board Search -->
		<div class="lp_section">
			<table border="1" cellspacing="0" class="board_search">
				<caption>
					<strong>게시물검색</strong>
					<p>조회기간, 구분, 게시여부, 첨부파일, 검색어 입력</p>
				</caption>
				<colgroup>
					<col width="120">
					<col width="*">						
				</colgroup>
				<tbody>
					<tr>
						<th><label for="sKind">구분</label></th>
						<td>
							<select name="sKind" id="sKind" title="게시구분선택" class="size115">
								<option value="0">전체</option>
								<option value="1">동원F&amp;B</option>
								<option value="2">브랜드</option>
								<option value="3">기타</option>
							</select>
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
						<th><label for="sIsOpen">게시여부</label></th>
						<td>
							<select name="sIsOpen" id="sIsOpen" title="게시여부선택" class="size115">
								<option value="0">전체</option>
								<option value="1">게시</option>
								<option value="2">미게시</option>
							</select>								
						</td>
					</tr>
					<tr>
						<th><label for="sKey">검색어입력</label></th>	
						<td colspan="3">		
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
			<div class="faq_list_wrap">
				<table border="1" cellspacing="0" class="board_list_type1 faq_list">
					<caption>
						<strong>자주찾는질문 선택리스트</strong>
						<p>선택, 구분, 브랜드, 제목, 등록일, 조회수</p>
					</caption>
					<thead>
						<tr>
							<th width="40" scope="col">선택</th>
							<th width="90" scope="col">구분</th>
							<th width="90" scope="col">브랜드</th>
							<th width="160" scope="col">제목</th>
							<th width="90" scope="col">등록일</th>
							<th width="90" scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="40"><input type="radio" name="sListSel" id="sListSel1" value="1" title="1항목 선택"></td>
							<td width="90">브랜드</td>
							<td width="90">동원</td>
							<td width="160" class="l15"><a href="/resource/admin/Customer/FAQ/FAQ_Edit.jsp" class="link">자주찾는질문 게시판제목입니다.</a></td>
							<td width="90">2015-09-12</td>
							<td width="70">100</td>									
						</tr>
						<tr>
							<td width="40"><input type="radio" name="sListSel" id="sListSel1" value="1" title="1항목 선택"></td>
							<td width="90">브랜드</td>
							<td width="90">동원</td>
							<td width="160" class="l15"><a href="/resource/admin/Customer/FAQ/FAQ_Edit.jsp" class="link">자주찾는질문 게시판제목입니다.</a></td>
							<td width="90">2015-09-12</td>
							<td width="70">100</td>									
						</tr>
						<tr>
							<td width="40"><input type="radio" name="sListSel" id="sListSel1" value="1" title="1항목 선택"></td>
							<td width="90">브랜드</td>

							<td width="90">동원</td>
							<td width="160" class="l15"><a href="/resource/admin/Customer/FAQ/FAQ_Edit.jsp" class="link">자주찾는질문 게시판제목입니다.</a></td>
							<td width="90">2015-09-12</td>
							<td width="70">100</td>									
						</tr>
						<tr>
							<td width="40"><input type="radio" name="sListSel" id="sListSel1" value="1" title="1항목 선택"></td>
							<td width="90">브랜드</td>
							<td width="90">동원</td>
							<td width="160" class="l15"><a href="/resource/admin/Customer/FAQ/FAQ_Edit.jsp" class="link">자주찾는질문 게시판제목입니다.</a></td>
							<td width="90">2015-09-12</td>
							<td width="70">100</td>									
						</tr>
						<tr>
							<td width="40"><input type="radio" name="sListSel" id="sListSel1" value="1" title="1항목 선택"></td>
							<td width="90">브랜드</td>
							<td width="90">동원</td>
							<td width="160" class="l15"><a href="/resource/admin/Customer/FAQ/FAQ_Edit.jsp" class="link">자주찾는질문 게시판제목입니다.</a></td>
							<td width="90">2015-09-12</td>
							<td width="70">100</td>									
						</tr>
						<tr>
							<td width="40"><input type="radio" name="sListSel" id="sListSel1" value="1" title="1항목 선택"></td>
							<td width="90">브랜드</td>
							<td width="90">동원</td>
							<td width="160" class="l15"><a href="/resource/admin/Customer/FAQ/FAQ_Edit.jsp" class="link">자주찾는질문 게시판제목입니다.</a></td>
							<td width="90">2015-09-12</td>
							<td width="70">100</td>									
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