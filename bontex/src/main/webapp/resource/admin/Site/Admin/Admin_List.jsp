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
					<li class="active">관리자회원관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>관리자 회원관리</h2>
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
							<p>검색어 입력</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sStatus">검색어 입력</label></th>
								<td>		
									<select name="sStatus" id="sStatus" title="상태 선택" class="size115">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
									</select>
									<select name="sKey" id="sKey" title="검색옵션선택" class="size115">
										<option value="">선택</option>
										<option value="sName">성명</option>
										<option value="sID">아이디</option>
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
							<strong>관리자 회원리스트</strong>
							<p>번호, 이름, 아이디, 부서, 상태</p>
						</caption>
						<colgroup>
							<col width="119">
							<col width="165">
							<col width="165">
							<col width="*">
							<col width="160">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">아이디</th>
								<th scope="col">부서</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="5" class="noData">검색된 결과가 없습니다.</td>
							</tr>
							<tr>
								<td>100</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>홍보팀</td>
								<td><span class="off">미사용</span></td>
							</tr>
							<tr>
								<td>99</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>CS팀</td>
								<td><span class="on">사용</span></td>
							</tr>
							<tr>
								<td>98</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>마케팅지원팀</td>
								<td><span class="on">사용</span></td>
							</tr>
							<tr>
								<td>97</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>홍보팀</td>
								<td><span class="off">미사용</span></td>
							</tr>
							<tr>
								<td>96</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>CS팀</td>
								<td><span class="on">사용</span></td>
							</tr>
							<tr>
								<td>95</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>마케팅지원팀</td>
								<td><span class="on">사용</span></td>
							</tr>
							<tr>
								<td>14</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>홍보팀</td>
								<td><span class="off">미사용</span></td>
							</tr>
							<tr>
								<td>93</td>
								<td>홍길동</td>
								<td><a href="v" class="link">qwert2345</a></td>
								<td>CS팀</td>
								<td><span class="on">사용</span></td>
							</tr>
							<tr>
								<td>92</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>마케팅지원팀</td>
								<td><span class="on">사용</span></td>
							</tr>
							<tr>
								<td>91</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>CS팀</td>
								<td><span class="on">사용</span></td>
							</tr>
							<tr>
								<td>90</td>
								<td>홍길동</td>
								<td><a href="/resource/admin/Site/Admin/Admin_Edit.jsp" class="link">qwert2345</a></td>
								<td>마케팅지원팀</td>
								<td><span class="on">사용</span></td>
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
							<a href="/resource/admin/Site/Admin/Admin_Write.jsp" class="btn mid black"><span>관리자생성</span></a>
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
