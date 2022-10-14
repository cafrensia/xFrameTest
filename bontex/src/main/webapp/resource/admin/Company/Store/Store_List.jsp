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
								<th><label for="sArea">지역구분</label></th>
								<td>
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
								<th><label for="sKey">검색어 입력</label></th>
								<td colspan="3">		
									<select name="sKey" id="sKey" title="검색옵션선택" class="size115">
										<option value="">전체</option>
										<option value="sStore">지점명</option>
										<option value="sAddr">주소</option>
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
							<strong>영업/판매사업장 리스트</strong>
							<p>선택, 번호, 이미지, 지역구분, 지점명, 주소, 전화번호, 팩스번호, 지도보기, 게시여부</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="70">
							<col width="110">
							<col width="90">
							<col width="90">
							<col width="*">
							<col width="90">
							<col width="90">
							<col width="90">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">번호</th>
								<th scope="col">이미지</th>
								<th scope="col">지역구분</th>
								<th scope="col">지점명</th>
								<th scope="col">주소</th>
								<th scope="col">전화번호</th>
								<th scope="col">팩스번호</th>
								<th scope="col">지도보기</th>
								<th scope="col">게시여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="10" class="noData">등록된 게시물이 없습니다.</td>
							</tr>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번항목선택"></td>
								<td>10</td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>서울특별시</td>								
								<td><a href="/resource/admin/Company/Store/Store_Edit.jsp" class="link">서부지점</a></td>																
								<td class="l15">서울특별시 은평구 연서로 165 (갈현동) 4층</td>
								<td>02-358-8311</td>
								<td>02-358-8324</td>
								<td><a href="#" class="btn sml gray"><span>미리보기</span></a></td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번항목선택"></td>
								<td>9</td>								
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>충청도</td>								
								<td><a href="/resource/admin/Company/Store/Store_Edit.jsp" class="link">서부지점</a></td>																
								<td class="l15">서울특별시 은평구 연서로 165 (갈현동) 4층</td>
								<td>02-358-8311</td>
								<td>02-358-8324</td>
								<td><a href="#" class="btn sml gray"><span>미리보기</span></a></td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번항목선택"></td>
								<td>8</td>								
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>전라도</td>								
								<td><a href="/resource/admin/Company/Store/Store_Edit.jsp" class="link">서부지점</a></td>																
								<td>서울특별시 은평구 연서로 165 (갈현동) 4층</td>
								<td>02-358-8311</td>
								<td>02-358-8324</td>
								<td><a href="#" class="btn sml gray"><span>미리보기</span></a></td>
								<td><span class="off">미게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>7</td>								
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>충청도</td>								
								<td><a href="/resource/admin/Company/Store/Store_Edit.jsp" class="link">서부지점</a></td>																
								<td class="l15">서울특별시 은평구 연서로 165 (갈현동) 4층</td>
								<td>02-358-8311</td>
								<td>02-358-8324</td>
								<td><a href="#" class="btn sml gray"><span>미리보기</span></a></td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>6</td>								
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>충청도</td>								
								<td><a href="/resource/admin/Company/Store/Store_Edit.jsp" class="link">서부지점</a></td>																
								<td class="l15">서울특별시 은평구 연서로 165 (갈현동) 4층</td>
								<td>02-358-8311</td>
								<td>02-358-8324</td>
								<td><a href="#" class="btn sml gray"><span>미리보기</span></a></td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>5</td>								
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>충청도</td>								
								<td><a href="/resource/admin/Company/Store/Store_Edit.jsp" class="link">서부지점</a></td>																
								<td class="l15">서울특별시 은평구 연서로 165 (갈현동) 4층</td>
								<td>02-358-8311</td>
								<td>02-358-8324</td>
								<td><a href="#" class="btn sml gray"><span>미리보기</span></a></td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>4</td>								
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td>충청도</td>								
								<td><a href="/resource/admin/Company/Store/Store_Edit.jsp" class="link">서부지점</a></td>																
								<td class="l15">서울특별시 은평구 연서로 165 (갈현동) 4층</td>
								<td>02-358-8311</td>
								<td>02-358-8324</td>
								<td><a href="#" class="btn sml gray"><span>미리보기</span></a></td>
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
							<a href="/resource/admin/Company/Store/Store_Write.jsp" class="btn mid black"><span>등록</span></a>
							<a href="#" class="btn mid black"><span>삭제</span></a>
						</div>
					</div>
					<!--// Board Pager -->								
				</div>			
				
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
