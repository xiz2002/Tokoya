<!-- 
 * @Class Name : reservationcourse.jsp
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.17		李 多 浩			最初作成
 * 
 * @author 李 多 浩
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/jquery-ui-1.10.4.custom.css"/>" />
<style>
	#feedback { font-size: 1.4em; }
	#selectable .ui-selecting { background: #FECA40; }
	#selectable .ui-selected { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
	#selectable li { margin: 3px; padding: 0.4em; font-size: 1.0em; height: 18px; }
	
	#sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
	#sortable li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.0em; height: 1.5em; }
	html>body #sortable li { height: 1.5em; line-height: 1.2em; }
	.ui-state-highlight { height: 1.5em; line-height: 1.2em; }
</style>
<script src="<c:url value="/js/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js" />"></script>
<script src="<c:url value="/js/jquery.datetimepicker.full.js" />"></script>
<script type="text/javascript">
	// Selectable 
	$( function() {
		$( "#selectable" )
		.selectable()
		.on("selectablestop", function() {
			var course="";
			$('#selectable .ui-selected').each(function() {
				course = $(this).attr('value');
			});
			document.getElementById("courseId").value = course.trim();
		//Debug
		console.log( course );
	    });
	});
	
	// non-selectable
	$( function() {
		$( "#sortable" ).sortable({
			placeholder: "ui-state-highlight"
		});
		$( "#sortable" ).disableSelection();
	} );
	
	//checkout
	function checkout() {
		if($("#cid").attr('value') == '' || $("#cid").attr('value') == "undefined") {
			alert("コースを選択してください。");
			return;
		}
		$("#frm").attr("action", "<c:url value='/reservation/date'/>");
		$("#frm").attr("target","_self");
		$("#frm").submit()
	};

</script>
</head>
<body>
	<div class="container">
		<div class="reservationDate">
			<h2>コース選択</h2>
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="courseId" id="courseId"></input>
				<!-- 選択 -->
				<table>
					<tr>
						<!-- CourseName -->
						<td>
							<ol id="selectable">
							<c:forEach var="item" items="${list}">
								<li class="ui-widget-content" value="${item.id}" > ${item.name}</li>
							</c:forEach>
							</ol>
						</td>
						<!-- CourseTime -->
						<td>
							<ul id="sortable">
							<c:forEach var="item" items="${list}">
  								<li class="ui-state-default">${item.price}</li>
  							</c:forEach>
  							</ul>
						</td>
						<!-- CoursePrice -->
						<td>
							<ul id="sortable">
							<c:forEach var="item" items="${list}">
  								<li class="ui-state-default">${item.time}</li>
  							</c:forEach>
  							</ul>
						</td>
					</tr>
				</table>
				<input type="button" name="bntChkOut" id="btnChkOut" value="CheckOut" onclick="checkout()" /><br>
				<!-- /page content -->
			</form>
		</div>
	</div>
</body>
</html>