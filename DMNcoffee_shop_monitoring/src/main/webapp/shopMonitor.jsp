<%@page import="com.dto.StateDTO"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="css/shopMonitor.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

function reload() {
	console.log("reload");
	
	location.href = "http://localhost:8085/DMN_Shop_Monitoring_Project_0925/SaleListServlet";
}


$(document).ready(function () {
	
	setInterval("reload()", 10000);
	
	 $('#completeN').on("click",function(){
		 console.log("N");
		 $(".YN").val("N");
		 $("#formMode").submit();
	 })
	 
	 	
	 $('#completeYN').on("click",function(){
		 console.log("YN");
		 $(".YN").val("YN");
		 $("#formMode").submit();
	 })
	 	
	 $('#complete_y').on("click",function(){  
		 var chb = false;
		 var chkValue = [];
		 var idx = 0;
		 $("input:checkbox[name=orderChk]").each(function() { 
			if(this.checked) {
				chkValue[idx] = $('#' + this.id).val();
				idx++;				// $('#' + this.id).val()	
				chb=true;
			}
		 });
		 
		 if(chb == false) {
			alert("주문을 선택해 주세요 ~ : )");
	 		return;
		 }
	 	 
		 $('#hiddenCheckValue').val(chkValue);
		 
	 	 $('#formComplete').submit();
	 
	 });
	 
 	$("input:checkbox").click(function(){
		var orderNumValue = [];
		var idx = 0;
		console.log("checkbox click");
		$("input:checkbox[name=orderChk]").each(function() {
			if(this.checked) {
				orderNumValue[idx] = $('#' + this.id).val();
				console.log(orderNumValue[idx]);
				$("#pickupNum").text("주문 - "+orderNumValue[idx]);
				idx++;	
			}		
		if(idx == 0){
			$("#pickupNum").text('주문 - N');
		}	
		 });

	}); 
 	
 	
 	$("#pickupCall").on("click",function(){
 		var orderNumValue = [];
 		var num = 0;
 		$("input:checkbox[name=orderChk]").each(function() {
			if(this.checked) {
				orderNumValue[num] = $('#' + this.id).val();
				num++;
				}			
		 })
			if(num == 0 ) {
				alert("호출할 주문을 선택해주세요 ~ : )");
			} else if (num > 1) {
				alert("체크박스를 1개만 선택하셔야 합니다 ~ : )");
			} else {
				alert("주문번호가 호출되었습니다!!");
				$("input:checkbox[name=orderChk]").prop("checked", false);
				$("#pickupNum").text('주문 - N');
			}  		
 	});
 	
 	
 	
	 
	 $('#cancel').on("click", function () {
		 var chb = false;
		 var chkValue = [];
		 var idx = 0;
		 $("input:checkbox[name=orderChk]").each(function() { 
			if(this.checked) {
				chkValue[idx] = $('#' + this.id).val();
				idx++;				
				chb=true;
			}
		 });
		 
		 if(chb == false) {
			alert("주문취소항목을 선택해 주세요 ~ : )");
	 		return;
		 }
	 	 console.log(chkValue);
		 $('#hiddenCheckValue2').val(chkValue);
		 
	 	 $('#formCancel').submit();
	})
	
	
	

	
	
	
});
</script>
<title>Insert title here</title>

</head>
<body>


<%
List<OrderDTO> list = (List<OrderDTO>)request.getAttribute("orderList");
StateDTO stDto = (StateDTO)request.getAttribute("curState");
String yn = (String)session.getAttribute("mode");
%>

<form id="formComplete" action="SaleCompleteServlet">
	<input type="hidden" id="hiddenCheckValue" name="saleComplete">
	<input type="hidden" class="YN" id="YN" value="<%=yn%>" name="YN">
</form>
<form id="formCancel" action="SaleCancelServlet">
	<input type="hidden" id="hiddenCheckValue2" name="saleCancel">
	<input type="hidden" class="YN" id="YN" value="<%=yn%>" name="YN">
</form>


<div id="origin"> <!-- 전체테두리  -->
			<form id="formMode" action="SaleListServlet">
				<input type="hidden" class="YN" id="YN" value="<%=yn%>" name="YN">
			</form>
