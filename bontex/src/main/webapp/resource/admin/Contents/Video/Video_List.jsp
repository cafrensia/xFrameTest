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
					<li class="active">홍보동영상관리</li>
				</ul>
				<!--// Breadcrumb -->
				
				<h2>홍보동영상 관리</h2>
			</div>
			<!--// Contents Header -->
			
			<!-- Contents body -->
			<div class="contents_body">

				<!-- Board List -->
				<div class="section">
					<table brder="1" cellspacing="0" class="board_list_type1 hoverNone">
						<caption>
							<strong>홍보동영상 리스트</strong>
							<p>구분, 콘텐츠 선택</p>
						</caption>
						<colgroup>
							<col width="120">
							<col width="*">							
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">콘텐츠 선택</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>한국어</td>
								<td>
									<table border="1" cellspacing="0" class="board_view">
										<colgroup>
											<col width="120">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th><label for="sTitle" class="ast">제목</label></th>
												<td class="l15"><input type="text" name="sTitle1" id="sTitle1" maxlength="100" title="글 제목입력" class="size500"></td>
											</tr>
											<tr>	
												<th><label for="sThumbnailPath1" class="ast">썸네일이미지</label></th>
												<td class="l15">
													<span class="input_file">
														<input type="text" name="sThumbnailPath1" id="sThumbnailPath1" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
														<input type="file" name="sThumbnail1" id="sThumbnail1" title="썸네일이미지 선택" onChange="javascript:setFilePath('sThumbnail1','sThumbnailPath1');">
													</span>
													<label for="sThumbnail1" title="썸네일이미지 선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
													<button type="button" class="btn sml gray"><span>삭제</span></button>
													<p class="mar_t5"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</p>																
												</td>
											</tr>
											<tr>
												<th><label for="sVideoUrl1" class="ast">동영상링크</label></th>
												<td class="l15">
													<input type="text" name="sVideoUrl1" id="sVideoUrl1" maxlength="200" title="동영상링크" class="size500">
												</td>
											</tr>
											<tr>
												<th><label for="sCaption1" class="ast">자막내용</label></th>
												<td class="l15">
													<textarea name="sCaption1" id="sCaption1" cols="100" rows="10" class="size100p"></textarea>
												</td>
											</tr>																																	
										</tbody>
									</table>
								</td>								
							</tr>
							<tr>
								<td>영어</td>
								<td>
									<table border="1" cellspacing="0" class="board_view">
										<colgroup>
											<col width="120">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th><label for="sTitle" class="ast">제목</label></th>
												<td class="l15"><input type="text" name="sTitle2" id="sTitle2" maxlength="100" title="글 제목입력" class="size500"></td>
											</tr>
											<tr>	
												<th><label for="sThumbnailPath2" class="ast">썸네일이미지</label></th>
												<td class="l15">
													<span class="input_file">
														<input type="text" name="sThumbnailPath2" id="sThumbnailPath2" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
														<input type="file" name="sThumbnail2" id="sThumbnail2" title="썸네일이미지 선택" onChange="javascript:setFilePath('sThumbnail2','sThumbnailPath2');">
													</span>
													<label for="sThumbnail2" title="썸네일이미지 선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
													<button type="button" class="btn sml gray"><span>삭제</span></button>
													<p class="mar_t5"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</p>																
												</td>
											</tr>
											<tr>
												<th><label for="sVideoUrl2" class="ast">동영상링크</label></th>
												<td class="l15">
													<input type="text" name="sVideoUrl2" id="sVideoUrl2" maxlength="200" title="동영상링크" class="size500">
												</td>
											</tr>
											<tr>
												<th><label for="sCaption2" class="ast">자막내용</label></th>
												<td class="l15">
													<textarea name="sCaption2" id="sCaption2" cols="100" rows="10" class="size100p"></textarea>
												</td>
											</tr>																																	
										</tbody>
									</table>								
								</td>								
							</tr>
							<tr>
								<td>중국어</td>								
								<td>
									<table border="1" cellspacing="0" class="board_view">
										<colgroup>
											<col width="120">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th><label for="sTitle3" class="ast">제목</label></th>
												<td class="l15"><input type="text" name="sTitle3" id="sTitle3" maxlength="100" title="글 제목입력" class="size500"></td>
											</tr>
											<tr>	
												<th><label for="sThumbnailPath3" class="ast">썸네일이미지</label></th>
												<td class="l15">
													<span class="input_file">
														<input type="text" name="sThumbnailPath3" id="sThumbnailPath3" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
														<input type="file" name="sThumbnail3" id="sThumbnail3" title="썸네일이미지 선택" onChange="javascript:setFilePath('sThumbnail3','sThumbnailPath3');">
													</span>
													<label for="sThumbnail3" title="썸네일이미지 선택" tabindex="0" class="btn sml gray"><span>파일선택</span></label>
													<button type="button" class="btn sml gray"><span>삭제</span></button>
													<p class="mar_t5"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</p>																
												</td>
											</tr>
											<tr>
												<th><label for="sVideoUrl3" class="ast">동영상링크</label></th>
												<td class="l15">
													<input type="text" name="sVideoUrl3" id="sVideoUrl3" maxlength="200" title="동영상링크" class="size500">
												</td>
											</tr>
											<tr>
												<th><label for="sCaption3" class="ast">자막내용</label></th>
												<td class="l15">
													<textarea name="sCaption3" id="sCaption3" cols="100" rows="10" class="size100p"></textarea>
												</td>
											</tr>																																	
										</tbody>
									</table>								
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
