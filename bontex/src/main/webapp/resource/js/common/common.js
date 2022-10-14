/* Common Function */

function ajaxCall(frmName, sendUrl, reUrl) {
	var dataString = $("#"+frmName).serialize();
	
	$.ajax({
		type:"POST",
		url:sendUrl,
		cache:false,
		async:false,
		dataType:"html",
		data:dataString,
		timeout:6000,
		success:function(data){
			if(data.msg !== ""){
				alert(data.msg);
			}
			document.location.href = reUrl;
		},
		complete:function(data){
			
		},
		error:function(xhr, status, error){
			
		}
	}); 
}

function ajaxLoad(selector, frmName, callUrl, callback){
	var dataString = $("#"+frmName).serialize();
	
	$(selector).load(callUrl, dataString, callback);
}

//loading
function showLoading() {
	var $loading = $("<div id='Loading' class='loadingWrap'></div>");

	if ($("#Loading").length == 0) {
		$loading.appendTo("body").show();
	}
}
function hideLoading() {
	if ($("#Loading").length > 0) { 
		$("#Loading").hide();	
	}
}

//JQuery 공통함수
jQuery(document).ready(function(e) {
	// Loading		
	$(window).ajaxStart(function() {
		showLoading();
	});
	$(window).ajaxError(function() {
		alert('ajax처리중 에러가 발생하였습니다!');
		showLoading();
	});	
	$(window).ajaxStop(function() {
		hideLoading();
	});
	
	$("#list2Row,#list3Row").children('thead').children('tr').each(function(idx){
		$(this).children('th').attr("style", "background-color:#ebebeb;");
		if(idx == 0){
			$(this).children('th').attr("style", "background-color:#ebebeb; border-bottom:1px solid #d7d7d7;");
			$(this).find('.2RowLine').attr("style", "background-color:#ebebeb; border-bottom:2px solid ##76797c;");
		}
	});
	$("#listRow").children('thead').children('tr').each(function(idx){
		$(this).children('th').attr("style", "background-color:#ebebeb;");
	});
	
	$("#list2Row").children('tbody').children('tr').each(function(idx){
		if(idx%4 == 0){
			$(this).children('td').attr("style", "background-color:#f8f8f8;");
			$("#list2Row").children('tbody').children('tr').eq(idx+1).children('td').attr("style", "background-color:#f8f8f8;");
		}
	});
	$("#list3Row").children('tbody').children('tr').each(function(idx){
		if(idx%6 == 0){
			$(this).children('td').attr("style", "background-color:#f8f8f8;");
			$("#list3Row").children('tbody').children('tr').eq(idx+1).children('td').attr("style", "background-color:#f8f8f8;");
			$("#list3Row").children('tbody').children('tr').eq(idx+2).children('td').attr("style", "background-color:#f8f8f8;");
		}
	});
	$("#listRow").children('tbody').children('tr').each(function(idx){
		if(idx%2 == 0){
			$(this).children('td').attr("style", "background-color:#f8f8f8;");
		}
	});
	
	
});

// input[type=file]  
function setFilePath(oObj,tObj) {
	$("#"+tObj).val($("#"+oObj).val());
	$("#"+oObj).next().val("");
}
function resetUpFile(tObj) {
	$("#"+tObj).val('');
}

// Inline Page Layer Popup Open
function openLayer(obj) {
	$.colorbox({inline:true, href:obj});
}

// Outer Page Layer Popup Open
function lp_open(url, openCallback, closeCallback) {
	$.colorbox({
		href:url,
		scrolling:false,
		onComplete:function() {						
			if (openCallback) {			
				openCallback();
			}
		},
		onClosed:function(){
			if (closeCallback) {			
				closeCallback();
			}			
		}
	});
}

// Layer Popup Close
function lp_close() {
	$.colorbox.close();
};

// Window Popup
function winPop(url, name ,sWidth, sHight, sLeft, sTop, isScroll, isResize, isTool, isMenu) {
	return window.open(url,name,'width='+sWidth+',height='+sHight+',left='+sLeft+',top='+sTop+',scrollbars='+isScroll+',resizable='+isResize+',toolbar='+isTool+',menubar='+isMenu+',location=no');
} 

