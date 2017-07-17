<!-- 
 * @Class Name : reservationhistory.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * 
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 
< %@include file="../sample/inc/head.jsp"  %>
 -->
 <head></head>
<body>

	<div class="container">
		
		<div class="reservationhistoryform">
			<h2>予約リスト</h2>
			<!-- 予約リスト -->
			<table>
				<!-- 表示項目 -->
				<tr>
					<th></th>
					<th>予約時刻</th>
      				<th>総額</th>
      				<th>コース名</th>
      				<th>スタイリスト名</th>
      				<th>予約ステータス</th>
    			</tr>
    			<!-- 該当する値 -->
    			<tr>
    				<td>
    					<input type="checkbox" id="remember" value="remember"/>
    				</td>
      				<td>xx</td>
      				<td>price</td>
      				<td>corsename</td>
      				<td>stylistname</td>
      				<td>reservationstatus</td>
    			</tr>
			</table>
				<!-- 各種ボタン -->
				<button type="submit" name="reservationcancel">予約キャンセル</button>
				<button type="submit" name="cancel">戻る</button>
			<!-- /page content -->
			<!-- footer 
			< %@include file="../sample/inc/foot.jsp"%>
			 /footer -->
		</div>
	</div>
	<!-- 
	< %@include file="../sample/inc/scripts.jsp"%>
	 -->
		</div>
	</div>
</body>
</html>