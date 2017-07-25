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
	$(function(){
	$("#boardList").DataTable();
	}); 
 	
</script>
<style>

</style>
<div class="right_col" role="main">
	<div class="">
		<div class="col-md-12 col-sm-12 col-xs-12">
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
 <!-- Datatables -->
    <script src="../vendor/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendor/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendor/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendor/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendor/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendor/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendor/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendor/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendor/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="../vendor/jszip/dist/jszip.min.js"></script>
    <script src="../vendor/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendor/pdfmake/build/vfs_fonts.js"></script>