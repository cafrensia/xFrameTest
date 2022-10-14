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
					<li class="active">진열관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>진열관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board Search -->
				<form name="SearchFrm" id="SearchFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_search">
						<caption>
							<strong>제품카테고리</strong>
							<p>조회기간, 브랜드명, 게시여부, 브랜드명, 제품카테고리, 검색어 입력</p>
						</caption>
						<colgroup>
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
							<strong>진열관리 리스트</strong>
							<p>노출순서, 브랜드, 카테고리1, 카테고리2, 제품명, 등록일, 노출여부</p>
						</caption>
						<colgroup>
							<col width="110">
							<col width="120">
							<col width="120">
							<col width="120">
							<col width="*">
							<col width="90">
							<col width="80">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">노출순서</th>
								<th scope="col">브랜드</th>
								<th scope="col">카테고리1</th>
								<th scope="col">카테고리2</th>
								<th scope="col">제품명</th>
								<th scope="col">등록일</th>
								<th scope="col">게시여부</th>								
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td><input type="text" name="iSort" id="iSort1" maxlength="3" value="" title="노출순서 입력" class="size70"></td>								
								<td>동원</td>
								<td>통조림류</td>
								<td>참치캔</td>
								<td>마일드참치</td>																							
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="text" name="iSort" id="iSort2" maxlength="3" value="" title="노출순서 입력" class="size70"></td>								
								<td>동원</td>
								<td>통조림류</td>
								<td>참치캔</td>
								<td>마일드참치</td>																							
								<td>2015.09.10</td>
								<td><span class="off">미게시</span></td>
							</tr>
							<tr>
								<td><input type="text" name="iSort" id="iSort3" maxlength="3" value="" title="노출순서 입력" class="size70"></td>								
								<td>동원</td>
								<td>통조림류</td>
								<td>참치캔</td>
								<td>DHA참치</td>																							
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="text" name="iSort" id="iSort4" maxlength="3" value="" title="노출순서 입력" class="size70"></td>								
								<td>동원</td>
								<td>통조림류</td>
								<td>참치캔</td>
								<td>마일드참치</td>																							
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="text" name="iSort" id="iSort5" maxlength="3" value="" title="노출순서 입력" class="size70"></td>								
								<td>동원</td>
								<td>통조림류</td>
								<td>참치캔</td>
								<td>마일드참치</td>																							
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td><input type="text" name="iSort" id="iSort6" title="노출순서 입력" class="size70"></td>								
								<td>동원</td>
								<td>통조림류</td>
								<td>참치캔</td>
								<td>마일드참치</td>																							
								<td>2015.09.10</td>
								<td><span class="on">게시</span></td>
							</tr>																																																																																																							
						</tbody>
					</table>							
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