<table border="0"> <!-- 테이블 2X2 형태  -->

	<tr><!--헤더부분 : 테이블 윗 줄 두 칸 병합 (colspan=2) : DMN로고 이미지들어가는곳  -->
		<td colspan="2"><span id="userid">  [ <%=session.getAttribute("login")%> ] 님 계정으로 접속하여 매장운영 중입니다.</span><div id="header"><img src="images/CafeName.png"></div>
		
		</td>
	</tr>

	<tr><!-- 테이블 아랫줄 부분(내용부분) -->
		<td> <!-- 테이블 (내용부분) 촤측![픽업번호, 현황, 조리버튼, 모드버튼 부분-->
			<div id="sidezone">
			<div id="sidePickup"><!-- 픽업번호 -->
				픽업대기 번호<br>
				<hr>
				<div id="pickupNum" >주문 - N</div>
			<input type="button" id="pickupCall" value="주문번호 호출" style="font-size: 25px"></input>
			</div>
			
			<div id="sideButton"> <!-- 조리버튼 -->
			<!-- <div class="btn">조리시작</div> -->
			<div class="btn" id="complete_y">조리완료</div>
			<div class="btn" id="cancel">주문취소</div>
			<!-- <div class="btn">조리취소</div> -->
			</div>
			
			
			<div id="sideState">	<!-- 주문, 처리, 대기, 완료 현황 -->
			<div id="sideStateTop"></div>
			<div class="sideState">누적주문량 : <%=stDto.getYn()%></div>
			<div class="sideState">주문현황 : <%=stDto.getN()%></div>
			<div class="sideState">주문완료 : <%=stDto.getY()%></div>
			</div>
			
			<div id="sideMode"> <!-- 모드버튼 -->

			<div class="sideMode" id="completeN">미제공보기</div>
			<div class="sideMode" id="completeYN">전체보기</div>
						
			</div>
			
			</div>
			</td> 
		<td>  <!-- 테이블 (내용부분) 우측![ 주문 내용 들어오는 부분 ]-->
			<!-- <div id="orderzoneouter"> ★★★★ 스크롤바를 나오게 하는 꼼수!!!!! -->
			<div id="orderzone">
			<%
			for(int i=0 ; i<list.size();i++){
					OrderDTO dto = list.get(i);
					int orderseq = dto.getOrderseq();
					int pdseq = dto.getOrderseq();
					String pdname = dto.getPdnm();
					String opt = dto.getOpt();
					int amount = dto.getAmount();
					String ordertakeout = "포장하기";
					String complete = "완료";
					String color = "gray";
					if(dto.getComplete_yn().equals("N")){
						complete = "대기";
						color = "#FAFAD2";
					}
					if(dto.getOrdertakeout().equals("매장")){
						ordertakeout = "먹고가기";
					}
			%>
			
			
			<% if(i == 0)  {%>
				<div class="menuOrder" style="background-color: <%= color%>">
				
				<input type="checkbox" class="orderChk" name="orderChk" value="<%=orderseq%>" id="chk<%= orderseq%>">
				</input>주문 - <%= orderseq%> 처리상태 : <%=complete %>    <span id="takeout"> [ <%=ordertakeout %> ] </span> <br>
				<%= pdname%> [수량 : <%= amount%>]<br> ㄴ<%= opt%><br>
			<% } else {%>
			
			<% if(list.get(i).getOrderseq() == list.get(i-1).getOrderseq())  {%>
					<%= pdname%> [수량 : <%= amount%>]<br> ㄴ<%= opt%><br>
			<% } else {%>
					
					</div>
					<div class="menuOrder" style="background-color: <%= color%>">
					
					<input type="checkbox" class="orderChk" name="orderChk" value="<%= orderseq%>" id="chk<%= orderseq%>">
					</input>주문 - <%= orderseq%> 처리상태 : <%=complete %>    <span id="takeout"> [ <%=ordertakeout %> ] </span> <br>
					<%= pdname%> [수량 : <%= amount%>]<br> ㄴ<%= opt%><br>
									
			<% } %>	
				
			<% }%>
			
		<% } %>
			
			</div>
			</div>
		</td>
	</tr>

</table>

</div>





</body>
</html>