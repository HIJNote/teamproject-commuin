 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting/css.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 메인</title>
</head>
<body>
	<c:if test="${sessionValue.getSessionName() != '관리자'}">
		<script>
			alert("비 정상적 접근하셨습니다. \n뒤로 돌아갑니다.");
			window.history.back();
		</script>
	</c:if>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<%@ include file="header.jsp"%>
		<!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-md-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<p class="card-title">최고 활동 사용자 TOP5</p>
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>아이콘</th>
												<th>닉네임</th>
												<th>레벨</th>
												<th>경험치</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="ur" items="${ur}">
												<tr>
													<td class="py-1"><img
														src="${img}images/faces/face1.jpg" alt="image" /></td>
													<td data-toggle="modal" data-target="#userModal" style="cursor: pointer;" onclick="userInfo('${ur.u_name}')"><span>${ur.u_name}</span>
													</td>
													<td>${ur.u_lv}</td>
													<td>
														<div class="progress" style="height:30px">
														<div class="progress-bar bg-danger" role="progressbar" style="width: ${(ur.u_ex/100000000)*100}%" aria-valuemax="100">
															${ur.u_ex}exp / 100,000,000exp
														</div>
													</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 grid-margin transparent">
						<div class="row">
							<div class="col-md-6 mb-4 stretch-card transparent">
								<div class="card card-tale">
									<div class="card-body">
										<p class="mb-5">
											<b>누적 회원 수</b>
										</p>
										<p class="fs-30 mb-2">${u_accumulateJoinCnt}</p>
										<p>New 회원 수 ${u_TodayJoinCnt} 명</p>
									</div>
								</div>
							</div>
							<div class="col-md-6 mb-4 stretch-card transparent">
								<div class="card card-dark-blue">
									<div class="card-body">
										<p class="mb-5">
											<b>누적 게시글 수</b>
										</p>
										<p class="fs-30 mb-2">${b_accumulateboardCnt}</p>
										<p>New 게시글 수 ${b_TodayboardCnt} 건</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-4 stretch-card transparent">
								<div class="card card-light-blue">
									<div class="card-body">
										<p class="mb-5">
											<b>누적 문의글 수</b>
										</p>
										<p class="fs-30 mb-2">${b_Accumulate_Q_Cnt}</p>
										<p>New 문의글 수 ${b_Today_Q_Cnt} 건</p>
									</div>
								</div>
							</div>
							<div class="col-md-6 mb-4 stretch-card transparent">
								<div class="card card-light-danger">
									<div class="card-body">
										<p class="mb-5">
											<b>누적 신고 게시글 수</b>
										</p>
										<p class="fs-30 mb-2">47033</p>
										<p>New 게시글 수 20,000 건</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 grid-margin stretch-card">
		              <div class="card">
		                <div class="card-body">
		                  <h4 class="card-title">[ TOP 5 ] 이모티콘 판매량</h4>
		                  <canvas id="doughnutChart"></canvas>
		                </div>
		              </div>
		            </div>
					<div class="col-lg-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<p class="card-title mb-0">[ TOP 10 ] 가장 인기 이모티콘 </p>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-striped table-borderless">
										<thead>
											<tr>
												<th>아이콘</th>
												<th>상품명</th>
												<th>판매 수</th>
												<th>상태</th>
												<th>기간</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="emoticon" items="${bestET}">
												<tr>
													<td><img src="${path}/${emoticon.e_path}"></td>
													<td class="font-weight-bold">${emoticon.e_title}</td>
													<td class="font-weight-bold">${emoticon.e_count}</td>
													<c:if test="${emoticon.e_delete eq 0}">
														<td class="font-weight-bold" style="color:Blue">정상</td>
													</c:if>
													<c:if test="${emoticon.e_delete eq 1}">
														<td class="font-weight-bold" style="color:Red">삭제/td>
													</c:if>
													<td class="font-weight-medium"><div
															class="badge badge-success">무제한</div></td>
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
					<div class="col-md-7 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<p class="card-title mb-0">일별 방문자 수</p>
								<br>
								<div class="table-responsive"
									style="width: 100%; height: 450px; overflow: auto">
									<canvas id="barChart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5 grid-margin stretch-card" >
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">관리자 체크 리스트</h4>
								<div class="list-wrapper pt-2" >
									<ul
										class="d-flex flex-column-reverse todo-list todo-list-custom">
										<li>
											<div class="form-check form-check-flat">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox"> 꽃에 물주기
												</label>
											</div> <i class="remove ti-close"></i>
										</li>
										<li class="completed">
											<div class="form-check form-check-flat">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox" checked> 산책하기
												</label>
											</div> <i class="remove ti-close"></i>
										</li>
										<li>
											<div class="form-check form-check-flat">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox"> 밥먹기
												</label>
											</div> <i class="remove ti-close"></i>
										</li>
										<li class="completed">
											<div class="form-check form-check-flat">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox" checked> 강아지랑 놀기
												</label>
											</div> <i class="remove ti-close"></i>
										</li>
										<li>
											<div class="form-check form-check-flat">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox"> 게임하기
												</label>
											</div> <i class="remove ti-close"></i>
										</li>
									</ul>
								</div>
								<div class="add-items d-flex mb-0 mt-2">
									<input type="text" class="form-control todo-list-input"
										placeholder="Add new task">
									<button
										class="add btn btn-icon text-primary todo-list-add-btn bg-transparent">
										<i class="icon-circle-plus"></i>
									</button>
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
									<i class="mdi mdi-account"></i>오늘 신규 회원
								</h4>
								<p class="card-description">
									신규 회원 수 :
									<code>${u_TodayJoinCnt}명</code>
								</p>
								<input class="form-control" id="newUserSearch" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>아이콘</th>
												<th>닉네임</th>
												<th>레벨</th>
												<th>가입일자</th>
											</tr>
										</thead>
										<tbody id="newUser">
											<c:forEach var = "nu_list" items="${ji}">
												<tr>
													<td class="py-1"><img src="${img}images/faces/face1.jpg" alt="image" /></td>
													<td data-toggle="modal" data-target="#userModal" style="cursor: pointer;" onclick="userInfo('${nu_list.u_name }');">${nu_list.u_name }</td>
													<td>${nu_list.u_lv}</td>
													<td>
														${nu_list.u_joindate}
													</td>
												</tr>
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
									<i class="mdi mdi-account"></i>오늘 신규 게시글 글
								</h4>
								<p class="card-description">
									신규 회원 글 수 :
									<code>${b_TodayboardCnt}건</code>
								</p>
								<input class="form-control" id="newBoardSearch" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>아이콘</th>
												<th>닉네임</th>
												<th>분류</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>추천수</th>
												<th>작성일자</th>
											</tr>
										</thead>
										<tbody id="newBoard">
											<c:forEach var ="nb_list" items="${bi}">
												<tr>
													<td class="py-1"><img src="${img}images/faces/face1.jpg" alt="image" /></td>
													<td>${nb_list.u_name}</td>
													<c:if test="${nb_list.ch_name != '공지 사항' and nb_list.ch_name != '채널 문의 게시판' and nb_list.ch_name != '문의 게시판'}">
														<td style="color: #AD19EC;"><b>일반</b></td>
													</c:if>
													<c:if test="${nb_list.ch_name eq '공지 사항'}">
														<td style="color: Blue;"><b>공지</b></td>
													</c:if>
													<c:if test="${nb_list.ch_name eq '채널 문의 게시판' || nb_list.ch_name eq '문의 게시판'}">
														<td style="color: Green;"><b>문의</b></td>
													</c:if>
													<td>${nb_list.ch_name}</td>
													<td style="line-height: 15px; cursor: pointer;" data-toggle="modal" data-target="#myModal" onclick="boardInfo('${nb_list.b_id}');">
														<div
															style="width: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
															${nb_list.b_title}</div>
													</td>
													<td>${nb_list.b_follow}</td>
													<td>${nb_list.b_regdate}</td>
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
								<h4 class="card-title">오늘 신규 문의 글</h4>
								<p class="card-description">
									신규 문의 게시글 수 :
									<code>${b_Today_Q_Cnt}</code>
								</p>
								<input class="form-control" id="newQuestionSearch" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 300px; overflow: auto">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>아이콘</th>
												<th>닉네임</th>
												<th>분류</th>
												<th style="width: 100px;">제목</th>
												<th>작성일자</th>
											</tr>
										</thead>
										<tbody id="newQuestion">
											<c:forEach var = "nq_list" items="${qi}">
												<tr>
													<td class="py-1"><img
														src="${img}images/faces/face1.jpg" alt="image" /></td>
													<td>${nq_list.u_name}</td>
													<td style="color: Red"><b>문의</b></td>
													<td style="line-height: 15px; cursor: pointer;" data-toggle="modal" data-target="#myModal" onclick="boardInfo('${nq_list.b_id}');">
														<div style="width: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
															${nq_list.b_title}
														</div>
													</td>
													<td>${nq_list.b_regdate}</td>
												</tr>
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
		<!-- main-panel ends -->
	</div>
	<!-- 사용자 정보 모달 -->
	<!-- 
	<div class="modal fade" id="userModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				
				<div class="modal-header">
					<h4 class="modal-title">Users Info.</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<form class="form-sample" id="userInfo">
							</form>
						</div>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	 -->	
	<!-- 게시글 정보 모달 -->
	<!-- 
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				Modal Header
				<div class="modal-header">
					<h4 class="modal-title">Board Info.</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				Modal body
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<form class="form-sample" id="boardInfo">
							</form>
						</div>
					</div>
				</div>
				Modal footer
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary mr-2">저장</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
	
			</div>
		</div>
	</div> -->
	
	<%@ include file="setting/js.jsp"%>
	<script>
	// 이모티콘 차트 및 일별 방문자 차트
		$(function() {
			'use strict';
			
			var dayList = [];
			var dayCount = [];
			
			<c:forEach var="dc" items="${dc}">
				dayList.push(${dc.dayList});
				dayCount.push(${dc.dayCount});
			</c:forEach>
			
			var backgroundColor = [];
			var borderColor = [];
			
			for(var i = 0; i < 31; i++) {
				backgroundColor.push('rgba(255, 99, 132, 0.5)');
				borderColor.push('rgba(255,99,132.1)');
			}
			
			var data = {
				labels : dayList,
				datasets : [ {
					label : '명',
					data : dayCount,
					backgroundColor : backgroundColor,
					borderColor : borderColor,
					borderWidth : 1,
					fill : false
				} ]
			};
			var options = {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				},
				legend : {
					display : false
				},
				elements : {
					point : {
						radius : 0
					}
				}

			};
			
			var bestEtTitle = [];
			var bestEtCount = [];

			<c:forEach var="et" begin="0" end="4" items="${bestET}">
				bestEtTitle.push("${et.e_title}");
				bestEtCount.push(${et.e_count});
			</c:forEach>
			i = 0;
			var doughnutPieData = {
					datasets : [ {
						data : bestEtCount,
						backgroundColor :
								[ 
								'rgba(255, 99, 132, 0.5)',
								'rgba(54, 162, 235, 0.5)',
								'rgba(255, 206, 86, 0.5)',
								'rgba(75, 192, 192, 0.5)',
								'rgba(153, 102, 255, 0.5)',
								'rgba(255, 159, 64, 0.5)' 
								],
						borderColor : [ 
								'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)', 
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)', 
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
					} ],
				labels : bestEtTitle
			};
			var doughnutPieOptions = {
				responsive : true,
				animation : {
					animateScale : true,
					animateRotate : true
				}
			};

			
			// Get context with jQuery - using jQuery's .get() method.
			if ($("#barChart").length) {
				var barChartCanvas = $("#barChart").get(0).getContext("2d");
				// This will get the first returned node in the jQuery collection.
				var barChart = new Chart(barChartCanvas, {
					type : 'bar',
					data : data,
					options : options
				});
			}

			if ($("#doughnutChart").length) {
				var doughnutChartCanvas = $("#doughnutChart").get(0)
						.getContext("2d");
				var doughnutChart = new Chart(doughnutChartCanvas, {
					type : 'doughnut',
					data : doughnutPieData,
					options : doughnutPieOptions
				});
			}

		});
		function boardInfo(id) {
			var html = '';
			
			$.ajax({
				type: "GET",
				url:"board_Info",
				data : {b_id : id},
				success : function(data){
				html += ' 					<div class="row">';
				html += ' 						<br>';
				html += ' 						<div class="col-sm-12" style="text-align: right;">';
				html += ' 							<p class="card-description" style="color:#000000;">';
				html += ' 								추천 : <b style="color:Blue;">' + data.b_follow + '</b> | ';
				html += ' 								신고 : <b style="color:Red;">200</b> | ';
				html += ' 								댓글 : ' + data.b_reply_count + ' | ';
				html += ' 								조회수 : '+ data.b_view + ' | ';
				html += ' 								작성 일 : ' + data.b_regdate + '';
				html += ' 							</p>';
				html += ' 						</div>';
				html += '					</div>';
				html += '					<hr>';
				html += ' 					<form class="forms-sample">';
				html += ' 						<div class="form-group row">';
				html += ' 							<label for="exampleInputUsername2"';
				html += ' 								class="col-sm-1 col-form-label">작성자</label>';
				html += ' 								<div class="col-sm-11" style="padding-top: 1.4%">';
				html += ' 									<b>'+ data.u_name +'</b>';
				html += '								</div>';
				html += ' 						</div>';
				html += ' 						<div class="form-group row">';
				html += ' 							<label for="exampleInputUsername2"';
				html += ' 								class="col-sm-1 col-form-label">제목</label>';
				html += ' 								<div class="col-sm-11" style="padding-top: 1.4%">';
				html += ' 									<b>'+ data.b_title +'</b>';
				html += '								</div>';
				html += ' 						</div>';
				html += ' 						<div class="form-group row">';
				html += ' 							<label for="exampleInputEmail2" class="col-sm-1 col-form-label">분류</label>';
				html += ' 								<div class="col-sm-2" style="padding-top: 0.5%">';
				html += ' 									<div class="form-group">';
				html += '										<select class="form-control form-control-sm" id="exampleFormControlSelect3" disabled>';
																if(data.ch_name == "문의 게시판" || data.ch_name == '채널 문의 게시판') {
				html += ' 											<option>일반</option>';
				html += ' 											<option>공지</option>';
				html += ' 											<option selected>문의</option>';
																}
																if(data.ch_name == "공지 사항") {
				html += ' 											<option>일반</option>';
				html += ' 											<option selected>공지</option>';
				html += ' 											<option>문의</option>';
																}
																if(data.ch_name != "공지 사항" && data.ch_name != "문의 게시판" && data.ch_name != "채널 문의 게시판") {
				html += ' 											<option selected>일반</option>';
				html += ' 											<option>공지</option>';
				html += ' 											<option>문의</option>';
																}
				html += ' 										</select>';
				html += ' 									</div>';
				html += ' 								</div>';
				html += ' 						</div>';
				html += '						<div class="form-group row">';
				html += ' 							<label for="exampleInputMobile" class="col-sm-1 col-form-label">내용</label>';
				html += ' 								<div class="col-sm-11">';
				html += '									<textarea class="form-control" rows="4" readonly="readonly"	style="background-color: #FFFFFF;">' + data.b_content + '</textarea>';
				html += ' 								</div>';
				html += ' 						</div>';
				html += ' 					</form>';
				html += '					<hr>';
				html += ' 					<div class="card">';
				html += ' 						<hr>';
				html += '   					<div class="card-body">';
				html += '   						<b>댓글 (' + data.b_reply_count + ').</b>';
				html += '   					</div>';
				html += ' 						<hr>';
				html += ' 					</div>';
				html += ' 					<div class="row">';
				html += ' 						<div class="col-sm-12">';
				html += ' 							<blockquote class="blockquote">';
				html += ' 	       						<div class="row">';
				html += ' 	     							<div class="col-sm-5" style="font-size: 15px;">댓글 작성자</div>';
				html += ' 	           							<div class="col-sm-7" style="text-align: right; font-size: 15px;">2020/12/12 23:23:23</div>';
				html += ' 	           						</div>';
				html += '              						<hr>';
				html += ' 	           						<p>댓글 내용 입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>';
				html += ' 	       					</blockquote>';
				html += '      					</div>';
				html += '              			<div class="col-sm-1">';
				html += '              				<h2 style="margin-left: 5%;"><b>ㄴ</b></h2>';
				html += '              			</div>';
				html += '              			<div class="col-sm-11">';
				html += ' 							<blockquote class="blockquote">';
				html += '          						<div class="row">';
				html += ' 	                   				<div class="col-sm-5" style="font-size: 15px;">댓글 작성자</div>';
				html += ' 	                   					<div class="col-sm-7" style="text-align: right; font-size: 15px;">2020/12/12 23:23:23</div>';
				html += ' 	                   				</div>';
				html += ' 	                   				<hr>';
				html += ' 	                   				<p>댓글 내용 입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>';
				html += '             				</blockquote>';
				html += '          				</div>';
				html += '      				</div>';
				html += ' 					<hr>';
					
					var htmlstr = document.getElementById("boardInfo"); 
					htmlstr.innerHTML = html;
					html = '';
				},
				error : function(){
					alert('통신 실패');
				}
			});
		}
		/*  
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
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">누적 추천수</label>';
					html += '				<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%;">';
					html += '					<span> 24,244,242개 </span>';
					html += '				</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">게시글 작성 수</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%">';
					html += '				<span> 42,242,242개 </span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					html += '<div class="row">';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">최근 작성 <br>게시글</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%;">';
					html += '				<span> 테스트용 제목글. </span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '		<label class="col-sm-3 col-form-label">마지막 댓글작성한 게시글 </label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%">';
					html += '				<span> 테스트용 제목글. </span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					html += '<div class="row">';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">정지 당한 횟수</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%;">';
					html += '					<span> 0번 </span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">회원 순위 </label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%">';
					html += '				<span> 1,042위 </span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</div>';
					html += '<div class="row">';
					html += '	<div class="col-md-6">';
					html += '			<div class="form-group row">';
					html += '				<label class="col-sm-3 col-form-label">신고한 횟수</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%;">';
					html += '				<span> 20,000번 </span>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '	<div class="col-md-6">';
					html += '		<div class="form-group row">';
					html += '			<label class="col-sm-3 col-form-label">신고 당한 횟수</label>';
					html += '			<div class="col-sm-9" style="margin: auto; padding-bottom: 1.5%">';
					html += '				<span> 10,000,000번 </span>';
					html += '			</div>';
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
					
					html = '';
				},
				error : function(){
					alert('통신 실패');
				}
			});
		}
		*/
	</script>
</body>
</html>