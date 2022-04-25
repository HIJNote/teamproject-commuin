<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<%@ include file="setting/js.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="img" value="./../resources/image/emoticon" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
<title>Document</title>
<link rel="stylesheet" href="${path }/resources/css/root.css">
<style type="text/css">
.chip{
	padding: 8px 10px;
	border-radius: 10px;
	font-weight: bold;
	font-size: 1.5rem;
	box-shadow: 0 2px 5px rgba(0,0,0,.25);
	
	cursor: pointer;
}
.chip-box{

}


.chip.primary{
 	/* background: #2F4058;  */
	 background: var(--color-bg-navbar);
	color: whitesmoke;
}

.board-title-link{
display: flex;
flex-wrap: wrap;
justify-content: space-between;
}
.board-link{
padding: 1rem 0;
color: #2F4058;
font-size: 2rem;
}


</style>
</head>

<body>
	<%@ include file="../common/navbar.jsp"%>
	<!-- main -->
	<article class="main-article">
		<!-- container -->
		<div class="container">
			<div class="row">
				<!-- 베스트 카테고리 추천10개 + 시간 빠른순으로 검색-->
				<div class="col-lg-4 col-sm-12 order-lg-1 best-item-border">
					<c:forEach var="bestChannel" items="${bestChannel }">
					
						<div class="bestboard-wrap">

							<div class="mb-4 mt-3 chip-box">
								<a class="title-hover" href="/board?ch_id=${bestChannel.ch_id}">
									<div class="board-title-link">
										<div class="chip primary">
											<i class="bi bi-layout-text-sidebar"></i>&nbsp;${bestChannel.ch_name }
										</div>
										<div class="board-link">
											<i class="bi bi-chevron-right"></i>
										</div>
									</div>
								</a>
							</div>

							<span class="title-boxline"><i class="bi bi-pencil-fill" style="color:blue"></i>&nbsp;${bestChannel.ch_intro }</span>
							<div class="board-hover ml-1 mr-1 mt-1">
								<c:forEach var="board" items="${bestChannel.mainBoardList}">
									<a href="/board?ch_id=${bestChannel.ch_id}&b_id=${board.b_id}"> <span class="badge badge-primary float-right mt-1 ml-1"> 
									<fmt:formatDate var="formatDate" type="both" value="${board.b_regdate }" pattern="MM-dd HH:mm" />
											${formatDate }
									</span>
										<div class="board-text">${board.b_title }[${board.b_reply_count }]</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 메인게시판 -->
				<div class="col-lg-8 col-sm-12 item-border">


					<div class="board-row">
						<c:forEach var="channel" items="${channel }">
							<div class="board-col">
								
									<div class="mb-4 chip-box">
									<a class="title-hover" href="/board?ch_id=${channel.ch_id }">
										<div class="board-title-link">
										<div class="chip primary"><i class="bi bi-layout-text-sidebar"></i>&nbsp;${channel.ch_name}</div>
										<div class="board-link">
											<i class="bi bi-chevron-right"></i>
										</div>
										</div>
									</a>
									</div>
								
								<span class="title-boxline"><i class="bi bi-pencil-fill" style="color:blue"></i>&nbsp;${channel.ch_intro }</span>
								<div class="ml-1 mr-1 mt-1">
									<!-- 작업중 -->
									<c:forEach var="board" items="${channel.mainBoardList}">
										<a class="a-hover" href="/board?ch_id=${channel.ch_id}&b_id=${board.b_id}"> 
										<span class="badge badge-primary float-right mt-1 ml-1"> 
										
										<!-- DB날짜 -->
										<fmt:formatDate var="regdate" type="both" value="${board.b_regdate }" pattern="yyyy.MM.dd" />
										<!-- 오늘날짜 -->
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<fmt:formatDate var="today" type="both" value="${now}" pattern="yyyy.MM.dd" />
										<!-- 날짜비교 -->
										<c:choose>
										<c:when test="${today > regdate }">										
										<div class="vcol vcol-time text-center">${ regdate}</div>
										</c:when>
										<c:otherwise>
										<fmt:formatDate var="regdate" type="both" value="${board.b_regdate }" pattern="HH:mm" />
										<div class="vcol vcol-time text-center">${ regdate}</div>
										</c:otherwise>
										</c:choose>
										
										<%-- <fmt:formatDate var="formatDate" type="both" value="${board.b_regdate }"
													pattern="MM-dd HH:mm"
												/> ${formatDate } --%>
										</span>
											<div class="board-text">
												${board.b_title }<span>&nbsp;[${board.b_reply_count }]</span>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
				
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- 컨테이너끝 -->
	</article>
	<%@ include file="../common/footer.jsp"%>
</body>

</html>