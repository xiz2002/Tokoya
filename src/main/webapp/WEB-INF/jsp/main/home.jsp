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
				<h2>
					Default Example <small>Users</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-6">
							<div id="datatable_filter" class="dataTables_filter">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="datatable" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="datatable_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending" style="width: 174px;">Name</th>
										<th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending" style="width: 281px;">Position</th>
										<th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending" style="width: 128px;">Office</th>
										<th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending" style="width: 66px;">Age</th>
										<th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1"
											aria-label="Start date: activate to sort column ascending" style="width: 128px;">Start date</th>
										<th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1"
											aria-label="Salary: activate to sort column ascending" style="width: 97px;">Salary</th>
									</tr>
								</thead>
								<tbody>
									<tr role="row" class="odd">
										<td class="sorting_1">Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
										<td>2011/04/25</td>
										<td>$320,800</td>
									</tr>
									<tr role="row" class="even">
										<td class="sorting_1">Timothy Mooney</td>
										<td>Office Manager</td>
										<td>London</td>
										<td>37</td>
										<td>2008/12/11</td>
										<td>$136,200</td>
									</tr>
									<tr role="row" class="odd">
										<td class="sorting_1">Unity Butler</td>
										<td>Marketing Designer</td>
										<td>San Francisco</td>
										<td>47</td>
										<td>2009/12/09</td>
										<td>$85,675</td>
									</tr>
									<tr role="row" class="even">
										<td class="sorting_1">Vivian Harrell</td>
										<td>Financial Controller</td>
										<td>San Francisco</td>
										<td>62</td>
										<td>2009/02/14</td>
										<td>$452,500</td>
									</tr>
									<tr role="row" class="odd">
										<td class="sorting_1">Yuri Berry</td>
										<td>Chief Marketing Officer (CMO)</td>
										<td>New York</td>
										<td>40</td>
										<td>2009/06/25</td>
										<td>$675,000</td>
									</tr>
									<tr role="row" class="even">
										<td class="sorting_1">Zenaida Frank</td>
										<td>Software Engineer</td>
										<td>New York</td>
										<td>63</td>
										<td>2010/01/04</td>
										<td>$125,250</td>
									</tr>
									<tr role="row" class="odd">
										<td class="sorting_1">Zorita Serrano</td>
										<td>Software Engineer</td>
										<td>San Francisco</td>
										<td>56</td>
										<td>2012/06/01</td>
										<td>$115,000</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- /page content -->
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