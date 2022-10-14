<%@ page pageEncoding="utf-8"%>
<th class="bgGray">
	<span class="tit">건강정보 1</span>
	<p class="mar_t10"><button type="button" class="btn sml gray btn_list_del"><span>삭제</span></button></p>
</th>
<td>
	<dl class="healthInfo">
		<dt><label for="sHealthTitle1">타이틀</label></dt>
		<dd>
			<input type="text" name="sHealthTitle" id="sHealthTitle1" maxlength="100" class="size100p">
			
		</dd>
	</dl>
	<dl	class="healthInfo">
		<dt><label for="sHealthInfo1">상세내용</label></dt>
		<dd>
			<textarea name="sHealthInfo" id="sHealthInfo1" rows="5" cols="86" class="size100p"></textarea>
			<div class="mar_t5"><strong id="bytes">200</strong> / 800자</div>
		</dd>
	</dl>		
</td>