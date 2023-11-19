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
	color:gray;
	margin-left: 50px;
	margin-right: 30px;
	font-size: 0.9em;
}

.amod,.adel{
	cursor: pointer;
	font-size: 0.7em;
	color: gray;
}
</style>    
<script type="text/javascript">
$(function(){
	
	//num값은 전역변수로 선언
	num = $("#num").val();
	loginok="${sessionScope.loginok}";
	myid="${sessionScope.myid}";
	
	//alert(loginok + "," + myid);
	
	list();
	
	
	//insert
	$("#btnansweradd").click(function(){
		
		var content = $("#content").val(); //content 값 넘기기
		
		if(content.trim().legnth==0){
			alert("댓글을 입력해 주세요");
			return;
		}
		
		
		//입력했을시 ajax
		$.ajax({
			type:"post",
			dataType:"html",
			url:"ainsert",
			data:{"num":num,"content":content},
			success:function(){
				//alert("성공");
				
				
				list();
				//입력값 지우기
				$("#content").val("");
			}
		});
	});
	
	
	
	//delete
	$(document).on("click","span.adel",function(){
		var idx = $(this).attr("idx");
		//alert(idx);
		var ans = confirm("해당 댓글을 삭제할까요?");
		
		if(ans){
			$.ajax({
				type:"get",
				dataType:"text",
				url:"adelete",
				data:{"idx":idx},
				success:function(){
					list();
				}
			});
		}
	});
	
	//수정창띄우기
	$(document).on("click","span.amod",function(){
		idx = $(this).attr("idx"); //전역변수 설정
		//alert(idx);
		$.ajax({
			type:"get",
			dataType:"json",
			url:"updateAnswer",
			data:{"idx":idx},
			success:function(res){
				$("#editname").val(res.name);
				$("#editcontent").val(res.content);
			}
		});
		
	});
	//수정
	$("#btnupdate").click(function(){
		alert("수정");
		var name = $("#editname").val();
		var content = $("#editcontent").val();
		
		$.ajax({
			type:"post",
			dataType:"text",
			url:"aupdate",
			data:{"idx":idx,"name":name,"content":content},
			success:function(){
				location.reload();
			}
		});
	});
});

//사용자 함수 list
function list()
{
	$.ajax({
		
		type:"get",
		dataType:"json",
		url:"alist",
		data:{"num":num},
		success:function(res){
			$("span.acount").text(res.length);
			
			var s="";
			
			$.each(res,function(i,dto){
				s+="<b>" + dto.name + "</b>:" + dto.content;
				s+="<span class='day'>" + dto.writeday + "</span>";
				
				if(loginok=='yes' && myid==dto.myid){
					s+="<span class='glyphicon glyphicon-pencil amod' data-toggle='modal' data-target='#AnswerUpdate' idx='"+dto.idx+"'></span>";
					s+="&nbsp";
					s+="<span class='glyphicon glyphicon-remove adel' idx='"+dto.idx+"'></span>";
				}
				s+="<br>";
			});
			
			$("div.alist").html(s);
		}
		
	});
}

</script> 
    
</head>
<body>
	<table class = "table table-bordered" style = "width:600px;">
		<tr>
			<td>
				<h3><b>${dto.subject }</b>
					<span style = "color:gray; float: right; font-size:14px;"><fmt:formatDate value = "${dto.writeday }" pattern = "yyyy-MM-dd HH:mm"/></span>
				</h3>
			<span>작성자: ${dto.name }(${dto.myid })</span>
			
			<c:if test="${dto.uploadfile!='no' }">
				<span style = "float:right;">
					<a href = "download?clip=${dto.uploadfile }">
						<span class = "glyphicon glyphicon-download-alt"></span>
						
						<b>${dto.uploadfile }</b>
					</a>				
				</span>
			</c:if>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${bupload==true }">
					<h3>업로드 파일이 이미지입니다</h3>
					<img src = "../photo/${dto.uploadfile }" style = "max-width: 400px;">
				</c:if>
				
				<br><br>
				<pre style="background-color: #fff; border:0px;">
					${dto.content }
				</pre>
				<br>
				<b>조회: ${dto.readcount }</b>&nbsp;&nbsp;&nbsp;
				<b>댓글<span class="acount"></span></b>
			</td>
		</tr>
		
		<tr>
			<td>
			<!-- 리스트 출력 -->
				<div class = "alist"></div>
				<c:if test="${sessionScope.loginok!=null }">
					<div class = "aform">
						<div class = "form-inline">
						<input type="hidden" id="num" value="${dto.num }"> 
							<input type = "text" class = "form-control" placeholder="댓글을 입력해주세요"
							id = "content" style = "width: 500px;">
							<button type = "button" class = "btn btn-info" style = "width: 60px;"
							id="btnansweradd">등록</button>
						</div>
					</div>
				</c:if>
				
			</td>
		</tr>
		
		<div class="container">
		
			<!-- 댓글수정창 -->
			<!-- Modal -->
			<div class="modal fade" id="AnswerUpdate" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
				
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원 수정</h4>
					</div>
					
					
					<div class="modal-body">
					<form method="post" name="updateAnswer">
					<input type="hidden" name = "num">
						<input type="text" id = "editname">
							
						<input type="text" id = "editcontent">
							
					</form>
					</div>
					
					<div class="modal-footer">
							<button type="button" class="btn btn-default" id = "btnupdate">수정</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
					</div>
					</div>
					</div>
					</div>
		
		
		<!-- 버튼들 -->
		
		<tr>
			<td align = "right">
				<!-- 글쓰기는 로그인 중일때만 -->
				<c:if test="${sessionScope.loginok!=null }">
				<button type = "button" class = "btn btn-default" onclick = "location.href='form'" style="width: 80px;">글쓰기</button>
				</c:if>
				<button type = "button" class = "btn btn-default" onclick = "location.href='list?currentPage=${currentPage}'" style="width: 80px;">목록</button>
				
				<!-- 로그인중이면서 자기글만 수정,삭제 버튼 보이게 -->
				<c:if test="${sessionScope!=null and sessionScope.myid==dto.myid }">
				<button type = "button" class = "btn btn-default" onclick = "location.href='updateform?num=${dto.num}&currentPage=${currentPage }'" style="width: 80px;">수정</button>
				<button type = "button" class = "btn btn-default" onclick = "location.href='delete?num=${dto.num}&currentPage=${currentPage }'" style="width: 80px;">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>