<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage="" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
<script type="text/javascript">
$(function(){
	$("#login").on("click", function(){
		location.assign("/login");
	});
	$("#userId").append("Guest");	
});
</script>
<div>
	<div style="text-align: center;"><a href="/home">ユーザーホーム</a></div>
	<div style="text-align: right;">
		<div>ようこそ
		<span id="userId"></span> 
		 さん
		</div>
		<div>
			<input type="button" value="Log In" id="login"/>
		</div>
	</div>
	<hr />
</div>