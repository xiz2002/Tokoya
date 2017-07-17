<!-- 
 * @Class Name : stylistmanagement.jsp
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
< %@include file="../sample/inc/head.jsp"  % > 
-->
<head></head>
<body>

	<div class="container">
		
		<div class="addstylistform">
		<form action="addstylistform" method="GET">
				<h2>スタイリスト追加</h2>
				<p>
				  <span>スタイリストID</span>
				  <input type="text" placeholder="stylistID">
				</p>
				<p>
				  <span>スタイリスト名</span>
				  <input type="text" placeholder="stylistname">
				</p>
				<!-- 各種ボタン -->
					<button type="submit" name="stylistadd">追加</button>
					<button type="submit" name="cansel">キャンセル</button>
			<!-- /page content -->
			<!-- footer 
			< %@include file="../sample/inc/foot.jsp"%>
			 /footer -->
			 </form>
		</div>
	</div>
	<!-- 
	< %@include file="../sample/inc/scripts.jsp"%>
	 -->
		</div>
	</div>
</body>
</html>