var baseProcDiv = "";

jQuery(document).ready(function(e) {
	baseProcDiv = $("#procLayerDiv").html();
	$("#procLayerDiv").hide();
	/*$(document).on("click","button[name=accountButtonArr]",function(){
		var index = $("button[name=accountButtonArr]").index(this);
		if(index  == 0){
			goAccountPopup(index+1, '02','','01');
		}else{
			goAccountPopup(index+1, '02','','');
		}
	});*/
	
	$("#procForm").find("input[name=processingCdStr]").each(function(index){
		if(this.value != ''){
			var jbSplit = this.value;
			var id = index+1;
			$("#"+id+"_processingCd").children('option').hide();
			$("#"+id+"_processingCd").children('option').each(function(){
				if(jbSplit.indexOf(this.value) > -1){
					$(this).show();
				}
			});
		}
	});
	
});

function goList(){
	location.href = "/order/list.do";
}

function getCas(){
	lp_open("/cost/popup.do");
}

function goCostPopSearch(){
	
	if($("#searchKeyword1").val() == "" && $("#searchKeyword2").val() == ""){
		alert("검색어를 입력해주세요.");
		$("#searchKeyword2").focus();
		return false;
	}
	
	$.ajax({
		url : "/cost/find.do",
		type : "POST",
		dataType : "json",
		data : $("#popForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			var html = "";
			if(data.returnCode == '0000'){
				var list = data.costList;
				for(var i=0;i<list.length;i++){
					html += "<tr>";
					html += "	<td width=\"90\">" + list[i].receiptDate + "</td>";
					html += "	<td width=\"90\">" + list[i].regrName + "</td>";
					html += "	<td width=\"120\">" + list[i].brandName + "</td>";
					html += "	<td width=\"120\">" + list[i].vendorName + "</td>";
					html += "	<td width=\"170\">" + list[i].itemName + "</td>";
					html += "	<td width=\"170\">" + list[i].itemCode + "</td>";
					html += "	<td width=\"70\"><button type=\"button\" onclick=\"addCost('" + list[i].casSeq + "');\" class=\"btn sml gray\"><span>선택</span></button></td>";
					html += "</tr>";
				}
			}else{
				html += "<tr><td width=\"890\" colspan=\"7\">해당하는 내용이 없습니다.</td></tr>";
			}
			
			$("#costPopList").empty();
			$("#costPopList").html(html);
		},
		error: function (request, status, error) {
			alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
		}
	});
}

function addCost(casSeq){
	
	$.ajax({
		url : "/order/getCost.do",
		type : "POST",
		dataType : "json",
		data : {casSeq : casSeq},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			var html = "";
			if(data.returnCode == '0000'){
				var vo = data.orderVO;
				
				$("#form").find("#casSeq").val(casSeq);
				$("#form").find("#brandAccountName").val(vo.brandAccountName);
				$("#form").find("#brandAccountSeq").val(vo.brandAccountSeq);
				$("#form").find("#vendorAccountName").val(vo.vendorAccountName);
				$("#form").find("#vendorAccountSeq").val(vo.vendorAccountSeq);
				
				$("#form").find("#salesDivCd").find("option").each(function() {
					if(this.value != ""){
						$(this).hide();
					}
					var divCdArr = vo.salesDivCd.split(",");
					for(var i in divCdArr){
						if(this.value == divCdArr[i]){
							$(this).show();
						}
					}
				});
				
				addItem("item", vo.itemSeq, vo.itemName, vo.vendorAccountSeq);
			}else{
				alert("예상원가를 불러오지 못했습니다.");
			}
		},
		error: function (request, status, error) {
			alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
		}
	});
}

function goAccountPopup(id, accountDivCd, accountTypeCd, purchaseDivCd){
	lp_open("/account/popup.do?id=" + id + "&accountDivCd=" + accountDivCd + "&accountTypeCd=" + accountTypeCd + "&purchaseDivCd=" + purchaseDivCd);
}

function goAccountPopSearch(){
	
	if($("#searchKeyword1").val() == ""){
		alert("검색어를 입력해주세요.");
		$("#searchKeyword1").focus();
		return false;
	}
	
	$.ajax({
		url : "/account/find.do",
		type : "POST",
		dataType : "json",
		data : $("#popForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			var html = "";
			if(data.returnCode == '0000'){
				var list = data.accountList;
				for(var i=0;i<list.length;i++){
					html += "<tr>";
					if(list[i].accountDivCd == "01"){
						html += "	<td width=\"150\">" + list[i].accountName + "</td>";
						html += "	<td width=\"200\">" + list[i].accountMark + "</td>";
						html += "	<td width=\"120\">" + list[i].accountTypeCdName + "</td>";
						html += "	<td width=\"120\">" + list[i].salesDivCdName + "</td>";
						html += "	<td width=\"80\">" + list[i].accountManager + "</td>";
						html += "	<td width=\"80\">" + list[i].userName + "</td>";
						html += "	<td width=\"80\"><button type=\"button\" onclick=\"addAccount01('" + data.id + "','" + list[i].accountSeq + "','" + list[i].accountName + "', '" + list[i].salesDivCd + "');\" class=\"btn sml gray\"><span>선택</span></button></td>";
					}
					if(list[i].accountDivCd == "02"){
						html += "	<td width=\"170\">" + list[i].accountName + "</td>";
						html += "	<td width=\"220\">" + list[i].accountMark + "</td>";
						html += "	<td width=\"140\">" + list[i].purchaseDivCdName + "</td>";
						html += "	<td width=\"100\">" + list[i].accountManager + "</td>";
						html += "	<td width=\"100\">" + list[i].userName + "</td>";
						html += "	<td width=\"100\"><button type=\"button\" onclick=\"addAccount02('" + data.id + "','" + list[i].accountSeq + "','" + list[i].accountName + "', '" + list[i].purchaseDivCd + "', '" + list[i].processingCd + "');\" class=\"btn sml gray\"><span>선택</span></button></td>";
					}
					html += "</tr>";
				}
			}else{
				if($("#accountDivCd").val() == '01'){
					html += "<tr><td width=\"890\" colspan=\"7\">해당하는 내용이 없습니다.</td></tr>";
				}
				if($("#accountDivCd").val() == '02'){
					html += "<tr><td width=\"890\" colspan=\"6\">해당하는 내용이 없습니다.</td></tr>";
				}
			}
			$("#accountPopList").empty();
			$("#accountPopList").html(html);
		},
		error: function (request, status, error) {
			alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
		}
	});
}

