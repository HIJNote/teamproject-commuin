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

/* .header-info i{
font-size:1.4rem} */
.sub-box .btn-subscribe {
	width: 61px;
	border: 2px solid var(--color-bg-navbar);
	
}


.sub-box .subscribe-text, .sub-box .btn-subscribe>i {
	color: red;
	font-size: 1.3rem;
}
.ch-content-box i{
font-size:1.4rem;
}

.sub-box .btn-subscribed {
	width: 78px;
	background:#db4c4c;
 	border:2px solid black; 
}

.sub-box .subscribed-text, .sub-box .btn-subscribed>i {
	color:white;
	font-size: 1.3rem;
}

.chip {
	padding: 8px 10px;
	border-radius: 10px;
	font-weight: 600;
	font-size: 1.5rem;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	margin: 0 10px;
	cursor: pointer;
}

.chip.primary {
	background: #2F4058;
	color: whitesmoke;
}

</style>
</head>

<body>
	<%@ include file="../common/navbar.jsp"%>
	<article class="channelList-article">
		<!-- 구독버튼value -->
		<input id="check" type="hidden" value="">
		<div class="container">
			<form action="/channel" class="form-group channel-form">
				<input class="form-control" id="channel-search" type="text"
					name="search" placeholder="채널 검색">
				<button type="submit">검색</button>
			</form>
			<!-- <form action="#">
            <input class="form-group" type="text">
            <button type="submit">검색</button>
           </form> -->
			<div class="row">
				<c:forEach var="channel" items="${channel}">
					<div class="col-sm-6 col-12">
						<div class="ch-box">
							<div class="ch-box-category">
								<a href="/board?ch_id=${channel.ch_id }">
								<span class="chip primary">
								 <i class="bi bi-layout-text-sidebar"></i>
								 &nbsp;<strong>${channel.ch_name }&nbsp;채널</strong>									
								</span>
								</a>
							</div>
							<div class="ch-content-box">
								<div class="flex-header">
									<div class="header-title">
										<div class="pt-2">
										<i class="bi bi-person-plus-fill" style="color:green;"></i>
										구독자
										${channel.ch_subscribe }명&nbsp;</div>
									</div>
									<!-- 1 -> 채널  -->
									<div class="sub-box text-right">
										<a href="/channel/subscribe?ch_id=${channel.ch_id }"> <c:choose>
												<c:when test="${channel.subscribeCheck eq '0' }">
													<div class="btn btn-subscribe">
														<i class="bi bi-plus"></i> <span class="subscribe-text">구독</span>
													</div>
												</c:when>
												<c:otherwise>
													<div class="btn btn-subscribed">

														<i class="bi bi-check2"></i> <span class="subscribed-text">구독
															중</span>
													</div>
												</c:otherwise>
											</c:choose>
										</a>
									</div>
								</div>
								<div>
									<div class="pt-1 pb-2 header-info">
										<i class="bi bi-star-fill" style="color: red"></i>&nbsp;${channel.u_name }&nbsp;
									</div>
									<div class="pt-2 pb-2 header-info">
										<i class="bi bi-pencil-fill" style="color: blue"></i>&nbsp;${channel.ch_intro }
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</article>
	<%@ include file="../common/footer.jsp"%>
	<script>
		
	</script>
</body>
</body>

</html>