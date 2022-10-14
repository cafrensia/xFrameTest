<%@ page pageEncoding="utf-8"%>

<th><label class="cookFlowNum">조리과정 1</label></th>
<td>
	<table border="1" cellspacing="0" class="table_row_type1">
		<tr>
			<th><label for="sCookFlow1">조리방법</label></th>
			<td><input type="text" name="sCookFlow1" id="sCookFlow1" maxlength="200" title="조리방법 입력" class="size500"></td>
		</tr>
		<tr>	
			<th><label for="sImgPath_Flow1" class="mar_r10">썸네일등록</label></th>
			<td>
				<span class="input_file">
					<input type="text" name="sImgPath_Flow1" id="sImgPath_Flow1" size="100" value="" title="썸네일이미지 경로" class="size500" readonly>
					<input type="file" name="sFlowThumb1" id="sFlowThumb1" title="썸네일이미지 선택" onChange="javascript:setFilePath('sFlowThumb1','sImgPath_Flow1');">
				</span>
				<button type="button" onClick="javascript:selUpFile('sFlowThumb1');" title="썸네일이미지 선택" class="btn sml gray "><span>파일선택</span></button>
				<p class="mar_t5"><span class="blue">*</span> 이미지 권장 사이즈 : 150 x 70</p>
			</td>
		</tr>	
	</table>											
</td>
