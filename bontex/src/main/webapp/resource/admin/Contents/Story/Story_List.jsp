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
					<li class="active">동원스토리관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>동원스토리 관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board List -->
				<div class="section">
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>동원스토리 리스트</strong>
							<p>구분, 순번, SNS 구분, 콘텐츠 선택</p>
						</caption>
						<colgroup>
							<col width="150">
							<col width="60">
							<col width="110">
							<col width="*">							
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">순번</th>
								<th scope="col">SNS구분</th>
								<th scope="col">콘텐츠 선택</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>현장스케치</td>
								<td>1</td>								
								<td>블로그</td>
								<td class="l15">
									<input type="text" name="sSketch_Blog" id="sSketch_Blog" maxlength="100" title="" class="size500">
									<button type="button" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span class="on">게시</span></button>
								</td>								
							</tr>
							<tr>
								<td rowspan="2">광고 브랜드 이야기</td>
								<td>1</td>								
								<td>페이스북</td>
								<td class="l15">
									<input type="text" name="sAdBrand_Facebook" id="sAdBrand_Facebook" maxlength="100" title="" class="size500">
									<button type="button" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span class="on">게시</span></button>
								</td>								
							</tr>
							<tr>
								<td class="bor_solid_l">2</td>								
								<td>블로그</td>
								<td class="l15">
									<input type="text" name="sAdBrand_Blog" id="sAdBrand_Blog" maxlength="100" title="" class="size500">
									<button type="button" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span class="off">미게시</span></button>
								</td>								
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
