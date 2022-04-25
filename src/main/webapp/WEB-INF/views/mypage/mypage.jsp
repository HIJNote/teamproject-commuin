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
.mypage-header i {
	font-size: 2rem;
}

.mypage-item-box {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.mypage-header {
	background-color: var(--color-bg-1);
}

.ch-name {
	color: #888888;
}

.mypage-body {
	height: 300px;
	overflow-y: scroll;
	/*  -ms-overflow-style: none; */ /*IE and Edge*/
	/* scrollbar-width: none;  */
}

.mypage-body::-webkit-scrollbar {
	/* display: none;  */ /*Chrome Safari, Opera*/
	
}

.vcol-time {
	width: 80px;
}

.vcol-content {
	width: calc(100% - 80px);
}

.mypage-userinfo{
display: flex;
flex-wrap: wrap;
font-size:1.6rem;
border:1px solid #a5b8c7;
margin: 0.5rem 0;

}

.mypage-userinfo-key{
width:30%;
border-right:1px solid #a5b8c7;
background: var(--color-bg-1);
padding: 0.5rem;
}
.mypage-userinfo-value{
width:70%;
padding:0.5rem;
}
.item-count{
padding:1rem 2rem;
font-size: 1.5rem;
}
</style>
</head>

<body>
	<%@ include file="../common/navbar.jsp"%>

	<article class="article-mypage">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-12">
					<div class="mypage-userinfo">
						<div class="mypage-userinfo-key">아이디</div>
						<div class="mypage-userinfo-value">${sessionValue.sessionId }</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="mypage-userinfo">
						<div class="mypage-userinfo-key">닉네임</div>
						<div class="mypage-userinfo-value">${sessionValue.sessionName }</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="mypage-userinfo">
						<div class="mypage-userinfo-key">이메일</div>
						<div class="mypage-userinfo-value">${sessionValue.sessionEmail }</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="mypage-userinfo">
						<div class="mypage-userinfo-key">가입일</div>
						<div class="mypage-userinfo-value">${sessionValue.sessionJoindate }</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-12">
					<div class="mypage-box">
						<div class="mypage-header">
							<strong><i class="bi bi-list-stars"></i>&nbsp;내가 등록한 게시글 [${boardCount }]</strong>
						</div>
						<div class="mypage-body">
							<c:forEach var="board" items="${board }">
								<fmt:formatDate var="regdate" type="both"
									value="${board.b_regdate }" pattern="yyyy.MM.dd" />
								<!-- 오늘날짜 -->
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:formatDate var="today" type="both" value="${now}"
									pattern="yyyy.MM.dd" />

								<div class="mypage-item">

									<a href="/board?ch_id=${board.ch_id }&b_id=${board.b_id}">
										<div class="mypage-item-box">
											<div class="vcol-content">
												<span class="ch-name">[${board.ch_name }]</span>&nbsp;${board.b_title }
											</div>
											<c:choose>
												<c:when test="${today > regdate }">
													<div class="vcol vcol-time">${ regdate}</div>
												</c:when>
												<c:otherwise>
													<fmt:formatDate var="regdate" type="both"
														value="${board.b_regdate }" pattern="HH:mm" />
													<div class="vcol vcol-time">${ regdate}</div>
												</c:otherwise>
											</c:choose>
										</div>
									</a>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>

				<div class="col-sm-6 col-12">
					<div class="mypage-box">
						<div class="mypage-header">
							<strong><i class="bi bi-chat-dots"></i>&nbsp;내가 등록한 댓글 [${replyCount }]</strong>
						</div>
						<div class="mypage-body">
							<c:forEach var="reply" items="${reply }">
								<fmt:formatDate var="regdate" type="both"
									value="${reply.rp_regdate }" pattern="yyyy.MM.dd" />
								<!-- 오늘날짜 -->
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:formatDate var="today" type="both" value="${now}"
									pattern="yyyy.MM.dd" />

								<div class="mypage-item">
									<a href="/board?ch_id=${reply.board.ch_id }&b_id=${reply.b_id}">
										<div class="mypage-item-box">
											<c:choose>
												<c:when test="${reply.rp_type ==1 }">
													<div class="vcol-content">
														<span class="ch-name">[${reply.board.ch_name }]</span>&nbsp;이모티콘
														댓글입니다.
													</div>
												</c:when>
												<c:otherwise>
													<div class="vcol-content">
														<span class="ch-name">[${reply.board.ch_name }]</span>&nbsp;${reply.rp_content }
													</div>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${today > regdate }">
													<div class="vcol vcol-time text-center">${ regdate}</div>
												</c:when>
												<c:otherwise>
													<fmt:formatDate var="regdate" type="both"
														value="${reply.rp_regdate }" pattern="HH:mm" />
													<div class="vcol vcol-time text-center">${ regdate}</div>
												</c:otherwise>
											</c:choose>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-12">
					<div class="mypage-box">
						<div class="mypage-header">
							<strong><i class="bi bi-bookmark-check"></i>&nbsp;내가
								스크랩한 글 [${scrapCount }]</strong>
						</div>
						<div class="mypage-body">
							<c:forEach var="scrap" items="${scrap }">
								<fmt:formatDate var="regdate" type="both"
									value="${scrap.sc_date }" pattern="yyyy.MM.dd" />
								<!-- 오늘날짜 -->
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:formatDate var="today" type="both" value="${now}"
									pattern="yyyy.MM.dd" />

								<div class="mypage-item">
									<a href="/board?ch_id=${scrap.board.ch_id }&b_id=${scrap.b_id}">
										<div class="mypage-item-box">
											<div class="vcol-content">
												<span class="ch-name">[${scrap.board.ch_name }]</span>&nbsp;${scrap.board.b_title }
											</div>
											<c:choose>
												<c:when test="${today > regdate }">
													<div class="vcol vcol-time text-center">${ regdate}</div>
												</c:when>
												<c:otherwise>
													<fmt:formatDate var="regdate" type="both"
														value="${scrap.sc_date }" pattern="HH:mm" />
													<div class="vcol vcol-time text-center">${ regdate}</div>
												</c:otherwise>
											</c:choose>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-12">
					<div class="mypage-box">
						<div class="mypage-header">
							<strong><i class="bi bi-emoji-laughing"></i>&nbsp;내가 가지고
								있는 이모티콘 [${userEmoticonCount }]</strong>
						</div>
						<div class="mypage-body-img">
							<c:forEach var="userEmoticon" items="${userEmoticon }">
								<div class="img-box">
									<a href="/emoticon?e_id=${userEmoticon.emoticon.e_id }"><img
										src="${path }${userEmoticon.emoticon.e_path}" alt="X"></a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</div>
	</article>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>