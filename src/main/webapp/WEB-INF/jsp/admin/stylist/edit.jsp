<!-- 
 * @Class Name : edit.jsp
 * @Description : 
 * @
 * @	修正日			修正者?		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * 
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../inc/admin_header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#name_error").hide();
	
	$("#upsty").on("click", function(){
		
		var ck = false;
		
		//validation check
		ck = checkValidation();
		console.log(ck);
		setParam();
		if (ck) {
			$("#editfrm").attr("action", "<c:url value='/admin/stylist/update.do'/>");
			$("#editfrm").submit();
		}
	});
	$("#delsty").on("click", function(){
		if(!confirm('本当に削除しますか？')){
			return false;
		}else{
			$("#editfrm").attr("action", "<c:url value='/admin/stylist/delete.do'/>");
			$("#editfrm").submit();
		}
	});
});
function checkValidation(){
	var flag = true;
	var name = $("#stylistName").val();

	var name_pattern = /[\s^-_.a-z0-9]/g;
	
	//氏名チェック
	if((name.length==0||name.length>20)||name==null||!checkCode(name)||name_pattern.test(name)){
		$("#name_error").show();
		flag = false;
	}else{
		$("#name_error").hide();
	}
	return flag;
}

function setParam() {
	var name;

	name = $("#stylistName").val();
	$("#name").val(name);

	return true;
}

function checkCode(param){
	for(var i = 0; i <param.length; i++){
		var st = param.charCodeAt(i);
		if((st < 256) || (st >= 0xff61 && st <= 0xff9f)) {
			return false;
		} 
   }
   return true;
}
</script>

<head>
</head>

<body>
<div class="right_col" role="main">
	<div class="">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>スタイリスト編集</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
			<form id="editfrm" method="POST">
				<c:forEach var="item" items="${result}">
				<p>
					<span>スタイリストID</span>
					<input type="hidden" id="stylistId" name="stylistId" value="${item.stylistId}">
					<label id="stylistId">${item.stylistId}</label>
				</p>
				<p>
					<span>スタイリスト名</span><br>
					<span id="name_error" style="color:red">*氏名を再入力して下さい。</span><br>
					<input type="text" id="stylistName" name="stylistName" value="${item.stylistName}">
				</p>
				<!-- 各種ボタン -->
			<button type="button" id="upsty" name="upsty">更新</button>
			<!-- <button type="button" id="delsty" name="delsty">削除</button> -->
			<button type="button" id="delsty" name="delsty" ${deljuge eq 1 ? '' : 'disabled'}>削除</button>
			<button type="button" id="return" OnClick="history.back()">戻る</button>
			</c:forEach>
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>
</body>
<%@ include file="../inc/admin_foot.jsp"%>