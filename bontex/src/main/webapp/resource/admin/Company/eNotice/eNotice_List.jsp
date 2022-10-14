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
	setSnb(1);
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
					<li class="active">전자공고</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>전자공고</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board Search -->
				<form name="SearchFrm" id="SearchFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_search">
						<caption>
							<strong>게시물검색</strong>
							<p>조회기간, 구분, 게시여부, 첨부파일, 검색어 입력</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sStartDate">조회기간</label></th>
								<td colspan="3">
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
								<th><label for="sKey">검색어 입력</label></th>
								<td colspan="3">		
									<select name="sKey" id="sKey" title="검색옵션선택" class="size115">
										<option value="">전체</option>
										<option value="sTitle">제목</option>
										<option value="sTitleCon">제목+내용</option>
									</select>
									<input type="text" name="sSearchString" id="sSearchString" maxlength="50" title="검색어입력" class="size500">
									<button type="button" class="btn mid blue"><span>검색</span></button>
								</td>	
							</tr>							
						</tbody>	
					</table>
				</div>
				</form>
				<!--// Board Search -->
				
				<!-- Board List -->
				<div class="section">
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>전자공고 리스트</strong>
							<p>선택, 번호, 년도, 제목, 첨부파일, 작성일, 조회수, 게시여부</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="70">
							<col width="90">
							<col width="*">
							<col width="100">
							<col width="90">
							<col width="70">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">번호</th>
								<th scope="col">년도</th>
								<th scope="col">제목</th>
								<th scope="col">첨부파일</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
								<th scope="col">게시여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="8" class="noData">등록된 게시물이 없습니다.</td>
							</tr>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번항목선택"></td>
								<td>10</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번항목선택"></td>
								<td>9</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번항목선택"></td>
								<td>8</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="off">미게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>7</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck5" title="5번항목선택"></td>
								<td>6</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck6" title="6번항목선택"></td>
								<td>5</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck7" title="7번항목선택"></td>
								<td>4</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck8" title="8번항목선택"></td>
								<td>3</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck9" title="9번항목선택"></td>
								<td>2</td>
								<td>2015년</td>
								<td class="l15"><a href="/resource/admin/Company/eNotice/eNotice_Edit.jsp" class="link">제 15기 결산공고</a></td>
								<td><button type="button" class="btn sml gray"><span>다운로드</span></button></td>								
								<td>2012-04-13</td>
								<td>100</td>
								<td><span class="on">게시</span></td>
							</tr>																																																																																																																													
						</tbody>
					</table>
					
					<!-- Board Pager -->
					<div class="board_pager_wrap">					
						<div class="board_pager">
							<ul class="boardNav">
								<li><a href="#" class="btn_first">first</a></li>
								<li><a href="#" class="btn_prev">prev</a></li>
							</ul>	
							<ul class="boardPage">
								<li class="on"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">6</a></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">9</a></li>
								<li><a href="#">10</a></li>
							</ul>
							<ul class="boardNav">
								<li><a href="#" class="btn_next">next</a></li>
								<li><a href="#" class="btn_last">last</a></li>
							</ul>
						</div>
						<div class="board_btn right">
							<a href="/resource/admin/Company/eNotice/eNotice_Write.jsp" class="btn mid black"><span>등록</span></a>
							<a href="#" class="btn mid black"><span>삭제</span></a>
						</div>
					</div>
					<!--// Board Pager -->								
				</div>			
				<!--// Board List -->
				
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
