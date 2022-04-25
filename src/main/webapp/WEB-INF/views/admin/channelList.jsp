<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${stylePath}css/button.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
	<c:if test="${sessionValue.getSessionName() != '관리자'}">
		<script>
			alert("비 정상적 접근하셨습니다. \n뒤로 돌아갑니다.");
			window.history.back();
		</script>
	</c:if>
	<div class="container-scroller">
		<%@ include file="header.jsp"%>
		<!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">채널 리스트</h4>
								<div class="table-responsive" style="width: 100%; height: 600px; overflow: auto">
									<table class="table table-hover text-center">
										<thead>
											<tr>
												<th>채널 생성자</th>
												<th>채널 이름</th>
												<th>현재 등긍</th>
												<th>구독자 수</th>
												<th>채널 게시글 수</th>
												<th>승급</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="c_list" items="${c_All_List}">
												<c:if test="${c_list.ch_grade != 3}">
													<c:if test="${c_list.ch_name != '베스트 게시글'}">
														<tr>
															<td>${c_list.u_name}</td>
															<td>${c_list.ch_name}</td>
															<td>일반</td>
															<td><fmt:formatNumber value="${c_list.ch_subscribe}" pattern="#,###" />명</td>
															<td><fmt:formatNumber value="20000000" pattern="#,###" />건</td>												
															<td>
																<c:if test="${c_list.ch_grade == 0}">
																	<button class="custom-btn btn-15" onMouseOver='this.innerHTML="메인채널"' onMouseOut='this.innerHTML="일반채널"' onclick="window.location='channelChange?ch_id=${c_list.ch_id}&ch_grade=1'">
																		<span>일반채널</span>
																	</button>
																</c:if>
																<c:if test="${c_list.ch_grade == 1}">
																	<button class="custom-btn btn-16" onMouseOver='this.innerHTML="일반채널"' onMouseOut='this.innerHTML="메인채널"' onclick="window.location='channelChange?ch_id=${c_list.ch_id}&ch_grade=0'">
																		<span>메인채널</span>
																	</button>
																</c:if>
															</td>
															<td>
																<c:if test="${c_list.ch_grade != 4}">
																	<button class="custom-btn btn-15" onMouseOver='this.innerHTML="보이기"' onMouseOut='this.innerHTML="숨기기"'>
																		<span>숨기기</span>
																	</button>
																</c:if>
																<c:if test="${c_list.ch_grade == 4}">
																	<button class="custom-btn btn-16" onMouseOver='this.innerHTML="숨기기"' onMouseOut='this.innerHTML="보이기"'>
																		<span>보이기</span>
																	</button>
																</c:if>
															</td>
														</tr>
													</c:if>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="footer.jsp"%>
		</div>
	</div>
	<%@ include file="setting/js.jsp"%>
</body>
</html>