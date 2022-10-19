$(".prev").on("click", function (e) {
      e.preventDefault();

      // 이미지 현재의 위치
      var imgOn = $(".imgBox").find(".on").index();
      // 이미지 총 개수 
      var imgLen = $(".imgBox .img").length;
      console.log(imgOn)
      
      // imgBox안의 img 중 imgOn 번째의 on 클래스 삭제 
      $(".imgBox .img").eq(imgOn).removeClass("on");
      // imgBox안의 img 중 imgOn 번째 숨기기 
      $(".imgBox .img").eq(imgOn).css("opacity", 0);
      
      //  이전의 위치로 돌아가야함으로
      imgOn = imgOn -1;

      if( imgOn < 0 ){
        // 돌아가 위치가 -1일 경우 
        // 이미지의 마지막으로 돌아간다
        $(".imgBox .img").eq(imgLen -1).css("opacity", 1);
        $(".imgBox .img").eq(imgLen -1).addClass("on");
      }else{
        // 돌아갈 위치가 -1이 아닌 경우
        $(".imgBox .img").eq(imgOn).css("opacity", 1);
        $(".imgBox .img").eq(imgOn).addClass("on");
      }

    });

    $(".next").on("click", function (e) {
      e.preventDefault();
      // 위에 동일 
      var imgOn = $(".imgBox").find(".on").index();
      var imgLen = $(".imgBox .img").length;

      // 위에 동일
      $(".imgBox .img").eq(imgOn).removeClass("on");
      $(".imgBox .img").eq(imgOn).css("opacity", 0);
      
      // 다음의 위치로 알아야 되기 때문에 
      imgOn = imgOn + 1;
      
      if( imgOn === imgLen ){
        // 다음의 위치가 총 개수보다 클 경우
        // 처음의 위치로 돌아간다
        $(".imgBox .img").eq(0).css("opacity", 1);
        $(".imgBox .img").eq(0).addClass("on");
      }else{
        // 다음 위치가 있는 경우 
        $(".imgBox .img").eq(imgOn).css("opacity", 1);
        $(".imgBox .img").eq(imgOn).addClass("on");
      }
    });