<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.dto.MemberDTO"%>
 <%
 	MemberDTO mdto = (MemberDTO)request.getAttribute("memberInfo");
 	
 	String phone1 = mdto.getPhone1();
 	String phone2 = mdto.getPhone2();
 	String phone3 = mdto.getPhone3();
 	int mempoint = mdto.getMempoint();
 	String stampCheck = mdto.getStampcheck();
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DMN</title>
<link rel="shortcut icon" type="image/x-icon" href="image/utility/버튼.png"><!-- 타이틀 이미지 링크 -->
<link rel="stylesheet" href="css/Step2_M.css?ver=2"/><!-- css 링크 -->
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
	
	$("#next").on("click",function(){
		var phone2 = document.getElementById("phone2").value;
		var phone3 = document.getElementById("phone3").value;
		
		if($("#discountprice").val() == 0){
			location.href="OrderConfirmation_Member?phone2="+phone2+"&phone3="+phone3;
		}else{
			location.href="Payment?phone2="+phone2+"&phone3="+phone3;
		}
	});
	
	$("#card").on("click",function(){
		var phone2 = document.getElementById("phone2").value;
		var phone3 = document.getElementById("phone3").value;
		
		if($("#discountprice").val() == 0){
			location.href="OrderConfirmation_Member?phone2="+phone2+"&phone3="+phone3;
		}else{
			location.href="Payment?phone2="+phone2+"&phone3="+phone3;
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
	var openWin;
	
	function stampEvent() {
		openWin = window.open("StampEvent","StampEvent","width=450,height=700,resizable=no,scrollbars=no,top=200,left=740");
		
		var phone2 = document.getElementById("phone2").value;
		var phone3 = document.getElementById("phone3").value;
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</header>
		<jsp:include page="common/step2.jsp" flush="true"></jsp:include>
	<table class="question">
		<tr>
			<td>안녕하세요?</td>
		</tr>
		<tr>
			<td>
				<input type="text" class="phoneNum" id="phone1" value="<%= phone1 %>" readonly="readonly">-
				<input type="text" class="phoneNum" id="phone2" value="<%= phone2 %>" readonly="readonly">-
				<input type="text" class="phoneNum" id="phone3" value="<%= phone3 %>" readonly="readonly">님
			</td>
		</tr>
	</table>
	<table class="member">
		<tr>
			<td><button class="btn1" id="card">카드<br>결제</button></td>
			<td><button class="btn1" onclick="stampEvent()">쿠폰<br>결제</button></td>
		</tr>
	</table>
	
	<div id="pay"></div>
	
	<div class="bottom">
		<table>
			<tr>
				<td><button class="btn2" id="cancel">전체취소</button></td>
				<td><button class="btn2" onclick="location.href='Step1';">이전</button></td>
				<td><button class="btn2" id="next">다음</button></td>
			</tr>
		</table>
	</div>
</body>
</html>