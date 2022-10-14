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

				<!-- Board Search -->
				<form name="SearchFrm" id="SearchFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_search">
						<caption>
							<strong>게시물검색</strong>
							<p>조회기간, 종류, 테마, 브랜드, 게시여부, 검색어 입력</p>
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
								<th><label for="sKind">종류</label></th>
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
								<th><label for="sBrand">브랜드</label></th>
								<td>
									<select name="sBrand" id="sBrand" title="브랜드 선택" class="size115">
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
								<th><label for="sIsOpen">게시여부</label></th>
								<td>
									<select name="sIsOpen" id="sIsOpen" title="게시여부 선택" class="size115">
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
										<option value="sTag">태그</option>
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
							<strong>레시피 리스트</strong>
							<p>선택, 번호, 썸네일, 종류, 테마, 브랜드, 제목, 조리시간, 조회수, like수, 등록일, 게시여부</p>
						</caption>
						<colgroup>
							<col width="40">
							<col width="60">
							<col width="110">
							<col width="100">
							<col width="90">
							<col width="90">
							<col width="*">
							<col width="70">
							<col width="60">
							<col width="60">
							<col width="90">
							<col width="70">							
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">번호</th>
								<th scope="col">썸네일</th>
								<th scope="col">종류</th>
								<th scope="col">테마</th>
								<th scope="col">브랜드</th>
								<th scope="col">제목</th>
								<th scope="col">조리시간</th>
								<th scope="col">조회수</th>
								<th scope="col">like수</th>
								<th scope="col">등록일</th>
								<th scope="col">게시여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="12" class="noData">등록된 게시물이 없습니다.</td>
							</tr>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번항목선택"></td>
								<td>10</td>	
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>							
								<td>밥/죽/스프</td>
								<td>야식</td>
								<td>동원</td>								
								<td class="l15"><a href="/resource/admin/Contents/Recipe/Recipe_Edit.jsp" class="link">볶음참치밥이 왔어요~</a></td>								
								<td>30분</td>							
								<td>100</td>
								<td>100</td>
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>								
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번항목선택"></td>
								<td>9</td>	
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>							
								<td>볶음/조림/찜</td>
								<td>피크닉</td>
								<td>동원</td>								
								<td class="l15"><a href="/resource/admin/Contents/Recipe/Recipe_Edit.jsp" class="link">볶음참치밥이 왔어요~</a></td>								
								<td>30분</td>							
								<td>100</td>
								<td>100</td>
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>								
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번항목선택"></td>
								<td>8</td>	
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>							
								<td>볶음/조림/찜</td>
								<td>한그릇 음식</td>
								<td>동원</td>								
								<td class="l15"><a href="/resource/admin/Contents/Recipe/Recipe_Edit.jsp" class="link">볶음참치밥이 왔어요~</a></td>								
								<td>30분</td>							
								<td>100</td>
								<td>100</td>
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>								
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>7</td>	
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>							
								<td>볶음/조림/찜</td>
								<td>한그릇 음식</td>
								<td>동원</td>								
								<td class="l15"><a href="/resource/admin/Contents/Recipe/Recipe_Edit.jsp" class="link">볶음참치밥이 왔어요~</a></td>								
								<td>30분</td>							
								<td>100</td>
								<td>100</td>
								<td>2015.09.10</td>
								<td><span class="off">미게시</span></td>								
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
							<a href="/resource/admin/Contents/Recipe/Recipe_Write.jsp" class="btn mid black"><span>등록</span></a>
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
