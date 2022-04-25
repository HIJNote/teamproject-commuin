<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="config/css.jsp"%>
<%@ include file="config/js.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
.swal-button--cancle {
	background-color: #c1c1c1;
}

.swal-button--confirm {
	background-color: #8cd4f5;
}

.swal-footer {
	text-align: center;
}

.swal-button--cancle:hover {
	background-color: #b1b1b1 !important;
}
/*  */
.board-header a {
	text-decoration: none;
	color: var(--color-text-color);
}

.temp-box a {
	text-decoration: none;
	color: var(--color-text-color);
}

.chip {
	padding: 5px 5px;
	border-radius: 5px;
	font-weight: bold;
	font-size: 1.5rem;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	cursor: pointer;
}

.title-topmargin {
	display: flex;
	flex-wrap: wrap;
}

.chip.primary {
	background: var(--color-bg-navbar);
	color: whitesmoke;
}

.board-header .btn-subscribe {
	width: 61px;
	border: 2px solid var(--color-bg-navbar);
}

.board-header .subscribe-text, .board-header .btn-subscribe>i {
	color: red;
	font-size: 1.3rem;
}

.board-header .btn-subscribed {
	width: 80px;
	background: #db4c4c;
	border: 2px solid black;
}

.board-header .subscribed-text, .board-header .btn-subscribed>i {
	color: white;
	font-size: 1.3rem;
}

.header-box {
	display: flex;
	flex-wrap: wrap;
}

.header-item {
	width: calc(100% - 80px);
}

.subs-item {
	width: 80px;
}

.board-sort .btn {
	font-size: 1.5rem;
}

/* 선택된 게시판 */

.selected-board .badge{
	background-color: var(--color-bg-badge);
	color:var(--color-text-badge-color);
	font-size: 1.3rem;
	padding: 0.5rem;
	font-weight:lighter; 
}

@media screen and (max-width: 425px) {
	.header-item {
		order: 2;
		width: 100%;
	}
	.subs-item {
		order: 1;
		width: 100%;
		margin-bottom: 0.5rem;
	}
}
</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판목록</title>
<style type="text/css">
</style>
</head>
<!-- d-none d-md-flex 를 이용해서 md이상부터 숨기기 가능-->

