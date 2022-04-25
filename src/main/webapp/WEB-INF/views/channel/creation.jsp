<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<%@ include file="setting/js.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style type="text/css">
/* 모달 */

.modal-class .skills{
background-color: #293c57;
	text-align: left;
	
}
.modal-class .tag-list{
text-align: center;
}
.modal-class h5{
color:white;
font-size:1.5rem;
}
.modal-content{
background-color: #293c57;
}
.modal-title{
color:white;
}

.article-creation .modal-body {
	display: flex;
	flex-wrap: wrap;
	font-size: 1.5rem;
}

.modal-body input[type="radio"] {
	display: none;
}

.modal-body input[type="radio"]+span {
	display: flex;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	justify-content: center;
	align-items: center;
	height: 35px;
	font-weight: 500;
	cursor: pointer;
}

.modal-body input[type="radio"]:checked+span {
	border: 1px solid #23a3a7;
	background: #23a3a7;
	color: #fff;
}

.modal .category-box {
	margin: 0.2rem;
	color:white;
}
/* 배경 */
.article-creation {
	background-color: white;
	background:
		url("../../../resources/image/background/KakaoTalk_20211128_193013852.png")
		no-repeat center/cover;
}

.article-creation .container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
}
/* 채널생성 카드 */
.mycard button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 3rem;
	font-size: 1.6rem;
	padding: 0 2rem;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.mycard button:hover {
	background: #fff;
	color: #1AAB8A;
}

.mycard button:before, .mycard button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.mycard button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.mycard button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.article-creation .mycard {
	padding: 3rem 0;
	display: block;
	background: white;
	opacity: 92%;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 300px;
	height: 500px;
	color: black;
	border-radius: 10px;
	text-align: center;
}

.article-creation .mycard a {
	text-decoration: none;
	padding: 0.5rem;
	margin-top: 2rem;
	font-size: 2rem;
	color: white;
}

.article-creation .form-control {
	font-size: 1.5rem;
	margin: 2rem auto;
	width: 80%;
	background: none;
	border-radius: 1rem;
}


/* 카드 */
h3 {
	margin: 10px 0;
}

h5 {
	margin: 5px 0;
	text-transform: uppercase;
}

p {
	font-size: 14px;
	line-height: 21px;
}

.card-container {
	/* background-color: #2F4058; */
	background:rgba(47,64,88,0.4);
	box-shadow: 9px 9px 20px -5px rgba(0, 0, 0, 0.75);
	color: white;
	padding: 2rem 0;
	position: relative;
	width: 300px;
	text-align: center;
	margin: 1rem 0;
	border-radius: 5px;
	
}

.card-container .round {
	border: 1px solid #03BFCB;
	border-radius: 50%;
	padding: 7px;
	width: 100px;
	height: 100px;
	margin: 2rem auto;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

.card-container .round i {
	font-size: 5rem;
}

button.primary {
	background-color: #03BFCB;
	border: 1px solid #03BFCB;
	border-radius: 3px;
	color: #293c57;
	font-size: 1.3rem;
	font-weight: lighter;
	padding: 0.5rem 1rem;
}

.creation-box {
	border-top: 1px solid white;
	border-bottom: 1px solid white;
}

button.primary.ghost {
	background-color: transparent;
	color: white;
}

button.primary-title {
	background-color: #cc7391;
	border: 2px solid white;
	border-radius: 5px;
	color: white;
	font-size: 1.4rem;
	font-weight: lighter;
	padding: 0.5rem 0.5rem;
}

button.primary-title.ghost {
	color: white;
}

.buttons {
	margin: 2rem 0;
}

.buttons .primary {
	background-color: #03BFCB;
	font-size: 1.8rem;
	font-weight: lighter;
	padding: 0.5rem 1rem;
	color: white;
}

.buttons button:disabled {
	background: #475466;
	color: gray;
}
@media screen and (max-width:300px) {
	.article-creation .container{
	padding: 1rem 0;
	}
	.card-container{
	width: 100%;
	padding:2rem;
	}    
}
@media screen and (max-width:450px){
.article-creation {
	
	/* background:
	
		url("../../../resources/image/background/KakaoTalk_20211128_193013852.png")
		no-repeat center; */
	
}

</style>
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>

	<article class="article-creation">
		<div class="container">
			<form action="/channel/creationDo" method="post">

				<!-- Modal -->
		<div class="modal-class">
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">
							<div class="text-left" id="ch-title"></div>
							<div class="text-left">
								<span class="">${sessionValue.sessionName }</span>
							</div>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" style="font-size: 2rem;"><i
								class="bi bi-x-square-fill"></i></span>
						</button>
					</div>
					<div class="modal-body">
						<div class="skills">
							<c:forEach var="category" items="${channelCategory }">
								<c:choose>
									<c:when test="${category.value == '게임' }">
										<label class="box-radio-input"> <input type="radio"
											name="ch_category" value="${category.value }"
											checked="checked"><span class="category-box">${category.value }</span>
										</label>
									</c:when>
									<c:otherwise>
										<label class="box-radio-input"> <input type="radio"
											name="ch_category" value="${category.value }"><span
											class="category-box">${category.value }</span>
										</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="primary ghost" data-dismiss="modal">취소</button>
						<button type="submit" class="primary ghost">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
				<!-- 모달끝 -->
				<div class="card-container">
					<div class="buttons text-center">
						<button class="primary-title" type="button"
							onclick="location.href='/channel/myChannel'">나의 채널 관리</button>
					</div>
					<div class="round">
						<i class="bi bi-box"></i>
					</div>
					<div class="header-info buttons">
						<div class="primary creation-box">채널 생성</div>
						<div style="font-size: 1.5rem;">
							채널 생성에는 <span style="color: red;">3000Pt.</span> 가 필요합니다.
						</div>
					</div>
					<c:choose>
						<c:when test="${sessionValue.sessionPoint<=3000 }">
							<br>
							<br>
							<div style="font-size: 1.3rem">포인트가 부족합니다.</div>
						</c:when>
						<c:otherwise>
							<input class="form-control" id="ch_name" name="ch_name"
								type="text" style="color: white" oninput="check()"
								placeholder="채널 이름">

							<div id="result" style="font-size: 1.3rem">&nbsp;</div>
							<div class="buttons">
								&nbsp;
								<button class="primary ghost" type="button" id="formbtn"
									disabled="disabled" data-toggle="modal"
									data-target="#exampleModalCenter" onclick="creationInfo()">채널
									등록</button>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</article>

	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
		function check() {
			var str = $("#ch_name").val().trim();
			$.ajax({
				url : "/channel/nameCheck",
				type : "get",
				dataType : "json",
				data : {
					ch_name : str
				},
				success : function(data) {

					$('#result').empty();

					if (str == "") {
						$('#result').append("&nbsp;")
						$('#formbtn').prop('disabled', 'true');
					} else if (data == 1) {
						$('#result').text("중복입니다.");
						$('#formbtn').prop('disabled', 'true');
					} else if (data == 0) {
						$('#result').text("사용가능!!!");
						$('#formbtn').removeAttr("disabled");
					}
				}
			})
		}

		function creationInfo() {
			var chName = $('#ch_name').val();
			$('#ch-title').empty();
			$('#ch-title').append("<span class='badge'>" + chName + '</span>');
		}
	</script>
</body>
</html>