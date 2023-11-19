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
	<c:if test="${sessionScope.loginok!=null }">
		<button type = "button" class = "btn btn-info" style="width: 100px; margin-left: 900px;" onclick="location.href='form'">글쓰기</button>
	</c:if>
	
	<br><br>
	
	<table class = "table table-bordered" style = "width:1000px;">
		<tr bgcolor="#ffc0cb">
			<th width = "60">번호</th>
			<th width = "160">작성자</th>
			<th width = "460">제목</th>
			<th width = "80">조회</th>
			<th width = "160">등록일</th>
		</tr>
		
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="5" align="center">
					<h3><b>등록된 게시글이 없습니다.</b></h3>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${totalCount>0 }">
			<c:forEach var ="a" items="${list }">
				<tr>
					<td align="center">${no }</td>
						<c:set var = "no" value = "${no-1 }"/>
						
					<td>
						<a href = "content?num=${a.num }&currentPage=${currentPage}" style = "color:black;">
							${a.subject }
							
							<!-- 댓글개수추가 -->
							<c:if test="${a.acount>0 }">
							<a href = "content?num=${a.num }&currentPage=${currentPage}" style ="color:red;">[${a.acount }]</a>
							</c:if>
							
								<c:if test="${a.uploadfile!='no' }">
									<span class ="glyphicon glyphicon-paperclip" style = "color:gray;"></span>
								</c:if>
						</a>
					</td>	
					<td align="center">${a.name }</td>
					<td align="center">${a.readcount }</td>
					<td align="center">
					<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd"/>
					</td>
					
					
				</tr>
			
			
			</c:forEach>
		</c:if>
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