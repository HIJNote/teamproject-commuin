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
<link
	href="https://fonts.googleapis.com/css2?family=Tourney:wght@100&display=swap"
	rel="stylesheet">
<!-- css -->


<!-- icon -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"> -->
<!-- JS -->



</head>

<body>
	<c:set var="searchTarget"
		value="${target==nulll?'':'&target=' }${target }"></c:set>
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
	<c:set var="pageURL"
		value="${searchTarget }${searchOption }${searchKeyword }"></c:set>

	<%@ include file="../common/navbar.jsp"%>
	<article class="shop-article">
		<!-- 메인 컨테이너 시작 -->
		<div class="container pt-2 pb-2 temp-for-padding">

			<!-- seleted item list -->
			<c:if test="${!empty emoticonInfo }">
				<fmt:formatDate var="formatDate" type="both"
					value="${emoticonInfo.e_regdate }" pattern="yyyy-MM-dd HH:mm:ss" />

				<div class="container">
					<div class="seleted-item-box">
						<div class="seleted-item-title">
							<strong>${emoticonInfo.e_title }</strong>
							<div id="title-count">
								판매수 <span style="color: rgb(76, 162, 202);">${emoticonInfo.e_count }</span>
							</div>
						</div>
						<div class="seleted-item-info">
							<span>${emoticonInfo.u_name }</span>
							<div>
								<span>등록일 : ${formatDate}</span>
							</div>
						</div>
						<div class="seleted-item-list">
							
								<c:forEach items="${emoticonList}" var="emoticonList">
									
										<img src="${path }${emoticonList.el_path}">
									
								</c:forEach>
							
						</div>
						<!-- 만약 check == 1이면 구매했다는 것이므로 삭제하기 출력 아니면 구매하기 출력 -->
						<div id="emoticon-purchase">
						<c:choose>
							<c:when test="${check eq '1'}">
							
									<div class="form-row justify-content-end mr-1">
										<button type="button" class="seleted-item-price" 
										onclick="emoticonPurchase(${emoticonInfo.e_id})" style="background-color: red">
											<i class="bi bi-trash-fill"></i><span
												>&nbsp;삭제하기</span>
									    </button>
									</div>
							
							</c:when>
							<c:otherwise>
							
									<div class="form-row justify-content-end mr-1">
										<button type="button" class="seleted-item-price" onclick="emoticonPurchase(${emoticonInfo.e_id})">
											<i class="bi bi-gift"></i> ${emoticonInfo.e_price}Pt. 구매하기
										</button>
									</div>								
							</c:otherwise>
						</c:choose>			
						</div>
					</div>
				</div>
			</c:if>



			<!-- 

                top
                
             -->
			<div class="container">

				<div class="top-box text-right">
					<a href="/emoticon" class="btn btn-secondary"> <span>등록순</span>
					</a> <a href="/emoticon?target=rank" class="btn btn-secondary"> <span>판매순</span>
					</a>
				</div>

				<!--

                middle

              -->
				<div class="middle-box">
				
						<c:forEach items="${emoticon}" var="emoticon">
							<div class="item">
								<a href="/emoticon?e_id=${emoticon.e_id}${pageURL}&p=${p}">
									<div class="mt-1 mb-1">
										<img src="${path}${emoticon.e_path}">
										<div>
											<div class="text-truncate item-title">
												<strong>${emoticon.e_title }</strong>
											</div>
											<div class="item-count text-truncate">${emoticon.e_count }번
												판매</div>
											<div class="item-registrant text-truncate">${emoticon.u_name }</div>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
				
				</div>

				<!-- 

                bottom
            
            -->
				<div class="bottom-box">
					<form action="/emoticon" method="get"
						class="form-inline justify-content-end">
						<c:if test="${target !=null }">
						<input type="hidden" name="target" value="${target }">
						</c:if>
						<div class="input-group">
							<div class="input-group-prepend">
								<select class="form-control form-control-sm"
									name="searchCondition" value="${keyword }">
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



					<!-- 페이지매김 -->
					<nav>
						<ul class="pagination flex-wrap justify-content-center">
							<c:if test="${pageMaker.prev }">
								<li class="page-item-box"><a class="page-link"
									href='<c:url value="/emoticon?&p=${pageMaker.startPage-1}"/>'>&lt;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="pageNum">
								<c:choose>
									<c:when test="${pageNum eq p }">
										<li><a class="page-link now-page"
											style="background-color: black; color: white;"
											href='<c:url value="/emoticon?${pageURL }&p=${pageNum }"/>'>${pageNum }</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="page-link"
											href='<c:url value="/emoticon?${pageURL }&p=${pageNum }"/>'>${pageNum }</a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<li><a class="page-link"
									href='<c:url value="/emoticon?${pageURL }&p=${pageMaker.endPage+1 }"/>'>&gt;</a></li>
							</c:if>
						</ul>
					</nav>
					<!-- 이모티콘 등록 -->
					<div class="text-right">
						<a href="/emoticon/upload">
							<div class="btn btn-secondary">
								<span class="bi bi-inbox"></span>&nbsp;등록하기
							</div>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- 컨테이너 끝 -->
	</article>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
	function emoticonPurchase(e_id) {	
		$.ajax({
			url:"/emoticon/buying",
			type: "get",
			dataType: "json",
			data:{e_id:e_id},
			success: function(data) {
				$('#emoticon-purchase').empty();
				var htmlstr = document.getElementById("emoticon-purchase");
				var html=''

				if(data.check==1){
					html+= '<div class="form-row justify-content-end mr-1">'
					html+= '<button type="button" class="seleted-item-price" style="background-color:red"'
					html+= 'onclick="emoticonPurchase('+${emoticonInfo.e_id}+')">'
					html+= '<i class="bi bi-trash-fill"></i><span>&nbsp;삭제하기</span>'
					html+= '</button></div>'
					
					$('#title-count').empty();
					$('#title-count').append('판매수 <span style="color: rgb(76, 162, 202);">'+data.count+'</span>');
					
				}else{
					
					html+= '<div class="form-row justify-content-end mr-1">'
						html+= '<button type="button" class="seleted-item-price"'
						html+= 'onclick="emoticonPurchase('+${emoticonInfo.e_id}+')">'
						html+= '<i class="bi bi-gift"></i> ${emoticonInfo.e_price}Pt. 구매하기</button></div>'
					if(data.check==2){
						alert('포인트가 부족합니다.');
					}
				}
				
				htmlstr.innerHTML += html;
				
				
			},error:function(){
				alert("장난 ㄴ");
			}
		})
	}
	</script>
</body>

</html>