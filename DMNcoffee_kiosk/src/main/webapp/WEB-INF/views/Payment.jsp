<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String phone2 = (String)request.getAttribute("phone2");
	String phone3 = (String)request.getAttribute("phone3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DMN</title>
<link rel="shortcut icon" type="image/x-icon" href="image/utility/버튼.png"><!-- 타이틀 이미지 링크 -->
<link rel="stylesheet" href="css/Payment.css?ver=1"/><!-- css 링크 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#next").on("click", function() {
		if(<%=phone2%>!= null && <%=phone3%> != null){
			location.href="OrderConfirmation?phone2="+<%=phone2%>+"&phone3="+<%=phone3%>;
		}else{
			location.href="OrderConfirmation";
		}
	});
	
	$("#card").on("click", function() {
		if(<%=phone2%>!= null && <%=phone3%> != null){
			location.href="OrderConfirmation?phone2="+<%=phone2%>+"&phone3="+<%=phone3%>;
		}else{
			location.href="OrderConfirmation";
		}
	});
	
	$("#cancel").on("click",function(){
		Swal.fire({
			  icon: 'warning',
			  title: '메인페이지로 돌아가시겠습니까?',
			  showCancelButton:true,
			  confirmButtonColor: "#6495ED",
			  cancelButtonColor: "#f1f3f5",
			  confirmButtonText:"네",
			  cancelButtonText:"아니오"
			}).then(result=>{
				if(result.isConfirmed){
					location.href="Main";
				}
			});
	});
})	
</script>
</head>
<body>
	<header>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</header>
	
<table class="head">
	<tr>
		<td align="center">카드 결제</td>
	</tr>
</table>
<table class="body">
	<tr>
		<td align="center">카드를 삽입해주세요</td>
	</tr>
	<tr>
		<td align="center"><img class="card_insert" id="card" src="image/utility/card_insert.png"></td>
	</tr>
</table>
<table class="tail">
	<tr>
		<td align="center"><button class="btn1" id="cancel">취소</button></td>
		<td align="center"><button class="btn1" id="next">다음</button></td>
	</tr>
</table>
</body>
</html>