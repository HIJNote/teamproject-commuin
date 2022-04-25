
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- nav -->
<div class="common">
	<nav class="navbar navbar-expand-md navbar-dark" id="top">
		<div class="container">
			<a class="navbar-brand" href="/"> <i class="bi bi-box"
				style="font-size: 2.5rem;"></i> <span>CUMMUIN</span>
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample07" aria-controls="navbarsExample07"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExample07">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown07"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						onclick="channelInfo()"><span class="nav-font">구독 채널</span></a> <!-- 구독 목록 수정 부분 윗부분 span 구독 채널에 onclick 추가 -->
						<c:if test="${empty sessionValue}">
							<div class="dropdown-menu drop-font" aria-labelledby="dropdown07">
								<div class="dropdown-item item-disabled">구독 중인 채널이 없습니다.</div>
							</div>
						</c:if> <c:if test="${!empty sessionValue}">
							<div class="dropdown-menu drop-font" aria-labelledby="dropdown07"
								id="info">
								<!-- 회원의 구독 정보 -->
							</div>
						</c:if></li>
					<!-- 주요채널 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown07"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="nav-font">메인 채널</span>
					</a>
						<div id="channel_tag_add"></div></li>
					<li class="nav-item"><a class="nav-link" href="/channel"><span
							class="nav-font">채널 검색</span></a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="/tempLogin"><span class="nav-font">로그인테스트</span></a></li> -->

				</ul>
				<ul class="nav navbar-nav">
					<!-- <input id="member-confirm" type="hidden" value="1"> -->
					<c:choose>
						<c:when test="${empty sessionValue}">
							<!-- 비로그인 JSP에서 if문 처리 가능할듯 -->
							<li class="nav-item dropdown nav-login"><a
								class="nav-link dropdown-toggle" href="#" id="dropdown07"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><span class="nav-font"><i
										class="bi bi-person-fill"></i></span></a>

								<div class="dropdown-menu drop-font"
									aria-labelledby="dropdown07">
									<div class="dropdown-item">
										<a class="nav-link" href="/member/login"> <i
											class="bi bi-person-check-fill"></i>&nbsp;로그인

										</a>
									
									</div>
									<div class="dropdown-item">
									<a class="nav-link" href="/member/join"> <i
										class="bi bi-person-plus-fill"></i>&nbsp;회원가입

									</a>
									</div>

								</div></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 완료 -->
							<li class="nav-item dropdown login-member"><a
								class="nav-link dropdown-toggle" href="#" id="dropdown07"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><span class="nav-font login-font">
										<i class="bi bi-person-circle"> </i>&nbsp;${sessionValue.sessionName}
								</span> </a>
								<div class="dropdown-menu drop-font"
									aria-labelledby="dropdown07">
									<div class="dropdown-item item-disabled"
										style="font-size: 1.3rem;">${sessionValue.sessionName}</div>
									<div class="dropdown-item item-disabled"
										style="font-size: 1.3rem;">Lv :
										${sessionValue.sessionLevel }</div>
									<div class="dropdown-item item-disabled"
										style="font-size: 1.3rem;">Point :
										${sessionValue.sessionPoint } ⓟ</div>
									<div class="dropdown-divider"></div>
									<c:if test="${sessionValue.sessionId eq 'admin' }">
										<a class="dropdown-item" href="/admin/index">관리자페이지</a>
									</c:if>
									<a class="dropdown-item" href="/mypage">마이페이지</a> <a
										class="dropdown-item" href="/emoticon">커뮤콘</a> <a
										class="dropdown-item" href="/channel/creation">채널생성</a>

									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/member/logout">로그아웃</a>
								</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<!-- nav -->
</div>


<script>
	window.onload = function() {
		var html = '';
		$.ajax({
    		url:"/cannelList",
    		type:"GET",    			
    		success:function(data) {
    			
    		
    	
        	html += '<div class="dropdown-menu drop-font" aria-labelledby="dropdown07">';
        	html += '	<div class="dropdown-item item-disabled">채널 목록</div>';
        	html += '	<div class="dropdown-divider"></div>';
							for(var i = 0; i < data.length; i++) {
        						if(data[i].ch_grade == 3) {
        	html += '				<a class="dropdown-item" href="/board?ch_id=' + data[i].ch_id+ '">' + data[i].ch_name + '</a>';
        						}
							}
        	html += '	<div class="dropdown-divider"></div>';
							for(var i = 0; i < data.length; i++) {
        						if(data[i].ch_grade == 2) {
			html += '				<a class="dropdown-item" href="/board?ch_id=' + data[i].ch_id+ '">' + data[i].ch_name + '</a>';
        						}
							}
        	html += '	<div class="dropdown-divider"></div>';
        					var cnt = 0;
							for(var i = 0; i < data.length; i++) {
								if(data[i].ch_grade == 1) {
			html += '				<a class="dropdown-item" href="/board?ch_id=' + data[i].ch_id+ '">' + data[i].ch_name + '</a>';
									cnt++;
								}
								if(cnt==10){
									break;
								}
							}
        	html += '</div>';
			
        	var htmlstr = document.getElementById("channel_tag_add"); 
				htmlstr.innerHTML = html;
    		},
    		
    		error:function() {
    			swal("오류","ajax","error");	
    		}
    	})
	};
	
	function channelInfo(){
		<c:if test = '${!empty sessionValue}'>
			var userName = '${sessionValue.sessionName}';
			var html = '';
	    	$.ajax({
	    		url:"/member/subscribe",
	    		type:"POST",
	    		data:{ userName: userName },    			
	    		success:function(list) {
	    			html += '<div class="dropdown-item item-disabled">';
	    			html += '구독 중인 채널';
	    			html += '</div>';
	    			html += '<div class="dropdown-divider"></div>'
	    			
	    			for(var i = 0; i < list.length; i++){
	    				html += '<a class="dropdown-item" href="/board?ch_id=' + list[i].ch_id+ '">';
	    				html += list[i].ch_name;
	    				html += '</a>';
	    			}
	    			
	    			var htmlStr = document.getElementById("info");
					htmlStr.innerHTML = html;
	    		},
	    		
	    		error:function() {
	    			swal("오류","ajax","error");	
	    		}
	    	})
		</c:if>
	}
		
	</script>