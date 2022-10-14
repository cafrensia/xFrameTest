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
	setLnb(0);
	setSnb(5);
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
		<%@ include file="/resource/admin/Includes/Aside_Site.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">사이트관리</a></li>
					<li class="active">팝업관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>팝업관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board List -->
				<div class="section">
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>팝업리스트</strong>
							<p>번호, 팝업명, 게시기간, 게시여부</p>
						</caption>
						<colgroup>
							<col width="70">
							<col width="*">
							<col width="200">							
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">팝업명</th>
								<th scope="col">게시기간</th>
								<th scope="col">게시여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4" class="noData">등록된 게시물이 없습니다.</td>
							</tr>
							<tr>
								<td>4</td>
								<td class="l15"><a href="/resource/admin/Site/Popup/Popup_Edit.jsp" class="link">시스템 정기점검 작업안내</a></td>
								<td>2013.03.12 ~ 2013.03.13</td>								
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td>3</td>
								<td class="l15"><a href="/resource/admin/Site/Popup/Popup_Edit.jsp" class="link">시스템 정기점검 작업안내</a></td>
								<td>2013.03.12 ~ 2013.03.13</td>								
								<td><span class="off">미게시</span></td>
							</tr>
							<tr>
								<td>2</td>
								<td class="l15"><a href="/resource/admin/Site/Popup/Popup_Edit.jsp" class="link">시스템 정기점검 작업안내</a></td>
								<td>2013.03.12 ~ 2013.03.13</td>								
								<td><span class="on">게시</span></td>
							</tr>
							<tr>
								<td>1</td>
								<td class="l15"><a href="/resource/admin/Site/Popup/Popup_Edit.jsp" class="link">시스템 정기점검 작업안내</a></td>
								<td>2013.03.12 ~ 2013.03.13</td>								
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
							<a href="/resource/admin/Site/Popup/Popup_Write.jsp" class="btn mid black"><span>등록</span></a>
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
