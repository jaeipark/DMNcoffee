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
<link rel="stylesheet" href="css/Step2.css?ver=1"/><!-- css 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet"><!-- 폰트 링크 -->
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
	
	$("#prev").on("click", function() {
		location.href="Step1";
	});
	
	$("#next").on("click", function() {
		location.href="Payment";
	});
	
	$("#card").on("click", function() {
		location.href="Payment";
	});
	
})	
</script>
</head>
<body>
	<header>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</header>
		<jsp:include page="common/step2.jsp" flush="true"></jsp:include>
	<table class="question">
		<tr>
			<td>결제방식을 선택해주세요</td>
		</tr>
		<tr>
			<td style="font-size: 20px;">카드결제 또는 다음을 클릭하시면 결제창으로 이동합니다</td>
		</tr>
	</table>
	<table class="member">
		<tr>
			<td><button class="btn1" id="card">카드<br>결제</button></td>
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