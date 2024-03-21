<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="chalKagTags"%>
<!DOCTYPE html>
<html>
<head>
    <chalKagTags:webCss/>
<style>
#writerForm {
	width: 70%;
}

.selectTags {
	border-color: rgb(179, 179, 179);
	border-radius: 5px;
	padding-left: 8px;
}

#marketPostWorkDate {
	border-radius: 5px;
	border: solid 1px rgb(179, 179, 179);
}

#preview {
	display: flex;
	overflow: hidden;
	width: 100%; /* 슬라이드 컨테이너의 너비를 설정 */
}

.image-container {
	display: flex;
	transition: transform 0.5s ease;
}

img {
	transform: translate(50, 50);
	max-width: 400px;
	max-height: 400px;
	margin-right: 10px;
	margin-left: 10px;
	object-fit: cover; 
	object-position: center;
}

.imgSlidebtn {
	border: 0;
	height: 150px;
	color: white;
	background-color: rgb(245, 63, 82);
}

#marketPostTitle {
	margin-bottom: 1%;
}

#marketPostContent {
	height: 300px;
}

#inputCol {
	margin-bottom: 2%;
}

#customButton {
	width: 100%;
	height: 50px;
	background-color: rgb(255, 255, 255);
	border: solid 1px rgb(245, 63, 82);
	color: rgb(245, 63, 82);;
	margin: 8px 0;
	border-radius: 5px;
	font-weight: bold;
}

#customButton:hover {
	background-color: rgb(245, 63, 82);
	border: none;
	color: rgb(255, 255, 255);
}

.img-wrapper {
  position: relative;
	width: 400px;
	height: 400px;
  display: inline-block; /* 이미지를 옆으로 나열 */
}

.delete-btn, .move-up-btn, .move-down-btn {
  position: absolute;
  cursor: pointer;
}

.delete-btn {
  top: 0;
  right: 9%;
  z-index: 50; /* 확실히 이미지 위에 오도록 설정 */
	background-color: transparent;
	border: 0;
	color: white;
	-webkit-text-stroke-width: 1px;
	-webkit-text-stroke-color: rgb(245, 63, 82);
	text-shadow: 1px 0px rgb(245, 63, 82);
}

.move-up-btn, .move-down-btn {
  top: 50%;
  transform: translateY(-50%);
	border: 0;
	color: white;
	-webkit-text-stroke-width: 1px;
	-webkit-text-stroke-color: rgb(245, 63, 82);
	background-color: transparent;
}

.move-up-btn {
  left: 9%; /* 이미지 왼쪽으로 이동 버튼 위치 조정 */
}

