<!-- 
 * @Class Name : stylistmanagement.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
/*$(document).ready(function(){
	$("#stylistadd").on("click", function(){
		$("#styfrm").attr("action", "<c:url value='/admin/stylist/insertWrite.do'/>");
		$("#styfrm").submit();
	});
	$("#cancle").on("click", function(){
		$("#styfrm").attr("action", "<c:url value='/admin/stylist/management'/>");
		$("#styfrm").submit();
	});
});*/

$(document).ready(function() {
	$("#id_error").hide();
	$("#name_error").hide();
	
	//スタイリスト登録
	$("#stylistadd").on("click", function() {
		var ck = false;
		
		//validation check
		ck = checkValidation();
		console.log(ck);
		setParam();
		if (ck) {
			$("#styfrm").attr("action", "<c:url value='/admin/stylist/insertWrite.do'/>");
			$("#styfrm").submit();
		}
	});
	
	//取り消し
	$("#cancle").on("click", function() {
		$("#styfrm").attr("action", "<c:url value='/admin/stylist/management'/>");
		$("#styfrm").submit();
	});
	
	//ID重複チェック
	$("#id_check").on("click", function() {
		checkStyId();
	});
});

function setParam() {
	var name;

	name = $("#stylistName").val();
	$("#name").val(name);

	return true;
}
function checkStyId() {
	var id = $("#stylistId").val();
	var blank_pattern = /[\s]/g;
	var id_pattern = /^[a-z0-9]{4,10}$/;
	var validation = true; 
	if(id==null||!id_pattern.test(id)){
		validation = false;
	}
	if(validation){
	$.ajax({
		type : "POST",
		dataType : "JSON",
		data : {
			id : id
		},
		url : "<c:url value='/admin/checkId.do'/>",
		error : function(data) {
			console.log(data);
			console.log("Error : ");
		},
		success : function(data) {
			var data = JSON.stringify(data);
			var obj = JSON.parse(data);
			if (obj.result == "true") {
				alert("このIDが使えます。");
				$("#id_error").hide();
			}
			else if (obj.result == "false") {
				alert("このIDはもう存在しています。他のIDを入力してください。");
			}
		}
	});
	}else{
		$("#id_error").show();
	}
}
function checkValidation(){
	var flag = true;
	var name = $("#stylistName").val();
	var id = $("#stylistId").val();

	var name_pattern = /[\s^-_.a-z0-9]/g;
	
	//name check
	if((name.length==0||name.length>20)||name==null||!checkCode(name)||name_pattern.test(name)){
		$("#name_error").show();
		flag = false;
	}else{
		$("#name_error").hide();
	}
	return flag;
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
	<div class="container">
		<div class="addstylistform">
			<form id="styfrm" method="POST">
				<h2>スタイリスト追加</h2>
				<p>
					<span>スタイリストID</span><br>
					<span id="id_error" style="color:red">*IDは半角英数字で4字以上10字以下で入力してください。</span><br>
					<input type="text" id="stylistId" name="stylistId" placeholder="スタイリストＩＤ"><br>
					<input type="button" value="IDチェック" id="id_check" />
				</p>
				<p>
					<span>スタイリスト名</span><br>
					<span id="name_error" style="color:red">*氏名を再確認してください。</span><br>
					<input type="text" id="stylistName" name="stylistName" placeholder="スタイリスト名">
				</p>
				<!-- 各種ボタン -->
			</form>
			<input type="button" value="追加" id="stylistadd">
			<input type="button" value="キャンセル" id="cansel">
			<!-- /page content -->
			<!-- footer -->
			<!-- /footer -->
		</div>
	</div>
	<!-- 
	< %@include file="../sample/inc/scripts.jsp"%>
	 -->
</body>
</html>