// Datepicker Popup
function openCal(fld) {
	var $initFld = $("#"+fld);
	$initFld.focus();
}

function openCal1(obj, fld) {
	var $initFld = $("#"+fld);
	
	if(obj == 'start'){
		$initFld.datepicker({
			formatDate:"ATOM",
			dateFormat:"yymmdd",
			defaultDate: $initFld.val(),
			changeMonth: true,
			changeYear: true,
			showMonthAfterYear:true	,
			monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			altField: "#"+fld,
			showButtonPanel: true,
			closeText:"close",
			minDate:0,
			onClose: function( selectedDate ) {
						$initFld.parent().next().children('input').datepicker( "option", "minDate", selectedDate );
						if(selectedDate == ""){
							$initFld.parent().next().children('input').attr("disabled", true);
							$initFld.parent().next().children('button').attr("disabled", true);
						}else{
							$initFld.parent().next().children('input').attr("disabled", false);
							$initFld.parent().next().children('button').attr("disabled", false);
						}
				 	}
		}).datepicker("show");
	}else{
		$initFld.datepicker({
			formatDate:"ATOM",
			dateFormat:"yymmdd",
			defaultDate: $initFld.val(),
			changeMonth: true,
			changeYear: true,
			showMonthAfterYear:true	,
			monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			altField: "#"+fld,
			showButtonPanel: true,
			closeText:"close",
			minDate:$initFld.parent().prev().children('input').val(),
			onClose: function( selectedDate ) {
				$initFld.parent().prev().children('input').datepicker( "option", "maxDate", selectedDate );
				 	}
		}).datepicker("show");
	}
}

