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
	
	int column = mempoint % 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DMN</title>
<link rel="shortcut icon" type="image/x-icon" href="image/utility/버튼.png"><!-- 타이틀 이미지 링크 -->
<link rel="stylesheet" href="css/StampCheck.css?ver=2"/><!-- css 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet"><!-- 폰트 링크 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".btn1").on("click",function(){
		$("button:focus").css("background-color", "#f1f3f5");
		$("button:not(:focus)").removeAttr("style");
	});
	
	$.ajax({
		url : "common/benefits",
		dataType : "html",
		success : function(result) {
			$(".contents").html(result);
		}
	});
	
	$("#benefits").on("click",function(){
		$.ajax({
			url : "common/benefits",
			dataType : "html",
			success : function(result) {
				$(".contents").html(result);
			}
		})
	});
	
	$("#history").on("click",function(){
		$.ajax({
			url : "MemberHistorySelect",
			dataType : "html",
			data : "phone2=<%=phone2%>&phone3=<%=phone3%>",
			success : function(result) {
				$(".contents").html(result);
			}
		});
	});
	
	$("#close").on("click",function(){
		window.close();
	});
	
	$("#stampCheck").on("click",function(){
		var phone2 = <%=phone2%>;
		var phone3 = <%=phone3%>;
		
		if(<%=mempoint%><10){
			Swal.fire({
				  icon: 'error',
				  title: '스탬프가 부족합니다.',
				})
			return false;
		}else{
			$.ajax({
				url : "StampCheck",
				type: "get",
				data : {
					phone2: phone2,phone3: phone3
				},
				success: function(result){
					$("#pay",opener.document).html(result);
					window.close();
				}
			});
			/* opener.location.href="FlagCheckServlet?phone1=010&phone2="+phone2+"&phone3="+phone3+"&flag=check";
			location.href="StampCheckServlet?phone2="+phone2+"&phone3="+phone3; */
			//$("#cart",opener.document).html(result);
			//window.close();
		}
	});
	
})
</script>
</head>
<body>
	<header>
		<img class="logo"src="image/utility/로고.png">
	</header>
		<table class="coupon">
		<tr>
			<td colspan="5">보유한 스탬프 : <a style="color: #6495ED;"><%= mempoint %></a></td>
		</tr>
		<!-- 첫째줄 -->
		<tr>
			<%
				if(mempoint >= 5 ){
					column = 5;
					for(int i=0;i<column;i++){
			%>
				<td align="center"><img id="stamp" src="image/utility/쿠폰.png"></td>
			<%
					}//for
				}else if(mempoint ==0){
					for(int i=0;i<5;i++){
			%>
				<td align="center"><div class="circle"></div></td>
			<%
					}//for
				}else{
					for(int i=0;i<column;i++){
			%>
				<td align="center"><img id="stamp" src="image/utility/쿠폰.png"></td>
			<%
					}//for
					for(int i=0;i<5-column;i++){
			%>
				<td align="center"><div class="circle"></div></td>
			<%
					}
				}
			%>
		</tr>
		<!-- 두번째줄 -->
		<tr>
			<%
				if(mempoint <= 5){
					for(int i=0;i<5;i++){
			%>
				<td align="center"><div class="circle"></div></td>
			<%
					}//for
				}else if(mempoint >= 10){
					column = 5;
					for(int i=0;i<column;i++){
			%>
				<td align="center"><img id="stamp" src="image/utility/쿠폰.png"></td>
			<%
					}//for
				}else{// 6=1 7=2 8=3 9=4
					column = mempoint % 5;
					for(int i=0;i<column;i++){
			%>
				<td align="center"><img id="stamp" src="image/utility/쿠폰.png"></td>
			<%
					}//for
					for(int i=0;i<5-column;i++){
			%>
				<td align="center"><div class="circle"></div></td>
			<%
					}//for
				}//else
			%>
		</tr>
	</table>
	<table class="body">
		<tr>
			<td colspan="2"><button class="btn1" id="benefits">혜택 및 유의사항</button><button class="btn1" id="history">적립/사용내역</button></td>
		</tr>
		<tr>
			<td colspan="2"><div class="contents"></div></td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td align="center"><button class="btn2" id="close">취소</button></td>
			<td align="center"><button class="btn2" id="stampCheck">쿠폰 사용하기</button></td>
		</tr>
	</table>
</body>
</html>