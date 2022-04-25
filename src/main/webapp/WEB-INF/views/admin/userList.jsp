<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
								<h4 class="card-title">전체 리스트</h4>
								<div>
									전체 회원 수&nbsp; : &nbsp;
									<b class="card-description">
										${allCnt}
									</b>
									<code>명</code>
								</div>
								<br>
								<input class="form-control" id="userListSearch" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 500px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>아이콘</th>
												<th>이름</th>
												<th>상태</th>
												<th>경험치</th>
												<th>레벨</th>
												<th>보유 포인트</th>
												<th>이메일</th>
												<th>받은 추천수</th>
												<th>받은 신고수</th>
												<th>가입 날짜</th>
												<th style="text-align: center;">상태 변경</th>
											</tr>
										</thead>
										<tbody id="userListTable">
											<c:forEach var="all" items="${userAllList}">
												<tr>
													<td class="py-1"><img
														src="${img}images/faces/face1.jpg" alt="image" /></td>
													<td>
														<span data-toggle="modal" data-target="#userModal" style="cursor: pointer;" 
															  onclick="userInfo('${all.u_name}');">
															${all.u_name}
														</span>
													</td>
													<td>
														<c:choose>
															<c:when test="${all.u_state eq 0}">정상</c:when>
															<c:when test="${all.u_state eq 1}">휴면</c:when>
															<c:when test="${all.u_state eq 2}">정지</c:when>
															<c:when test="${all.u_state eq 3}">삭제</c:when>
															<c:otherwise>정상</c:otherwise>
														</c:choose>
													</td>
													<td>
														<div class="progress" style="height:30px">
														<div class="progress-bar bg-danger" role="progressbar" style="width: ${(all.u_ex/100000000)*100}%" aria-valuemax="100">
															${all.u_ex}exp / 100,000,000exp
														</div>
													</div>
													</td>
													<td>${all.u_lv}</td>
													<td>${all.u_pt}pt</td>
													<td>${all.u_email}</td>
													<td>0</td>
													<td>0</td>
													<td>${all.u_joindate}</td>
													<td style="text-align: center;">
														<button type="button" class="btn btn-warning btn-icon-text"
																onclick="window.location='userStop?name=${all.u_name}&state=${all.u_state}'">
															<i class="ti-reload btn-icon-prepend"></i>정지
														</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">
									<i class="mdi mdi-account"></i>휴먼회원 리스트
								</h4>
								<p class="card-description">
								<div>
									휴면 회원 수&nbsp; : &nbsp;
									<b class="card-description">
										${oldCnt}
									</b>
									<code>명</code>
								</div>
								<br>
								</p>
								<input class="form-control" id="dormantSearch" type="text"
									placeholder="Search.."><br>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th></th>
												<th>이름</th>
												<th>최근 접속</th>
												<th style="text-align: center;">상태 변경</th>
											</tr>
										</thead>
										<tbody id="dormant">
											<c:forEach var="old" items="${userOldList}">
												<c:if test="${old.u_state eq 1 }">
													<c:if test="${old.u_pt >= 30 }">
														<tr>
															<td class="py-1">
															<img src="${img}images/faces/face1.jpg" alt="image" /></td>
															<td><span data-toggle="modal" data-target="#myModal">${old.u_name}</span>
															</td>
															<td>${old.u_pt}일 전.</td>
															<td style="text-align: center;">
																<button type="button" class="btn btn-warning btn-icon-text" 
																		onclick="window.location='userNormal?name=${old.u_name}'">
																	<i class="ti-reload btn-icon-prepend"></i>일반
																</button>
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
					<div class="col-md-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">블랙회원 리스트</h4>
								<div>
									블랙 회원 수&nbsp; : &nbsp;
									<b class="card-description">
										${blackCnt}
									</b>
									<code>명</code>
								</div>
								<br>
								<input class="form-control" id="blackSearch" type="text"
									placeholder="Search.."><br>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th></th>
												<th>이름</th>
												<th>신고 수</th>
												<th>변경 된 날짜</th>
												<th style="text-align: center;">상태 변경</th>
											</tr>
										</thead>
										<tbody id="black">
											<tr>
												<td class="py-1"><img
													src="${img}images/faces/face2.jpg" alt="image" /></td>
												<td>황인재</td>
												<td>80</td>
												<td>2017/10/10</td>
												<td style="text-align: center;">
													<button type="button" class="btn btn-warning btn-icon-text">
														<i class="ti-reload btn-icon-prepend"></i>일반
													</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">
									<i class="mdi mdi-account"></i>정지회원 리스트
								</h4>
								<div>
									정지 회원 수&nbsp; : &nbsp;
									<b class="card-description" id="stopListCnt">
										${stopCnt}
									</b>
									<code>명</code>
								</div>
								<br>
								<input class="form-control" id="stopSearch" type="text"
									placeholder="Search.."><br>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th></th>
												<th>이름</th>
												<th>정지 날짜</th>
												<th style="text-align: center;">상태 변경</th>
											</tr>
										</thead>
										<tbody id="stop">
											<c:forEach var="stop" items="${userAllList}">
												<c:if test="${stop.u_state eq 2}">
													<tr>
														<td class="py-1"><img
															src="${img}images/faces/face1.jpg" alt="image" /></td>
														<td><span data-toggle="modal" data-target="#myModal">${stop.u_name}</span>
														</td>
														<td>${stop.u_joindate}</td>
														<td style="text-align: center;">
															<button type="button" class="btn btn-warning btn-icon-text" 
																	onclick="window.location='userNormal?name=${stop.u_name}'">
																<i class="ti-reload btn-icon-prepend"></i>일반
															</button>
														</td>
													</tr>
												</c:if>	
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">
									<i class="mdi mdi-account"></i>삭제회원 리스트
								</h4>
								<div>
									삭제 회원 수&nbsp; : &nbsp;
									<b class="card-description">
										${removeCnt}
									</b>
									<code>명</code>
								</div>
								<br>
								<input class="form-control" id="removeSearch" type="text"
									placeholder="Search.."><br>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th></th>
												<th>이름</th>
												<th>탈퇴 날짜</th>
											</tr>
										</thead>
										<tbody id="remove">
											<c:forEach var="remove" items="${userAllList}">	
												<c:if test="${remove.u_state eq 3}">
													<tr>
														<td class="py-1"><img
															src="${img}images/faces/face1.jpg" alt="image" /></td>
														<td><span data-toggle="modal" data-target="#myModal">${remove.u_name}</span>
														</td>
														<td>${remove.u_joindate}</td>
													</tr>
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
	<div class="modal fade" id="userModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Users Info.</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<form class="form-sample" id="userInfo">
							</form>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 사용자 정보 모달 -->
	
	<script>
		function userInfo(name) {
			var html = '';
			
			$.ajax({
				type: "GET",
				url:"userInfo",
				data : {u_name : name},
				success : function(data){
					var ex = (data.u_ex/100000000)*100;
					var email_1 = data.u_email.split("@");
					
					html += '<div class="row">';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">닉네임</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%;">';
					html += '				<span id="name">' + data.u_name + '</span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">이메일</label>';
					html += '			<div class="col-sm-4" style="margin: auto; padding-bottom: 1.5%;">';
					html += '				<span> ' + email_1[0] + ' </span>';
					html += '			</div>';
					html += '			<span style="margin-top: auto; margin-bottom: auto;">@</span>';
					html += '			<div class="col-sm-4">';
					html += '				<select class="form-control" disabled="disabled">';
					if(email_1[1] == 'naver.com') {
						html += '					<option selected>naver.com</option>';
						html += '					<option>kakao.com</option>';
						html += '					<option>daum.com</option>';
						html += '					<option>gmail.com</option>';
					}
					if(email_1[1] == 'koko.com') {
						html += '					<option>naver.com</option>';
						html += '					<option selected>kakao.com</option>';
						html += '					<option>daum.com</option>';
						html += '					<option>gmail.com</option>';
					}
					if(email_1[1] == 'daum.com') {
						html += '					<option>naver.com</option>';
						html += '					<option>kakao.com</option>';
						html += '					<option selected>daum.com</option>';
						html += '					<option>gmail.com</option>';
					}
					if(email_1[1] == 'gmail.com') {
						html += '					<option>naver.com</option>';
						html += '					<option>kakao.com</option>';
						html += '					<option>daum.com</option>';
						html += '					<option selected>gmail.com</option>';
					}
					html += '				</select>';
					html += '				</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					html += '<div class="row">';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">레벨</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%">';
					html += '				<span id="lv">' + data.u_lv + '</span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">경험치</label>';
					html += '				<div class="col-sm-9">';
					html += '					<div class="progress" style="height:50px">';
					html += '						<div id="bar" class="progress-bar bg-danger" role="progressbar"';
					html += '						style="width: '+ ex +'%"';
					html += '						aria-valuemax="100"> ' + ex + 'exp / 100,000,000exp</div>';
					html += '					</div>';
					html += '				</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					html += '<div class="row">';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">상태</label>';
					html += '				<div class="col-sm-9">';
					
					if(data.u_state == 0) {
						html += '					<select class="form-control">';
						html += '						<option selected>일반회원</option>';
						html += '						<option>휴면회원</option>';
						html += '						<option>정지회원</option>';
						html += '						<option disabled>삭제회원</option>';
						html += '						<option>블랙회원</option>';
						html += '					</select>';			
					}
					if(data.u_state == 1) {
						html += '					<select class="form-control">';
						html += '						<option>일반회원</option>';
						html += '						<option selected>휴면회원</option>';
						html += '						<option>정지회원</option>';
						html += '						<option disabled>삭제회원</option>';
						html += '						<option>블랙회원</option>';
						html += '					</select>';
					}
					if(data.u_state == 2) {
						html += '					<select class="form-control">';
						html += '						<option>일반회원</option>';
						html += '						<option>휴면회원</option>';
						html += '						<option selected>정지회원</option>';
						html += '						<option disabled>삭제회원</option>';
						html += '						<option>블랙회원</option>';
						html += '					</select>';
					}
					if(data.u_state == 3) {
						html += '					<select class="form-control" disabled>';
						html += '						<option>일반회원</option>';
						html += '						<option>휴면회원</option>';
						html += '						<option>정지회원</option>';
						html += '						<option selected>삭제회원</option>';
						html += '						<option>블랙회원</option>';
						html += '					</select>';				
					}
					if(data.u_state == 4) {
						html += '					<select class="form-control">';
						html += '						<option>일반회원</option>';
						html += '						<option>휴면회원</option>';
						html += '						<option>정지회원</option>';
						html += '						<option disabled>삭제회원</option>';
						html += '						<option selected>블랙회원</option>';
						html += '					</select>';			
					}
					html += '				</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">포인트</label>';
					html += '				<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%;">';
					html += '					<span id="pt">' + data.u_pt + 'pt</span>';
					html += '				</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					html += '<div class="row">';
					html += '		<div class="col-md-6">';
					html += '			<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">가입 일자</label>';
					html += '				<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%;">';
					html += '					<span> 21/10/24 </span>';
					html += '				</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">마지막 방문</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%">';
					html += '				<span> 21/10/24 </span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					
					var htmlstr = document.getElementById("userInfo"); 
					htmlstr.innerHTML = html;
				},
				error : function(){
					alert('통신 실패');
				}
			});
		}
	</script>
	<%@ include file="setting/js.jsp"%>
</body>
</html>