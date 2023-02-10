<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="/css/home.css" rel="stylesheet" />
<title>모임 검색</title>
<style>

<%-- margin: auto; 하니까 검색창 가운데로 가네 ㅋㅋ --%>
.search {
	margin : auto;
  position: relative;
  width: 300px;
}

input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

img {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"> </script>
<script>
$(function() {
	
	
	$('#search_moim').on('keyup', function() {
		let search_moim_name = $('#search_moim').val(); // 검색어
			
		$.ajax({
			url : "/Moim/search_moim_name",
			type : "GET",
			data : {search_moim_name : search_moim_name},
			dataType : "json",
			}).done(function(e){
				$("#test").remove();
				//console.log("값은"+e['moimVo']);
				let arr = e['moimVo'];
				console.log(arr);
				
				let tr = $("<ul id=test></ul>");
				let td = $("<table></table>");
				
				$.each(arr, function(index, obj) {
					// console.log(index); // 번호
					// console.log("moim_name : " + obj.moim_name); 
					// console.log("moim_cate : " + obj.moim_cate);
					// console.log("moim_intro : " + obj.moim_intro);
					//$("<li></li><br>").html(index).appendTo(tr);
					//$("<table id=obj.moim_name>").appendTo(tr);
					td.appendTo(tr);
					$('<a href=javascript:void(0) name=moim_name></a><br><br>').html(obj.moim_name).appendTo(td);
					


					//$("</table>").appendTo(tr);
					//$("<li></li><br>").html(obj.moim_cate).appendTo(tr);
					//$("<li></li><br>").html(obj.moim_intro).appendTo(tr);
	
				});
				
				$("#moim_list").append(tr);
				$('[name=moim_name]').click(function(){
					
					var row_data = $(this);
					
					console.log("클릭한 Row의 모든 데이터 : "+row_data.text());
					let moim_name = row_data.text();
					
					$.ajax({
						url : "find_moim_idx",
						type : "GET",
						data : {moim_name : moim_name},
						dataType : 'json',
						success : function(moim_idx){
							location.replace('/Moim/moimpage?moim_idx='+moim_idx);
							
						},
						error : function() {
							alert('서버요청실패');
						}
					})
					
			    });
				
			})
			
		})
		$('#search_moim').keyup();
		
	})

</script>
</head>
<body>
<!-- 내비게이션 바 불러오기 -->
<%@include file="/WEB-INF/include/navi.jsp" %>

<!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h2 class="display-4 fw-bolder">대동단결</h2>
                    <br><p class="lead fw-normal text-white-50 mb-0">우리 사이트에서 <br>당신만의 동아리를 만들어가세요</p>
                </div>
            </div>
        </header>
<br><br>

<div id="searchmain">
	<form action="/Moim/search_moim_name" method="GET" id="search_moim_name">
	<table>
		<div class="search">

  			<input type="text" id="search_moim" placeholder="모임이름 또는 관심사를 입력하세요" value="${search_word}" name="search_moim">

 

  			<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			<ul>
			<br>
			<span id="moim_list"></span></ul><br>
		</div>
		
		
	</table>
	</form>
</div>
</body>
</html>