<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/signUpForm.css" />

<title>모임 가입</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"> </script>
<script>
/*
$(function() {
	$('form').on('submit', function(e) {
		let user_id = "${user_info.user_id}"
		let moim_idx = "${moim_info.moim_idx}"
		var error = false;
		
		$.ajax({
				url : "moim_user_duplicate_check",
				type : "GET",
				data : {user_id : user_id, moim_idx : moim_idx},
				async : false,
				dataType : 'json',
				success : function(result){
					if(result > 0){
						alert('이미 이 모임에 가입하셨습니다.');
						error = true;
					}
					else{
						
					}
				},
				error : function() {
					alert("서버요청실패");
				}
		});
		if(error){
			return false;
		}
		
		
	})
});
*/
	


</script>

</head>
<body>
	<div id=sign_up>
	<form action="/sign_moim_user" class="joinForm" method="POST" id="sign_moim_user">
		<h2>우리 모임 가입을 환영합니다 :)</h2>
		<table>
			<input type="hidden" name="user_id" value="${user_info.user_id}" />
			<input type="hidden" name="moim_idx" value="${moim_info.moim_idx}" />
			
			<div class="textForm">
				유저이름 : ${user_info.user_name }
			</div>
			<div class="textForm">
				유저의 대학교명 : ${user_info.univname }
			</div>
			<div class="textForm">
				유저관심사 : ${user_info.user_cate }
			</div>
			<div class="textForm">
				가입하려는 동아리 이름 : ${moim_info.moim_name }
			</div>
			<div class="textForm">
		  		가입인삿말 : <input name="sign_up_intro" class="sign_up_info" type="text"  >
			</div>
		</table>
			<button type="submit" class="btn1" for="sign_moim_user">모임 가입하기</button>
			<button type="submit" class="btn2" >내용 지우기</button>
		</form>
	</div>
</body>
</html>