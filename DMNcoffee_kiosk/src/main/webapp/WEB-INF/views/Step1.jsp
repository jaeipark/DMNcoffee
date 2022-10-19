<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DMN</title>
<link rel="shortcut icon" type="image/x-icon" href="image/utility/버튼.png"><!-- 타이틀 이미지 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet"><!-- 폰트 링크 -->
<link rel="stylesheet" href="css/Step1.css?ver=1"/><!-- css 링크 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$.ajax({
		url : "PaymentHistory",
		type : "get",
		success : function(result){
			$("#pay").html(result);
			}//pay 화면
		});
	
	$("#next").on("click", function() {
		location.href="Step2";
	});
	
	$("#prev").on("click", function() {
		location.href="Order";
	});
	
	$(".btn1").on("click", function() {
		location.href="MemberLookupAndJoin";
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
		<jsp:include page="common/step1.jsp" flush="true"></jsp:include>
	<table class="question">
		<tr>
			<td>적립하시겠습니까?</td>
		</tr>
		<tr>
			<td class="txt">회원이 아니면 [회원가입]을, 적립을 원하지 않으시면 결제를 진행해 주세요.</td>
		</tr>
	</table>
	<table class="member">
		<tr>
			<td><button class="btn1">번호<br>조회</button></td>
			<td><button class="btn1">회원<br>가입</button></td>
		</tr>
	</table>
	
	<div id="pay"></div>
	
	<div class="bottom">
		<table>
			<tr>
				<td><button class="btn2" id="cancel">전체취소</button></td>
				<td><button class="btn2" id="prev">이전</button></td>
				<td><button class="btn2" id="next">다음</button></td>
			</tr>
		</table>
	</div>
</body>
</html>