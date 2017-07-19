<!-- 
 * @Class Name : home.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2016.10.04		内山　佳美		最初作成
 * 
 * @author 李　多　浩
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>

<body>
<%@include file="../user/inc/top.jsp"%>
<div id="body" style="margin-left:500px;">
<div>
<c:forEach var="item" items="${result }">
NoticeId : ${item.noticeId } <br/>
タイトル : ${item.noticeTitle } <br/>
内容 : ${item.noticeBody } <br/>
登録日　：　<fmt:formatDate value="${item.registerDate }" type="time" pattern="yyyy-MM-dd" /> <br/>
</c:forEach>
<div>
<a href="/home">ホーム</a>
</div>
</div>
</div>
</body>

</html>