$(function(){
	$(".datepicker").datepicker({
		formatDate:"ATOM",
		dateFormat:"yymmdd",
		changeMonth: true,
		changeYear: true,
		showMonthAfterYear:true	,
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		showButtonPanel: true,
		closeText:"close"			
	});	
	
	$("#searchStartDate").datepicker();
	$("#searchStartDate").datepicker("option", "maxDate", $("#searchEndDate").val());
	$("#searchStartDate").datepicker("option", "onClose", function ( selectedDate ) {
		$("#searchEndDate").datepicker( "option", "minDate", selectedDate );
		if(selectedDate == ""){
			$("#searchEndDate").attr("disabled", true);
		}else{
			$("#searchEndDate").attr("disabled", false);
		}
	});

	$("#searchEndDate").datepicker();
	$("#searchEndDate").datepicker("option", "onClose", function ( selectedDate ) {
		$("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
	});
	
});

// Datepicker 기간선택
function setSearchDate(mm, fld1, fld2) {
	var nowDate = new Date();
	var startDate;
	var endDate = $.datepicker.formatDate($.datepicker.ATOM, nowDate);
	
	nowDate.setMonth(nowDate.getMonth() - parseInt(mm));
	
	startDate = $.datepicker.formatDate($.datepicker.ATOM, nowDate);
	
	$("#" + fld1).val(startDate.replace(/-/gi,""));
	$("#" + fld2).val(endDate.replace(/-/gi,""));
}

//오늘날짜 구하기 yyyymmdd
function nowDay(){
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 

	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 

	return year + "" + month + "" + day;
}

// LNB 활성화
var mainNum;
function setLnb(mn) {		
	$(".lnb li.node1").removeClass("on");
	$(".lnb li.node1").eq(mn).addClass("on");
	
	mainNum = $(".lnb li.node1.on").index(".lnb li.node1");	
	console.log(mainNum);
}

// SNB 활성화
var subNum;
function setSnb(sm) {		
	$(".snb li.node1").removeClass("on");
	$(".snb li.node1").eq(sm).addClass("on");
	
	subNum = $(".snb li.node1.on").index(".snb li.node1");	
}

//페이징 번호 클릭시 다음페이지 이동 함수
function gf_goPage(formName, pageNumber) {
	//$('#' + formName + ' input[id=page]').val(pageNumber);
	$('#pageNo').val(pageNumber);
	$('#' + formName).submit();
	return false;
}

function gf_goPagePopup(formName, pageNumber) {
	$('#' + formName + ' input[id=pageNo]').val(pageNumber);
	
	var url = $('#' + formName).attr('action');
	var params = $('#' + formName).serialize().replace(/%/g,'%25'); 
	$('#div_' + formName).load(url, params);
	return false;
}

//해당 tr 삭제
function layerDel(obj){
	if(confirm("선택하신 항목을 삭제하시겠습니까?")){
		$(obj).parent().parent().remove();
		reNum("");
	}
}

//해당 tr 위치변경
function layerGo(ud, obj){
	
	var element = $(obj).closest('tr');
	if (ud == "up" && element.prev().html() != null) {
		// 위로 이동
		element.insertBefore(element.prev());
	} else if (ud == "dn" && element.next().html() != null && element.next().attr("id") != "layerAdd"){
		// 아래로 이동
		element.insertAfter(element.next());
	}
	reNum("");
}

//번호 재설정
function reNum(key){
	var id = "layerAdd";
	if(key != ""){
		id = key;
	}
	$("#"+id).siblings("tr").each(function(idx) {
		$(this).children('td').children('div:first').text(idx+1);
	});
	var totalIdx = $("#"+id).index();
	$("#writeCount").val(totalIdx);
}

function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

/**
 * 12. 연속된 문자/숫자, 같은 문자/숫자 체크
 */
function isAlphaNumericSame(obj) {
	
	var SamePass_1 = 0; // 연속성(+) 카운트
	var SamePass_2 = 0; // 연속성(-) 카운트

	var chr_pass_0;
	var chr_pass_1;
	var chr_pass_2;
	
	if(/(\w)\1\1\1/.test(obj.value)){
		alert("동일한 문자/숫자가 3자리 이상 반복해 들어가는 비밀번호는 사용하실 수 없습니다.(예, aaa, 111 등)");
		return true;
	}
	
	for ( var i = 0; i < obj.value.length; i++) {
		chr_pass_0 = obj.value.charAt(i);
		chr_pass_1 = obj.value.charAt(i + 1);
		chr_pass_2 = obj.value.charAt(i + 2);
		// 연속성(+) 카운드
		if (chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1
				&& chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
			SamePass_1 = SamePass_1 + 1;
		}

		// 연속성(-) 카운드
		if (chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1
				&& chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
			SamePass_2 = SamePass_2 + 1;
		}
	}

	if (SamePass_1 > 0 || SamePass_2 > 0) {
		alert("연속된 문자/숫자가 3자리 이상 계속해 들어가는 비밀번호는 사용하실 수 없습니다.(예, abc, 123 등)");
		return true;
	}
	return false;
}

/**
 * 13. 숫자,영문(10자리 이상)조합 
 * //또는 숫자,영문,특수문자(8자리이상)조합
 */
function fn_validatePassword2(pwd) {
	var number = /[0-9]/;
	var eng = /[a-zA-Z]/;
	//var cahr = /[\!\@\#\$\%\^\&\*\(\)\-\=\_\+\,\.\<\>\/\?]/;
	var size = 0;

	if (number.test(pwd)) {
		if (eng.test(pwd)) {
			//if (cahr.test(pwd)) {
			//	size = 8;
			//} else {
				size = 10;
			//}
		} else {
			size = 0;
		}
	} else {
		size = 0;
	}

	if (size == 0) {
		return false;
	} else {
		if (pwd.length < size) {
			return false;
		} else {
			return true;
		}
	}
}

function isAlphaNumeric3(msg, obj, minLen, maxLen) {
	var str = obj.value;

	if (minLen != null && minLen > str.length) {
		alert(msg + "의 길이는 " + minLen + " 이상 이여야 합니다.");
		obj.focus();
		return true;
	}

	if (maxLen != null && maxLen < str.length) {
		alert(msg + "의 길이는 " + maxLen + " 이하 이여야 합니다.");
		obj.focus();
		return true;
	}

	return false;
}

//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
// 모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}
