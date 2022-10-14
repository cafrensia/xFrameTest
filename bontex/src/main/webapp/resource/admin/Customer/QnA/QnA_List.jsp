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
	setSnb(2);	
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
					<li class="active">고객의 소리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>고객의 소리</h2>
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
							<p>조회기간, 구분, 답변여부, 상태, 검색어 입력</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="375">							
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
								<th><label for="sKind">구분</label></th>
								<td>
									<select name="sKind" id="sKind" title="게시구분선택" class="size200">
										<option value="0">전체</option>
										<option value="1">제품관련 문의 &amp; 제안</option>
										<option value="2">신제품개발관련 제안</option>
										<option value="3">소비자 클레임(제품 불만)</option>
										<option value="4">기타 소비자 불만</option>
										<option value="5">이벤트행사 관련문의</option>
										<option value="6">제품 구입 및 대리점 문의</option>
										<option value="7">제품 사용소감</option>
										<option value="8">채용/인사 관련문의</option>
										<option value="9">견학관련문의</option>
										<option value="10">후원/홍보 관련문의</option>
										<option value="11">기타문의</option>
									</select>									
								</td>
								<th><label for="sIsAnswer">답변여부</label></th>
								<td>
									<select name="sIsAnswer" id="sIsAnswer" title="답변여부선택" class="size115">
										<option value="0">전체</option>
										<option value="1">답변완료</option>
										<option value="2">답변미완료</option>
									</select>								
								</td>
							</tr>
							<tr>
								<th><label for="sStatus">상태</label></th>
								<td colspan="3">
									<select name="sStatus" id="sStatus" title="상태선택" class="size115">
										<option value="0">전체</option>
										<option value="1">접수완료</option>
										<option value="2">처리중</option>
										<option value="2">처리완료</option>
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
							<strong>고객의소리 리스트</strong>
							<p>삭제, 번호, 구분, 고객명, 전화번호, 메일주소, 제목, 등록일, 답변여부, 상태</p>
						</caption>
						<colgroup>
							<col width="50">
							<col width="70">
							<col width="100">
							<col width="70">
							<col width="100">
							<col width="130">
							<col width="*">
							<col width="80">
							<col width="80">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">삭제</th>
								<th scope="col">번호</th>
								<th scope="col">구분</th>
								<th scope="col">고객명</th>
								<th scope="col">전화번호</th>
								<th scope="col">이메일</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
								<th scope="col">답변여부</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="10" class="noData">등록된 게시물이 없습니다.</td>
							</tr>						
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck1" title="1번항목선택"></td>
								<td>10</td>
								<td>소비자클레임</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td>abc111@naver.com</td>
								<td class="l15"><a href="/resource/admin/Customer/QnA/QnA_View.jsp" class="link">동원참치가 너무 맛있어요.</a></td>
								<td>2015-09-12</td>
								<td>답변완료</td>
								<td>처리완료</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck2" title="2번항목선택"></td>
								<td>9</td>
								<td>제품 사용소감</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td>abc111@naver.com</td>
								<td class="l15"><a href="/resource/admin/Customer/QnA/QnA_View.jsp" class="link">동원참치가 너무 맛있어요.</a></td>
								<td>2015-09-12</td>
								<td>답변미완료</td>
								<td>접수완료</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번항목선택"></td>
								<td>8</td>
								<td>제품 사용소감</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td>abc111@naver.com</td>
								<td class="l15"><a href="/resource/admin/Customer/QnA/QnA_View.jsp" class="link">동원참치가 너무 맛있어요.</a></td>
								<td>2015-09-12</td>
								<td>답변미완료</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>7</td>
								<td>제품 사용소감</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td>abc111@naver.com</td>
								<td class="l15"><a href="/resource/admin/Customer/QnA/QnA_View.jsp" class="link">동원참치가 너무 맛있어요.</a></td>
								<td>2015-09-12</td>
								<td>답변미완료</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck5" title="5번항목선택"></td>
								<td>6</td>
								<td>제품 사용소감</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td>abc111@naver.com</td>
								<td class="l15"><a href="/resource/admin/Customer/QnA/QnA_View.jsp" class="link">동원참치가 너무 맛있어요.</a></td>
								<td>2015-09-12</td>
								<td>답변미완료</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck4" title="4번항목선택"></td>
								<td>5</td>
								<td>제품 사용소감</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td>abc111@naver.com</td>
								<td class="l15"><a href="/resource/admin/Customer/QnA/QnA_View.jsp" class="link">동원참치가 너무 맛있어요.</a></td>
								<td>2015-09-12</td>
								<td>답변미완료</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="sListCheck" id="sListCheck3" title="3번항목선택"></td>
								<td>4</td>
								<td>제품 사용소감</td>
								<td>홍길동</td>
								<td>010-1234-5678</td>
								<td>abc111@naver.com</td>
								<td class="l15"><a href="/resource/admin/Customer/QnA/QnA_View.jsp" class="link">동원참치가 너무 맛있어요.</a></td>
								<td>2015-09-12</td>
								<td>답변미완료</td>
								<td>처리중</td>
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