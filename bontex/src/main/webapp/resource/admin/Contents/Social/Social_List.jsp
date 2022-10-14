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

				<!-- Board Search -->
				<form name="SearchFrm" id="SearchFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_search">
						<caption>
							<strong>게시물검색</strong>
							<p>조회기간, 브랜드명, 게시여부, 브랜드명, 제품카테고리, 검색어 입력</p>
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
								<th><label for="sIsWrite">작성여부</label></th>
								<td>
									<select name="sIsWrite" id="sIsWrite" title="작성여부 선택" class="size115">
										<option value="0">전체</option>
										<option value="1">작성완료</option>
										<option value="2">미작성</option>
									</select>
								</td>
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
								<th><label for="sSNS">SNS 종류</label></th>
								<td>
									<select name="sSNS" id="sSNS" title="SNS종류 선택" class="size115">
										<option value="0">전체</option>
										<option value="1">블로그</option>
										<option value="2">페이스북</option>
										<option value="3">트위터</option>
										<option value="4">카카오스토리</option>
									</select>								
								</td>								
								<th><label for="sCategory1">제품카테고리</label></th>
								<td>
									<select name="sCategory1" id="sCategory1" title="카테고리 1차분류 선택" class="size115">
										<option value="">1차분류</option>
										<option value="1">동원스토리</option>
										<option value="2">웰빙스토리</option>
									</select>
									<select name="sCategory2" id="sCategory2" title="카테고리 2차분류 선택" class="size115">
										<option value="">2차분류</option>

										<option value="1">현장스케치</option>
										<option value="2">광고/브랜드 이야기</option>
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
							<strong>소셜 콘텐츠 리스트</strong>
							<p>선택, 번호, SNS종류, 카테고리1, 카테고리2, 썸네일, 제목, 내용, 날짜, 태그, 작성여부, 게시여부</p>
						</caption>
						<colgroup>
							<col width="40">
							<col width="60">
							<col width="90">
							<col width="80">
							<col width="90">
							<col width="110">
							<col width="*">
							<col width="110">
							<col width="80">
							<col width="80">
							<col width="70">
							<col width="70">							
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">번호</th>
								<th scope="col">SNS종류</th>
								<th scope="col">카테고리1</th>
								<th scope="col">카테고리2</th>
								<th scope="col">썸네일</th>
								<th scope="col">제목</th>
								<th scope="col">내용</th>
								<th scope="col">날짜</th>
								<th scope="col">태그</th>
								<th scope="col">작성여부</th>
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
								<td>페이스북</td>
								<td>동원스토리</td>
								<td>현장스케치</td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td><a href="/resource/admin/Contents/Social/Social_Edit.jsp" class="link">페이스북에서 진행하는 이벤트</a></td>								
								<td>콘텐츠 내용입니다.</td>
								<td>2015.09.10</td>
								<td>태그1, 태그2</td>
								<td>작성완료</td>
								<td><button type="button" class="btn sml gray"><span class="on">게시</span></button></td>								
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번항목선택"></td>
								<td>9</td>								
								<td>카카오스토리</td>
								<td>동원스토리</td>
								<td>광고/브랜드 이야기</td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td><a href="/resource/admin/Contents/Social/Social_Edit.jsp" class="link">페이스북에서 진행하는 이벤트</a></td>								
								<td>콘텐츠 내용입니다.</td>
								<td>2015.09.10</td>
								<td>태그1, 태그2</td>
								<td>작성완료</td>
								<td><button type="button" class="btn sml gray"><span class="off">미게시</span></button></td>								
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번항목선택"></td>
								<td>8</td>								
								<td>트위터</td>
								<td>웰빙스토리</td>
								<td>건강</td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td><a href="/resource/admin/Contents/Social/Social_Edit.jsp" class="link">트위터에서 진행하는 이벤트</a></td>								
								<td>콘텐츠 내용입니다.</td>
								<td>2015.09.10</td>
								<td>태그1, 태그2</td>
								<td>작성완료</td>
								<td><button type="button" class="btn sml gray"><span class="on">게시</span></button></td>								
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>7</td>								
								<td>트위터</td>
								<td>웰빙스토리</td>
								<td>맛집</td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td><a href="/resource/admin/Contents/Social/Social_Edit.jsp" class="link">트위터에서 진행하는 이벤트</a></td>								
								<td>콘텐츠 내용입니다.</td>
								<td>2015.09.10</td>
								<td>태그1, 태그2</td>
								<td>작성완료</td>
								<td><button type="button" class="btn sml gray"><span class="on">게시</span></button></td>								
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
							<a href="/resource/admin/Contents/Social/Social_Write.jsp" class="btn mid black"><span>등록</span></a>
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
