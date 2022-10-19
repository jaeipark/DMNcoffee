<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="en">
<head>
<meta charset="UTF-8">
<title>DMN</title>
<link rel="shortcut icon" type="image/x-icon" href="image/utility/버튼.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/Main.css?ver=1"/><!-- css 링크 -->
</head>
<body>
<!-- 슬라이드쇼 -->
<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="4000">
      <img src="image/background/메인 페이지1.png" class="slide">
    </div>
    <div class="carousel-item" data-bs-interval="4000">
      <img src="image/background/메인 페이지2.png" class="slide">
    </div>
    <div class="carousel-item" data-bs-interval="4000">
      <img src="image/background/메인 페이지3.png" class="slide">
    </div>
  </div>
</div>
<!-- 테이크아웃 여부 -->
<form action="TakeOutWheter" method="get">
	<table class="buttontable">
		<tr>
			<td><button class="btn" name="ordertakeout" value="매장"><img class="img" src="image/utility/매장에서 먹어요.png"></button></td>
			<td><button class="btn" name="ordertakeout" value="포장"><img class="img" src="image/utility/포장해서 갈래요.png"></button></td>
		</tr>
	</table>
</form>
</body>
</html>