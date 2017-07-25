<!-- 
* @Class Name : home.jsp
* @Description : お知らせ一覧画面
*　@
*　@	修正日			修正者		修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.12		Kim		最初作成
* 
* @author Kim
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*
-->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../admin/inc/admin_header.jsp"%>
<script type="text/javascript">
	function writeForm() {
		$("#admin_body").load("/admin/board/write");
		history.pushState(null, null, "/admin/board/write");
	}
	/* $(function(){
	$("#boardList").DataTable();
	}); */
 	$(function() {
		paging();
	});
	function paging() {
		var paging = '';
		var totalCnt = document.getElementById("totalCnt").value
		if (1 > totalCnt || totalCnt == null || totalCnt == '') {
			document.getElementById('paging').innerHTML = "";
			return;
		}
		var pageCnt = document.getElementById("pageCnt").value;
		var totalpage = Math.ceil(totalCnt / pageCnt);
		var curPage = document.getElementById("curPage").value;
		document.getElementById("totalCnt").value = totalCnt;
		document.getElementById("totalPage").value = totalpage;

		var pre = (curPage * 1) - 1;
		var next = (curPage * 1) + 1;
		paging = '<div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate"><ul class="pagination">';
		paging += "<li class='paginate_button previous disabled' id='datatable_previous'><a href='javascript:movePage(" + totalpage + "," + pre
				+ ");'aria-controls='datatable'>prev</a>";
		var loopCnt = 10;
		var i = 1;
		if (totalpage > 10) {
			loopCnt = 10;
		} else {
			loopCnt = totalpage;
		}
		if (curPage > 10) {
			var v1 = Math.ceil(curPage / 10);
			var v2 = Math.ceil(totalpage / 10);
			i = ((Math.ceil(curPage / 10) - 1) * 10) + 1;
			if (v1 == v2) {
				loopCnt = totalpage;
			} else {
				loopCnt = i + 9;
			}
		}
		for (i; i < loopCnt + 1; i++) {
			/* if (curPage == i) {
				paging = paging + '<li class="paginate_button active">' + i;
			} else { */
				paging = paging + '<li class="paginate_button active"><a href="javascript:movePage(' + totalpage
						+ "," + i + ');"' + 'aria-controls="datatable-buttons" tabindex="0" data-dt-idx="'+i+'">' + i + '</a></li>';
			//}
		}
		paging += "<li class='paginate_button previous disabled' id='datatable_previous'><a href='javascript:movePage(" + totalpage + "," + next
				+ ");' aria-controls='datatable'>next<span></span></a>";
		paging += "</div>";
		document.getElementById('paging').innerHTML = paging;
	}
	function setPageInfo(currentPage) {
		var stNum;
		var endNum;
		var pageCnt = document.getElementById("pageCnt").value;
		var currentCnt = currentPage;

		if (currentCnt == 1) {
			stNum = "1";
			endNum = pageCnt;
		} else {
			stNum = (1 * currentCnt - 1) * pageCnt + 1;
			endNum = (1 * stNum) + (1 * pageCnt) - 1;
		}
		document.getElementById("curPage").value = currentCnt;
		document.getElementById('stNum').value = stNum;
		document.getElementById('endNum').value = endNum;
	}
	function movePage(totalpage, pageNum) {
		if (pageNum < 1) {
			return;
		}
		if (pageNum > totalpage) {
			return;
		}
		document.getElementById('curPage').value = pageNum;
		
		var param = {"selectedPageNum": pageNum};
		$.ajax({
		    url: '/admin/board',
		    type: 'GET',
		    contentType: 'application/json; charset=utf-8',
		    data: param,
		    success: function(result) {
		        $('#board_list').html(result);
		    }
		});
	} 
</script>
<style>

</style>
<div class="right_col" role="main">
	<div class="">
		<div class="col-md-10 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>お知らせ</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
	<div class="table-responsive">
		<table class="table table-striped jambo_table bulk_action" id="boardList">
			<thead class="headings">
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>登録日</th>
				<th>備考</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${result}">
				<tr>
					<td>${item.noticeId }</td>
					<td><a href="<c:url value='/board/view?id=${item.noticeId }'/>">${item.noticeTitle }</a></td>
					<td><fmt:formatDate value="${item.registerDate }" type="time" pattern="yyyy/MM/dd" /></td>
					<td></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- paging -->
	<input type="hidden" name="pageCnt" id="pageCnt" value="10" /> <input
		type="hidden" name="curPage" id="curPage" value="${curPage}" /> <input
		type="hidden" name="stNum" id="stNum" value="1" /> <input
		type="hidden" name="endNum" id="endNum" value="5" /> <input
		type="hidden" name="totalCnt" id="totalCnt" value="${total}" /> <input
		type="hidden" name="totalPage" id="totalPage" value="" /> <span
		id="paging"></span>
	<!-- paging -->
</div>
</div>
</div>
</div>
</div>
<%@ include file="../admin/inc/admin_foot.jsp"%>