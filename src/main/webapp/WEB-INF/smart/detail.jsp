<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<style type="text/css">
.day{
	color: gray;
	font-size: 14px;
	float:right;
}

.box{
	width: 30px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 100px;
	float: right;
}
</style>    
</head>
<body>
	<div style="width: 600px; margin: 100px 100px;">
		<b style = "font-size: 30px;">${dto.sangname }</b>
		<span>입고일: ${dto.ipgoday }</span>
		<br><br>
		<b style = "font-size:18px;">
			<fmt:formatNumber value="${dto.price }" type = "currency"/>
		</b>
		<b style="float:right; font-size:14px;">${dto.color }</b>
		<div class = "box" style="background-color: ${dto.color}"></div>
		<br><br>
		<hr>
		${dto.content }
		<br><br>
		<div style ="float:right;">
		<button type = "button" class = "btn btn-danger"
		onclick="location.href=''">삭제</button>
		
		<button type = "button" class = "btn btn-danger"
		onclick="location.href='list?currentPage=${currentPage}'">목록</button></div>
	</div>
</body>
</html>