function addAccount01(id, seq, name, divCd){
	$("#"+id+"Seq").val(seq);
	$("#"+id+"Name").val(name);
	
	$("#salesDivCd").find("option").each(function() {
		if(this.value != ""){
			$(this).hide();
		}else{
			$(this).attr("selected","selected");
		}
		var divCdArr = divCd.split(",");
		for(var i in divCdArr){
			if(this.value == divCdArr[i]){
				$(this).show();
			}
		}
	});
	
	lp_close();
}

function addAccount02(id, seq, name, divCd, processingCd){
	$("#"+id+"_accountSeq").val(seq);
	$("#"+id+"_accountName").val(name);
	
	$("#"+id+"_purchaseDivCd").find("option").each(function() {
		if(this.value != ""){
			$(this).hide();
		}else{
			$(this).attr("selected","selected");
		}
		var divCdArr = divCd.split(",");
		for(var i in divCdArr){
			if(this.value == divCdArr[i]){
				$(this).show();
			}
		}
	});
	
	$("#"+id+"_processingCd").children('option').hide();
	$("#"+id+"_processingCd").children('option').each(function(){
		var jbSplit = processingCd.split(',');
		for ( var i in jbSplit ) {
			if(this.value == ''){
				$(this).attr("selected","selected");
				$(this).show();
			}
			if(this.value == jbSplit[i]){
				$(this).show();
			}
		}
	});
	
	lp_close();
}

function goItemPopup(id){
	lp_open("/item/popup.do?id=" + id + "&accountSeq=" + $("#vendorAccountSeq").val());
}

function goItemPopSearch(){
	
	if($("#searchKeyword").val() == ""){
		alert("검색어를 입력해주세요.");
		$("#searchKeyword").focus();
		return false;
	}
	
	$.ajax({
		url : "/item/find.do",
		type : "POST",
		dataType : "json",
		data : $("#popForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			var html = "";
			if(data.returnCode == '0000'){
				var list = data.itemList;
				for(var i=0;i<list.length;i++){
					html += "<tr>";
					html += "	<td width=\"220\">" + list[i].itemCode + "</td>";
					html += "	<td width=\"220\">" + list[i].itemName + "</td>";
					html += "	<td width=\"120\">" + list[i].vendorName + "</td>";
					html += "	<td width=\"90\">" + list[i].regDate + "</td>";
					html += "	<td width=\"90\">" + list[i].regrName + "</td>";
					html += "	<td width=\"90\"><button type=\"button\" onclick=\"getColors('" + data.id + "','" + list[i].itemSeq + "','" + list[i].itemName + "', '" + list[i].vendorSeq + "');\" class=\"btn sml gray\"><span>선택</span></button></td>";
					html += "</tr>";
				}
			}else{
				html += "<tr><td width=\"890\" colspan=\"6\">해당하는 내용이 없습니다.</td></tr>";
			}
			$("#itemPopList").empty();
			$("#itemPopList").html(html);
		},
		error: function (request, status, error) {
			alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
		}
	});
}

function getColors(id, seq, name, vSeq){
	
	$.ajax({
		url : "/item/findColor.do",
		type : "POST",
		dataType : "json",
		data : {itemSeq : seq},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			var html = "";
			if(data.returnCode == '0000'){
				var list = data.itemColorList;
				for(var i=0;i<list.length;i++){
					if(list[i].vendorAccountSeq == vSeq){
						
						html += "<tr id=\"ocl_row_" + list[i].itemSeq + "_" + list[i].colorSeq + "\">";
						html += "	<td width=\"130\">" + list[i].colorCode + "</td>";
						html += "	<td width=\"170\">" + list[i].colorName + "</td>";
						html += "	<td width=\"110\">" + list[i].bt + "</td>";
						html += "	<td width=\"120\">" + list[i].refOrdNo + "</td>";
						html += "	<td width=\"100\">" + list[i].prcAccountName + "</td>";
						html += "	<td width=\"130\">" + list[i].memo + "</td>";
						html += "	<td width=\"70\">";
						html += "		<input type=\"checkbox\" name=\"colorSeqArr\" value=\"" + list[i].colorSeq + "\" />";
						html += "		<input type=\"hidden\" name=\"prcAccountSeqArr\" value=\"" + list[i].prcAccountSeq + "\" />";
						html += "	</td>";
						html += "</tr>";
					}
				}
			}
			
			$("#itemColorList").empty();
			$("#itemColorList").html(html);
			$("#itemPopSearchArea").hide();
			$("#itemPoplistArea").hide();
			$("#itemColorPoplistArea").show();
			$("#itemColorSelArea").show();
			$("input[name='colorItemSeq']").val(seq);
			$("input[name='colorItemId']").val(id);
			$("input[name='colorItemName']").val(name);
			$("input[name='itemSeq']").val(seq);
			$("input[name='itemName']").val(name);
		},
		error: function (request, status, error) {
			alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
		}
	});
}

function selAllColors(obj){
	
	if($(obj).is(':checked')){
		$("input[name='colorSeqArr']").prop("checked",true);
	}else{
		$("input[name='colorSeqArr']").prop("checked",false);
	}
}