<body>

	<!-- 페이징 시작전 세팅 -->
	<c:set var="searchOption"
		value="${option == null?'':'&searchCondition='}${option }"></c:set>
	<c:choose>
		<c:when test="${keyword =='' ||keyword==null }">
			<c:set var="searchKeyword" value=""></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="searchKeyword" value="&searchKeyword=${keyword }"></c:set>
		</c:otherwise>
	</c:choose>
	<c:set var="searchTarget"
		value="${target==nulll?'':'&target=' }${target }"></c:set>
	<c:set var="searchTag"
		value="${tagName==null?'':'&tagName=' }${tagName}"></c:set>
	<c:set var="bId"
		value="${thisBoard==null?'':'&b_id=' }${thisBoard.b_id }"></c:set>
	<c:set var="targetURL"
		value="${searchTag }${searchOption }${searchKeyword }"></c:set>
	<c:set var="pageURL"
		value="${searchTag}${searchTarget }${searchOption }${searchKeyword }"></c:set>

	<c:if test="${!empty sessionValue }">
		<!-- Modal -->
		<div class="model-class">
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">게시물 신고</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true" style="font-size: 2rem;"><i
									class="bi bi-x-square-fill"></i></span>
							</button>
						</div>
						<div class="modal-body">
							<div>작성자&nbsp;:&nbsp;${thisBoard.u_name }</div>
							<div>제목&nbsp;:&nbsp;${thisBoard.b_title }</div>
							<br> <label class="box-radio-input"> <input
								type="radio" name="radioValue" value="도배성"><span
								class="text-flex">도배성</span>
							</label> <label class="box-radio-input"> <input type="radio"
								name="radioValue" value="비방성"><span class="text-flex">비방성</span>
							</label> <label class="box-radio-input"> <input type="radio"
								name="radioValue" value="기타" checked="checked"><span
								class="text-flex">기타</span>
							</label>
							<textarea class="form-control" id="ason"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-success"
								data-dismiss="modal" onclick="return report(${thisBoard.b_id})">
								<span id="report-result"></span>신고
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 -->
	</c:if>
	<%@ include file="../common/navbar.jsp"%>

	<article class="board-article">
		<div class="container boardList-container">
			<!-- 게시판 헤더 -->
			<div class="board-header">
				<div class="header-box">
					<div class="header-item flex-header">
						<div class="board-header-title">
							<a href="/board?ch_id=${channel.ch_id}"><strong><span
									class="chip primary"><i
										class="bi bi-layout-text-sidebar"></i>&nbsp;${channel.ch_name}&nbsp;채널
								</span></strong></a>
						</div>

						<div class="title-topmargin pt-2">
							<div>
								<i class="bi bi-person-plus-fill" style="color: green;"></i>&nbsp;구독자
								<span id="subs-count">${channel.ch_subscribe }</span>명&nbsp;
							</div>
							<c:if test="${channel.ch_grade ne '2' }">

								<div class="" style="font-size: 1.3rem">
									<i class="bi bi-star-fill" style="color: red"></i>${channel.u_name }&nbsp;</div>
							</c:if>
							<div class="">
								<i class="bi bi-pencil-fill" style="color: blue;"></i>&nbsp;${channel.ch_intro }
							</div>
						</div>

					</div>

					<div class="subs-item text-right" id="subscribe">
						<c:choose>
							<c:when test="${subscribe eq '1'}">
								<div id="subsed" class="btn btn-subscribed"
									onclick="subsCheck()">
									<i class="bi bi-check2"></i> <span class="subscribed-text">구독
										중</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="btn btn-subscribe" onclick="subsCheck()">
									<i class="bi bi-plus"></i><span class="subscribe-text">구독</span>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<!-- 선택된 게시판 -->

			<c:if test="${!empty thisBoard}">
				<c:if test="${channel.ch_id eq '1' }">
				<span>
					<a href="/board?ch_id=${thisBoard.ch_id }" style="color:black">${thisBoard.ch_name}&nbsp;<span>채널로
						가기!</span></a>
						</span>
				</c:if>
				<article class="selected-board">
					<div class="getboard-title mt-2">
						<c:choose>
						<c:when test="${thisBoard.b_tag =='전체' }">
						<strong>${thisBoard.b_title}</strong>
						</c:when>
						<c:otherwise>
						<strong><span class="badge">${thisBoard.b_tag}</span>&nbsp;${thisBoard.b_title}</strong>
						</c:otherwise>
						</c:choose>
					
						<!-- 신고버튼 -->
						<c:choose>
							<c:when test="${empty sessionValue }">
								<div>
									<button type="button" onclick="alert('로그인을 해주세요')">
										<i class="bi bi-lightbulb-fill"></i>&nbsp;신고
									</button>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<button type="button" data-toggle="modal"
										data-target="#exampleModalCenter">
										<i class="bi bi-lightbulb-fill"></i>&nbsp;신고
									</button>
								</div>
							</c:otherwise>
						</c:choose>

						<!-- 신고버튼 끝 -->
					</div>
					<div class="row getboard-info">
						<div class="col-md-5 col-12 member-info">
							<i class="bi bi-person-fill"></i>&nbsp;${thisBoard.u_name }
						</div>
						<div class="col-md-7 col-12 board-info">
							<div class="board-score">
								<span class="b-head">추천</span> <span id="follow-text"
									class="b-body" style="color: royalblue;">${thisBoard.b_follow }</span>
								<span class="b-sep"></span> <span class="b-head"
									id="reply-count">댓글</span> <span class="b-body"
									style="color: orangered;">${thisBoard.b_reply_count }</span> <span
									class="b-sep"></span> <span class="b-head">조회수</span> <span
									class="b-body" style="color: orange;">${thisBoard.b_view }&nbsp;</span>
							</div>
							<div class="board-date">
								<span class="b-sep"></span> <span class="b-head">작성일</span>
								<fmt:formatDate value="${thisBoard.b_regdate }" var="formatDate"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<span class="b-body">${formatDate }</span>
							</div>
						</div>
					</div>
					<div class="board-content">${thisBoard.b_content }</div>
					<div>
						<!-- <a href="/board/follow" style="text-decoration: none;"> -->
						<div class="board-vote">
							<div class="btn btn-secondary" onclick="followCheck()">
								<i class="bi bi-hand-thumbs-up-fill"></i> 추천&nbsp;<span
									id="follow-count" style="font-size: 1.5rem;"><span>${thisBoard.b_follow }</span></span>
							</div>
						</div>
						<div class="text-center" id="follow-msg"></div>
						<!-- </a> -->
					</div>
					<!-- 삭제 버튼 -->
					<c:if test="${thisBoard.u_name eq sessionValue.sessionName }">
						<div class="board-scrape border-top-0">
							<c:choose>
								<c:when test="${thisBoard.b_tag =='공지' }">
									<button class="btn btn-outline-dark"
										onclick="location.href='board/updateBoardInfo?ch_id=${channel.ch_id}&ch_name=${channel.ch_name}&b_id=${thisBoard.b_id }&check=1'">
										&nbsp;수정&nbsp;</button>
								&nbsp;&nbsp;
							</c:when>
								<c:otherwise>
									<button class="btn btn-outline-dark"
										onclick="location.href='board/updateBoardInfo?ch_id=${channel.ch_id}&ch_name=${channel.ch_name}&b_id=${thisBoard.b_id }'">
										&nbsp;수정&nbsp;</button>
								&nbsp;&nbsp;
							</c:otherwise>
							</c:choose>

							<button class="btn btn-outline-dark"
								onclick="boardDelete(${thisBoard.b_id},${channel.ch_id })">
								&nbsp;삭제&nbsp;</button>
						</div>
					</c:if>
					<!-- 스크랩 -->
					<div class="board-scrape">
						<button class="btn btn-secondary"
							onclick="scrap(${thisBoard.b_id})">
							<c:choose>
								<c:when test="${scrap eq '1' }">
									<div id="scrap">
										<span class="bi bi-bookmark-check"></span>스크랩 됨
									</div>
								</c:when>
								<c:otherwise>
									<div id="scrap">
										<span class="bi bi-bookmark"></span>스크랩!
									</div>
								</c:otherwise>
							</c:choose>
						</button>
					</div>
					<!-- 새로한곳 -->
					<div class="board-comment">
						<div class="comment-title">
							<i class="bi bi-chat-right-dots" style="font-size: 2rem;"></i> 댓글
						</div>
						<div class="comment-list">

							<c:forEach var="list" items="${replyList}">
								<fmt:formatDate var="replyRegdate" type="both"
									value="${list.rp_regdate }" pattern="yyyy-MM-dd hh:mm:ss" />

								<c:if test="${list.rp_type == 1 }">
									<div class="comment" id="div${list.rp_id }">
										<div class="user-info">
											<div class="user-id">${list.u_name}</div>
											<div class="user-date">
												${replyRegdate }&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply"
													href="#"><i class="bi bi-reply-fill"></i>답글</a>
												<c:if test="${list.u_name eq sessionValue.sessionName }">
														&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply"
														id="${list.rp_id}" href="#" onclick="replyDelete(this);"><i
														class="bi bi-trash2-fill"></i>삭제</a>
												</c:if>
											</div>
										</div>
										<div class="user-message">
											<img src="${path}${list.rp_content}">
										</div>
									</div>

								</c:if>

								<c:if test="${list.rp_type == 0 }">
									<div class="comment" id="div${list.rp_id }">
										<div class="user-info">
											<div class="user-id">${list.u_name}</div>
											<div class="user-date">
												${replyRegdate }&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply"
													href="#"><i class="bi bi-reply-fill"></i>답글</a>
												<c:if test="${list.u_name eq sessionValue.sessionName }">
														&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply"
														id="${list.rp_id}" href="#" onclick="replyDelete(this);"><i
														class="bi bi-trash2-fill"></i>삭제</a>
												</c:if>
											</div>
										</div>
										<div class="user-message">${list.rp_content}</div>
									</div>

								</c:if>

							</c:forEach>
							<div id="replyList"></div>
						</div>
					</div>
					<!-- 새로한곳 -->
					<div class="rp-class">
						<div class="rp-title">댓글 작성</div>

						<div class="rp-user-info">
							<div class="rp-user-name">
								<span>@</span>${sessionValue.sessionName }
							</div>
							<input type="button" value="이모티콘" id="showImg">
						</div>
						<!--style="
										display:inline-block;"  -->
						<div class="emoticon-show-box">
							<div class="emoticon-div">
								<div class="thumbnails">
									<c:forEach var="emoticonList" items="${emo}">
										<button type="button" class="btn-image"
											onclick="ajaximg(${emoticonList.e_id})">
											<img src="${path }${emoticonList.emoticon.e_path}">
										</button>
									</c:forEach>
								</div>
							</div>
							<div class="emo-list">
								<div id="commucon"></div>

							</div>
						</div>

						<div class="rp-text">
							<textarea maxlength="2000" id="b_content"></textarea>
							<button class="rp-submit"
								onclick="reply('${sessionValue.sessionName}','${thisBoard.b_id}');">작성</button>
						</div>
					</div>
				</article>
			</c:if>

			<!-- 게시글카테고리 황인재 -->
			<div class="board-bullet mt-2">
				<ul>
					<c:forEach var="tag" items="${tagList }">
						<c:choose>
							<c:when test="${tag.tg_name == '전체' }">
								<li><a href="/board?ch_id=${channel.ch_id }">${tag.tg_name}</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="/board?ch_id=${channel.ch_id }&tagName=${tag.tg_name}">${tag.tg_name}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>

			</div>
			<!-- 게시글목록 -->
			<div class="board-list">
				<div class="row">
					<!-- 게시글목록 헤더부분 크기 md 밑으로 내려갈경우 사라짐 -->
					<div class="col-md-12">
						<div class="vrow head d-none d-md-block d-md-flex">
							<div class="vrow-top">
								<div class="vcol vcol-id text-center">번호</div>
								<div class="vcol vcol-title">제목</div>
							</div>
							<div class="vrow-bottom">
								<div class="vcol vcol-author">작성자</div>
								<div class="vcol vcol-time text-center">작성일</div>
								<div class="vcol vcol-view text-center">조회수</div>
								<div class="vcol vcol-rate text-center">추천</div>
							</div>
						</div>
					</div>
					<c:forEach var="notice" items="${noticeBoard }">
						<!-- DB날짜 -->
						<fmt:formatDate var="regdate" type="both"
							value="${notice.b_regdate }" pattern="yyyy.MM.dd" />
						<!-- 오늘날짜 -->
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate var="today" type="both" value="${now}"
							pattern="yyyy.MM.dd" />

						<div class="col-md-12">
							<a
								href="/board?ch_id=${channel.ch_id }&b_id=${notice.b_id }${pageURL }&p=${p}">
								<div class="vrow head notice-board">
									<div class="vrow-top">
										<div class="vcol vcol-id text-center">${notice.b_tag }</div>
										<div class="vcol vcol-title">
											<i class="bi bi-megaphone-fill"></i>&nbsp;${notice.b_title }
										</div>
									</div>
									<div class="vrow-bottom">
										<div class="vcol vcol-author">${notice.u_name }</div>
										<!-- 날짜비교 -->
										<c:choose>
											<c:when test="${today > regdate }">
												<div class="vcol vcol-time text-center">${ regdate}</div>
											</c:when>
											<c:otherwise>
												<fmt:formatDate var="regdate" type="both"
													value="${notice.b_regdate }" pattern="HH:mm" />
												<div class="vcol vcol-time text-center">${ regdate}</div>
											</c:otherwise>
										</c:choose>
										<div class="vcol vcol-view text-center">${notice.b_view }</div>
										<div class="vcol vcol-rate text-center">${notice.b_follow }</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
					<c:forEach var="board" items="${board}" varStatus="status">
						<div class="col-md-12">
							<a
								href="/board?ch_id=${channel.ch_id }&b_id=${board.b_id }${pageURL }&p=${p}">
								<div class="vrow">
									<div class="vrow-top">
										<div class="vcol vcol-id text-center">${pageMaker.totalCount-(p-1)*pageMaker.perPageNum-status.index}</div>
										<div class="vcol vcol-title ">
											<c:choose>
												<c:when test="${channel.ch_id eq '1' }">
													<span class="badge">${board.ch_name }</span>&nbsp;
											 ${board.b_title }<span>&nbsp;&nbsp;&nbsp;[${board.b_reply_count }]</span>
												</c:when>
												<c:otherwise>
													<c:choose>

														<c:when test="${board.b_tag ne '전체' }">
															<span class="badge"> ${board.b_tag }</span> ${board.b_title }<span>&nbsp;&nbsp;&nbsp;[${board.b_reply_count }]</span>
														</c:when>
														<c:otherwise>
													${board.b_title }<span>&nbsp;&nbsp;&nbsp;[${board.b_reply_count }]</span>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="vrow-bottom">
										<div class="vcol vcol-author">${board.u_name }</div>
										<!-- DB날짜 -->
										<fmt:formatDate var="regdate" type="both"
											value="${board.b_regdate }" pattern="yyyy.MM.dd" />
										<!-- 오늘날짜 -->
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<fmt:formatDate var="today" type="both" value="${now}"
											pattern="yyyy.MM.dd" />
										<!-- 날짜비교 -->
										<c:choose>
											<c:when test="${today > regdate }">
												<div class="vcol vcol-time text-center">${ regdate}</div>
											</c:when>
											<c:otherwise>
												<fmt:formatDate var="regdate" type="both"
													value="${board.b_regdate }" pattern="HH:mm" />
												<div class="vcol vcol-time text-center">${ regdate}</div>
											</c:otherwise>
										</c:choose>


										<div class="vcol vcol-view text-center">${board.b_view }</div>
										<div class="vcol vcol-rate text-center">${board.b_follow }</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>


				</div>
			</div>


			<!-- 글분류+글쓰기 -->

			<div class="board-sort mt-3">
				<div class="row">
					<div class="col-8">
						<a href="/board?ch_id=${channel.ch_id}">
							<div class="btn btn-outline-primary mr-2 mb-2">전체글</div>
						</a>
						<%-- <c:if test="${channel.ch_id ne '1' }">
							<a href="/board?ch_id=${channel.ch_id}&target=good$${targetURL}">
								<div class="btn btn-outline-danger mr-2 mb-2">개념글</div>
							</a>
						</c:if> --%>
						<a href="/board?ch_id=${channel.ch_id}&target=view${targetURL}">
							<div class="btn btn-outline-danger mr-2 mb-2">조회순</div>
						</a> <a
							href="/board?ch_id=${channel.ch_id}&target=comment${targetURL}">
							<div class="btn btn-outline-info mr-2 mb-2">댓글순</div>
						</a> <a href="/board?ch_id=${channel.ch_id}&target=follow${targetURL}">
							<div class="btn btn-outline-success mr-2 mb-2">추천순</div>
						</a>
					</div>
					<div class="col-4">
						<c:if test="${channel.ch_grade <2 }">
							<a
								href="/board/write?ch_id=${channel.ch_id}&ch_name=${channel.ch_name}">
								<div class="btn btn-outline-dark mb-2 float-right">글쓰기</div>
							</a>
							<c:if test="${channel.u_name eq sessionValue.sessionName}">
								<a
									href="/board/write?ch_id=${channel.ch_id}&ch_name=${channel.ch_name}&check=1">
									<div class="btn btn-outline-danger mb-2 float-right ml-1 mr-1">공지</div>
								</a>
							</c:if>

						</c:if>
						<c:if test="${channel.ch_grade>2}">
							<c:choose>
							<c:when test="${channel.ch_name == '문의 게시판'}">
							<a
								href="/board/write?ch_id=${channel.ch_id}&ch_name=${channel.ch_name}">
								<div class="btn btn-outline-dark mb-2 float-right">글쓰기</div>
							</a>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionValue.sessionId eq 'admin' }">
								<a
									href="/board/write?ch_id=${channel.ch_id}&ch_name=${channel.ch_name}">
									<div class="btn btn-outline-dark mb-2 float-right">전체공지</div>
								</a>
							</c:if>
							</c:otherwise>
							</c:choose>
						</c:if>
					</div>
				</div>
			</div>

			<!-- 검색 -->
			<form action="/board" method="get"
				class="form-inline justify-content-end mb-2">
				<input type="hidden" name="ch_id" value="${channel.ch_id }">
				<c:if test="${!empty target }">
					<input type="hidden" name="target" value="${target }">
				</c:if>
				<c:if test="${!empty tagName }">
					<input type="hidden" name="tagName" value="${tagName }">
				</c:if>
				<div class="input-group">
					<div class="input-group-prepend">
						<select class="form-control form-control-sm"
							name="searchCondition">
							<c:forEach items="${conditionMap }" var="condition">
								<c:choose>
									<c:when test="${option eq condition.value }">
										<option value="${condition.value }" selected="selected">${condition.key }
									</c:when>
									<c:otherwise>
										<option value="${condition.value }">${condition.key }
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>

					<input type="text" class="form-control form-control-sm"
						name="searchKeyword" value="${keyword }">
					<div class="input-group-append">
						<button class="btn btn-secondary btn-sm" type="submit">검색</button>
					</div>
				</div>
			</form>



			<!-- 페이징시작 -->
			<nav>
				<ul class="pagination flex-wrap justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item-box"><a class="page-link"
							href='<c:url value="/board?ch_id=${channel.ch_id }${pageURL }&p=1"/>'>&laquo;</a></li>
					</c:if>
					<c:if test="${pageMaker.prev }">
						<li class="page-item-box"><a class="page-link"
							href='<c:url value="/board?ch_id=${channel.ch_id }${pageURL }&p=${pageMaker.startPage-1}"/>'>&lt;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="pageNum">
						<c:choose>
							<c:when test="${pageNum eq p }">
								<li><a class="page-link now-page"
									style="background-color: black; color: white;"
									href='<c:url value="board?ch_id=${channel.ch_id }${pageURL }&p=${pageNum }"/>'>${pageNum }</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="page-link"
									href='<c:url value="board?ch_id=${channel.ch_id }${pageURL }&p=${pageNum }"/>'>${pageNum }</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li><a class="page-link"
							href='<c:url value="/board?ch_id=${channel.ch_id}${pageURL }&p=${pageMaker.endPage+1 }"/>'>&gt;</a></li>
					</c:if>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li><a class="page-link"
							href='<c:url value="/board?ch_id=${channel.ch_id}${pageURL }&p=${pageMaker.end}"/>'>&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>

	</article>
	<%@ include file="../common/footer.jsp"%>

	<script>
	 
	//황인재 
	/* 신고 */
	function report(b_id) {
		var reason = $('input:radio[name="radioValue"]:checked').val();
		$('input:radio[name="radioValue"]:input[value="01"]').prop("checked", true);
		if(reason=='기타')
		reason=$('#ason').val();
		$('#ason').val('');
		
		$.ajax({
			url: "/report",
			type: "post",
			dataType: "json",
			data: {
				re_reason:reason,
				b_id:b_id},
			success: function(data) {
			if(data==0){
				alert("이미 신고한 게시물입니다.");
			}
			else if(data==1){
				alert('신고 완료');
			}
			else{
				alert('로그인을 해주세요.');
			}
			}
		})
	}

	/*구독*/
	function subsCheck(){
		var name='${sessionValue.sessionName}';
		var ch_id='${channel.ch_id}';
		if(name!=""){
		$.ajax({
			url: "/board/subscribe",
			type: "get",
			dataType: "json",
			data: { ch_id: ch_id },
			success: function(data) {
			$('#subscribe').empty();
			$('#subs-count').empty();
			html='';
			if(data.msg=='0'){
				
			html += '<div class="btn btn-subscribe subs" onclick="subsCheck()" >'		
			html += '<i class="bi bi-plus"></i><span class="subscribe-text">구독</span></div>'
			$('#subs-count').append(data.count);
			}else if(data.msg=='1'){		
			
				html += '<div id="subsed" class="btn btn-subscribed" onclick="subsCheck()">'		
				html +='<i class="bi bi-check2"></i> <span class="subscribed-text">구독 중</span></div>'
					$('#subs-count').append(data.count);
			}else{
				location.href="/member/login";
			}
			$('#subscribe').append(html);
			}	
		})}	
		else{
			location.href="/member/login";
		}
	}

	/* 추천을 하면 추천수 증가 */
	
	function followCheck() {
		var name='${sessionValue.sessionName}';
		var b_id='${thisBoard.b_id}';
		if(name!=""){
		$.ajax({
			url: "/board/follow",
			type: "get",
			dataType: "json",
			data: { b_id: b_id },
			success: function(data) {
			$('#follow-count').empty();
			$('#follow-count').append('<span>'+data.follow+'</span>');
			$('#follow-text').text(data.follow);
			$('#follow-msg').text(data.msg);
			$('#follow-msg').fadeOut(2000);
			$('#follow-msg').css('display','block');
			}	
		})}
		else{
			location.href="/member/login";
		}
		
	}
	
	/* 이모티콘 버튼을 눌렀을때 로그인 했다면 이모티콘 창이 열리고
	비로그인이면 경고창이 뜬다.*/
	
	$(document).ready(function() {	
			$('#showImg').click(function(){			
				<c:choose>
				<c:when test='${!empty sessionValue}'>				
				$('.emoticon-show-box').css('display', 'inline-block');
				</c:when>
				<c:otherwise>
				alert('로그인을 해주세요');
				</c:otherwise>
				</c:choose>
			});
	});
	
	/* 이모티콘을 누르면 해당 이모티콘파일들이 보이게된다 */
	 function ajaximg(id){		
		$("#commucon").empty();
		var e_id=id;
		console.log(e_id);
		var html = '';
		$.ajax({
			url: "/board/getEmoticon",
			type: "get",
			dataType: "json",
			data: { "e_id": e_id },
			success: function(data) {
					
				let str = JSON.stringify(data); 
				
				$.each(data, function(index, item) { 
					/* html +='<a href="#">'
					html +='<img src="${path }/resources/'
					htmL += item.e_path
					html += '">'
					html += '</a>'  */
					$("#commucon").append('<img src="${path}'+item.el_path+'" onclick="imgReply(this);">');					
				});
			}		
		});
		} 
	
	

	 //여현모
	 function reply(u_name,b_id) {
	 		/*수정
			let today = new Date();
			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			let hours = today.getHours(); // 시
			let minutes = today.getMinutes();  // 분
			let seconds = today.getSeconds();  // 초
			*/
			
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<fmt:formatDate var="today" type="both" value="${now}"
			pattern="yyyy-MM-dd hh:mm:ss" />
			
			var b_content = document.getElementById("b_content").value;
			var html = '';
			$.ajax({
				type: "GET",
				url:"/admin/replyInsert",
				data : {b_id : b_id, u_name : u_name, rp_content : b_content, rp_type : 0},
				success : function(data){
		
					html += ' <div class="comment" id = "div' + data +'">';
					html += 
						' 	<div class="user-info">';
					html += ' 		<div class="user-id">' + u_name + '</div>';
					html += '			<div class="user-date">';
						
					html += ' 				' + "${today}" + '&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply" href="#"> <i class="bi bi-reply-fill"></i>답글</a>';
					html += '&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply" id="' + data + '" href="#" onclick="replyDelete(this);"><i class="bi bi-trash2-fill"></i>삭제</a>';
					html += '			 </div>';
					html += ' 		</div>';
					html += ' 		<div class="user-message">' + b_content + '</div>';
					html += ' </div>';
			
					var htmlstr = document.getElementById("replyList"); 
					htmlstr.innerHTML += html;
				
					document.getElementById("b_content").value = '';
					//document.getElementById("reply-count").value=data;
					
				},
				error : function(){
					location.href='/member/login'; 
			
				}
			});
		}
	 
	 	//이미지 댓글
	 	function imgReply(obj) {
	 		var src = $(obj).attr('src');
	 		var u_name = '${sessionValue.sessionName}';
	 		var b_id = '${thisBoard.b_id}';
	 		var html = '';
	 		
	 		<c:set var="now" value="<%=new java.util.Date()%>" />
			<fmt:formatDate var="today" type="both" value="${now}"
			pattern="yyyy-MM-dd hh:mm:ss" />
	 		
	 		$.ajax({
				type: "GET",
				url:"/admin/replyInsert",
				data : {b_id : b_id, u_name : u_name, rp_content : src, rp_type : 1},
				success : function(data){
					
					html += ' <div class="comment" id = "div' + data +'">';
					html += 
						' 	<div class="user-info">';
					html += ' 		<div class="user-id">' + u_name + '</div>';
					html += '			<div class="user-date">';
						
					html += ' 				' + "${today}" + '&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply" href="#"> <i class="bi bi-reply-fill"></i>답글</a>';
					html += '&nbsp;&nbsp;|&nbsp;&nbsp;<a class="reply" id="' + data + '" href="#" onclick="replyDelete(this);"><i class="bi bi-trash2-fill"></i>삭제</a>';
					html += '			 </div>';
					html += ' 		</div>';
					html += ' 		<div class="user-message"><img src="${path}'+ src +'"></div>';
					html += ' </div>';
			
					var htmlstr = document.getElementById("replyList"); 
					htmlstr.innerHTML += html;
				
					document.getElementById("b_content").value = '';
					//document.getElementById("reply-count").value=data;
					$('.emoticon-show-box').css('display', 'none');
					
				},
				error : function(){
					location.href='/member/login'; 
			
				}
			});
	 	}
	 	
	 	//댓글 삭제
	 	function replyDelete(obj){
	 		
	 		swal({
	 			title : '댓글 삭제',
	 			text: '댓글을 삭제하시겠습니까?',
	 			icon : 'warning',
	 			buttons : {
	 				confirm : {
	 					text : '확인',
	 					value : true
	 				},
	 				cancle : {
	 					text : '취소',
	 					value : false
	 				}
	 			}
	 		}).then((result) => {
	 			if(result) {
	 				swal('댓글 삭제', '완료', 'success');
	 				
	 				$.ajax({
						type: "GET",
						url:"/admin/replyDelete",
						data : {rp_id : obj.id},
						success : function(){
							var div = '#div' + obj.id;
							$('div').remove(div);
							//alert(div); 삭제 확인
						},
						error : function(){
							alert('오류');
							location.href='/member/login'; 
					
						}
					});
	 			}
	 			
	 		});
	 		
	 	}
	 	
	 	//게시글 삭제
	 	function boardDelete(boardId, channelId){
	 		swal({
	 			title : '게시글 삭제',
	 			text: '게시글을 삭제하시겠습니까?',
	 			icon : 'warning',
	 			buttons : {
	 				confirm : {
	 					text : '확인',
	 					value : true
	 				},
	 				cancle : {
	 					text : '취소',
	 					value : false
	 				}
	 			}
	 		}).then((result) => {
	 			if(result) {
	 				swal({
						title : '게시글 삭제',
						text : '완료',
						icon : 'success',
						buttons : {
							confirm : {
								text : '확인',
								value : true
							}
						}
	 				}).then((value) => {
	 					location.href ='/board/delete?b_id='+boardId+'&ch_id='+channelId;
	 				});
	 			}
	 			
	 		});
	 	}
	</script>


</body>

</html>