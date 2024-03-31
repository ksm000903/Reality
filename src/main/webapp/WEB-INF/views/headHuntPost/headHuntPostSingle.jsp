<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="chalKagTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <chalKagTags:webCss/>
    
    <style type="text/css">
	 .postInfo {
	 	display: flex;
	 	font-style: 'Malgun Gothic';
	 	margin-bottom: 5px;
		font-size:20px;
		margin-left: 26%;
	 }
    	.postInfoTitle { 	
    	margin-right: 100px; 
    	width: 100px;
		margin-left: 4%;
    	}

		.owl-carousel {
            display: block;
            width: 100%;
            margin: 0 auto;
        }
        .owl-item img {
            display: block;
            width: 750px; /* 이미지의 너비를 750px로 강제 설정 */
            height: 575px; /* 이미지의 높이를 575px로 강제 설정 */
            object-fit: cover; /* 이미지의 비율을 유지하면서 요소에 맞게 잘리지 않도록 설정 */
        }
    	
    </style>
</head>
	<body>
		<!-- Start header tag로 출력 -->
		<chalKagTags:webHeader />
		<!-- End header tag로 출력 -->

		<section class="single">
			<div class="container">
				<div class="row">

					<chalKagTags:webSider />

					<div class="col-md-8">
						<article class="article main-article">
							<header>
								<h1>${headHuntPostSingle.headHuntPostTitle}</h1>
								<ul class="details" >
									<li>${headHuntPostSingle.headHuntPostDate}</li>
									<li>
										<a>Film</a>
									</li>
									<li>By 
										<c:if test="${member == null || member != headHuntPostSingle.memberId}">
											<a href="/memberPage?memberId=${headHuntPostSingle.memberId}">${headHuntPostSingle.memberNickname}</a>
										</c:if> 
										
										<c:if test="${member == headHuntPostSingle.memberId}">
											<a href="/myPage?memberId=${headHuntPostSingle.memberId}">${headHuntPostSingle.memberNickname}</a>
										</c:if>
										
									</li>	
								</ul>
							</header>
						<div class="main">
							<div class="featured">
							<div class="owl-carousel">
								<c:forEach var="postImgList" items="${postImgList}">
										<figure>
											<img src="/postImg/${postImgList.postImgName}">
										</figure>
								</c:forEach>
								</div>
							</div>
								<div class="featured" style="margin-bottom: 3%; margin-top: 2%; display: block; justify-content: center;">
										<div>
											<div class="postInfo">
												<i class="ion-ios-body"
													style="font-size:20px;"></i><div class="postInfoTitle">Role</div>
												<div class="postInfoContents">${headHuntPostSingle.headHuntPostRole} </div>
											</div>
											<div  class="postInfo">
												<i class="ion-android-home"
													style="font-size:20px;"></i><div class="postInfoTitle">Region</div>
												<div class="postInfoContents">${headHuntPostSingle.headHuntPostRegion}</div>
											</div>
											<div  class="postInfo">
												<i class="ion-cash"
													style="font-size:20px;"></i><div class="postInfoTitle" style="margin-left:3.1%;">Pay</div>
												<div class="postInfoContents" id="headHuntPostPay">${headHuntPostSingle.headHuntPostPay} ₩</div>
											</div>
											<div  class="postInfo">
												<i class="ion-android-calendar"
													style="font-size:20px;"></i><div class="postInfoTitle">Work Date</div>
												<div class="postInfoContents">${headHuntPostSingle.headHuntPostWorkDate}</div>
											</div>
											<div  class="postInfo">
												<i class="ion-ios-camera"
													style="font-size:20px;"></i><div class="postInfoTitle">Concept</div>
												<div class="postInfoContents">${headHuntPostSingle.headHuntPostConcept}</div>
											</div>
										</div>
								</div>
								<!-- 게시글 내용 출력 -->
								<p>${headHuntPostSingle.headHuntPostContent}</p>
							</div>
							<footer>
								<div class="col" style="width:54.4%;">
									<a href="#" class="love" style="margin-top:0%"><i class="ion-android-favorite-outline"></i><div>${headHuntPostList.recommendCnt}</div></a>
								</div>
							</footer>
						</article>
						<div  style="display: flex; justify-content: center;">
							<c:if test="${member != null || member == headHuntPostSingle.memberId}">
								<a class="btn btn-primary" style="margin-right: 10px" href="/updateHeadHuntPost?headHuntPostId=${headHuntPostSingle.headHuntPostId}">Post Update</a>
								<a class="btn btn-primary" href="/deleteHeadHuntPost?headHuntPostId=${headHuntPostSingle.headHuntPostId}">Post Delete</a>
							</c:if>
						</div>
						<div class="line">
							<div>Author</div>
						</div>
						<div class="author">
							<figure>
								<img src="profileImg/${headHuntPostSingle.profileImgName}"style="width: 100%; height: 100%; object-fit: cover;">
							</figure>
							<div class="details">
								<h3 class="name">${headHuntPostSingle.memberNickname}</h3>
								<p>I enjoy capturing small moments in everyday life with my camera as a
									hobby. I strive to capture the beauty of daily life through photos so
									that everyone can share in those precious moments together. Let's share
									these precious moments together!</p>
								<%-- <p>${headHuntPostSingle.memberIntroduction}</p> --%>
							</div>
						</div>
						<div class="line thin"></div>
						<!-- 댓글 출력 -->
						<chalKagTags:webComments />
					</div>
				</div>
			</div>
		</section>

		<!-- Start footer tag로 출력 -->
		<chalKagTags:webFooter/>
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
	<script src="css/user/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="css/user/scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="css/user/scripts/toast/jquery.toast.min.js"></script>
	<script src="css/user/js/demo.js"></script>
	<script src="css/user/js/e-magz.js"></script>
	<script>
		  $(document).ready(function(){
            // Owl Carousel 초기화
            $(".owl-carousel").owlCarousel({
				items: 1,
                loop: true,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true,
                margin: 10
            });
		});

		document.addEventListener('DOMContentLoaded', function() {
    // div 요소를 가져옵니다.
    const postPayElement = document.getElementById('headHuntPostPay');

    // 요소의 텍스트 내용을 가져옵니다.
    const postPayText = postPayElement.textContent;

    // 쉼표로 숫자를 구분하여 출력하기 위한 함수를 정의합니다.
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // 텍스트 내용을 숫자로 파싱하고 쉼표로 구분하여 다시 설정합니다.
    postPayElement.textContent = numberWithCommas(parseFloat(postPayText));
});
	</script>
	</body>
</html>