//기본정보 등록 부분 ====================================================================
function addItem(){
	
	if($("input:checkbox[name=colorSeqArr]:checked").length == 0){
		alert("컬러를 선택해주세요.");
		return false;
	}
	
	var prevSeq = 0;
	var checkSeq = true;
	$("input:checkbox[name=colorSeqArr]").each(function(index) {
		if($(this).is(":checked")){
			var seq = $("input[name=prcAccountSeqArr]").eq(index).val();
			if(prevSeq > 0){
				if(prevSeq != seq){
					checkSeq = false;
					return false;
				}
			}
			prevSeq = seq;
		}
	});
	
	if(!checkSeq){
		alert("선택된 컬러의 염색업체가 여러 곳 입니다.");
		return false;
	}
	
	var id = $("#colorItemId").val();
	var seq = $("#colorItemSeq").val();
	var name = $("#colorItemName").val();
	
	$("#"+id+"Seq").val(seq);
	$("#"+id+"Name").val(name);
	
	//아이템에 해당하는 컬러 목록을 가져와서 표시
	$.ajax({
		url : "/item/findColor.do",
		type : "POST",
		dataType : "json",
		data     : $("#colorForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			var html = "";
			if(data.returnCode == '0000'){
				var list = data.itemColorList;
				for(var i=0;i<list.length;i++){
					html += "<tr id=\"ocl_row_" + list[i].itemSeq + "_" + list[i].colorSeq + "\">";
					html += "	<td class=\"ocl_count\">" + (i+1) + "</td>";
					html += "	<td>" + list[i].colorCode;
					html += "		<input type=\"hidden\" name=\"colorSeqArr\" id=\"colorSeq_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" value=\"" + list[i].colorSeq + "\">";
					html += "		<input type=\"hidden\" name=\"delYnArr\" id=\"delYn_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" value=\"N\">";
					html += "	</td>";
					
					html += "	<td>" + list[i].colorName + "</td>";
					html += "	<td>" + list[i].bt + "</td>";
					
					html += "	<td>";
					html += "		<input type=\"text\" name=\"purchaseOrderQntArr\" id=\"purchaseOrderQnt_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" maxlength=\"50\" title=\"P/O 수량입력\" class=\"size60\" value=\"\">";
					html += "	</td>";
					html += "	<td>";
					html += "		<input type=\"text\" name=\"needQntArr\" id=\"needQnt_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" maxlength=\"50\" title=\"필요수량입력\" class=\"size60\" value=\"\">";
					html += "	</td>";
					html += "	<td>";
					html += "		<input type=\"text\" name=\"workQntArr\" id=\"workQnt_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" maxlength=\"50\" title=\"작업수량입력\" class=\"size60\" value=\"\">";
					html += "	</td>";
					html += "	<td>";
					html += "		<input type=\"text\" name=\"noteArr\" id=\"note_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" maxlength=\"50\" title=\"비고입력\" class=\"size60\" value=\"\">";
					html += "	</td>";
					
					html += "	<td>";
					html += "		<input type=\"checkbox\" name=\"expriceCheck_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" id=\"expriceCheck_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" onclick=\"expriceYn('" + list[i].itemSeq + "','" + list[i].colorSeq + "')\" value=\"Y\" />";
					html += "		<input type=\"hidden\" name=\"expriceYnArr\" id=\"expriceYn_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" value=\"N\" />";
					html += "	</td>";
					
					html += "	<td>";
					html += "		<input type=\"checkbox\" name=\"check_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" id=\"check_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" onclick=\"stockYn('" + list[i].itemSeq + "','" + list[i].colorSeq + "')\" value=\"Y\" />";
					html += "		<input type=\"hidden\" name=\"stockYnArr\" id=\"stock_" + list[i].itemSeq + "_" + list[i].colorSeq + "\" value=\"N\" />";
					html += "		<button type=\"button\" onclick=\"delOclRow('" + list[i].itemSeq + "','" + list[i].colorSeq + "','');\" class=\"btn sml gray\"><span>삭제</span></button>";
					html += "	</td>";
					html += "</tr>";
				}
			}else{
				html += "<tr><td width=\"890\" colspan=\"10\">해당하는 내용이 없습니다.</td></tr>";
			}
			$("#colorRowData").empty();
			$("#colorRowData").html(html);
			
			if($("#colorRowData").children('tr').length > 0){
				
				if($("#itemSeq").val() != '' && $("#vendorAccountSeq").val() != ''){
					//단가 가져오기
					$.ajax({
						url : "/unitPrice/getUnitPrice.do",
						type : "POST",
						dataType : "json",
						data : {itemSeq : $("#itemSeq").val(), accountSeq : $("#vendorAccountSeq").val(), brandAccountSeq : $("#brandAccountSeq").val()},
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
				        },
						success: function(data) {
							if(data.returnCode == '0000'){
								
								var unit = data.unitPrice;
								$("#monetaryUnit").val(unit.monetaryUnit);
								$("#unitPrice").val(unit.unitPrice);
								$("#unitCd").val(unit.unitCd);
							}
						}
					});
				}
			}
		},
		error: function (request, status, error) {
			alert('code:' + request.status + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
		}
	});
	
	lp_close();
}

function delOclRow(iSeq, cSeq, oSeq){
	
	if(oSeq == ''){
		$("#ocl_row_"+iSeq+"_"+cSeq).remove();
	}else{
		$("#delYn_"+iSeq+"_"+cSeq).val("Y");
		$("#ocl_row_"+iSeq+"_"+cSeq).hide();
		$("#ocl_row_"+iSeq+"_"+cSeq).children('td.ocl_count').removeClass('ocl_count');
	}
	
	$(".ocl_count").each(function(i){
		$(this).text(i+1);
	});
}

function stockYn(item, color){
	if($("#check_" + item + "_" + color).is(':checked')){
		$("#stock_" + item + "_" + color).val("Y");
	}else{
		$("#stock_" + item + "_" + color).val("N");
	}
}

function expriceYn(item, color){
	if($("#expriceCheck_" + item + "_" + color).is(':checked')){
		$("#expriceYn_" + item + "_" + color).val("Y");
	}else{
		$("#expriceYn_" + item + "_" + color).val("N");
	}
}

function goRegOrder(){
	
	if($("#brandAccountSeq").val() == ""){
		alert("브랜드를 조회하세요.");
		$("#brandAccountName").focus();
		return false;
	}
	
	if($("#vendorAccountSeq").val() == ""){
		alert("벤더를 조회하세요.");
		$("#vendorAccountName").focus();
		return false;
	}
	
	if($("#salesDivCd").val() == ""){
		alert("매출구분을 선택하세요.");
		$("#salesDivCd").focus();
		return false;
	}
	
	if($("#purchaseOrderNo").val() == ""){
		alert("P/O NO를 입력하세요.");
		$("#purchaseOrderNo").focus();
		return false;
	}
	
	if($("#itemSeq").val() == ""){
		alert("ITEM을 조회하세요.");
		$("#itemName").focus();
		return false;
	}
	
	if($("#monetaryUnit").val() == ""){
		alert("단가 구분을 선택하세요.");
		$("#monetaryUnit").focus();
		return false;
	}
	
	if($("#unitPrice").val() == ""){
		alert("단가를 입력하세요.");
		$("#unitPrice").focus();
		return false;
	}
	
	if($("#leastUnitPrice").val() == ""){
		alert("탕비를 입력하세요.");
		$("#leastUnitPrice").focus();
		return false;
	}
	
	if($("#deliveryDate").val() == ""){
		alert("납기일을 선택하세요.");
		$("#deliveryDate").focus();
		return false;
	}
	
	if($("#unitCd").val() == ""){
		alert("단위를 선택하세요.");
		$("#unitCd").focus();
		return false;
	}
	
	var bl = true;
	
	if($("#colorRowData").children('tr').length < 1){
		alert("선택하신 아이템에 해당하는 컬러항목이 없습니다.\n아이템에 컬러항목을 추가해주세요.");
		return false;
	}else{
		if(bl){
			$("input:text[name=purchaseOrderQntArr]").each(function(){
				if(this.value == ''){
					alert("P/O수량을 입력하세요.");
					$(this).focus();
					bl = false;
					return false;
				}
			});
		}
		if(bl){
			$("input:text[name=needQntArr]").each(function(){
				if(this.value == ''){
					alert("필요수량을 입력하세요.");
					$(this).focus();
					bl = false;
					return false;
				}
			});
		}
		if(bl){
			$("input:text[name=workQntArr]").each(function(){
				if(this.value == ''){
					alert("작업수량을 입력하세요.");
					$(this).focus();
					bl = false;
					return false;
				}
			});
		}
	}
	
	if(!bl){
		return false;
	}
	
	$.ajax({
		url      : "/order/merOrder.do",
		type     : 'POST',
		dataType : "json",
		data     : $("#form").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			if(data.returnCode == '0000'){
				alert("오더가 등록되었습니다.");
				location.href = "/order/form.do?ordSeq="+data.ordSeq;
			}else{
				alert("오더가 등록되지 않았습니다.");
				return false;
			}
		}
	});
}

