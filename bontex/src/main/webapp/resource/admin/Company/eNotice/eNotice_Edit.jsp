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

				<!-- Tab -->
				<ul class="tab four_up">
					<li class="on"><a href="#">국문</a></li>
					<li><a href="#">영문</a></li>
					<li><a href="#">중문</a></li>
					<li><a href="#">일문</a></li>
				</ul>
				<!--// Tab -->
			
				<!-- Board Write -->
				<form name="EditFrm" id="EditFrm" method="post" onSubmit="">
				<div class="section">
					<table border="1" cellspacing="0" class="board_view">
						<caption>
							<strong>게시물등록</strong>
							<p>년도, 제목, 작성자, 등록일자, 게시여부, 첨부파일</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">							
						</colgroup>
						<tbody>
							<tr>
								<th><label for="sYear">년도</label></th>
								<td colspan="3">
									<select name="sYear" id="sYear" title="년도선택" class="size115">
										<option value="0">전체</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option>
										<option value="2013">2013</option>
										<option value="2012">2012</option>
										<option value="2011">2011</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="sTitle">제목</label></th>
								<td colspan="3">
									<input type="text" name="sTitle" id="sTitle" maxlength="100" value="글제목입니다." title="글 제목입력" class="size500">
								</td>
							</tr>
							<tr>
								<th><label for="sName">작성자</label></th>
								<td colspan="3">
									<input type="text" name="sName" id="sName" maxlength="20" value="홍길동" title="작성자입력" class="size115">
								</td>
							</tr>																				
							<tr>
								<th><label for="sRegDate">등록일자</label></th>
								<td>
									<span class="input_date"><input type="text" name="sRegDate" id="sRegDate" maxlength="10" value="2015-09-11" title="등록일자 입력" readonly class="size115 datepicker"><button type="button" onClick="javascript:openCal('sRegDate');" class="btn_datepicker"><span>등록일자선택</span></button></span>
								</td>
								<th><label for="sIsOpen">게시여부</label></th>
								<td>
									<select name="sIsOpen" id="sIsOpen" title="게시여부선택" class="size115">
										<option value="0">전체</option>
										<option value="1" selected>게시</option>
										<option value="2">비게시</option>
									</select>								
								</td>
							</tr>
							<tr>	
								<th><label for="sUpFilePath">첨부파일</label></th>
								<td colspan="3">
									<span class="input_file">
										<input type="text" name="sUpFilePath" id="sUpFilePath" size="100" value="" title="첨부파일경로" class="size500" readonly>
										<input type="file" name="sUpFile" id="sUpFile" title="첨부파일선택" onChange="javascript:setFilePath('sUpFile','sUpFilePath');">
									</span>
									<label for="sUpFile" title="첨부파일선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
									<button type="button" class="btn sml gray"><span>삭제</span></button>
								</td>
							</tr>							
						</tbody>	
					</table>
					<div class="btn_wrap right mar_t20">
						<button type="submit" class="btn mid black"><span>수정</span></button>
						<button type="button" class="btn mid black"><span>삭제</span></button>
						<button type="button" onClick="javascript:history.back();" class="btn mid black"><span>목록</span></button>
					</div>
				</div>
				</form>
				<!--// Board Write -->			
				
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
