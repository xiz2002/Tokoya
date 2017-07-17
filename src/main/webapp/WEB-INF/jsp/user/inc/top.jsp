<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage="" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<c:url value="/js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.10.4.custom.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login").on("click", function() {
			location.assign("/login");
		});
	});
</script>
<div>
	<div style="text-align: center;">ユーザーホーム</div>
	<div style="text-align: right;">
		<div>ようこそ ○○○ さん</div>
		<div>
			<input type="button" value="Log In" id="login" data-login="false" />
		</div>
	</div>
	<hr />
</div>