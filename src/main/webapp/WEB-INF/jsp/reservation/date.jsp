<!-- 
 * @Class Name : reservationdate.jsp
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.13		李多浩			最初作成
 * 
 * @author 李多浩
 * @since 2017.07.13
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../inc/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
<form id="frm" method="post">
<input type="hidden" name="courseId" id="courseId" value="${result.courseId}"/>
<input type="hidden" name="stylistId" id="stylistId" value=""/>
<!-- <div class="col-md-1 col-sm-12 col-xs-12 center"></div> -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title" style="text-align: center;">
				<h1>日付及びスタッフ選択</h1>
				<div class="clearfix"></div>
			</div>
			<div class="x_contens">
				<div class="col-md-5 col-sm-12 col-xs-12">
					<div class="col-md-8 col-sm-12 col-xs-12">
						<div class="x_title">
							<h4>Date</h4>
						</div>
						<div class="x_contents">
							<div id="DatePicker"></div>
						</div>
					</div>
					<div class="col-md-2 col-sm-12 col-xs-12">
						<div class="x_title">
							<h4>Time</h4>
						</div>
						<div id="TimePicker"></div>
					</div>
					<div class="col-md-1 col-sm-12 col-xs-12">
						<input type="button" class="btn btn-default btn-lg" id="ajaxtest" value="検索" style="margin-top:220px;"/>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="x_title">
						<h4>Staff</h4>
					</div>
					<ol id="selectable"></ol>
					</div>
				</div>
				<div class="col-md-1 col-sm-12 col-xs-12">
					<input type="button" class="btn btn-round btn-primary btn-lg" name="bntChkOut" id="btnChkOut" value="CheckOut" onclick="checkout()" style="margin-top:220px; padding:10px" />
				</div>
			</div>
		</div>
	</div>
</form>
</div>
<!-- /page content -->
				
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>" />
<style>
	#feedback { font-size: 1.4em; }
	#selectable .ui-selecting { background: #FECA40; }
	#selectable .ui-selected { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
	#selectable li { margin: 3px; padding: 0.4em; font-size: 1.0em; height: 40px; width: 150px;}
	ul { display: flex; align-content: flex-start; flex-direction: column; flex-wrap: wap; overflow: auto;}
</style>
<script type="text/javascript">
	//Date&Time Picker
	Number.prototype.padLeft = function(base,chr){
	    var  len = (String(base || 10).length - String(this).length)+1;
	    return len > 0? new Array(len).join(chr || '0')+this : this;
		// usage
		//=> 3..padLeft() => '03'
		//=> 3..padLeft(100,'-') => '--3' 
	}
	
	var d = new Date(),
	dformat = [(d.getFullYear()).padLeft(),(d.getMonth()+1).padLeft(),d.getDate()].join('/'),
	tformat = [(d.getHours()+1).padLeft(),d.getMinutes().padLeft(),d.getSeconds().padLeft()].join(':');
	
	$(document).ready(function() {
		$.datetimepicker.setLocale('ja');
		$('#DatePicker').datetimepicker({
			value: dformat,
			minDate: '-1970/01/01', // Today is minimum date
			maxDate: '+1970/02/01', // and NextMonth is maximum date calendar
			format:'Ymd',
			timepicker:false,
			inline: true
		});

		$("#TimePicker").datetimepicker({
			format:'H',
			value: tformat,
			allowTimes:['09:00','10:00','11:00','12:00','13:00','14:00','15:00','016:00','17:00'],
			datepicker:false,
			timepickerScrollbar: false,
			inline: true
		});
		$("#ajaxtest").click(function() {
			var dDate = parseInt($("#DatePicker").val());
			var dTime = parseInt($("#TimePicker").val());
			var getStaff;	
			console.log(dTime);
			if (dTime <= 17 && dTime > 9) {
				$.ajax({
					type:"POST",
					url:"<c:url value='/reservation/getStaffList'/>",
					data : { date : dDate, time : dTime },
					dataType : "json",
					error: function(data) {
						console.log(data);
						console.log("Error : " + Fail);
					},
					success : function(data) {
						var data = JSON.stringify(data);
						var obj = JSON.parse(data);
						var str = '';
						for(var i in obj.list){
							str += '<li class="ui-widget-content" value=' + obj.list[i].id + '>'+ obj.list[i].name + '</li>';
						 }
						$('#selectable').html(str);
					}
				});
			} else {
				alert("예약 시간이 아닙니다.");
			}
		});
	});
	// Selectable 
	$( function() {
		$( "#selectable" )
		.selectable()
		.on("selectablestop", function() {
			var styId = "";
			$('#selectable .ui-selected').each(function() {
				styId = $(this).attr('value');
			});
			document.getElementById("stylistId").value = styId;
	    });
	});
	//checkout
	function checkout() {
		if($("#courseId").attr('value') == '' || $("#courseId").attr('value') == "undefined") {
			alert("コースを選択してください。");
			return;
		}
		if($("#stylistId").attr('value') == '' || $("#stylistId").attr('value') == "undefined") {
			alert("スタッフを選択してください。");
			return;
		}
		if($("#DatePicker").val() == "" || typeof DatePicker == "undefined") {
			alert("日を選択してください。");
			return;
		}
		if($("#TimePicker").val() == "" || typeof TimePicker == "undefined") {
			alert("時間を選んでください。");
			return;
		}
		var $frm = $('#frm');
		var rDate = $('<input type="hidden" id="reservationDate" name="reservationDate" value="' + $('#DatePicker').val() + '" />');
		var rTime = $('<input type="hidden" id="reservationStartTime" name="reservationStartTime" value="' + $('#TimePicker').val() + '" />');	
		rDate.appendTo($frm);
		rTime.appendTo($frm);
		$frm.attr("action", "<c:url value='/reservation/check'/>");
		$frm.attr("target","_self");
		$frm.submit();
	}
</script>
<script src="<c:url value="/js/jquery.datetimepicker.full.js"/>"></script>
<%@ include file="../inc/footer.jsp" %>