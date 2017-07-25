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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../inc/header.jsp" %>
<!-- page content -->
<div class="clearfix"></div>
<div class="row">
<div class="col-md-2 col-sm-12 col-xs-12 center">
</div>
	<div class="col-md-8 col-sm-12 col-xs-12 center">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					コース選択
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form id="frm" name="frm" method="post">
					<div class="col-md-3 col-sm-12 col-xs-12">
						<input type="hidden" name="courseId" id="courseId"/>
						<input type="hidden" name="userId" id="userId" value="${sessionScope.userInfo.userId}"/>
						<table class="table">
							<thead style="text-align: center;">
								<tr>
									<th>コース</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding-top: 1px;">
										<ol id="selectable">
										<c:forEach var="item" items="${list}">
											<li class="ui-widget-content" value="${item.id}" > ${item.name}</li>
										</c:forEach>
										</ol>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-5 col-sm-12 col-xs-12">
						<table class="table">
							<thead style="text-align: center;">
								<tr>
									<th>価格</th>
									<th>時間</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
								<tr>
									<td>￥ ${item.price}</td>
									<td>${item.time}:00</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				<input type="button" name="bntChkOut" id="btnChkOut" value="CheckOut" onclick="checkout()" /><br>
				</form>
			</div>
		</div>
	</div>
				<!-- /page content -->
</div>
</div>
</div>
<!-- /pageContents -->
<!-- Style -->
<style>
#feedback {
	font-size: 1.4em;
}

#selectable .ui-selecting {
	background: #FECA40;
}

#selectable .ui-selected {
	background: #F39814;
	color: white;
}

#selectable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
}

#selectable li {
	margin-top: 1px;
	padding-top: 6px;
	text-align: center;
	font-size: 1.0em;
	height: 37px;
}

#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
}

#sortable li {
	margin: 0 5px 5px 5px;
	padding: 5px;
	font-size: 1.0em;
	height: 1.5em;
}

html>body #sortable li {
	height: 1.5em;
	line-height: 1.2em;
}

.ui-state-highlight {
	height: 1.5em;
	line-height: 1.2em;
}
</style>
<!-- /Style -->
<!-- Script -->
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
		if($("#courseId").attr('courseId') == '' || $("#courseId").attr('value') == "undefined") {
			alert("コースを選択してください。");
			return;
		}
		$("#frm").attr("action", "<c:url value='/reservation/date'/>");
		$("#frm").attr("target","_self");
		$("#frm").submit();
	};
</script>
<%@ include file="../inc/footer.jsp"%>