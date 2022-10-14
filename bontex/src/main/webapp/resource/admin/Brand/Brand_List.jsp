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
			
				<!-- Board Search -->
				<form name="SearchFrm" id="SearchFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_search">
						<caption>
							<strong>게시물검색</strong>
							<p>다국어 부문, 검색어 입력</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sLang">다국어 부문</label></th>
								<td>
									<select name="sLang" id="sLang" title="언어 선택" class="size115">
										<option value="ko">국문</option>
										<option value="en">영문</option>
										<option value="cn">중문</option>
										<option value="jp">일문</option>
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
										<option value="sTitle">제목</option>
										<option value="sContents">내용</option>
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
							<strong>브랜드관리리스트</strong>
							<p>선택, 번호, 브랜드명, BI썸네일, 배경이미지, 본문타이틀, 주요제품, 연관레시피, 홍보CF, 브랜드사이트, 노출</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="70">
							<col width="110">
							<col width="110">
							<col width="110">
							<col width="*">
							<col width="70">
							<col width="70">
							<col width="70">
							<col width="70">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">번호</th>
								<th scope="col">브랜드명</th>
								<th scope="col">BI썸네일</th>
								<th scope="col">배경이미지</th>
								<th scope="col">본문타이틀</th>
								<th scope="col">주요제품</th>
								<th scope="col">연관<br>레시피</th>
								<th scope="col">홍보CF</th>
								<th scope="col">브랜드<br>사이트</th>
								<th scope="col">노출</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="11" class="noData">등록된 게시물이 없습니다.</td>
							</tr>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번항목선택"></td>
								<td>100</td>								
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp" class="link">동원</a></td>
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp"><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></a></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td class="l15">Everyday Good Food</td>
								<td>N건</td>
								<td>N건</td>
								<td>N건</td>
								<td>없음</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번항목선택"></td>
								<td>99</td>								
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp" class="link">양반</a></td>
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp"><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></a></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td class="l15">현대적으로 재탄생한 전통의 맛과 멋</td>
								<td>N건</td>
								<td>N건</td>
								<td>N건</td>
								<td>없음</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번항목선택"></td>
								<td>98</td>								
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp" class="link">리챔</a></td>
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp"><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></a></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td class="l15">앞다리살로 만들어 더욱 부드러운 맛</td>
								<td>N건</td>
								<td>N건</td>
								<td>N건</td>
								<td>없음</td>
								<td><span class="off">미게시</span></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>97</td>								
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp" class="link">덴마크밀크</a></td>
								<td><a href="/resource/admin/Brand/Brand_Edit.jsp"><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></a></td>
								<td><img src="/Images/Common/img_noImage.gif" alt="NO IMAGE"></td>
								<td class="l15">자연에 가장 가까운 세계 수준의 고유 유제품</td>
								<td>N건</td>
								<td>N건</td>
								<td>N건</td>
								<td><a href="#" target="_blank" class="link">바로가기</a></td>
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
							<a href="/resource/admin/Brand/Brand_Write.jsp" class="btn mid black"><span>등록</span></a>
							<a href="#" class="btn mid black"><span>삭제</span></a>
							<a href="#" class="btn mid black"><span>저장하기</span></a>
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
