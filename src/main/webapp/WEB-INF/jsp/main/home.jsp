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
<!-- page content -->
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					Default Example <small>Users</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false"><i class="fa fa-wrench"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Settings 1</a></li>
							<li><a href="#">Settings 2</a></li>
						</ul></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<p class="text-muted font-13 m-b-30">
					DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call
					the construction function:
					<code>$().DataTable();</code>
				</p>
				<div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-6">
							<div class="dataTables_length" id="datatable_length">
								<label>Show <select name="datatable_length" aria-controls="datatable" class="form-control input-sm"><option
											value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option></select> entries
								</label>
							</div>
						</div>
						<div class="col-sm-6">
							<div id="datatable_filter" class="dataTables_filter">
								<label>Search:<input type="search" class="form-control input-sm" placeholder=""
									aria-controls="datatable"></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="datatable" class="table table-striped table-bordered dataTable no-footer" role="grid"
								aria-describedby="datatable_info">
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
						<div class="col-sm-5">
							<div class="dataTables_info" id="datatable_info" role="status" aria-live="polite">Showing 51 to 57 of 57
								entries</div>
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate">
								<ul class="pagination">
									<li class="paginate_button previous" id="datatable_previous"><a href="#" aria-controls="datatable"
										data-dt-idx="0" tabindex="0">Previous</a></li>
									<li class="paginate_button "><a href="#" aria-controls="datatable" data-dt-idx="1" tabindex="0">1</a></li>
									<li class="paginate_button "><a href="#" aria-controls="datatable" data-dt-idx="2" tabindex="0">2</a></li>
									<li class="paginate_button "><a href="#" aria-controls="datatable" data-dt-idx="3" tabindex="0">3</a></li>
									<li class="paginate_button "><a href="#" aria-controls="datatable" data-dt-idx="4" tabindex="0">4</a></li>
									<li class="paginate_button "><a href="#" aria-controls="datatable" data-dt-idx="5" tabindex="0">5</a></li>
									<li class="paginate_button active"><a href="#" aria-controls="datatable" data-dt-idx="6" tabindex="0">6</a></li>
									<li class="paginate_button next disabled" id="datatable_next"><a href="#" aria-controls="datatable"
										data-dt-idx="7" tabindex="0">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- /page content --> <%@ include file="../inc/footer.jsp"%>