.move-down-btn {
  right: 9%; /* 이미지 오른쪽으로 이동 버튼 위치 조정 */
}
</style>
</head>
<body>
	<!-- Start header tag로 출력 -->
	<chalKagTags:webHeader />
	<!-- End header tag로 출력 -->

	<section class="single">
		<div class="container">
			<div class="box-wrapper" id="writerForm">
				<div class="box box-border">
					<div class="box-body">
						<div class="form-group">
								<h4 style="display: flex; justify-content: center; margin-bottom: 0;">Writer : ${memberId}</h4><h5 style="display: flex; justify-content: center;">(LV : 20  |  Grade : nomal )</h5>
						</div>
						<br>
						<form action="/writeMarketPost" method="post"
							onsubmit="return validateForm(event)"
							enctype="multipart/form-data">
							<div class="form-group"
								style="display: flex; justify-content: center;">
								<input type="text" class="form-control rounded"
									id="marketPosttitle" name="marketPosttitle" placeholder="Title" />
							</div>
							<div class="form-group" style="display: flex;">
								<input type="text" id="marketPostPrice" name="marketPostPrice" class="form-control rounded" style="width: 32%; margin-right: 2%;" oninput="trimInput(this); validatePrice(this);"
									placeholder="productPrice" /> 
									<select class="selectTags"
									id="marketPostCompany" name="marketPostCompany"
									style="width: 32%; margin-right: 2%;">
									<option value="" disabled selected>Company</option>
									<option value="캐논">캐논</option>
									<option value="소니">소니</option>
									<option value="니콘">니콘</option>
								</select> <select class="selectTags" id="marketPostCategory"
									name="marketPostCategory" style="width: 32%;">
									<option value="" disabled selected>Category</option>
									<option value="DSLR">DSLR</option>
									<option value="미러리스">미러리스</option>
								</select>
							</div>
							<div class="form-group">
								<input type="file" name="file" id="fileInput" accept="image/*"
									style="display: none;" multiple> <input type="button"
									id="customButton" value="Upload">
							</div>
							<div id="preview" style="display: flex; justify-content: center;">
								<button class="imgSlidebtn" id="slideLeft">◀</button>
								<div style="overflow: hidden; flex-grow: 1;">
									<div class="image-container"></div>
								</div>
								<button class="imgSlidebtn" id="slideRight">▶</button>
							</div>
							<div class="form-group"
								style="display: flex; justify-content: center;">
								<textarea class="form-control rounded" id="marketPostContent"
									name="marketPostContent"></textarea>
							</div>
							<button class="btn btn-primary btn-block" id="marketPostContent"
								name="marketPostContent">Composite</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Start footer tag로 출력 -->
	<chalKagTags:webFooter />
	<!-- End Footer -->
	<!-- JS -->
	<!-- 페이지 이동 및 필터검색 Js 파일 링크 달기 & Jsp로 작성할때 링크 프로젝트내 링크와 맞추기 -->
	<script src="css/user/js/jquery.js"></script>
	<script src="css/user/js/jquery.migrate.js"></script>
	<script src="css/user/scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
	<script src="css/user/scripts/jquery-number/jquery.number.min.js"></script>
	<script src="css/user/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script
		src="css/user/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="css/user/scripts/easescroll/jquery.easeScroll.js"></script>
	<script src="css/user/scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="css/user/scripts/toast/jquery.toast.min.js"></script>
	<script src="css/user/js/demo.js"></script>
	<script src="js/user/previewImg.js"></script>
	<script>
		$("input").iCheck({
			checkboxClass : 'icheckbox_square-red',
			radioClass : 'iradio_square-red',
			cursor : true
		});
	</script>
	<script src="css/user/js/e-magz.js"></script>
	<script>
		// 공백 및 null 입력 막는 함수
		function trimInput(element) {
			element.value = element.value.trim();
		}

		function validatePrice(input) {
			const priceRegex = /^[0-9]*$/; // 숫자만 입력하는 정규표현식
			if (!priceRegex.test(input.value)) {
				input.value = input.value.replace(/[^0-9]/g, '');
				swal("fail", "가격은 숫자만 입력해주세요.", "error", {
					button : "OK",
				});
			}
		}

		function validateForm(event) {
			var title = document.getElementById('marketPostTitle').value;
			var price = document.getElementById('marketPostPrice').value;
			var company = document.getElementById('marketPostCompany').value;
			var category = document.getElementById('marketPostCategory').value;
			var content = document.getElementById('marketPostContent').value;
			var imageInput = document.getElementById('fileInput');

			if (!title.trim() || !price.trim() || !company || !category
					|| !content.trim()) {
				swal("fail", "모든 필드를 채워주세요.", "error", {
     				button: "OK",
  				});
				event.preventDefault(); // 폼 제출을 막는다.
				return false; 
			} else if (!imageInput.files.length) { 	// 이미지가 업로드되었는지 확인
				swal("fail", "이미지를 업로드해주세요.", "error", {
     				button: "OK",
  				});
				event.preventDefault(); // 폼 제출을 막는다.
   				return false; // 폼 제출을 막는다.
			}

		return true; // 모든 검사를 통과하면 폼 제출을 진행.
	}
	</script>
</body>
</html>