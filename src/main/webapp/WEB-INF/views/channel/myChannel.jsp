<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<%@ include file="setting/js.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
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
.go-register{
text-align: center;
font-size: 2rem;

}

.card-container {
	background-color: #2F4058;
	/* background:url("../../../resources/image/background/tree-6792528_1280.jpg");
	background-size: 100% 100%;
	 background-repeat: no-repeat; */
	/* border-radius: 10px; */
	
	box-shadow: 0px 10px 20px -10px rgba(0, 0, 0, 0.75);
	color: white;
	padding-top: 2rem;
	position: relative;
	width: 100%;
	border: 1px solid #1F1A36;
	text-align: center;
	margin: 1rem 0;
}


.card-container .pro {
	color: #231E39;
	background-color: #FEBB0B;
	border-radius: 3px;
	font-size: 1.1rem;
	padding: 3px 7px;
	position: absolute;
	top: 30px;
	left: 30px;
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
button.primary.ghost {
	background-color: transparent;
	color: white;
}

button.primary-title {
	background-color:#753f54;
	border: 1px solid #03BFCB;
	border-radius: 3px;
	color: white;
	font-size: 1.3rem;
	font-weight: lighter;
	padding: 0.5rem 0.5rem;
}
button.primary-title.ghost {
	
	/* 	color: #02899C; */
	color: white;
}

.buttons {
	margin: 2rem 0;
}

.article-mychannel .header-info {
	margin: 0.5rem 0;
}

.header-title {
	color: white;
}



.article-mychannel .skills {
	/* background-color: #1F1A36; */
	background-color: #293c57;
	text-align: left;
	padding: 15px;
	border-top:1px solid #a3d7e0;
	
}
.skills-bottom{
border-bottom: 1px solid #a3d7e0;
}

.skills ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.skills ul li {
	border: 1px solid whitesmoke;
	border-radius: 2px;
	display: inline-block;
	font-size: 12px;
	margin: 0 7px 7px 0;
	padding: 7px;
}
.article-mychannel .tag-form .form-control{
  color: var(--color-text-color);
  background-color: var(--color-bg-main);
  width: 28rem;
  font-size:1.5rem;
  border: 1px solid var(--color-border-color);
}
.article-mychannel .tag-form{
  display: flex;
  justify-content:center;
   padding: 1rem 0.5rem;
   margin: 0 auto;
    font-size: 1.6rem;
}
.article-mychannel .tag-form button{
 width:10rem;
}

.tag-form button:disabled {
	background: #475466;
	color:gray;
	
}
/*모달  */
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
.tagUpdate-btn{
margin: 1rem 0;
padding-bottom: 1rem;
}
.tagUpdate-btn button{
margin:0 1rem;
}
.getTag li{
color:white;
}
.modal-class .intro-text{
font-size: 1.4rem;
}
.update-tag{
font-size: 1.4rem;
text-align: center;
}
.update-tag-box input{
width:15rem;
}
.update-tag-box{
display:flex;
flex-wrap:wrap;
justify-content: center;
margin:0.5rem 0;
}
.tag-box-font{
width: 70px;
font-size: 1.5rem;
color:white;
background: #03BFCB;
}
.tag-alert{
text-align:center;
font-size: 1.3rem;
color:white;
margin:1rem 0;
}
@media screen and (min-width: 320px) {
 .article-mychannel .tag-form button{
 font-size:1.3rem;
 }
 .tag-form .form-control{
 width:calc(100% - 10rem);
 
 }
}

</style>
</head>

<body>
<c:if test="${!empty show }">
		<!-- Modal -->
		<div class="modal-class">
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title"><span class="text-deco">${chValue.ch_name }</span>&nbsp;<span
									style="font-size: 1.2rem">채널 태그 삭제</span>
							</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true" style="font-size: 2rem;"><i
									class="bi bi-x-square-fill"></i></span>
							</button>
						</div>
						<div class="modal-body">
							<div class="skills">
								<div class="tag-alert"><i class="bi bi-exclamation-circle"></i>&nbsp;태그 삭제 시 복구할 수 없습니다.</div>
								<ul class="getTag tag-list">

								</ul>
							</div>
							<input class="form-control" id="deleteTag" type="text">
						</div>
						<div class="modal-footer">
							<button type="button" class="primary ghost" data-dismiss="modal">취소</button>
							<button type="button" class="primary ghost" data-dismiss="modal"
								onclick="return tagDelete()">
								<span id="report-result"></span>삭제
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-class">
			<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">${chValue.ch_name }&nbsp;<span
									style="font-size: 1.2rem">채널 태그 수정</span>
							</h5>
							<button type="button" class="close" data-dismiss="modal" 
								aria-label="Close">
								<span aria-hidden="true" style="font-size: 2rem;"><i
									class="bi bi-x-square-fill"></i></span>
							</button>
						</div>
						<div class="modal-body">
							<div class="skills">
								<div class="tag-alert"><i class="bi bi-exclamation-circle"></i>&nbsp;태그 수정 시 복구할 수 없습니다.</div>
								<ul class="getTag tag-list">

								</ul>

								<div class="update-tag">
									<div class="update-tag-box">
										<div class="tag-box-font">From</div><div><input id="originalTag" type="text" maxlength="15"></div>
									</div>
									<div class="update-tag-box">
										<div class="tag-box-font">To</div><input id="updateTag" type="text">
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="primary ghost" data-dismiss="modal">취소</button>
							<button type="button" class="primary ghost" data-dismiss="modal"
								onclick="return tagChange()">
								<span id="report-result"></span>수정
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 -->
	</c:if>
	<%@ include file="../common/navbar.jsp"%>

	<article class="article-mychannel">
		<div class="container">
			<c:if test="${!empty show}">

				<div class="card-container">
					 <div class="header-title">${chValue.ch_name }&nbsp;채널의
							정보를 수정합니다.</div>				
					<div class="skills skills-bottom">
						<h5 class="text-center">Tags</h5>
						<ul id="tag-list" class="tag-list">
							<c:forEach var="tag" items="${tag }">
							<c:if test="${!(tag.tg_name == '전체' || tag.tg_name =='공지')}">
							<li>${tag.tg_name }</li>
							</c:if>
						</c:forEach>
						</ul>
					</div>
					<div class="tag-form">
					<!-- <button class="primary-title ghost" type="button">태그추가</button> -->
						<input class="form-control" id="tg_name" type="text"
							name="tg_name" placeholder="태그 추가" oninput="tagCheck()">
						<!-- 폼형식 <button id="formbtn" type="submit" disabled="disabled">추가</button> -->
						<button class="primary ghost" id="formbtn" onclick="addTag()" type="button" disabled="disabled">추가</button>	
					</div>
					
					<div id="result">&nbsp;</div>
					
					<div class="tag-form channel-intro">					
						<input class="form-control" id="intro" type="text"
							value="${chValue.ch_intro }">
						<button class="primary ghost" type="button" onclick="channelIntro()">채널 수정</button>
					</div>
					<div class="tagUpdate-btn">
						<button class="primary ghost" data-toggle="modal" type="button" data-target="#exampleModalCenter2" onclick="getTag()">태그 수정</button>
						<button class="primary ghost" data-toggle="modal" type="button" data-target="#exampleModalCenter" onclick="getTag()">태그 삭제</button>
					</div>
				</div>			
			</c:if>
			<div class="row">
				<c:choose>
					<c:when test="${!empty myChannel}">
						<c:forEach var="myChannel" items="${myChannel }">
							<div class="col-12 col-sm-6">

								<div class="card-container">
									<span class="pro"> <c:choose>
											<c:when test="${myChannel.ch_grade==0}">
									일반 채널
									</c:when>
											<c:when test="${myChannel.ch_grade==1}">
									주요 채널
									</c:when>
											<c:when test="${myChannel.ch_grade==2}">
									베스트 채널
									</c:when>
											<c:when test="${myChannel.ch_grade==3}">
									관리자 채널
									</c:when>
										</c:choose>
									</span>
									<!-- <img class="round"
										src="https://randomuser.me/api/portraits/women/79.jpg"
										alt="user" /> -->

									<div class="round">
										<i class="bi bi-box"></i>
									</div>
									<div class="header-title">
										<strong>${myChannel.ch_name }&nbsp;채널</strong>
									</div>

									<div class="header-info">
										<i class="bi bi-person-plus-fill" style="color: green;"></i>&nbsp;구독자&nbsp;
										${myChannel.ch_subscribe }명&nbsp;
									</div>
									<div class="header-info">
										<i class="bi bi-star-fill" style="color: red"></i>&nbsp;${myChannel.u_name }
									</div>
									<div class="header-info">
										<i class="bi bi-pencil-fill" style="color: blue"></i>&nbsp;${myChannel.ch_intro }
									</div>
									<div class="buttons">
										<button class="primary"
											onclick="location.href='/channel/myChannel?ch_id=${myChannel.ch_id }'">채널
											수정</button>
										<button class="primary ghost"
											onclick="location.href='/board?ch_id=${myChannel.ch_id}'">채널로
											가기</button>
									</div>
									<div class="skills">
										<h5>Tags</h5>
										<ul>
											<c:forEach var="tag" items="${myChannel.channelTagList }">
												<li><div class="">${tag.tg_name }</div></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>


							<%-- <div class="col-sm-6 col-12">
								<a href="/channel/myChannel?ch_id=${myChannel.ch_id }">
									<div class="ch-box">
										<div class="inner-box">
											<div class="header-title">
												<span class="bi bi-box"></span>&nbsp;<strong>${myChannel.ch_name }&nbsp;채널</strong>
											</div>
											<div class="ch-header">
												<div class="pt-2 header-info">구독자
													${myChannel.ch_subscribe }명&nbsp;</div>
												<div class="pt-2 header-info">@${myChannel.u_name }</div>
											</div>
										</div>
										<div class="ch-body">
											<c:forEach var="tag" items="${myChannel.channelTagList }">
												<div class="tag-box">${tag.tg_name }</div>
											</c:forEach>
										</div>

									</div>
								</a>
							</div> --%>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="go-register col-12">
							<button type="button" class="primary" onclick="location.href='/channel/creation'">등록하러가기!!</button>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</article>

	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
		function tagCheck() {
			var tg_name = $('#tg_name').val().trim();
			var ch_id = '${channel.ch_id}';

			$.ajax({

				url : "/channel/tagCheck",
				type : "post",
				dataType : "json",
				data : {
					"ch_id" : ch_id,
					"tg_name" : tg_name
				},
				success : function(data) {
					$('#result').empty();
					if (tg_name == "") {
						$('#result').append("&nbsp;");
						$('#formbtn').prop("disabled", true);
					} else if (data == 1) {
						$('#result').append("중복입니다.");
						$('#formbtn').prop("disabled", true);
					} else if (data == 0) {
						$('#result').append("사용가능!!!");
						$('#formbtn').removeAttr("disabled");
					}
				}
			})
		}
		function channelIntro() {

			var text = $('#intro').val();
			console.log(text);
			$.ajax({
				url : "/channel/introChange",
				type : "get",
				dataType : "json",
				data : {
					ch_intro : text
				},
				success : function(data) {
					if (data == 1)
						alert("채널 설명이 수정되었습니다.");
					else
						alert("실패");
				}
			})

		}
		function addTag() {
			var tagName = $('#tg_name').val();

			var confirmCheck = confirm("추가하시겠습니까?");
			if (confirmCheck == true) {

				console.log(tagName);
				$.ajax({
					url : "/channel/addTag",
					type : "get",
					dataType : "json",
					data : {
						tg_name : tagName
					},
					success : function(data) {
						$("#tag-list").empty();
						$.each(data, function(index, item) {
							if(!(item.tg_name == '전체' ||item.tg_name == '공지'))
							$("#tag-list").append(
									'<li>' + item.tg_name + '</li>');
						});
					},
					error : function() {
						alert("통신실패");
					}
				})
			}

		}
		function getTag() {	
			console.log('ㅎㅇ');
			$.ajax({
				url : "/channel/getTag",
				type : "get",
				dataType : "json",
				success : function(data) {
					$(".getTag").empty();
					$.each(data, function(index, item) {
						if(!(item.tg_name == '전체' ||item.tg_name == '공지'))
						$(".getTag").append(
								'<li>' + item.tg_name
										+ '</li>');
					});
				},
				error : function() {
					alert("통신실패");
				}
			})
		}
		function tagDelete() {
			var tagName = $('#deleteTag').val();
		
			var confirmCheck = confirm("삭제하시겠습니까?");
			if (confirmCheck == true) {

				console.log(tagName);
				$.ajax({
					url : "/channel/tagDelete",
					type : "get",
					dataType : "json",
					data : {
						tg_name : tagName
					},
					success : function(data) {
						$("#tag-list").empty();
						$.each(data, function(index, item) {
							if(!(item.tg_name == '전체' ||item.tg_name == '공지'))
							$("#tag-list").append(
									'<li>' + item.tg_name
											+ '</li>');
						});
					},
					error : function() {
						alert("통신실패");
					}
				})
			}

		}
		 function tagChange() {

			var originTag = $('#originalTag').val();
			var updateTag = $('#updateTag').val();
			var confirmCheck = confirm("변경하시겠습니까?");
			if (confirmCheck == true) {
				$.ajax({
					url : "/channel/tagChange",
					type : "get",
					dataType : "json",
					data : {
						tg_name : originTag,
						tg_change : updateTag
					},
					success : function(data) {
						$("#tag-list").empty();
						$.each(data, function(index, item) {
							if(!(item.tg_name == '전체' ||item.tg_name == '공지'))
							$("#tag-list").append(
									'<li>' + item.tg_name
											+ '</li>');
						});
					}
				})
			}
		} 
	</script>
</body>
</html>