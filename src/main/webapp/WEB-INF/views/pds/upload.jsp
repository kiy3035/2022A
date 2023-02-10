<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 올리기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--  <link rel="stylesheet" href="/css/upload.css" />  -->
<link href="/css/home.css" rel="stylesheet" />
<link href="/css/upload.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="/img/favicon.ico" />

<style>
	h2 {text-align:center;}
	form.upload-form {width:50%;}

</style>
</head>
<body>
<!-- 내비게이션 바 불러오기 -->
<%@include file="/WEB-INF/include/navi.jsp" %>

<!-- 
<button type="button"  style="float: right" onclick="location.href='javascript:history.back()';">　이전으로　</button>
<button type="button"  style="float: right" onclick="location.href='/';">　홈으로　</button>
<button type="button"  style="float: right" onclick="location.href='/Mypage?user_id=${ sessionScope.login.user_id }';">　마이페이지　</button>
-->


    <!--사진 업로드페이지 중앙배치-->
        <main class="uploadContainer">
           <!--사진업로드 박스-->
            <section class="upload">
               
               <!--사진업로드 로고-->
                <div class="upload-top">
                    <a href="home.html" class="">
                        <img src="/images/logo.jpg" alt="">
                    </a>
                    <h2><b>사진 업로드</b></h2>
                    <br>
                </div>
                <!--사진업로드 로고 end-->
                
                <!--사진업로드 Form-->
                <form class="upload-form" method="POST" enctype="multipart/form-data" action="/Pds/Album/upload">
                    <input type="hidden" name="moim_idx" value="${moim_idx}"/>
                      <input type="hidden" name="user_id" value="${ sessionScope.login.user_id }"/>  <%--세션의 담긴 유저아이디 로 바꿔주기 --%>
                       <input type="hidden" name="menu_idx" value="3"/>    <%-- menu_idx = 1 ( 자유게시판 ) menu_idx = 2 ( Q & A) menu_idx = 3 ( 사진첩) --%>
                    <input type="file" name="file"  accept="image/*" id="input_img" />
                    <br><br>
                    
                    <div class="upload-img">
                        <img src="/img/images.png" alt="" id="img_preview" />
                    </div>
                    
                    <br>
                    <!--사진설명 + 업로드버튼-->
                    <div class="upload-form-detail">
                   		<input type="text" placeholder="사진제목" name="board_title">
                        <input type="text" placeholder="사진내용" name="board_cont">
                        <button class="cta blue">업로드</button>
                    </div>
                    <!--사진설명end-->
                    
                </form>
                <!--사진업로드 Form-->
            </section>
            <!--사진업로드 박스 end-->
        </main>


	<script>
		$("#input_img").on("change", (e) => {
			let files = e.target.files;
			let filesArr = Array.prototype.slice.call(files);
			filesArr.forEach((f)=>{
				if(!f.type.match("image.*")){
					alert("이미지를 등록해야 합니다.");
					return;
				}
				let reader = new FileReader();
				console.log(reader);
				reader.onload = (e) => { 
					console.log(e.target);
					$("#img_preview").attr("src", e.target.result);
				}
				reader.readAsDataURL(f); // 이 코드 실행시 reader.onload 실행됨.
			});
		});
	</script>
	

</body>
</html>