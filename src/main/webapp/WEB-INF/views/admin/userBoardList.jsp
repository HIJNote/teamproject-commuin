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
<style>
.form-control:focus {
	border-color: #CED4DA;
}
</style>
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
								<h4 class="card-title">전체 게시글 리스트</h4>
								<p class="card-description">
									전체 게시글 수 :
									<code>${b_All_Cnt}건</code>
								</p>
								<input class="form-control" id="board_All_List_Search" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 500px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>번호</th>
												<th>구분</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>조회수</th>
												<th>추천수</th>
												<th>작성 날짜</th>
												<th style="text-align:center;">변경</th>
											</tr>
										</thead>
										<!--  <img src="${img}images/new.png" style="width: 30px; height: 11px; border-radius: 0%"> -->
										<tbody id="board_All_List">
											<c:set var="today" value="<%=new java.util.Date()%>" />
											<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>
											<c:set var="i" value="1"/>
											<c:forEach var="a" items="${b_All_List}">
												<tr>
													<td>${i}</td>
													<c:if test="${a.ch_name != '공지 사항' and a.ch_name != '문의 게시판'}">
														<td style="color: #AD19EC;"><b>일반</b></td>
													</c:if>
													<c:if test="${a.ch_name eq '문의 게시판'}">
														<td style="color: Red;"><b>문의</b></td>
													</c:if>
													<c:if test="${date eq a.b_regdate}">
														<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
														    onclick="boardInfo('${a.b_id}');">
														    <b>${a.b_title}</b> <img src="${img}images/new.png" style="width: 30px; height: 11px; border-radius: 0%">
														</td>
													</c:if>
													<c:if test="${date != a.b_regdate}">
														<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
														    onclick="boardInfo('${a.b_id}');">
														    ${a.b_title}
														</td>
													</c:if>
													<td>${a.u_name}</td>
													<td>${a.b_view}</td>
													<td>${a.b_follow}</td>
													<td>${a.b_regdate}</td>
													<td style="text-align:center;">
														<button type="button" class="btn btn-warning btn-icon-text" onclick="window.location='boardChange?b_id=${a.b_id}&num=0&now_date=${date}'">
                          									<i class="ti-reload btn-icon-prepend"></i>                                                    
                          									신고.
                        								</button>
                        							</td>
												</tr>
												<c:set var="i" value="${i + 1}"/>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">공지 게시글 리스트</h4>
								<p class="card-description">
									전체 공지 글 수 :
									<code>${b_Announcement_Cnt}건</code>
								</p>
								<input class="form-control" id="board_Announcement_list_Search" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 500px; overflow: auto">
									<table class="table">
										<thead>
											<tr>
												<th>번호</th>
												<th>구분</th>
												<th style="text-align:center;">보임/숨김</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>조회수</th>
												<th>추천수</th>
												<th style="text-align: center;">작성 날짜</th>
												<th style="text-align: center;">숨긴 날짜</th>
												<th style="text-align: center;">변경</th>
											</tr>
										</thead>
										<tbody id="board_Announcement_list">
											<c:set var="today" value="<%=new java.util.Date()%>" />
											<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
											<c:set var="i" value="1"/>
											<c:forEach var="a" items="${b_Announcement_List}">
												<c:if test="${a.b_delete eq 0}">
													<tr>
														<td>${i}</td>
														<td style="color: Blue;"><b>공지</b></td>
														<td style="text-align:center;">보임</td>
														<c:if test="${date eq a.b_regdate}">
															<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
															    onclick="boardInfo('${a.b_id}');">
															    <b>${a.b_title}</b> <img src="${img}images/new.png" style="width: 30px; height: 11px; border-radius: 0%">
															</td>
														</c:if>
														<c:if test="${date != a.b_regdate}">
															<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
															    onclick="boardInfo('${a.b_id}');">
															    ${a.b_title}
															</td>
														</c:if>
														<td>${a.u_name}</td>
														<td>${a.b_view}</td>
														<td>${a.b_follow}</td>
														<td style="text-align: center;">${a.b_regdate}</td>
														<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
														<td style="text-align:center;">
															 <button type="button" class="btn btn-outline-success btn-icon-text" onclick="window.location='boardChange?b_id=${a.b_id}&num=0'">
										                     	<i class="ti-alert btn-icon-prepend"></i>                                                    
										                     		숨기기
										                     </button>
                        								</td>
													</tr>
												</c:if>
												<c:if test="${a.b_delete eq 1}">
													<tr style="background-color: Black; color : #FFFFFF;">
														<td>${i}</td>
														<td style="color: Blue;"><b>공지</b></td>
														<td style="text-align:center;">숨김</td>
														<c:if test="${date eq a.b_regdate}">
															<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
															    onclick="boardInfo('${a.b_id}');">
															    <b>${a.b_title}</b> <img src="${img}images/new.png" style="width: 30px; height: 11px; border-radius: 0%">
															</td>
														</c:if>
														<c:if test="${date != a.b_regdate}">
															<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
															    onclick="boardInfo('${a.b_id}');">
															    ${a.b_title}
															</td>
														</c:if>
														<td>${a.u_name}</td>
														<td>${a.b_view}</td>
														<td>${a.b_follow}</td>
														<td>${a.b_regdate}</td>
														<td>${a.b_blinddate}</td>
														<td style="text-align:center;">
															<button type="button" class="btn btn-warning btn-icon-text" onclick="window.location='boardChange?b_id=${a.b_id}&num=1'">
                          										<i class="ti-reload btn-icon-prepend"></i>                                                    
                          										보이기.
                        									</button>
                        								</td>
													</tr>
												</c:if>
												<c:set var="i" value="${i + 1}"/>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">문의 게시글 리스트</h4>
								<p class="card-description">
									전체 문의 글 수 :
									<code>${b_Question_Cnt}건</code>
								</p>
								<input class="form-control" id="board_Question_list_Search" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 500px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>번호</th>
												<th>구분</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>조회수</th>
												<th>추천수</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<tbody id="board_Question_list">
											<c:set var="today" value="<%=new java.util.Date()%>" />
											<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
											<c:set var="i" value="1"/>
											<c:forEach var="a" items="${b_Question_List}">
												<tr>
													<td>${i}</td>
													<td style="color: Red;"><b>문의</b></td>
													<c:if test="${date eq a.b_regdate}">
														<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
														    onclick="boardInfo('${a.b_id}');">
														    <b>${a.b_title}</b> <img src="${img}images/new.png" style="width: 30px; height: 11px; border-radius: 0%">
														</td>
													</c:if>
													<c:if test="${date != a.b_regdate}">
														<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
														    onclick="boardInfo('${a.b_id}');">
														    ${a.b_title}
														</td>
													</c:if>
													<td>${a.u_name}</td>
													<td>${a.b_view}</td>
													<td>${a.b_follow}</td>
													<td>${a.b_regdate}</td>
												</tr>
												<c:set var="i" value="${i + 1}"/>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">신고 게시글 리스트</h4>
								<p class="card-description">
									전체 문의 글 수 :
									<code>${b_Delete_Cnt}건</code>
								</p>
								<input class="form-control" id="board_Question_list_Search" type="text"
									placeholder="Search.."> <br>
								<div class="table-responsive"
									style="width: 100%; height: 500px; overflow: auto">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>번호</th>
												<th>구분</th>
												<th>채널 이름</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>조회수</th>
												<th>추천수</th>
												<th>작성 날짜</th>
												<th>신고 날짜</th>
												<th style="text-align : center;">변경</th>
											</tr>
										</thead>
										<tbody id="board_Question_list">
											<c:set var="today" value="<%=new java.util.Date()%>" />
											<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>
											<c:set var="i" value="1"/>
											<c:forEach var="a" items="${b_Delete_List}">
												<tr>
													<td>${i}</td>
													<td style="color: #e4ffff; text-shadow:1px 1px 1px #f30201;"><b>신고</b></td>
													<td>${a.ch_name}</td>
													<c:if test="${date eq a.b_regdate}">
														<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
														    onclick="boardInfo('${a.b_id}');">
														    <b>${a.b_title}</b> <img src="${img}images/new.png" style="width: 30px; height: 11px; border-radius: 0%">
														</td>
													</c:if>
													<c:if test="${date != a.b_regdate}">
														<td data-toggle="modal" data-target="#myModal" style="cursor: pointer;" 
														    onclick="boardInfo('${a.b_id}');">
														    ${a.b_title}
														</td>
													</c:if>
													<td>${a.u_name}</td>
													<td>${a.b_view}</td>
													<td>${a.b_follow}</td>
													<td>${a.b_regdate}</td>
													<td>${a.b_blinddate}</td>
													<td style="text-align:center;">
														<button type="button" class="btn btn-warning btn-icon-text" onclick="window.location='boardChange?b_id=${a.b_id}&num=1&now_date=${date}'">
                          									<i class="ti-reload btn-icon-prepend"></i>                                                    
                          									일반.
                        								</button>
                        							</td>
												</tr>
												<c:set var="i" value="${i + 1}"/>
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
	<!-- 사용자 정보 모달 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Board Info.</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<form class="form-sample" id="boardInfo">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="setting/js.jsp"%>
	<script>
		var b_id = '';
		var b_content = '';
		rp_regdata = '';
		
		function boardInfo(id) {
			var html = '';
			
			$.ajax({
				type: "GET",
				url:"board_Info",
				data : {b_id : id},
				success : function(data){
				alert(data.board.b_tag);
				b_id = data.board.b_id;
				
				html += ' 					<div class="row">';
				html += ' 						<br>';
				html += ' 						<div class="col-sm-12" style="text-align: right;">';
				html += ' 							<p class="card-description" style="color:#000000;">';
				html += ' 								추천 : <b style="color:Blue;">' + data.board.b_follow + '</b> | ';
				html += ' 								신고 : <b style="color:Red;">0</b> | ';
				html += ' 								댓글 : <b id="re_reply_count"> ' + data.board.b_reply_count + '</b> | ';
				html += ' 								조회수 : '+ data.board.b_view + ' | ';
				html += ' 								작성 일 : ' + data.board.b_regdate + '';
				html += ' 							</p>';
				html += ' 						</div>';
				html += '					</div>';
				html += '					<hr>';
				html += ' 					<form class="forms-sample">';
				html += ' 						<div class="form-group row">';
				html += ' 							<label for="exampleInputUsername2"';
				html += ' 								class="col-sm-1 col-form-label">작성자</label>';
				html += ' 								<div class="col-sm-11" style="padding-top: 1.4%">';
				html += ' 									<b>'+ data.board.u_name +'</b>';
				html += '								</div>';
				html += ' 						</div>';
				html += ' 						<div class="form-group row">';
				html += ' 							<label for="exampleInputUsername2"';
				html += ' 								class="col-sm-1 col-form-label">제목</label>';
				html += ' 								<div class="col-sm-11" style="padding-top: 1.4%">';
				html += ' 									<b>'+ data.board.b_title +'</b>';
				html += '								</div>';
				html += ' 						</div>';
				html += ' 						<div class="form-group row">';
				html += ' 							<label for="exampleInputEmail2" class="col-sm-1 col-form-label">분류</label>';
				html += ' 								<div class="col-sm-2" style="padding-top: 0.5%">';
				html += ' 									<div class="form-group">';
				html += '										<select class="form-control form-control-sm" id="exampleFormControlSelect3" disabled>';
																if(data.board.ch_name == "문의 게시판") {
				html += ' 											<option selected> ' + data.board.b_tag + '</option>';
																}
																if(data.board.ch_name == "공지 사항") {
				html += ' 											<option>일반</option>';
				html += ' 											<option selected>공지</option>';
				html += ' 											<option>문의</option>';
																}
																if(data.board.ch_name != "공지 사항" && data.board.ch_name != "문의 게시판") {
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
				html += ' 								<div class="col-sm-11" style="padding-top: 1.4%">';
				html += ' 									<b>'+ data.board.b_content +'</b>';
				html += '								</div>';
				html += ' 						</div>';
				html += ' 					</form>';
				html += '					<hr>';
				html += ' 					<div class="card">';
				html += ' 						<hr>';
				html += '   					<div class="card-body">';
				html += '   						<b>댓글.</b>';
				html += '   					</div>';
				html += ' 						<hr>';
				html += ' 					</div>';
											for(var i = 0; i < data.reply.length; i++) {
				html += ' 					<div class="row">';
				html += ' 						<div class="col-sm-12">';
				html += ' 							<blockquote class="blockquote">';
				html += ' 	       						<div class="row">';
				html += ' 	     							<div class="col-sm-5" style="font-size: 15px;"> ' + data.reply[i].u_name + '</div>';
				html += ' 	           							<div class="col-sm-7" style="text-align: right; font-size: 15px;">' + data.reply[i].rp_regdate + '</div>';
				html += ' 	           						</div>';
				html += '              						<hr>';
				html += ' 	           						<p>' + data.reply[i].rp_content + '</p>';
				html += ' 	       					</blockquote>';
				html += '      					</div>';
				html += '      				</div>';
											}
				html += '                   <div id="replySelect"></div>';
				html += ' 					<hr>';
				html += ' 					<div class="row">';
				html += ' 						<div class="col-sm-12">';
				html += ' 							<blockquote class="blockquote">';
				html += ' 	       						<div class="row">';
				html += ' 	     							<div class="col-sm-5" style="font-size: 15px;">관리자</div>';
				html += ' 	           						</div>';
				html += '              						<hr>';
				html += ' 	           						<textarea name="b_content" class="form-control" id="b_content" rows="4"></textarea>';
				html += ' 	       					</blockquote>';
				html += '      					</div>';
				html += '      				</div>';
				html += '<div class="modal-footer">';
				html += '	<button type="button" class="btn btn-primary mr-2"  onclick="replyInsert();">작성</button>';
				html += '	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>';
				html += '</div>';
							
					var htmlstr = document.getElementById("boardInfo"); 
					htmlstr.innerHTML = html;
				},
				error : function(){
					alert('통신 실패');
				}
			});
		}
		function replyInsert() {
			let today = new Date();
			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			b_content = document.getElementById("b_content").value;
			
			var html = '';
			var u_name = '관리자';
			$.ajax({
				type: "GET",
				url:"replyInsert",
				data : {b_id : b_id, u_name : u_name, rp_content : b_content},
				success : function(data){
					html += ' 					<div class="row">';
					html += ' 						<div class="col-sm-12">';
					html += ' 							<blockquote class="blockquote">';
					html += ' 	       						<div class="row">';
					html += ' 	     							<div class="col-sm-5" style="font-size: 15px;"> ' + u_name + '</div>';
					html += ' 	           							<div class="col-sm-7" style="text-align: right; font-size: 15px;">' + year + '-' + month + '-' + date + '</div>';
					html += ' 	           						</div>';
					html += '              						<hr>';
					html += ' 	           						<p>' + b_content + '</p>';
					html += ' 	       					</blockquote>';
					html += '      					</div>';
					html += '      				</div>';
					
					var htmlstr = document.getElementById("replySelect"); 
					htmlstr.innerHTML += html;
					
					document.getElementById("b_content").value = '';
					document.getElementById("re_reply_count").innerHTML = data;
				},
				error : function(){
					alert('통신 실패');
				}
			});
		}
</script>
</body>
</html>