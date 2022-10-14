<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="/resource/admin/Includes/Meta.jsp" %>
<title>동원F&amp;B - 관리자페이지</title>
<%@ include file="/resource/admin/Includes/Styles.jsp" %>
<%@ include file="/resource/admin/Includes/Scripts.jsp" %>
<script type="text/javascript">
<!--
jQuery(document).ready(function(e) {
	setLnb(5);
	setSnb(1);	
});
//-->
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
		<%@ include file="/resource/admin/Includes/Aside_Customer.jsp" %>
		<!--// Aside -->
		<hr>
		
		<!-- Contents -->
		<div id="Contents">
			<!-- Contents Header -->
			<div class="contents_header">
				<!-- Breadcrumb -->
				<ul class="breadcrumb">
					<li><a href="#">HOME</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">자주찾는 질문</a></li>
					<li class="active">자주찾는 질문 Top6/Top10관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>자주찾는 질문 Top6/Top10 관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">			
				
				<!-- Board List -->
				<form name="ListFrm" id="ListFrm" method="post" action="" onSubmit="">
				<div class="section">
					<h3>자주찾는질문 Top6 / Top10 관리</h3>
					<table brder="1" cellspacing="0" class="board_list_type1">
						<caption>
							<strong>자주찾는질문 Top6 / Top10 관리</strong>
							<p>순번, 제목</p>
						</caption>
						<colgroup>
							<col width="70">
							<col width="*">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">제목</th>
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td>1</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle1" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle2" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>3</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle3" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle4" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>5</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle5" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>6</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle6" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>7</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle7" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>8</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle8" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>9</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle9" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>
							<tr>
								<td>10</td>
								<td class="l15">
									<input type="text" name="sTitle" id="sTitle10" maxlength="100" value="식물성 유지가 인체에 해로운점이 있나요?" title="질문제목입력" class="size500">
									<button type="button" onClick="javascript:lp_open('/Popup/LP_FaqSelList.jsp');" class="btn sml gray"><span>선택</span></button>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>																																																																																									
						</tbody>
					</table>
					<div class="btn_wrap mar_t10">
						<span class="fl"><span class="blue">※</span> Top6는 자주찾는 질문 상단페이지에, Top10은 고객센터 서브메인에 노출됩니다.</span>
						<span class="fr"><button type="button" class="btn mid black"><span>등록</span></button></span>
					</div>															
				</div>
				<!--// Board List -->							
				</form>				
							
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