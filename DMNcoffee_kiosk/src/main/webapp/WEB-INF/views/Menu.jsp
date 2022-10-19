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

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	/* $.ajax({
	url : "Category",
	type : "get",
	success : function(result){
		$("#category").html(result);
		}//default 화면
	}); */
	
	$.ajax({
	url : "DefaultMenuBord",
	type : "get",
	success : function(result){
		$("#menu").html(result);
		}//default 화면
	});
	
	$.ajax({
		url : "CartSelect",
		type : "get",
		success : function(result){
			$("#cart").html(result);
			}//cart 화면
		});
	
	$(".categoryBTN").on("click",function(){
		$("button:focus").css("background-color", "#E1F6FA");
		$("button:not(:focus)").removeAttr("style");
		$.ajax({
			url : "CategoryRetrieve",
			type: "get",
			data : {
				ctno : $(this).attr("data-xxx")
			},
			success: function(result){
				$("#menu").html(result);
			}
		});
	});
	
	$("#delAll").on("click",function(){
		$.ajax({
			url : "CartDelAll",
			type: "get",
			success: function(result){
				$("#cart").html(result);
			}
		});
	});
	
	$("#payment").on("click", function() {
		$.ajax({
			url : "CartSelectAll",
			type: "get",
			dataType: "json",
			success: function(json){
				var size = json.map.size;
				if (size == 0 ) {
					Swal.fire({
						  icon: 'error',
						  title: '상품을 선택해주세요.',
						  confirmButtonColor: '#6495ED'
						})
					return false;
				} else {
					location.href="Order";
				}
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
	<!-- 카테고리 선택 버튼 테이블 -->
		<jsp:include page="common/category.jsp" flush="true"></jsp:include>
		<!-- <div id="category"></div> -->
	<!-- 메뉴보드 html -->
		<div id="menu"></div>
		<div id="cart"></div>
		<jsp:include page="common/bottom.jsp" flush="true"></jsp:include>
		<input type="hidden" id="test" value="">
<link rel="stylesheet" href="css/Menu.css?ver=1"/><!-- css 링크 -->
</body>
</html>