// 가공업체 등록 부분 ====================================================================
function addProcLayer(){
	
	var html = $("#procLayerDiv").html();
	$("#procLayerAdd").append().before(html);
	$(".proc_count").each(function(i){
		$(this).text((i+1) + "번");
	});
	
	$("#procLayerDiv").empty();
	
	var maxLength = $("#procForm").children('div.section').length;
	$("#procForm").children('div.section').each(function(i){
		var idx = i+1;
		$("input:text[name=accountNameArr]").eq(i).attr("id", idx + "_accountName");
		$("input:text[name=accountNameArr]").eq(i).parent().prev().children('label').attr("for",idx + "_accountName");
		
		$("input:hidden[name=accountSeqArr]").eq(i).attr("id", idx + "_accountSeq");
		$("input:hidden[name=prcDelYnArr]").eq(i).attr("id", idx + "_prcDelYn");
		$("input:hidden[name=prcSeqArr]").eq(i).attr("id", idx + "_prcSeq");
		$("button:button[name=accountButtonArr]").eq(i).attr("onclick", "goAccountPopup("+ idx +", '02','','');");
		$("select[name=purchaseDivCdArr]").eq(i).attr("id", idx + "_purchaseDivCd");
		$("select[name=purchaseDivCdArr]").eq(i).parent().prev().children('label').attr("for",idx + "_purchaseDivCd");
		$("input:text[name=unitPriceArr]").eq(i).attr("id", idx + "_unitPrice");
		$("input:text[name=unitPriceArr]").eq(i).parent().prev().children('label').attr("for",idx + "_unitPrice");
		$("input:hidden[name=unitPriceUsdArr]").eq(i).attr("id", idx + "_unitPriceUsd");
		$("input:hidden[name=unitPriceWonArr]").eq(i).attr("id", idx + "_unitPriceWon");
		
		$(this).find("input:radio").each(function(j){
			$(this).attr("name", idx + "_monetaryUnitArr");
			$(this).attr("id", idx + "_MONETARY_UNIT_" + this.value);
			$(this).prev('label').attr("for", idx + "_MONETARY_UNIT_" + this.value);
		});
		$("input:hidden[name=monetaryUnitArr]").eq(i).attr("id", idx + "_monetaryUnit");
		
		$("input:text[name=lossArr]").eq(i).attr("id", idx + "_loss");
		$("input:text[name=lossArr]").eq(i).parent().prev().children('label').attr("for",idx + "_loss");
		$("select[name=processingCdArr]").eq(i).attr("id", idx + "_processingCd");
		$("select[name=processingCdArr]").eq(i).parent().prev().children('label').attr("for",idx + "_processingCd");
	});
	
	$("#procLayerDiv").html(baseProcDiv);
}

function delProcLayerIg(obj, pSeq){
	if(confirm("삭제한 생지영역을 다시 확인하려면 페이지에 새로 진입하셔야 합니다.\n삭제하시겠습니까?")){
		delProcLayer(obj, pSeq);
	}
}

function delProcLayer(obj, pSeq){
	
	if(pSeq == ''){
		$(obj).parent().parent().remove();
	}else{
		$(obj).parent().parent().find("input:hidden[name=prcDelYnArr]").val("Y");
		$(obj).parent().parent().find(".proc_count").removeClass("proc_count");
		$(obj).parent().parent().hide();
	}
	
	$(".proc_count").each(function(i){
		$(this).text((i+1) + "번");
	});
}

function changeWorkQnt(){
	var bl = true;
	$("#procForm").find("input:text[name=lossArr]").each(function(){
		if(this.value == ''){
			alert("축률을 입력하세요.");
			$(this).focus();
			bl = false;
			return false;
		}
	});
	
	if(bl){
		//컬러별 축률을 적용해야 할지 총합에 축률을 적용할지 확인 필요
		//가장 마지막 작업수량(100) + 축률 = 이전 공정 작업수량
		var procCnt = $("#procForm").find("input:text[name=lossArr]").length;
		for(var num=procCnt;num>1;num--){
			var qntAll = 0;
			
			$("#"+num+"_qntArea").find("input:text[name=qntWorkQntArr]").each(function(idx){
				
				var nowQnt = $(this).val();
				var loss = $("#procForm").find("input:text[name=lossArr]").eq(num-1).val();
				var lossQnt = (nowQnt / 100) * loss;
				var beforeQnt = Math.round(Number(nowQnt) + lossQnt);
				
				if($("#procForm").find("select[name=purchaseDivCdArr]").eq(0).val() == '01'){
					if(num > 2){
						$("#"+(num-1)+"_qntArea").find("input:text[name=qntWorkQntArr]").eq(idx).val(beforeQnt);
					}else{
						qntAll = qntAll + beforeQnt;
					}
				}else{
					$("#"+(num-1)+"_qntArea").find("input:text[name=qntWorkQntArr]").eq(idx).val(beforeQnt);
				}
			});
			
			if($("#procForm").find("select[name=purchaseDivCdArr]").eq(0).val() == '01'){
				if(num <= 2){
					if($("#unitCd").val() == 'M'){
						qntAll = Math.round(Number(qntAll) * 1.0936);
					}
					$("#"+(num-1)+"_qntArea").find("input:text[name=qntWorkQntArr]").val(qntAll);
				}
			}
		}
	}
}

