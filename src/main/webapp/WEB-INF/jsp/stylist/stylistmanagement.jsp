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

<%@include file="../sample/inc/head.jsp"  %>
<body>

	<div class="container">
		
		<div class="stylistmanagementform">
			<h2>スタイリスト一覧</h2>
			<table>
				<!-- 表示項目 -->
				<tr>
					<th></th>
					<th>スタイリストID</th>
      				<th>スタイリスト名</th>
    			</tr>
    			<!-- 該当する値 -->
    			<tr>
    				<td>
    					<input type="checkbox" id="remember" value="remember"/>
    				</td>
      				<td>stylistID</td>
      				<td>stylistname</td>
    			</tr>
			</table>
				<!-- 各種ボタン -->
					<button type="submit" name="stylistinsert">追加</button>
					<button type="submit" name="stylistdelete">削除</button>
			<!-- /page content -->
			<!-- footer -->
			<%@include file="../sample/inc/foot.jsp"%>
			<!-- /footer -->
		</div>
	</div>
	<%@include file="../sample/inc/scripts.jsp"%>
</body>
</html>