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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$.ajax({
		url : "PaymentHistory",
		type : "get",
		success : function(result){
			$("#pay").html(result);
			}//pay 화면
		});
	
	$.ajax({
		url : "OrderHistory",
		type : "get",
		success : function(result){
			$("#order").html(result);
			}//order 화면
		});
	
	$("#next").on("click", function() {
		var orderprice = $(".orderprice").val();
		location.href="Step1?orderprice="+orderprice;
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
	
	function plusBtn(id) {
	         var amount = $("#amount"+id).val();
	         var pdnum = $("#num"+id).val();
	         
	         if(parseInt(amount)!=null) {
		     	amount = parseInt(amount)+1;
		     	$.ajax({
		 			url : "CartUpdate",
		 			type : "get",
		 			dataType: "json",
		 			data : {
		 				pdnum: pdnum , amount: amount , status : "plus" 
		 			},
		 			success : function(json){
		 				var amount = json.map.amount;
		 				var totalprice = json.map.totalprice;
		 				
		 				$("#price"+id).val(totalprice);
		 				$("#amount"+id).val(amount);
		 				
		 				$.ajax({
		 		 			url : "PaymentHistory",
		 		 			type : "get",
		 		 			success : function(result){
		 		 				$("#pay").html(result);
		 		 			}
		 		 		});
		 			}
		 		});
		     }
	   }
	   
	   function minusBtn(id) {
		   var amount = $("#amount"+id).val();
	       var pdnum = $("#num"+id).val();
	       
		   if (parseInt(amount)!=1) {
	       		amount = parseInt(amount)-1;
		     	$.ajax({
		 			url : "CartUpdate",
		 			type : "get",
		 			dataType: "json",
		 			data : {
		 				pdnum: pdnum , amount: amount , status: "minus"
		 			},
		 			success : function(json){
		 				var amount = json.map.amount;
		 				var totalprice = json.map.totalprice;
		 				
		 				$("#price"+id).val(totalprice);
		 				$("#amount"+id).val(amount);
		 				
		 				$.ajax({
		 		 			url : "PaymentHistory",
		 		 			type : "get",
		 		 			success : function(result){
		 		 				$("#pay").html(result);
		 		 			}
		 		 		});
		 			}
		 		});    
	       }
	   }
		
	function singleDel(id) {
		$.ajax({
			url : "CartDel",
			type : "get",
			data : {
				pdnum : $("#num"+id).val()
			},
			success : function(result){
				$("#order").html(result);
				$.ajax({
 		 			url : "PaymentHistory",
 		 			type : "get",
 		 			success : function(result){
 		 				$("#pay").html(result);
 		 			}
 		 		});
			}
		});
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</header>
	
	<div class="name">&nbsp;주 문 내 역</div>
	
	<div id="order"></div>
	
	<div id="pay"></div>
	
	<div class="bottom">
		<table>
			<tr>
				<td><button class="btn1" id="cancel">전체취소</button></td>
				<td><button class="btn1" onclick="location.href='Menu';">이전</button></td>
				<td><button class="btn1" id="next">다음</button></td>
			</tr>
		</table>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/Order.css?ver=1"/><!-- css 링크 -->
</body>
</html>