<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.dto.*" %>
<%@page import="com.service.*" %>
<%@page import="java.util.List" %>
<%
	List<OrderInfoDTO> olist = (List<OrderInfoDTO>)request.getAttribute("list");
	String time = (String)request.getAttribute("time");
	
	int totalprice = 0;
	int discountprice = 0;
	int orderseq = 0;
	
	
	for(int i=0;i<olist.size();i++){
		OrderInfoDTO dto = olist.get(i);
		int price = dto.getPrice();
		int amount = dto.getAmount();
		orderseq = dto.getOrderseq();
			
		totalprice += price * amount;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DMN</title>
<link rel="shortcut icon" type="image/x-icon" href="image/utility/버튼.png"><!-- 타이틀 이미지 링크 -->
<link rel="stylesheet" href="css/OrderConfirmation.css?ver=1"/><!-- css 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet"><!-- 폰트 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".btn1").on("click",function(){
		location.href="Main";
	});
})
</script>
<SCRIPT LANGUAGE="JavaScript"> 
	function Timer() { 
		setTimeout("locateKap()",10000); 
 	} 
	function locateKap(){
 		location.replace("Main");
	}
</SCRIPT> 
<script language='javascript'>
  cnt = 10; // 카운트다운 시간 초단위로 표시
  function countdown() {
   if(cnt == 0){
          // 시간이 0일경우
         locateKap();
   }else {
         // 시간이 남았을 경우 카운트다운을 지속한다.
        document.all.choonDiv.innerHTML = cnt + "초후에 메인페이지로 이동이 됩니다";
        setTimeout("countdown()",1000);
  cnt--;
   }
  }
</script>
</head>
<body onload="Timer()">
	<div class="check">
		<table class="check-table" border="1">
			<tr>
				<td colspan="3"><img class="check-image" src="image/utility/로고.png"></td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;결제가 완료되었습니다</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;<hr>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;주문번호</td>
				<td class="right"><%=orderseq%>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;<div class="opacity-50"><hr></div>&nbsp;</td>
			</tr>			
			<tr>
				<td colspan="1">&nbsp;거래시간</td>
				<td class="right" colspan="2"><%=time %>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;거래구분</td>
				<td class="right">카드결제&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;주문금액</td>
				<td class="right"><%=totalprice %>원&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;거래금액</td>
				<td class="right"><%=totalprice %>원&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3">&nbsp;<div class="opacity-50"><hr></div>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><input class="blank" type="text" value=" " readonly="readonly"></td>
				<td><input type="text" class="blank" value=" " readonly="readonly"></td>
			</tr>
		</table>
	</div>
	<button class="btn1"><img class="home" src="image/utility/home.png"></button>
	<div id="choonDiv"></div>
	<script>countdown();</script>
</body>
</html>