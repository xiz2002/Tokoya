<!-- 
 * @Class Name : ReservationCheck.jsp
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		Kim				最初作成
 * @		2017.07.17		Lee				予約確認内容追加
 * @author Kim
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../inc/header.jsp" %>
<!-- page content -->
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_content">
				<section class="content invoice">
				<form id="frm">
					<!-- title row -->
					<div class="row">
						<div class="col-xs-12 invoice-header">
							<h1>
								<i class="fa fa-globe"></i>
								予約確認.
								<jsp:useBean id="now" class="java.util.Date" />
								<small class="pull-right">Date: <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></small>
							</h1>
						</div>
						<!-- /.col -->
					</div>
					<!-- info row -->
					<div class="row invoice-info">
						<div class="col-sm-4 invoice-col">
							From
							<address>
								<strong>Tokoya, Inc.</strong><!--  <br>795 Freedom Ave, Suite 600 <br>New York, CA 94107 <br>Phone:
								1 (804) 123-9876 <br>Email: ironadmin.com -->
							</address>
						</div>
						<!-- /.col -->
						<div class="col-sm-4 invoice-col">
							To
							<address>
								<strong>${sessionScope.userInfo.userName}</strong><!--  <br>795 Freedom Ave, Suite 600 <br>New York, CA 94107 <br>Phone: 1
								(804) 123-9876 <br>Email: jon@ironadmin.com -->
							</address>
						</div>
						<!-- /.col -->
						<div class="col-sm-4 invoice-col">
							<!-- <b>Invoice #007612</b> <br> <br> <b>Order ID:</b> 4F3S8J <br> <b>Payment Due:</b> 2/22/2014 <br>
							<b>Account:</b> 968-34567 -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- Table row -->
					<div class="row">
						<div class="col-xs-12 table">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>コース</th>
										<th>コース時間</th>
										<th>予約日</th>
										<th>予約時間</th>
										<th>スタイリスト</th>
										<th>金額</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${result.courseName}</td>
										<td>${result.courseTime}:00</td>
										<td>${result.reservationDate}</td>
										<td>${result.reservationStartTime}:00</td>
										<td>${result.stylistName}</td>
										<td>￥ ${result.coursePrice}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<div class="row">
						<!-- accepted payments column -->
						<div class="col-xs-6">
							<p class="lead">Payment Methods:</p>
							<img src=<c:url value="/images/visa.png"/> alt="Visa"> 
							<img src=<c:url value="/images/mastercard.png"/> alt="Mastercard">
							<img src=<c:url value="/images/american-express.png"/> alt="American Express">
							<img src=<c:url value="/images/paypal.png"/> alt="Paypal">
							<p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">＊予約キャンセルは前日まで</p>
						</div>
						<!-- /.col -->
						<div class="col-xs-6">
							<p class="lead">Amount <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></p>
							<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr>
											<th style="width: 50%">Subtotal:</th>
											<td>￥ ${result.coursePrice}</td>
										</tr>
										<tr>
											<th>Tax (8.0%)</th>
											<c:set var="tax" value="${result.coursePrice*0.08}" />
											<td>￥ ${tax}</td>
										</tr>
										<tr>
											<th>Total:</th>
											<td>￥ ${result.coursePrice + tax}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
					<input type="hidden" id="userId" name="userId" value="${result.userId}"/>
					<input type="hidden" id="userName" name="userName" value="${result.userName}"/>
					<input type="hidden" id="courseId" name="courseId" value="${result.courseId}"/>
					<input type="hidden" id="courseName" name="courseName" value="${result.courseName}"/>
					<input type="hidden" id="coursePrice" name="coursePrice" value="${result.coursePrice}"/>
					<input type="hidden" id="courseTime" name="courseTime" value="${result.courseTime}"/>
					<input type="hidden" id="reservationDate" name="reservationDate" value="${result.reservationDate}"/>
					<input type="hidden" id="reservationStartTime" name="reservationStartTime" value="${result.reservationStartTime}"/>
					<input type="hidden" id="stylistId" name="stylistId" value="${result.stylistId}"/>
					<input type="hidden" id="stylistName" name="stylistName" value="${result.stylistName}"/>
					</form>

					<!-- this row will not appear when printing -->
					<div class="row no-print">
						<div class="col-xs-12">
							<!-- <button class="btn btn-default" onclick="window.print();"><i class="fa fa-print"></i> Print</button> -->
							<button class="btn btn-danger pull-right" style="margin-right: 5px;" id="btnCancel"><i class="fa fa-download"></i>キャンセル</button>
							<button class="btn btn-success pull-right" id="btnChkOut"><i class="fa fa-credit-card"></i>予約確定</button>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div id="dialog-message-success" title="予約完了">
		<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		予約を完了しました。<br>
		ホーム画面に戻ります。
		</p>
	</div>
	<div id="dialog-message-fail" title="予約失敗">
		<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		予約を失敗しました。<br>
		ホーム画面に戻ります。<br>
		<b>管理者に話してください。</b>
		</p>
	</div>
</div>
</div>
<script>
	$(document).ready(function(){ 
		$('#dialog-message-success').dialog({
			autoOpen: false,
			resizable: false,
			modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
					location.replace('/'); 
				}
			}
		});
		$('#dialog-message-fail').dialog({
			autoOpen: false,
			resizable: false,
			modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
					location.replace('/');
				}
			}
		});
		$('#btnChkOut').click(function(e) {
			var formData = $("#frm").serialize();
			$.ajax({
				type:"POST",
				url:"<c:url value='/reservation/checkout'/>",
				data : formData,
				dataType : "json",
				error: function() {
					$('#dialog-message-fail').dialog('open');
				},
				success : function() {
					$( "#dialog-message-success" ).dialog('open');
				}
			});
		});
		$('#btnCancel').click(function(e) {
			location.replace('/');
		});
	});
</script>
<%@ include file="../inc/footer.jsp" %>