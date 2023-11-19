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
</head>
<body>
	<form action="insert" method = "post" enctype="multipart/form-data"> 
		<table class = "table table-bordered" style = "margin:100px 100px; width:500px;">
			<caption><b>회원전용 게시판</b></caption>
				<tr>
					<th width="120" bgcolor="#ddd">제목</th>
						<td>
							<input type = "text" name = "subject" class = "form-control" required="required" autofocus="autofocus">
						</td>
				</tr>
				
				<tr>
					<th width="120" bgcolor="#ddd">업로드</th>
						<td>
							<input type = "file" name = "upload" class = "form-control">
						</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<textarea style="width: 490px; height: 150px;" name = "content" class = "form-control" required="required"></textarea>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class = "btn btn-default">등록</button>
						<button type="button" class = "btn btn-default" onclick = "location.href='list'">목록</button>
					</td>
				</tr>
		</table>
	</form>
 </body>
</html>