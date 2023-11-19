<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>    
<%@ taglib prefix = "tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
	body{
		font-size : 1.3em;
		font-family: 'Noto Sans KR';
	}
	
	div.layout div{
		border: none;
	} 
	
	div.layout div.title{
		position: absolute;
		top: 10px;
		left: 400px;
		height: 200px;
	}
	
	div.layout div.menu{
		position: absolute;
		top: 150px;
		left: 300px;
		width:1200px;
		height: 100px;
	}
	
	div.layout div.main{
		position: absolute;
		top: 250px;
		left: 300px;
		width:1000px;
		height: 800px;
	}
	
 </style>  
</head>
<body>
	<div class = "layout">
		<div class = "title">
			<tiles:insertAttribute name = "title2"/>
		</div>
		<div class = "menu">
			<tiles:insertAttribute name = "menu2"/>
		</div>
		
		<div class = "main">
			<tiles:insertAttribute name = "main"/>
		</div>
	</div>
</body>
</html>