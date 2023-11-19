<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- <div class = "searcharea" style = "width:800px; margin: 10px 100px;">
   검색창
   
   <form action="list" class="form-inline" style ="width:600px; margin-left: 100px;">
      <div>
         <select class="form-control" style = "width:150px;" name = "searchcolumn">
            <option value="subject">제목</option>
            <option value = "name">작성자</option>
            <option value = "content">내용</option>
         </select>
         &nbsp;&nbsp;&nbsp;&nbsp;
         <input type = "text" name = "searchword" class = "form-control" style = "width:200px;" placeholder="검색어를 입력하세요">
         <button type = "submit" class="btn btn-success">검색</button>
      </div>      
   </form>
   </div> -->

	<div class = "searcharea" style = "width:800px; margin: 10px 100px;">
		<form action = "list" class = "form-inline" style = "width:600px; margin-left:100px;">
			<div>
				<select class = "form-control" style ="width:150px;" name = "searchcolumn">
					<option value = "subject">제목</option>
					<option value = "name">작성자</option>
					<option value = "content">내용</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<input type = "text" name = "searchword" class = "form-control" style = "width:200px;" placeholder="검색어를 입력하세요">
				<button type = "submit" class = "btn btn-success">검색</button>
			</div>
		</form>
	</div>


   <c:if test="${sessionScope.loginok!=null }">
      <button type="button" class="btn btn-info" onclick="location.href='form'">글쓰기</button>
   </c:if>
   
   <br><br>
   
   <table class="table table-bordered" style="width: 600px;"> 
      <tr bgcolor="#ffcc0cb">
         <th>번호</th>
         <th>작성자</th>
         <th width="200">제목</th>
         <th>조회</th>
         <th>등록일</th>
         <th>댓글</th>
      </tr>
      
      <c:if test="${totalCount==0 }">
         <tr>
            <td colspan="5" align="center">
               <h3><b>등록된 게시글이 없습니다</b></h3>
            </td>
         </tr>
      </c:if>
      
      
      <c:if test="${totalCount!=0 }">
         <c:forEach var="dto" items="${list }" varStatus="i">
            <tr>
               <td>
               <c:if test="${dto.relevel!=0 }">
               	<c:forEach begin="1" end ="${dto.relevel }" step ="1">&nbsp;&nbsp;</c:forEach>
               	└
               </c:if>
               ${no}</td>
               <c:set var="no" value="${no-1 }"/>
               <td>${dto.name }</td>
               <td>
                  <a href="content?num=${dto.num }">
                     ${dto.subject }&nbsp;
                     <c:if test="${dto.photo!='no' }">
                        <span class="glyphicon glyphicon-picture"></span>
                     </c:if>
                  </a>
               </td>
               <td>${dto.readcount }</td>
               <td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
               <td><button type = "button" id = "btncomment" onclick="location.href='form?num=${dto.num }&currentPage=${currentPage}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}'">댓글</button></td>
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