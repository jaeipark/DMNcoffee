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
<link rel="stylesheet" href="css/Member_lookup&join.css?ver=1"/><!-- css 링크 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#cancel").on("click", function() {
		location.href="Step1";
	});
})	

	function num(num,maxlength) {
		var phone2 = document.getElementById("phone2");
		
		if(phone2.value.length < 4){
			phone2.value += num;
		}else if(phone2.value.length >= 4){
			var phone3 = document.getElementById("phone3");
			phone3.value += num;
			if(phone3.value.length > maxlength ){
				phone3.value = phone3.value.substr(0,maxlength);
			}
		}//else if
	}//num++
	
	
	function deleteAll(){
		var phone2 = document.getElementById("phone2");
		var phone3 = document.getElementById("phone3");
		phone2.value = "";
		phone3.value = "";
		var deleteAll = document.getElementById("phone2","");
		deleteAll.value = "";
	}//deleteAll
	
	function del(){
		var phone2 = document.getElementById("phone2");
		var phone3 = document.getElementById("phone3");
		
		if(phone3.value.length > 0 ){
			phone3.value = phone3.value.substr(0,phone3.value.length-1);
		}else{
			phone2.value = phone2.value.substr(0,phone2.value.length-1);
		}
	}//delete
	
	function phoneNum(){
		
		var phone2 = document.getElementById("phone2");
		var phone3 = document.getElementById("phone3");
		
		if(phone2.value.length < 4 || phone3.value.length < 4){
			Swal.fire({
				  icon: 'error',
				  title: '번호를 다시 입력해주세요.',
				  confirmButtonColor: '#6495ED'
				})
			return false;
		}else{
			phone2 = phone2.value;
			phone3 = phone3.value;
		
			send.action = "MemberAddorSelect";
			send.submit();
		}
	}//phoneNum
	
</script>
</head>
<body>
	<header>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</header>
	<form id="send" method="get">
	<table class="numbox">
		<tr>
			<td colspan="3" style="text-align: center;"><h1>회원 조회/가입</h1></td>
		</tr>
		<tr>
			<td><input class="memberphone" type="text" name="phone1" value="010"></td>
			<td><input class="memberphone" type="text" id="phone2" name="phone2"></td>
			<td><input class="memberphone" type="text" id="phone3" name="phone3"></td>
		</tr>
	</table>
	</form>
	<table class="keypad">
		<tr>
			<td><button class="btn1" onclick="num(1,4)">1</button></td>
			<td><button class="btn1" onclick="num(2,4)">2</button></td>
			<td><button class="btn1" onclick="num(3,4)">3</button></td>
		</tr>
		<tr>
			<td><button class="btn1" onclick="num(4,4)">4</button></td>
			<td><button class="btn1" onclick="num(5,4)">5</button></td>
			<td><button class="btn1" onclick="num(6,4)">6</button></td>
		</tr>
		<tr>
			<td><button class="btn1" onclick="num(7,4)">7</button></td>
			<td><button class="btn1" onclick="num(8,4)">8</button></td>
			<td><button class="btn1" onclick="num(9,4)">9</button></td>
		</tr>
		<tr>
			<td><button class="btn1" onclick="deleteAll()">delete<br>all</button></td>
			<td><button class="btn1" onclick="num(0,4)">0</button></td>
			<td><button class="btn1" onclick="del()">←</button></td>
		</tr>
	</table>
	<table class="button">
		<tr>
			<td><button class="btn2" id="cancel">취소</button></td>
			<td><button class="btn2" onclick="phoneNum()">다음</button></td>
		</tr>
	</table>
</body>
</html>