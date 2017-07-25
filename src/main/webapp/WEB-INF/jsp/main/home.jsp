<!-- 
 * @Class Name : home.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.16		Kim		最初作成
 * 
 * @author Kim
 * @since 2017.07.16
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../inc/header.jsp"%>

<!-- Datatables -->
<link href="<c:url value="/vendor/datatables.net-bs/css/dataTables.bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/vendor/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/vendor/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/vendor/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/vendor/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"/>" rel="stylesheet">

<!-- page content -->
<div class="clearfix"></div>
<div class="row">
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
								<th width="79px">No</th>
								<th width="281px">Title</th>
								<th width="79px" class="sorting_desc">登録日</th>
								<!-- <th>備考</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${result}">
								<tr>
									<td>${item.noticeId }</td>
									<td><a href="<c:url value='/board/view?id=${item.noticeId }'/>">${item.noticeTitle }</a></td>
									<td><fmt:formatDate value="${item.registerDate }" type="time" pattern="yyyy/MM/dd" /></td>
									<!-- <td></td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- paging -->
				<input type="hidden" name="pageCnt" id="pageCnt" value="10" /> 
				<input type="hidden" name="curPage" id="curPage"	value="${curPage}" /> 
				<input type="hidden" name="stNum" id="stNum" value="1" /> <input type="hidden" name="endNum" id="endNum" value="5" />
				<input type="hidden" name="totalCnt" id="totalCnt" value="${total}" />
				<input type="hidden" name="totalPage" id="totalPage" value="" />
				<span id="paging"></span>
				<!-- paging -->
			</div>
		</div>
	</div>
</div>
</div>
<!-- /page content -->
<script type="text/javascript">
	function writeForm() {
		$("#admin_body").load("/admin/board/write");
		history.pushState(null, null, "/admin/board/write");
	}
	$(function(){
		$("#boardList").DataTable({
			 "order": [[ 2, "desc" ]]
		});
	}); 
 	
</script>
<!-- Datatables -->
<script src="<c:url value="/vendor/datatables.net/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-bs/js/dataTables.bootstrap.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-buttons/js/dataTables.buttons.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-buttons/js/buttons.flash.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-buttons/js/buttons.html5.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-buttons/js/buttons.print.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-keytable/js/dataTables.keyTable.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-responsive-bs/js/responsive.bootstrap.js"/>"></script>
<script src="<c:url value="/vendor/datatables.net-scroller/js/dataTables.scroller.min.js"/>"></script>
<script src="<c:url value="/vendor/jszip/dist/jszip.min.js"/>"></script>
<script src="<c:url value="/vendor/pdfmake/build/pdfmake.min.js"/>"></script>
<script src="<c:url value="/vendor/pdfmake/build/vfs_fonts.js"/>"></script>
<%@ include file="../inc/footer.jsp"%>