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
<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script type="text/javascript">
	function writeForm() {
		$("#admin_body").load("/admin/board/write");
		history.pushState(null, null, "/admin/board/write");
	}
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
		paging = '<div class="uoss_paginate_complex">';
		paging += "<a href='javascript:movePage("
				+ totalpage
				+ ",1);'  class='direction prev'><span></span><span></span>prev end</a>";
		paging += "'<a href='javascript:movePage(" + totalpage + "," + pre
				+ ");' class='direction prev'><span></span> prev</a>&nbsp;";
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
			if (curPage == i) {
				paging = paging + '<strong>' + i + '</strong>&nbsp;';
			} else {
				paging = paging + '<a href="javascript:movePage(' + totalpage
						+ "," + i + ');" >' + i + '</a>&nbsp;';
			}
		}
		paging += "<a href='javascript:movePage(" + totalpage + "," + next
				+ ");' class='direction next'>next <span></span></a>&nbsp;";
		paging += "<a href='javascript:movePage("
				+ totalpage
				+ ","
				+ totalpage
				+ ");' class='direction next'>next end <span></span><span></span> </a>&nbsp;";
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
<div class="col-md-12 col-sm-12 col-xs-12">
<div id="x_content">
	<div>
		<table id="datatable" class="table table-striped table-bordered dataTable no-footer">
			<thead>
			<tr role="row">
				<th class="sorting_asc">No</th>
				<th class="sorting">Title</th>
				<th class="sorting">登録日</th>
				<th class="sorting">備考</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${result}">
				<tr role="row" class="even">
					<td>${item.noticeId }</td>
					<td><a href="<c:url value='/board/view?id=${item.noticeId }'/>">${item.noticeTitle }</a></td>
					<td><fmt:formatDate value="${item.registerDate }" type="time"
							pattern="yyyy/MM/dd" /></td>
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
	<c:choose>
	<c:when test="${sessionScope.userInfo.userIsAdmin == 1}">
	<div>
		<a href="javascript:void(0);" onclick="writeForm()" id="write">登録</a>
	</div>
	</c:when>
	</c:choose>
</div>
</div>
