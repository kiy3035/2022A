<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>모임 개설 화면</title>

<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/css/common.css"/>
<link rel="stylesheet" href="/css/signUpForm.css" />
<style> 
	h2 { margin-top:30px; 
		 margin-botton:30px;
		 
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"> </script>
<script>
$(function() {
	$('[name=moim_name]').on('keyup', function() {
		let moim_name = $('[name=moim_name]').val(); // 모임이름 들고오기
		
		$.ajax({
				url : "moim_name_check",
				type : "GET",
				data : {moim_name: moim_name},
				dataType : 'json',
				success : function(mc){
					if(mc > 0){
						$("#moim_name_check").html('사용할 수 없는 모임 이름입니다.');
						$("#moim_name_check").css('color','red');
						$('[name=moim_name]').css('border', '1px solid red');
					}
					else{
						$("#moim_name_check").html('사용할 수 있는 모임 이름입니다.');
						$("#moim_name_check").css('color','green');
						$('[name=moim_name]').css('border', '1px solid green');
					}
				},
				error : function() {
					alert("서버요청실패");
				}
		})
	});
	
	$('[name=moim_name]').on('focus', function() {
		$('#uid').empty();
		$('[name=moim_name]').val('').css( {
			'border-color' : 'black',
			'border-width' : '1px',
			'border-style' : 'solid'
		});
	});
	$('[name=moim_intro]').on('focus', function() {
		$('#uid').empty();
		$('[name=moim_intro]').val('').css( {
			'border-color' : 'black',
			'border-width' : '1px',
			'border-style' : 'solid'
		});
	});
	
	
	$('form').on('submit', function(e) {
		if( $('[name=moim_name]').val() == '' ) {
			alert('모임이름을 입력해주세요');
			$('[name=moim_name]').css('border', '2px solid red');
			e.preventDefault();
			e.stopPropagation();
		}
		
		else if( $('[name=moim_cate]').val() == '' ) {
			alert('모임관심사를 선택해주세요');
			e.preventDefault();
			e.stopPropagation();
		}
		else if( $('[name=moim_intro]').val() == '' ) {
			alert('모임소개글을 입력해주세요');
			$('[name=moim_intro]').css('border', '2px solid red');
			e.preventDefault();
			e.stopPropagation();
		}
		else if( $("#moim_name_check").html() == '사용할 수 없는 모임 이름입니다.') {
			alert('다른 모임이름을 입력해주세요');
			$('[name=moim_name]').css('border', '2px solid red');
			e.preventDefault();
			e.stopPropagation();
		}
		else
			  var result = confirm('모임을 개설하시겠습니까?');
		 if(result) {
	           //yes
	            location.replace('home.jsp');
	        } else {
	            //no
	        	e.preventDefault();
				e.stopPropagation();
	        }
		
		
		
	})
	
});
</script>
</head>
<body>

<div id="main">
	<form action="/Main/Inputmoim" class="joinForm" method="POST" id="inputmoim" enctype="multipart/form-data">
   <h2>새로운 모임 만들기</h2>
    <table>
     	<input type="hidden" name="univname" value="${a.univname }" />
     	<input type="hidden" name="user_id" value="${a.user_id }" />
     	
     	<div class="textForm">학교이름 : ${a.univname }</div>
     	<div class="textForm">유저이름 : ${a.user_name }</div>
     	<div class="textForm">모임이름 : <input type="text" name="moim_name" /></div></li>
	     	<span id="moim_name_check"></span>
     	<div class="textForm">
     		관심사 선택: <select name="moim_cate">
	     		<option value="">모임 관심사 선택</option>
	     		<option value="스포츠/운동">스포츠 / 운동</option>
	     		<option value="문화/공연">문화 / 공연</option>
	     		<option value="게임/오락">게임 / 오락</option>
	     		<option value="사교/인맥">사교 / 인맥</option>
	     		<option value="댄스/음악">댄스 / 음악</option>
	     		<option value="요리/맛집">요리 / 맛집</option>
	     		<option value="여행/캠핑">여행 / 캠핑</option>
	     		<option value="반려동물">반려동물</option>
     		</select>
     		</div>
     	<div class="textForm">모임 간단설명 : 
     		<input type="text" name="moim_intro" />
   		</div>
   		<div class="textForm">
     		<input type="file" name="uploadFile" id="uploadFile" accept="image/*" /><br>
     	</div>
    </table>
     	<button type="submit"  class="btn1" form="inputmoim">모임 개설하기</button>
     	<button type="reset"  class="btn2" >내용 지우기</button>
    </form>
   
</div>

</body>
</html>












