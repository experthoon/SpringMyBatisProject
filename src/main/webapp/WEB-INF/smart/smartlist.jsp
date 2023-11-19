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
<h3 class = "alert alert-info">${totalCount }개의 상품이 등록되었습니다.</h3>

<button type = "button" class = "btn btn-info"
onclick="location.href='form'">상품추가</button>
<!-- 번호    상품명    색상    가격    입고일 -->
<table class = "table table-bordered" style = "width:600px;">
	<caption><b>상품목록</b></caption>
	<tr bgcolor="#add8e6">
		<th width="80">번호</th>
		<th width="180">상품명</th>
		<th width="100">색상</th>
		<th width="120">가격</th>
		<th width="180">입고일</th>
	</tr>

	<c:forEach var="dto" items = "${list }">
		<tr>
			<td>${no }</td>
			<c:set var = "no" value = "${no-1 }"/>
			
			<td>
				<a href = "detail?num=${dto.num }&currentPage=${currentPage}">${dto.sangname }</a>
			</td>
			<td>${dto.color }</td>
			<td>${dto.price }</td>
			<td>${dto.ipgoday }</td>
		</tr>
	</c:forEach>

</table>

 <!-- 페이징 -->
        <c:if test="${totalCount>0 }">
            <div style="width:800px; text-align: center;">
                <ul class="pagination">
                    <!-- 이전 -->
                    <c:if test="${startPage>1 }">
                        <li>
                            <a href="list?currentPage=${startPage-1 }">이전</a>
                        </li>
                    </c:if>
                    
                    <c:forEach var="pp" begin="${startPage }" end="${endPage }">
                        <c:if test="${currentPage==pp }">
                            <li class="active">
                                <a href="list?currentPage=${pp }">${pp }</a>
                            </li>
                        </c:if>
                        
                        <c:if test="${currentPage!=pp }">
                            <li>
                                <a href="list?currentPage=${pp }">${pp }</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <!-- 다음 -->
                    <c:if test="${endPage<totalPage }">
                        <li>
                            <a href="list?currentPage=${endPage+1 }">다음</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </c:if>


</body>
</html>