function goRegProc(){
	
	//가공업체 정보가 입력되었는지 확인
	var bl = true;
	
	if(bl){
		$("#procForm").find("input:text[name=accountNameArr]").each(function(){
			if(this.value == ''){
				alert("거래처를 조회하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	if(bl){
		$("#procForm").find("select[name=purchaseDivCdArr]").each(function(){
			if(this.value == ''){
				alert("매입구분을 선택하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	if(bl){
		$("#procForm").find("input:text[name=unitPriceArr]").each(function(){
			if(this.value == ''){
				alert("단가를 입력하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	if(bl){
		$("#procForm").children('div.section').each(function(i){
			if(i+1 < $("#procForm").children('div.section').size()){
				if(!$("input:radio[name=" + (i+1) + "_monetaryUnitArr]").is(':checked')){
					$("input:radio[name=" + (i+1) + "_monetaryUnitArr]").focus();
					bl = false;
					alert("달러나 원화를 선택하세요.");
					return false;
				}else{
					var radioVal = $("input:radio[name=" + (i+1) + "_monetaryUnitArr]:checked").val();
					$("input:hidden[name=monetaryUnitArr]").eq(i).val(radioVal);
					if(radioVal == "D"){
						$("input:hidden[name=unitPriceUsdArr]").eq(i).val($("input:text[name=unitPriceArr]").eq(i).val());
						$("input:hidden[name=unitPriceWonArr]").eq(i).val(0);
					}else{
						$("input:hidden[name=unitPriceWonArr]").eq(i).val($("input:text[name=unitPriceArr]").eq(i).val());
						$("input:hidden[name=unitPriceUsdArr]").eq(i).val(0);
					}
				}
			}
		});
	}
	if(bl){
		$("#procForm").find("input:text[name=lossArr]").each(function(){
			if(this.value == ''){
				alert("축률을 입력하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	if(bl){
		$("#procForm").find("select[name=processingCdArr]").each(function(){
			if(this.value == ''){
				alert("가공구분을 선택하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	if(bl){
		$("#procForm").find("select[name=calcUnitCdArr]").each(function(){
			if(this.value == ''){
				alert("정산단위를 선택하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	
	if(!bl){
		return false;
	}
	
	$.ajax({
		url      : "/order/merProc.do",
		type     : 'POST',
		dataType : "json",
		data     : $("#procForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			if(data.returnCode == '0000'){
				alert("오더가 등록되었습니다.");
				location.reload();
			}else{
				alert("오더 가 등록되지 않았습니다.");
				return false;
			}
		}
	});
}

function getStockPopup(qntSeq, itemSeq, colorSeq, purchaseDivCd){
	lp_open("/stock/usePopup.do?qntSeq=" + qntSeq + "&itemSeq=" + itemSeq + "&colorSeq=" + colorSeq + "&purchaseDivCd=" + purchaseDivCd);
}

function getUseStockList(qntSeq, ordNo){
	lp_open("/stock/useStockPopup.do?qntSeq=" + qntSeq + "&ordNo=" + ordNo);
}

function checkStockAll1(){
	var checkYn = $("#chkAll1").is(':checked');
	$("#stockPopForm").find("#check1").find("input:checkbox[name='chkQntSeqArr']").each(function(){
		$(this).prop("checked", checkYn);
	});
}

function checkStockAll2(){
	var checkYn = $("#chkAll2").is(':checked');
	$("#stockPopForm").find("#check2").find("input:checkbox[name='chkQntSeqArr']").each(function(){
		$(this).prop("checked", checkYn);
	});
}

function goStockReg(){
	
	if(!$("#stockPopForm").find("input:checkbox[name=chkQntSeqArr]").is(":checked")){
		alert("사용할 재고를 선택하세요.");
		return false;
	}
	
	var bl = true;
	
	if(bl){
		$("#stockPopForm").find("input:checkbox[name=chkQntSeqArr]").each(function(idx){
			var stock = $("#stockPopForm").find("input:hidden[name=stockQntArr]").eq(idx);
			var use = $("#stockPopForm").find("input:text[name=useQntArr]").eq(idx);
			if(use.val() == ''){
				alert("재고사용량을 입력하세요.");
				use.focus();
				bl = false;
				return false;
			}
			if(Number(stock.val()) < Number(use.val())){
				alert("전월재고보다 초과할 수 없습니다.");
				use.focus();
				bl = false;
				return false;
			}
		});
	}
	
	if(!bl){
		return false;
	}
	
	$.ajax({
		url      : "/stock/useStock.do",
		type     : 'POST',
		dataType : "json",
		data     : $("#stockPopForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			if(data.returnCode == '0000'){
				alert("재고사용이 등록되었습니다.");
				location.reload();
			}else{
				alert("재고사용이 등록되지 않았습니다.");
				return false;
			}
		}
	});
}

//의뢰서 및 요청서 신청 부분 ====================================================================
// 구매요청서
function goPurcReqPopup(ordSeq, prcSeq){
	lp_open("/order/purcReqPopup.do?ordSeq=" + ordSeq + "&prcSeq=" + prcSeq);
}

function goPurcPrint(){
	
	var printPop = winPop('', "PurcPreView", 1040, 900, 100, 50, 'YES');
	$("#purcReqPopForm").attr("action", "/order/purcPreView.do");
	$("#purcReqPopForm").attr("target", "PurcPreView");
	$("#purcReqPopForm").submit();
	
	var browser = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (browser.indexOf("msie") != -1) ) {
		printPop.print();
		printPop.close();
	}
}

function goPurcReqReg(){
	
	if($("#purcReqPopForm").find("#email").val() == ""){
		alert("이메일을 입력하세요.");
		$("#purcReqPopForm").find("#email").focus();
		return false;
	}
	
	if($("#purcReqPopForm").find("#accountName").val() == ""){
		alert("업체명을 입력하세요.");
		$("#purcReqPopForm").find("#accountName").focus();
		return false;
	}
	
	if($("#purcReqPopForm").find("#reference").val() == ""){
		alert("참조를 입력하세요.");
		$("#purcReqPopForm").find("#reference").focus();
		return false;
	}
	
	/*if($("#purcReqPopForm").find("#fax").val() == ""){
		alert("팩스를 입력하세요.");
		$("#purcReqPopForm").find("#fax").focus();
		return false;
	}*/
	
	if($("#purcReqPopForm").find("#ordDate").val() == ""){
		alert("발주일을 선택하세요.");
		$("#purcReqPopForm").find("#ordDate").focus();
		return false;
	}
	
	if($("#purcReqPopForm").find("#dlvyDate").val() == ""){
		alert("납품일을 선택하세요.");
		$("#purcReqPopForm").find("#dlvyDate").focus();
		return false;
	}
	
	if($("#purcReqPopForm").find("#dlvyAccountName").val() == ""){
		alert("납품처를 입력하세요.");
		$("#purcReqPopForm").find("#dlvyAccountName").focus();
		return false;
	}
	
	if($("#purcReqPopForm").find("#manager").val() == ""){
		alert("담당자를 입력하세요.");
		$("#purcReqPopForm").find("#manager").focus();
		return false;
	}
	
	if($("#purcReqPopForm").find("#standard").val() == ""){
		alert("규격을 입력하세요.");
		$("#purcReqPopForm").find("#standard").focus();
		return false;
	}
	if($("#purcReqPopForm").find("#qnt").val() == ""){
		alert("수량을 입력하세요.");
		$("#purcReqPopForm").find("#qnt").focus();
		return false;
	}
	if($("#purcReqPopForm").find("#unitPrice").val() == ""){
		alert("단가를 입력하세요.");
		$("#purcReqPopForm").find("#unitPrice").focus();
		return false;
	}
	if($("#purcReqPopForm").find("#amount").val() == ""){
		alert("금액을 입력하세요.");
		$("#purcReqPopForm").find("#amount").focus();
		return false;
	}
	
	$("#purcReqPopForm").find("#totalQnt").val($("#purcReqPopForm").find("#amount").val());
	
	$.ajax({
		url      : "/order/merPurcReq.do",
		type     : 'POST',
		dataType : "json",
		data     : $("#purcReqPopForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			if(data.returnCode == '0000'){
				alert("구매요청서가 저장되었습니다.");
				location.reload();
			}else{
				alert("구매요청서가 저장되지 않았습니다.");
				return false;
			}
		}
	});
}

// 발주서
function goDraftPopup(ordSeq, prcSeq){
	lp_open("/order/draftPopup.do?ordSeq=" + ordSeq + "&prcSeq=" + prcSeq);
}

function goDraftPrint(){
	
	var printPop = winPop('', "DraftPreView", 1040, 900, 100, 50, 'YES');
	$("#draftPopForm").attr("action", "/order/draftPreView.do");
	$("#draftPopForm").attr("target", "DraftPreView");
	$("#draftPopForm").submit();
	
	var browser = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (browser.indexOf("msie") != -1) ) {
		printPop.print();
		printPop.close();
	}
}

function goDraftReg(){
	
	if($("#draftPopForm").find("#accountName").val() == ""){
		alert("업체명을 입력하세요.");
		$("#draftPopForm").find("#accountName").focus();
		return false;
	}
	
	if($("#draftPopForm").find("#accountManager").val() == ""){
		alert("업체담당자를 입력하세요.");
		$("#draftPopForm").find("#accountManager").focus();
		return false;
	}
	
	if($("#draftPopForm").find("#frlDate").val() == ""){
		alert("일자를 선택하세요.");
		$("#draftPopForm").find("#frlDate").focus();
		return false;
	}
	
	if($("#draftPopForm").find("#writeDate").val() == ""){
		alert("작성일을 선택하세요.");
		$("#draftPopForm").find("#writeDate").focus();
		return false;
	}
	
	if($("#draftPopForm").find("#dlvyDate").val() == ""){
		alert("납품일을 선택하세요.");
		$("#draftPopForm").find("#dlvyDate").focus();
		return false;
	}
	
	if($("#draftPopForm").find("#dlvyAccountName").val() == ""){
		alert("납품처를 입력하세요.");
		$("#draftPopForm").find("#dlvyAccountName").focus();
		return false;
	}
	
	if($("#draftPopForm").find("#itemName").val() == ""){
		alert("품명을 입력하세요.");
		$("#draftPopForm").find("#itemName").focus();
		return false;
	}
	
	if($("#draftPopForm").find("#orderQnt").val() == ""){
		alert("ORDER량을 입력하세요.");
		$("#draftPopForm").find("#orderQnt").focus();
		return false;
	}
	if($("#draftPopForm").find("#unit").val() == ""){
		alert("UNIT을 입력하세요.");
		$("#draftPopForm").find("#unit").focus();
		return false;
	}
	if($("#draftPopForm").find("#unitPrice").val() == ""){
		alert("단가를 입력하세요.");
		$("#draftPopForm").find("#unitPrice").focus();
		return false;
	}
	
	var bl = true;
	
	if(bl){
		$("input:text[name=qtyArr]").each(function(){
			if(this.value == ''){
				alert("컬러수량을 입력하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	
	if(!bl){
		return false;
	}
	
	$.ajax({
		url      : "/order/merDraftReq.do",
		type     : 'POST',
		dataType : "json",
		data     : $("#draftPopForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			if(data.returnCode == '0000'){
				alert("발주서가 저장되었습니다.");
				location.reload();
			}else{
				alert("발주서가 저장되지 않았습니다.");
				return false;
			}
		}
	});
}

// 가공의뢰서
function goProcReqPopup(ordSeq, prcSeq, accountSeq, level){
	lp_open("/order/procReqPopup.do?ordSeq=" + ordSeq + "&prcSeq=" + prcSeq + "&accountSeq=" + accountSeq + "&level=" + level);
}

function goProcPrint(){
	
	var printPop = winPop('', "ProcPreView", 1200, 900, 100, 50, 'YES');
	$("#procReqPopForm").attr("action", "/order/procPreView.do");
	$("#procReqPopForm").attr("target", "ProcPreView");
	$("#procReqPopForm").submit();
	
	var browser = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (browser.indexOf("msie") != -1) ) {
		printPop.print();
		printPop.close();
	}
}

function goProcReqReg(){
	
	if($("#procReqPopForm").find("#email").val() == ""){
		alert("이메일을 입력하세요.");
		$("#procReqPopForm").find("#email").focus();
		return false;
	}
	
	if($("#procReqPopForm").find("#accountName").val() == ""){
		alert("업체명을 입력하세요.");
		$("#procReqPopForm").find("#accountName").focus();
		return false;
	}
	
	if($("#procReqPopForm").find("#reference").val() == ""){
		alert("참조를 입력하세요.");
		$("#procReqPopForm").find("#reference").focus();
		return false;
	}
	
	/*if($("#procReqPopForm").find("#fax").val() == ""){
		alert("팩스를 입력하세요.");
		$("#procReqPopForm").find("#fax").focus();
		return false;
	}*/
	
	if($("#procReqPopForm").find("#dlvyDate").val() == ""){
		alert("납품일을 선택하세요.");
		$("#procReqPopForm").find("#dlvyDate").focus();
		return false;
	}
	
	if($("#procReqPopForm").find("#receiptDate").val() == ""){
		alert("IG입고일을 선택하세요.");
		$("#procReqPopForm").find("#receiptDate").focus();
		return false;
	}
	
	if($("#procReqPopForm").find("#purchaseAccountName").val() == ""){
		alert("IG구매처를 입력하세요.");
		$("#procReqPopForm").find("#purchaseAccountName").focus();
		return false;
	}
	
	/*if($("#procReqPopForm").find("#accountItemName").val() == ""){
		alert("IG업체 품명을 입력하세요.");
		$("#procReqPopForm").find("#accountItemName").focus();
		return false;
	}*/
	
	if($("#procReqPopForm").find("#orderQnt").val() == ""){
		alert("ORDER량을 입력하세요.");
		$("#procReqPopForm").find("#orderQnt").focus();
		return false;
	}
	
	if($("#procReqPopForm").find("#amount").val() == ""){
		alert("단가를 입력하세요.");
		$("#procReqPopForm").find("#amount").focus();
		return false;
	}
	
	var bl = true;
	
	if(bl){
		$("input:text[name=qntArr]").each(function(){
			if(this.value == ''){
				alert("컬러수량을 입력하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	
	if(!bl){
		return false;
	}
	
	$.ajax({
		url      : "/order/merProcReq.do",
		type     : 'POST',
		dataType : "json",
		data     : $("#procReqPopForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			if(data.returnCode == '0000'){
				alert("가공의뢰서가 저장되었습니다.");
				location.reload();
			}else{
				alert("가공의뢰서가 저장되지 않았습니다.");
				return false;
			}
		}
	});
}

// 출고요청서
function goFactReqPopup(ordSeq, prcSeq, level){
	lp_open("/order/factReqPopup.do?ordSeq=" + ordSeq + "&prcSeq=" + prcSeq + "&level=" + level);
}

function goFactPrint(){
	
	var printPop = winPop('', "FactPreView", 1040, 900, 100, 50, 'YES');
	$("#factReqPopForm").attr("action", "/order/factPreView.do");
	$("#factReqPopForm").attr("target", "FactPreView");
	$("#factReqPopForm").submit();
	
	var browser = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (browser.indexOf("msie") != -1) ) {
		printPop.print();
		printPop.close();
	}
}

function goFactReqReg(){
	
	if($("#factReqPopForm").find("#accountName").val() == ""){
		alert("업체명을 입력하세요.");
		$("#factReqPopForm").find("#accountName").focus();
		return false;
	}
	
	if($("#factReqPopForm").find("#reference").val() == ""){
		alert("참조를 입력하세요.");
		$("#factReqPopForm").find("#reference").focus();
		return false;
	}
	
	if($("#factReqPopForm").find("#manager").val() == ""){
		alert("담당자를 입력하세요.");
		$("#factReqPopForm").find("#manager").focus();
		return false;
	}
	
	if($("#factReqPopForm").find("#frlDate").val() == ""){
		alert("일자를 선택하세요.");
		$("#factReqPopForm").find("#frlDate").focus();
		return false;
	}
	
	var bl = true;
	
	if(bl){
		$("#factReqPopForm").find("input:text[name=qtyArr]").each(function(){
			if(this.value == ''){
				alert("Q'TY를 입력하세요.");
				$(this).focus();
				bl = false;
				return false;
			}
		});
	}
	
	if($("#factReqPopForm").find("#level").val() == '2'){
		
		if(bl){
			$("#factReqPopForm").find("input:text[name=ctNoArr]").each(function(){
				if(this.value == ''){
					alert("C/T NO를 입력하세요.");
					$(this).focus();
					bl = false;
					return false;
				}
			});
		}
		
		if(bl){
			$("#factReqPopForm").find("input:text[name=noteArr]").each(function(){
				if(this.value == ''){
					alert("SHIPPING MARK ORDER NO를 입력하세요.");
					$(this).focus();
					bl = false;
					return false;
				}
			});
		}
		
	}else{
		
		if(bl){
			$("#factReqPopForm").find("input:text[name=dlvyDateArr]").each(function(){
				if(this.value == ''){
					alert("출고일을 선택하세요.");
					$(this).focus();
					bl = false;
					return false;
				}
			});
		}
		
	}
	
	if(!bl){
		return false;
	}
	
	$.ajax({
		url      : "/order/merFactReq.do",
		type     : 'POST',
		dataType : "json",
		data     : $("#factReqPopForm").serialize(),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success: function(data) {
			if(data.returnCode == '0000'){
				alert("출고요청서가 저장되었습니다.");
				location.reload();
			}else{
				alert("출고요청서가 저장되지 않았습니다.");
				return false;
			}
		}
	});
}


//가공업체 출고수량 등록 부분 ====================================================================
function addDlvy(num){
	var itemName = $("#"+num+"_inItemName").val();
	if($("#"+num+"_purchaseDivCd").val() == '01' || $("#"+num+"_purchaseDivCd").val() == '10'){
		itemName = "";
	}
	var dlvyDate = $("#"+num+"_inDlvyDate").val();
	var qnt = $("#"+num+"_inQnt").val();
	var qntSeq = $("#"+num+"_qntArea").children("tbody").children("tr #" + num + "_" + itemName + "_qntTr").children('td').find("input:hidden[name=qntSeqArr]").val();
	
	if(dlvyDate == ""){
		alert("출고날짜를 선택하세요.");
		$("#"+num+"_inDlvyDate").focus();
		return false;
	}
	
	if(dlvyDate.length < 8){
		alert("출고날짜를 다시 선택하세요.");
		$("#"+num+"_inDlvyDate").focus();
		return false;
	}
	
	if(qnt == "" || qnt == "0"){
		alert("출고수량을 입력하세요.");
		$("#"+num+"_inQnt").focus();
		return false;
	}
	
	var tdHtml = "<input type=\"text\" name=\"dlvyQntArr\" maxlength=\"50\" title=\"출고수량입력\" class=\"size80\" style=\"height:24px;\" value=\"" + qnt + "\">";
	tdHtml += "<input type=\"hidden\" name=\"dlvyQntSeqArr\" value=\"" + qntSeq + "\" />";
	tdHtml += "<input type=\"hidden\" name=\"dlvySeqArr\" value=\"\"/>";
	tdHtml += "<input type=\"hidden\" name=\"dlvyDateArr\" value=\"" + dlvyDate + "\"/>";
	tdHtml += "<input type=\"hidden\" name=\"dlvyDelYnArr\" value=\"N\"/>";
	
	var bl = false;
	var cnt = 0;
	$("#"+num+"_dlvyArea").children("thead").children("tr").children('th.widthCount').each(function(idx){
		if($(this).children("div").text() != ""){
			cnt++;
		}
		if(!bl){
			if(dlvyDate == $(this).children("div").text()){
				bl = true;
				var targetTd = $("#"+num+"_dlvyArea").children("tbody").children("tr #" + num + "_" + itemName + "_dlvyTr").children('td.widthCount').eq(idx);
				if(targetTd.children("input").length > 0){
					targetTd.find("input:text[name=dlvyQntArr]").val(qnt);
					targetTd.find("input:hidden[name=dlvyDateArr]").val(dlvyDate);
				}else{
					targetTd.append(tdHtml);
				}
			}
		}
	});
	
	if(!bl){
		var thHtml = "<div class=\"fl\">" + dlvyDate + "</div> <button type=\"button\" onclick=\"delDlvy('" + num + "', '" + dlvyDate + "')\" class=\"btn del gray\"><span>X</span></button>";
		if(cnt < 4){
			$("#"+num+"_dlvyArea").children("thead").children("tr").children("th.widthCount").eq(cnt).append(thHtml);
			$("#"+num+"_dlvyArea").children("tbody").children("tr #" + num + "_" + itemName + "_dlvyTr").children("td.widthCount").eq(cnt).append(tdHtml);
		}else{
			thHtml = "<th width=\"100px;\" class=\"widthCount\" scope=\"col\">" + thHtml + "</th>";
			tdHtml = "<td width=\"100px;\" class=\"widthCount\">" + tdHtml + "</td>";
			$("#"+num+"_dlvyArea").children("thead").children("tr").append(thHtml);
			$("#"+num+"_dlvyArea").children("tbody").children("tr #" + num + "_" + itemName + "_dlvyTr").append(tdHtml);
			$("#"+num+"_dlvyArea").children("tbody").children("tr #" + num + "_" + itemName + "_dlvyTr").siblings().append("<td width=\"100px;\" class=\"widthCount\"></td>");
			
			var tSize = $("#"+num+"_dlvyArea").children("tbody").children("tr #" + num + "_" + itemName + "_dlvyTr").children("td.widthCount").length;
			$("#"+num+"_dlvyArea").attr("style","width:" + tSize + "00px;");
		}
	}
	totalQnt(num);
}

function delDlvy(num, dlvyDate){
	
	$("#"+num+"_dlvyArea").children("thead").children("tr").children('th.widthCount').each(function(idx){
		if(dlvyDate == $(this).children("div").text()){
			
			$("#"+num+"_dlvyArea").children("tbody").children("tr").each(function(){
				$(this).children("td.widthCount").eq(idx).find("input:hidden[name=dlvyDelYnArr]").val("Y");
				$(this).children("td.widthCount").eq(idx).hide();
				$(this).children("td.widthCount").eq(idx).removeClass("widthCount");
			});
			$(this).children("div").text("");
			$(this).removeClass("widthCount");
			$(this).hide();
		}
	});
	
	var tSize = $("#"+num+"_dlvyArea").children("tbody").children("tr").eq(0).children("td.widthCount").length;
	if(tSize < 4){
		var thHtml = "<th width=\"100px;\" class=\"widthCount\" scope=\"col\"><div></div></th>";
		var tdHtml = "<td width=\"100px;\" class=\"widthCount\"></td>";
		for(var i=tSize;i<4;i++){
			$("#"+num+"_dlvyArea").children("thead").children("tr").append(thHtml);
			$("#"+num+"_dlvyArea").children("tbody").children("tr").each(function(idx){
				$(this).append(tdHtml);
			});
		}
		$("#"+num+"_dlvyArea").attr("style","width:400px;");
	}else{
		$("#"+num+"_dlvyArea").attr("style","width:" + tSize + "00px;");
	}
	
	totalQnt(num);
}

function totalQnt(num){
	$("#"+num+"_dlvyArea").children("tbody").children("tr").each(function(idx){
		var sum = 0;
		
		$(this).children("td.widthCount").each(function(){
			if($(this).find("input:text[name=dlvyQntArr]").length > 0){
				sum = sum + Number($(this).find("input:text[name=dlvyQntArr]").val());
			}
		});
		$("#"+num+"_dlvySumArea").children("tbody").children("tr").eq(idx).children("td").eq(0).text(sum);
	});
}

//해당 주문 마감처리
function goEndOrder(ordSeq){
	
	if(confirm("마감처리 이후에는 해당 주문의 수정이 불가능합니다.\n마감처리 하시겠습니까?")){
		$.ajax({
			url      : "/order/endOrder.do",
			type     : 'POST',
			dataType : "json",
			data     : $("#form").serialize(),
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	        },
			success: function(data) {
				if(data.returnCode == '0000'){
					alert("마감처리 되었습니다.");
					location.reload();
				}else{
					alert("마감처리되지 않았습니다.");
					return false;
				}
			}
		});
	}
}

//컬러별 마감 선택창
function goColorPopup(ordSeq){
	lp_open("/order/orderEndColorPopup.do?ordSeq=" + ordSeq + "&colorFinishYn=Y");
}


function endColor(){
	
	if(confirm("마감처리 이후에는 해당 컬러가 보이지 않게 됩니다.\n마감처리 하시겠습니까?")){
		
		$.ajax({
			url      : "/order/endColor.do",
			type     : 'POST',
			dataType : "json",
			data     : $("#colorPopForm").serialize(),
			beforeSend: function(xhr) {
		        xhr.setRequestHeader(header, token);
		    },
			success: function(data) {
				if(data.returnCode == '0000'){
					alert("마감처리 되었습니다.");
					location.reload();
				}else{
					alert("마감처리되지 않았습니다.");
					return false;
				}
			}
		});
		
	}
}