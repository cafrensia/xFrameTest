
/* 거래처 선택 팝업 */
function goAccountPopup(id, accountDivCd, accountTypeCd, purchaseDivCd){
	lp_open("/account/popup.do?id=" + id + "&accountDivCd=" + accountDivCd + "&accountTypeCd=" + accountTypeCd + "&purchaseDivCd=" + purchaseDivCd);
}

/* 거래처 조회 */
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
						html += "	<td width=\"80\">" + list[i].manager + "</td>";
						html += "	<td width=\"80\"><button type=\"button\" onclick=\"addAccount('" + data.id + "','" + list[i].accountSeq + "','" + list[i].accountName + "', '" + list[i].salesDivCd + "', '" + list[i].purchaseDivCd + "', '" + list[i].processingCd + "');\" class=\"btn sml gray\"><span>선택</span></button></td>";
					}
					if(list[i].accountDivCd == "02"){
						html += "	<td width=\"170\">" + list[i].accountName + "</td>";
						html += "	<td width=\"220\">" + list[i].accountMark + "</td>";
						html += "	<td width=\"140\">" + list[i].purchaseDivCdName + "</td>";
						html += "	<td width=\"100\">" + list[i].accountManager + "</td>";
						html += "	<td width=\"100\">" + list[i].manager + "</td>";
						html += "	<td width=\"100\"><button type=\"button\" onclick=\"addAccount('" + data.id + "','" + list[i].accountSeq + "','" + list[i].accountName + "', '" + list[i].salesDivCd + "', '" + list[i].purchaseDivCd + "', '" + list[i].processingCd + "');\" class=\"btn sml gray\"><span>선택</span></button></td>";
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


/* 아이템 선택 팝업*/
function goItemPopup(id){
	lp_open("/item/popup.do?id="+id);
}

/* 아이템 조회 */
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
					html += "	<td width=\"90\"><button type=\"button\" onclick=\"addItem('" + data.id + "','" + list[i].itemSeq + "','" + list[i].itemName + "','" + list[i].itemCode + "');\" class=\"btn sml gray\"><span>선택</span></button></td>";
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
