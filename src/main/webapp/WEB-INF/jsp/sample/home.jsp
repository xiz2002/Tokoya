<!-- 
 * @Class Name : home.jsp
 * @Description : 
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2016.10.04		李多浩		最初作成
 * 
 * @author 李　多　浩
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head></head>
<body>
    <ul>
    <c:forEach var="item" items="${result}">
        <li>${item.userId}</li>
    </c:forEach>
    </ul>
</body>
</html>