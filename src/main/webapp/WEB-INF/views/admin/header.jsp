<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div
		class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="index.html">
			<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
  				<path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
			</svg>
			<span>COMMUIN</span>
		</a> 
		<a class="navbar-brand brand-logo-mini" href="index.html">
			<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
  				<path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
			</svg>	
		</a>
	</div>
	<div
		class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
		<button class="navbar-toggler navbar-toggler align-self-center"
			type="button" data-toggle="minimize">
			<span class="icon-menu"></span>
		</button>
		<ul class="navbar-nav mr-lg-2">
			<li class="nav-item nav-search d-none d-lg-block">
				<div class="input-group">
					<div class="input-group-prepend hover-cursor"
						id="navbar-search-icon">
						<span class="input-group-text" id="search"> <i
							class="icon-search"></i>
						</span>
					</div>
					<input type="text" class="form-control" id="navbar-search-input"
						placeholder="User Search now" aria-label="search"
						aria-describedby="search">
				</div>
			</li>
		</ul>
		<ul class="navbar-nav navbar-nav-right">
			<li class="nav-item dropdown"><a
				class="nav-link count-indicator dropdown-toggle"
				id="notificationDropdown" href="#" data-toggle="dropdown"> <i
					class="icon-bell mx-0"></i> <span class="count"></span>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
					aria-labelledby="notificationDropdown">
					<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
					<a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-success">
								<i class="ti-info-alt mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">Application
								Error</h6>
							<p class="font-weight-light small-text mb-0 text-muted">Just
								now</p>
						</div>
					</a> <a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-warning">
								<i class="ti-settings mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">Settings</h6>
							<p class="font-weight-light small-text mb-0 text-muted">
								Private message</p>
						</div>
					</a> <a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-info">
								<i class="ti-user mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">New user
								registration</h6>
							<p class="font-weight-light small-text mb-0 text-muted">2
								days ago</p>
						</div>
					</a>
				</div></li>
			<li class="nav-item nav-profile dropdown">
				<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown"> 
					<img src="${img}images/faces/face28.jpg" alt="profile" />
				</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown"> 
					<b class="dropdown-item" style="cursor: default;"> 
						${sessionValue.getSessionName()}
					</b>
					<b class="dropdown-item" style="cursor: default;"> 
						Lv : ${sessionValue.getSessionLevel()} 
					</b>
					<b class="dropdown-item" style="cursor: default;"> 
						Point : ${sessionValue.getSessionPoint()}ⓟ
					</b>
					<hr>
					<a class="dropdown-item" href="/">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square-fill" viewBox="0 0 16 16">
 						 <path d="M14 0a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12zM5.904 10.803 10 6.707v2.768a.5.5 0 0 0 1 0V5.5a.5.5 0 0 0-.5-.5H6.525a.5.5 0 1 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 .707.707z"/>
					</svg> 
						<b style="margin-left: 10px;">회원사이트 이동.</b> 
					</a>
					<a class="dropdown-item" href="/member/logout"> 
						<i class="ti-power-off text-primary"></i>
						<b>로그아웃.</b> 
					</a>
				</div>
			</li>
		</ul>
		<button
			class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
			type="button" data-toggle="offcanvas">
			<span class="icon-menu"></span>
		</button>
	</div>
</nav>
<!-- partial -->
<div class="container-fluid page-body-wrapper">
	<!-- partial:partials/_settings-panel.html -->
	<div class="theme-setting-wrapper">
		<div id="settings-trigger">
			<i class="ti-settings"></i>
		</div>
		<div id="theme-settings" class="settings-panel">
			<i class="settings-close ti-close"></i>
			<p class="settings-heading">SIDEBAR SKINS</p>
			<div class="sidebar-bg-options selected" id="sidebar-light-theme">
				<div class="img-ss rounded-circle bg-light border mr-3"></div>
				Light
			</div>
			<div class="sidebar-bg-options" id="sidebar-dark-theme">
				<div class="img-ss rounded-circle bg-dark border mr-3"></div>
				Dark
			</div>
			<p class="settings-heading mt-2">HEADER SKINS</p>
			<div class="color-tiles mx-0 px-4">
				<div class="tiles success"></div>
				<div class="tiles warning"></div>
				<div class="tiles danger"></div>
				<div class="tiles info"></div>
				<div class="tiles dark"></div>
				<div class="tiles default"></div>
			</div>
		</div>
	</div>
	<!-- partial -->
	<!-- partial:partials/_sidebar.html -->
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="index" >
					<i class="icon-grid menu-icon"></i> <span class="menu-title">관리자
						메인</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#auth" aria-expanded="false" aria-controls="auth"> <i
					class="icon-head menu-icon"></i> <span class="menu-title">회원
						관리</span> <i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="auth">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link" href="userList">
								회원</a></li>
					</ul>
				</div></li>
			<li class="nav-item"><a class="nav-link" data-toggle="collapse"
				href="#board" aria-expanded="false" aria-controls="board"> 
				<i class="icon-paper menu-icon"></i> <span class="menu-title">게시글
						관리</span> <i class="menu-arrow"></i>
			</a>
				<div class="collapse" id="board">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link"
							href="board">게시글 전체리스트</a></li>
					</ul>
					<!--
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="bulletinWrite">공지사항 작성</a></li>
						</ul>
					  -->
				</div></li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="collapse" href="#channel" aria-expanded="false" aria-controls="channel"> 
					 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-display" viewBox="0 0 16 16">
						  <path d="M0 4s0-2 2-2h12s2 0 2 2v6s0 2-2 2h-4c0 .667.083 1.167.25 1.5H11a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1h.75c.167-.333.25-.833.25-1.5H2s-2 0-2-2V4zm1.398-.855a.758.758 0 0 0-.254.302A1.46 1.46 0 0 0 1 4.01V10c0 .325.078.502.145.602.07.105.17.188.302.254a1.464 1.464 0 0 0 .538.143L2.01 11H14c.325 0 .502-.078.602-.145a.758.758 0 0 0 .254-.302 1.464 1.464 0 0 0 .143-.538L15 9.99V4c0-.325-.078-.502-.145-.602a.757.757 0 0 0-.302-.254A1.46 1.46 0 0 0 13.99 3H2c-.325 0-.502.078-.602.145z"/>
					 </svg>
						<span class="menu-title" style="margin-left:15px;">채널 관리</span> 
							<i class="menu-arrow"></i>
				</a>
				<div class="collapse" id="channel">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item">
							<a class="nav-link" href="channelList">채널 리스트</a>
						</li>
					</ul>
				</div>
			</li>
		</ul>
	</nav>