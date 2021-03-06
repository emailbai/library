<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<%@page import="java.sql.*" import="com.entity.*"
	import="java.util.Calendar" import="com.test.LibConnection"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>图书馆管理系统</title>
<%!ResultSet rs = null;//跟这本书有关的评论列表
	ResultSet result = null; //书的列表结果
	User user = null;
	int cardid = 0;
	int index = 0;%>
<%
	user = (User) session.getAttribute("user");
	user = new User(666);//测试用，使用登录之后再把它注释掉
	cardid = user.cardID;
	index = (Integer)session.getAttribute("bookindex");
%>

<meta name="description" content="3 styles with inline editable feature" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="/Library/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/Library/assets/font-awesome/4.2.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet"
	href="/Library/assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="/Library/assets/css/jquery.gritter.min.css" />
<link rel="stylesheet" href="/Library/assets/css/select2.min.css" />
<link rel="stylesheet" href="/Library/assets/css/datepicker.min.css" />
<link rel="stylesheet"
	href="/Library/assets/css/bootstrap-editable.min.css" />

<!-- text fonts -->
<link rel="stylesheet"
	href="/Library/assets/fonts/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="/Library/assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="/Library/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/Library/assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="/Library/assets/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="/Library/assets/js/html5shiv.min.js"></script>
		<script src="/Library/assets/js/respond.min.js"></script>
		<![endif]-->
</head>

<body class="no-skin">
	<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<div class="navbar-header pull-left">
				<a href="index.jsp" class="navbar-brand"> <small> <i
						class="fa fa-leaf"></i> 图书馆管理系统
				</small>
				</a>
			</div>

			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
					<li class="grey"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-tasks"></i> <span class="badge badge-grey">4</span>
					</a>

						<ul
							class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="ace-icon fa fa-check"></i>
								4 Tasks to complete</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar">
									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left">Software Update</span> <span
													class="pull-right">65%</span>
											</div>

											<div class="progress progress-mini">
												<div style="width: 65%" class="progress-bar"></div>
											</div>
									</a></li>

									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left">Hardware Upgrade</span> <span
													class="pull-right">35%</span>
											</div>

											<div class="progress progress-mini">
												<div style="width: 35%"
													class="progress-bar progress-bar-danger"></div>
											</div>
									</a></li>

									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left">Unit Testing</span> <span
													class="pull-right">15%</span>
											</div>

											<div class="progress progress-mini">
												<div style="width: 15%"
													class="progress-bar progress-bar-warning"></div>
											</div>
									</a></li>

									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left">Bug Fixes</span> <span
													class="pull-right">90%</span>
											</div>

											<div class="progress progress-mini progress-striped active">
												<div style="width: 90%"
													class="progress-bar progress-bar-success"></div>
											</div>
									</a></li>
								</ul>
							</li>

							<li class="dropdown-footer"><a href="#"> See tasks with
									details <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="purple"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-bell icon-animated-bell"></i> <span
							class="badge badge-important">8</span>
					</a>

						<ul
							class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i
								class="ace-icon fa fa-exclamation-triangle"></i> 8 Notifications
							</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar navbar-pink">
									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left"> <i
													class="btn btn-xs no-hover btn-pink fa fa-comment"></i> New
													Comments
												</span> <span class="pull-right badge badge-info">+12</span>
											</div>
									</a></li>

									<li><a href="#"> <i
											class="btn btn-xs btn-primary fa fa-user"></i> Bob just
											signed up as an editor ...
									</a></li>

									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left"> <i
													class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
													New Orders
												</span> <span class="pull-right badge badge-success">+8</span>
											</div>
									</a></li>

									<li><a href="#">
											<div class="clearfix">
												<span class="pull-left"> <i
													class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
													Followers
												</span> <span class="pull-right badge badge-info">+11</span>
											</div>
									</a></li>
								</ul>
							</li>

							<li class="dropdown-footer"><a href="#"> See all
									notifications <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="green"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="ace-icon fa fa-envelope icon-animated-vertical"></i> <span
							class="badge badge-success">5</span>
					</a>

						<ul
							class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i
								class="ace-icon fa fa-envelope-o"></i> 5 Messages</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar">
									<li><a href="#" class="clearfix"> <img
											src="/Library/assets/avatars/avatar.png" class="msg-photo"
											alt="Alex's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Alex:</span>
													Ciao sociis natoque penatibus et auctor ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>a moment
														ago</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="/Library/assets/avatars/avatar3.png" class="msg-photo"
											alt="Susan's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Susan:</span>
													Vestibulum id ligula porta felis euismod ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>20 minutes
														ago</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="/Library/assets/avatars/avatar4.png" class="msg-photo"
											alt="Bob's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Bob:</span>
													Nullam quis risus eget urna mollis ornare ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>3:15 pm</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="/Library/assets/avatars/avatar2.png" class="msg-photo"
											alt="Kate's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Kate:</span>
													Ciao sociis natoque eget urna mollis ornare ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>1:33 pm</span>
											</span>
										</span>
									</a></li>

									<li><a href="#" class="clearfix"> <img
											src="/Library/assets/avatars/avatar5.png" class="msg-photo"
											alt="Fred's Avatar" /> <span class="msg-body"> <span
												class="msg-title"> <span class="blue">Fred:</span>
													Vestibulum id penatibus et auctor ...
											</span> <span class="msg-time"> <i
													class="ace-icon fa fa-clock-o"></i> <span>10:09 am</span>
											</span>
										</span>
									</a></li>
								</ul>
							</li>

							<li class="dropdown-footer"><a href="inbox.jsp"> See all
									messages <i class="ace-icon fa fa-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="light-blue"><a href="login.jsp"> <img
							class="nav-user-photo" src="/Library/assets/avatars/user.jpg"
							alt="Jason's Photo" />登录<i class="ace-icon fa fa-caret-down"></i>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div id="sidebar" class="sidebar                  responsive">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
						<i class="ace-icon fa fa-signal"></i>
					</button>

					<button class="btn btn-info">
						<i class="ace-icon fa fa-pencil"></i>
					</button>

					<button class="btn btn-warning">
						<i class="ace-icon fa fa-users"></i>
					</button>

					<button class="btn btn-danger">
						<i class="ace-icon fa fa-cogs"></i>
					</button>
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list">
					<li class="active">
						<a href="/Library/index.jsp">
							<i class="menu-icon fa fa-tachometer"></i>主页</a>

						<b class="arrow"></b>
					</li>


					<li class="">
						<a href="/Library//hot.jsp">
							<i class="menu-icon fa fa-file-o"></i>热搜榜<b class="arrow"></b>
						</a>

						<b class="arrow"></b>			
					</li>

					
						
						</ul>
					</li>
				</ul><!-- /.nav-list -->

			<!-- /.nav-list 

-->
			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left"
					data-icon1="ace-icon fa fa-angle-double-left"
					data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>

			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'collapsed')
				} catch (e) {
				}
			</script>
		</div>

		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">图书馆管理系统</a>
						</li>

						<li>图书信息</li>
						<li class="active"></li>
					</ul>
					<!-- /.breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
				</div>

				<div class="page-content">
					<div class="ace-settings-container" id="ace-settings-container">
						<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
							id="ace-settings-btn">
							<i class="ace-icon fa fa-cog bigger-130"></i>
						</div>

						<div class="ace-settings-box clearfix" id="ace-settings-box">
							<div class="pull-left width-50">
								<div class="ace-settings-item">
									<div class="pull-left">
										<select id="skin-colorpicker" class="hide">
											<option data-skin="no-skin" value="#438EB9">#438EB9</option>
											<option data-skin="skin-1" value="#222A2D">#222A2D</option>
											<option data-skin="skin-2" value="#C6487E">#C6487E</option>
											<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
										</select>
									</div>
									<span>&nbsp; Choose Skin</span>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-navbar" /> <label class="lbl"
										for="ace-settings-navbar"> Fixed Navbar</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-sidebar" /> <label class="lbl"
										for="ace-settings-sidebar"> Fixed Sidebar</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-breadcrumbs" /> <label class="lbl"
										for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-rtl" /> <label class="lbl"
										for="ace-settings-rtl"> Right To Left (rtl)</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-add-container" /> <label class="lbl"
										for="ace-settings-add-container"> Inside <b>.container</b>
									</label>
								</div>
							</div>
							<!-- /.pull-left -->

							<div class="pull-left width-50">
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-hover" /> <label class="lbl"
										for="ace-settings-hover"> Submenu on Hover</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-compact" /> <label class="lbl"
										for="ace-settings-compact"> Compact Sidebar</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-highlight" /> <label class="lbl"
										for="ace-settings-highlight"> Alt. Active Item</label>
								</div>
							</div>
							<!-- /.pull-left -->
						</div>
						<!-- /.ace-settings-box -->
					</div>
					<!-- /.ace-settings-container -->

					<div class="page-header">
						<h1>图书信息</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="clearfix"></div>

							<div class="hr dotted"></div>

							<div>
								<div id="user-profile-1" class="user-profile row">
									<div class="col-xs-12 col-sm-3 center">
										<div>
											<span class="profile-picture"> <img id="avatar"
												class="editable img-responsive" alt="Alex's Avatar"
												src="/Library/assets/avatars/profile-pic.jpg" />
											</span>

											<div class="space-4"></div>

											<div
												class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
												<div class="inline position-relative">
													<a href="#" class="user-title-label dropdown-toggle"
														data-toggle="dropdown"> <i
														class="ace-icon fa fa-circle light-green"></i> &nbsp; <span
														class="white">啦啦啦</span>
													</a>

												</div>
											</div>
											<hr />
											<button class="btn btn-info" type="button" value="预约"
												onClick="order()">
												预约<i class="ace-icon fa fa-check bigger-110"></i>
											</button>

										</div>

										<div class="space-6"></div>

										<div class="profile-contact-info">
											<div class="profile-contact-links align-left"></div>

										</div>

										<div class="hr hr12 dotted"></div>

										<div class="clearfix"></div>

										<div class="hr hr16 dotted"></div>
									</div>

									<div class="col-xs-12 col-sm-9">

										<div class="profile-user-info profile-user-info-striped">

											<%
												result = LibSystem.queryByIndex2(index);
												while (result.next()) {
											%>


											<div class="profile-info-row">
												<div class="profile-info-name">图书名:</div>

												<div class="profile-info-value">
													<span class="editable" id="username"><%=result.getString("bookname")%></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">索书号 :</div>
												<%=index%>

												<div class="profile-info-value">
													<i class="fa fa-map-marker light-orange bigger-110"></i> <span
														class="editable" id="country"><%=index%></span><span
														class="editable" id="city"></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">作者 :</div>

												<div class="profile-info-value">
													<span class="editable" id="age"><%=result.getString("author")%></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">出版社:</div>

												<div class="profile-info-value">
													<span class="editable" id="signup"><%=result.getString("press")%></span>
												</div>
											</div>
											<div class="profile-info-row">
												<div class="profile-info-name">类型:</div>

												<div class="profile-info-value">
													<span class="editable" id="about"><%=result.getString("booktype")%></span>
												</div>
											</div>

											<div class="profile-info-row">
												<div class="profile-info-name">总数量:</div>


												<div class="profile-info-value">
													<span class="editable" id="login"><%=result.getString("COUNT(bookid)")%>本</span>
												</div>
											</div>
											<div class="profile-info-row">
												<div class="profile-info-name">借出数量:</div>

												<div class="profile-info-value">
													<span class="editable" id="login"><%=LibSystem.searchBorrowNum(Integer.parseInt(result.getString("index")))%>本</span>
												</div>
											</div>
											<hr />
											<%
												}
											%>

											<script>
												function order() {
													$
															.ajax({
																type : 'post',
																data : {
																	index :
											<%=index%>
												,
																	cardid :
											<%=cardid%>
												},
																url : '/Library/OrderBook',
																success : function(
																		data) {
																	alert("预约成功")
																}
															});

												};
											</script>
										</div>


										<div class="space-20"></div>

										<div class="widget-box transparent">
											<div class="widget-header widget-header-small">
												<h4 class="widget-title blue smaller">
													<i class="ace-icon fa fa-rss orange"></i> 评论
												</h4>

												<div class="widget-toolbar action-buttons">
													<a href="#" data-action="reload"> <i
														class="ace-icon fa fa-refresh blue"></i>
													</a> &nbsp; <a href="#" class="pink"> <i
														class="ace-icon fa fa-trash-o"></i>
													</a>
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-8">
													<div id="profile-feed-1" class="profile-feed">
														<div class="profile-activity clearfix">
															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>
														<%
															rs = LibSystem.getBookComment(index);
															while (rs.next()) {
														%>
														<div class="profile-activity clearfix">
															<div>
																<div class="time">
																	<img class="pull-left" alt="Alex Doe's avatar"
																		src="/Library/assets/avatars/avatar5.png" />用户名：<%=rs.getString("name")%>
																</div>
																<div class="time">
																	借阅证卡号：<%=rs.getString("cardID")%></div>

																<div class="time">
																	评论内容：<%=rs.getString("remark")%></div>
																<div class="time">
																	<label>教师打分:</label>
																	<form name="form1" method="post"
																		action="/Library/LeaveComment">
																		<label for="score"></label> <input type="text"
																			name="score" id="score"> <input type="submit"
																			name="submit" id="submit" value="提交">

																	</form>
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>
														<%
															}
														%>

														<div class="profile-activity clearfix"></div>
													</div>
												</div>
											</div>
										</div>

										<div class="hr hr2 hr-double"></div>

										<form name="searchform" method="post" action="/Library/remark">

											<div class="input-group">
												<input placeholder="索书号" name="index" type="hidden"
													value=<%=index%> /> <input placeholder="评论" name="remark"
													type="text" /> <input type="submit" name="Submitremark"
													value="评论">
											</div>

										</form>

										<div class="space-6"></div>

										<div class="center"></div>
									</div>
								</div>
							</div>

							<div class="hide">
								<div id="user-profile-2" class="user-profile">
									<div class="tabbable">
										<ul class="nav nav-tabs padding-18">
											<li class="active"><a data-toggle="tab" href="#home">
													<i class="green ace-icon fa fa-user bigger-120"></i>
													Profile
											</a></li>

											<li><a data-toggle="tab" href="#feed"> <i
													class="orange ace-icon fa fa-rss bigger-120"></i> Activity
													Feed
											</a></li>

											<li><a data-toggle="tab" href="#friends"> <i
													class="blue ace-icon fa fa-users bigger-120"></i> Friends
											</a></li>

											<li><a data-toggle="tab" href="#pictures"> <i
													class="pink ace-icon fa fa-picture-o bigger-120"></i>
													Pictures
											</a></li>
										</ul>

										<div class="tab-content no-border padding-24">
											<div id="home" class="tab-pane in active">
												<div class="row">
													<div class="col-xs-12 col-sm-3 center">
														<span class="profile-picture"> <img
															class="editable img-responsive" alt="Alex's Avatar"
															id="avatar2"
															src="/Library/assets/avatars/profile-pic.jpg" />
														</span>

														<div class="space space-4"></div>

														<a href="#" class="btn btn-sm btn-block btn-success">
															<i class="ace-icon fa fa-plus-circle bigger-120"></i> <span
															class="bigger-110">Add as a friend</span>
														</a> <a href="#" class="btn btn-sm btn-block btn-primary">
															<i class="ace-icon fa fa-envelope-o bigger-110"></i> <span
															class="bigger-110">Send a message</span>
														</a>
													</div>
													<!-- /.col -->

													<div class="col-xs-12 col-sm-9">
														<h4 class="blue">
															<span class="middle">Alex M. Doe</span> <span
																class="label label-purple arrowed-in-right"> <i
																class="ace-icon fa fa-circle smaller-80 align-middle"></i>
																online
															</span>
														</h4>

														<div class="profile-user-info">
															<div class="profile-info-row">
																<div class="profile-info-name">Username</div>

																<div class="profile-info-value">
																	<span>alexdoe</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Location</div>

																<div class="profile-info-value">
																	<i class="fa fa-map-marker light-orange bigger-110"></i>
																	<span>Netherlands</span> <span>Amsterdam</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Age</div>

																<div class="profile-info-value">
																	<span>38</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Joined</div>

																<div class="profile-info-value">
																	<span>2010/06/20</span>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">Last Online</div>

																<div class="profile-info-value">
																	<span>3 hours ago</span>
																</div>
															</div>
														</div>

														<div class="hr hr-8 dotted"></div>

														<div class="profile-user-info">
															<div class="profile-info-row">
																<div class="profile-info-name">Website</div>

																<div class="profile-info-value">
																	<a href="#" target="_blank">www.alexdoe.com</a>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">
																	<i
																		class="middle ace-icon fa fa-facebook-square bigger-150 blue"></i>
																</div>

																<div class="profile-info-value">
																	<a href="#">Find me on Facebook</a>
																</div>
															</div>

															<div class="profile-info-row">
																<div class="profile-info-name">
																	<i
																		class="middle ace-icon fa fa-twitter-square bigger-150 light-blue"></i>
																</div>

																<div class="profile-info-value">
																	<a href="#">Follow me on Twitter</a>
																</div>
															</div>
														</div>
													</div>
													<!-- /.col -->
												</div>
												<!-- /.row -->

												<div class="space-20"></div>

												<div class="row">
													<div class="col-xs-12 col-sm-6">
														<div class="widget-box transparent">
															<div class="widget-header widget-header-small">
																<h4 class="widget-title smaller">
																	<i class="ace-icon fa fa-check-square-o bigger-110"></i>
																	Little About Me
																</h4>
															</div>

															<div class="widget-body">
																<div class="widget-main">
																	<p>My job is mostly lorem ipsuming and dolor sit
																		ameting as long as consectetur adipiscing elit.</p>
																	<p>Sometimes quisque commodo massa gets in the way
																		and sed ipsum porttitor facilisis.</p>
																	<p>The best thing about my job is that vestibulum
																		id ligula porta felis euismod and nullam quis risus
																		eget urna mollis ornare.</p>
																	<p>Thanks for visiting my profile.</p>
																</div>
															</div>
														</div>
													</div>

													<div class="col-xs-12 col-sm-6">
														<div class="widget-box transparent">
															<div
																class="widget-header widget-header-small header-color-blue2">
																<h4 class="widget-title smaller">
																	<i class="ace-icon fa fa-lightbulb-o bigger-120"></i>
																	My Skills
																</h4>
															</div>

															<div class="widget-body">
																<div class="widget-main padding-16">
																	<div class="clearfix">
																		<div class="grid3 center">
																			<div class="easy-pie-chart percentage"
																				data-percent="45" data-color="#CA5952">
																				<span class="percent">45</span>%
																			</div>

																			<div class="space-2"></div>
																			Graphic Design
																		</div>

																		<div class="grid3 center">
																			<div class="center easy-pie-chart percentage"
																				data-percent="90" data-color="#59A84B">
																				<span class="percent">90</span>%
																			</div>

																			<div class="space-2"></div>
																			HTML5 & CSS3
																		</div>

																		<div class="grid3 center">
																			<div class="center easy-pie-chart percentage"
																				data-percent="80" data-color="#9585BF">
																				<span class="percent">80</span>%
																			</div>

																			<div class="space-2"></div>
																			Javascript/jQuery
																		</div>
																	</div>

																	<div class="hr hr-16"></div>

																	<div class="profile-skills">
																		<div class="progress">
																			<div class="progress-bar" style="width: 80%">
																				<span class="pull-left">HTML5 & CSS3</span> <span
																					class="pull-right">80%</span>
																			</div>
																		</div>

																		<div class="progress">
																			<div class="progress-bar progress-bar-success"
																				style="width: 72%">
																				<span class="pull-left">Javascript & jQuery</span> <span
																					class="pull-right">72%</span>
																			</div>
																		</div>

																		<div class="progress">
																			<div class="progress-bar progress-bar-purple"
																				style="width: 70%">
																				<span class="pull-left">PHP & MySQL</span> <span
																					class="pull-right">70%</span>
																			</div>
																		</div>

																		<div class="progress">
																			<div class="progress-bar progress-bar-warning"
																				style="width: 50%">
																				<span class="pull-left">Wordpress</span> <span
																					class="pull-right">50%</span>
																			</div>
																		</div>

																		<div class="progress">
																			<div class="progress-bar progress-bar-danger"
																				style="width: 38%">
																				<span class="pull-left">Photoshop</span> <span
																					class="pull-right">38%</span>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /#home -->

											<div id="feed" class="tab-pane">
												<div class="profile-feed row">
													<div class="col-sm-6">
														<div class="profile-activity clearfix">
															<div>
																<img class="pull-left" alt="Alex Doe's avatar"
																	src="/Library/assets/avatars/avatar5.png" /> <a
																	class="user" href="#"> Alex Doe </a> changed his
																profile photo. <a href="#">Take a look</a>

																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> an
																	hour ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<img class="pull-left" alt="Susan Smith's avatar"
																	src="/Library/assets/avatars/avatar1.png" /> <a
																	class="user" href="#"> Susan Smith </a> is now friends
																with Alex Doe.
																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 2
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<i
																	class="pull-left thumbicon fa fa-check btn-success no-hover"></i>
																<a class="user" href="#"> Alex Doe </a> joined <a
																	href="#">Country Music</a> group.
																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 5
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<i
																	class="pull-left thumbicon fa fa-picture-o btn-info no-hover"></i>
																<a class="user" href="#"> Alex Doe </a> uploaded a new
																photo. <a href="#">Take a look</a>

																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 5
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<img class="pull-left" alt="David Palms's avatar"
																	src="/Library/assets/avatars/avatar4.png" /> <a
																	class="user" href="#"> David Palms </a> left a comment
																on Alex's wall.
																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 8
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>
													</div>
													<!-- /.col -->

													<div class="col-sm-6">
														<div class="profile-activity clearfix">
															<div>
																<i
																	class="pull-left thumbicon fa fa-pencil-square-o btn-pink no-hover"></i>
																<a class="user" href="#"> Alex Doe </a> published a new
																blog post. <a href="#">Read now</a>

																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 11
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<img class="pull-left" alt="Alex Doe's avatar"
																	src="/Library/assets/avatars/avatar5.png" /> <a
																	class="user" href="#"> Alex Doe </a> upgraded his
																skills.
																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 12
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<i
																	class="pull-left thumbicon fa fa-key btn-info no-hover"></i>
																<a class="user" href="#"> Alex Doe </a> logged in.
																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 12
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<i
																	class="pull-left thumbicon fa fa-power-off btn-inverse no-hover"></i>
																<a class="user" href="#"> Alex Doe </a> logged out.
																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 16
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>

														<div class="profile-activity clearfix">
															<div>
																<i
																	class="pull-left thumbicon fa fa-key btn-info no-hover"></i>
																<a class="user" href="#"> Alex Doe </a> logged in.
																<div class="time">
																	<i class="ace-icon fa fa-clock-o bigger-110"></i> 16
																	hours ago
																</div>
															</div>

															<div class="tools action-buttons">
																<a href="#" class="blue"> <i
																	class="ace-icon fa fa-pencil bigger-125"></i>
																</a> <a href="#" class="red"> <i
																	class="ace-icon fa fa-times bigger-125"></i>
																</a>
															</div>
														</div>
													</div>
													<!-- /.col -->
												</div>
												<!-- /.row -->

												<div class="space-12"></div>

												<div class="center">
													<button type="button"
														class="btn btn-sm btn-primary btn-white btn-round">
														<i class="ace-icon fa fa-rss bigger-150 middle orange2"></i>
														<span class="bigger-110">View more activities</span> <i
															class="icon-on-right ace-icon fa fa-arrow-right"></i>
													</button>
												</div>
											</div>
											<!-- /#feed -->

											<div id="friends" class="tab-pane">
												<div class="profile-users clearfix">
													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar4.png"
																	alt="Bob Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span
																		class="user-status status-online"></span> Bob Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">Content Editor</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 orange"></i>
																		<span class="green"> 20 mins ago </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar1.png"
																	alt="Rose Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span
																		class="user-status status-offline"></span> Rose Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">Graphic Designer</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 grey"></i>
																		<span class="grey"> 30 min ago </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar.png"
																	alt="Jim Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span class="user-status status-busy"></span>
																		Jim Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">SEO &amp; Advertising</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 red"></i>
																		<span class="grey"> 1 hour ago </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar5.png"
																	alt="Alex Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span class="user-status status-idle"></span>
																		Alex Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">Marketing</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 orange"></i>
																		<span class=""> 40 minutes idle </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar2.png"
																	alt="Phil Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span
																		class="user-status status-online"></span> Phil Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">Public Relations</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 orange"></i>
																		<span class="green"> 2 hours ago </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar3.png"
																	alt="Susan Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span
																		class="user-status status-online"></span> Susan Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">HR Management</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 orange"></i>
																		<span class="green"> 20 mins ago </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar1.png"
																	alt="Jennifer Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span
																		class="user-status status-offline"></span> Jennifer
																		Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">Graphic Designer</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 grey"></i>
																		<span class="grey"> 2 hours ago </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="itemdiv memberdiv">
														<div class="inline pos-rel">
															<div class="user">
																<a href="#"> <img
																	src="/Library/assets/avatars/avatar3.png"
																	alt="Alexa Doe's avatar" />
																</a>
															</div>

															<div class="body">
																<div class="name">
																	<a href="#"> <span
																		class="user-status status-offline"></span> Alexa Doe
																	</a>
																</div>
															</div>

															<div class="popover">
																<div class="arrow"></div>

																<div class="popover-content">
																	<div class="bolder">Accounting</div>

																	<div class="time">
																		<i
																			class="ace-icon fa fa-clock-o middle bigger-120 grey"></i>
																		<span class="grey"> 4 hours ago </span>
																	</div>

																	<div class="hr dotted hr-8"></div>

																	<div class="tools action-buttons">
																		<a href="#"> <i
																			class="ace-icon fa fa-facebook-square blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
																		</a> <a href="#"> <i
																			class="ace-icon fa fa-google-plus-square red bigger-150"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="hr hr10 hr-double"></div>

												<ul class="pager pull-right">
													<li class="previous disabled"><a href="#">&larr;
															Prev</a></li>

													<li class="next"><a href="#">Next &rarr;</a></li>
												</ul>
											</div>
											<!-- /#friends -->

											<div id="pictures" class="tab-pane">
												<ul class="ace-thumbnails">
													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-1.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>

													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-2.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>

													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-3.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>

													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-4.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>

													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-5.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>

													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-6.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>

													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-1.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>

													<li><a href="#" data-rel="colorbox"> <img
															alt="150x150"
															src="/Library/assets/images/gallery/thumb-2.jpg" />
															<div class="text">
																<div class="inner">Sample Caption on Hover</div>
															</div>
													</a>

														<div class="tools tools-bottom">
															<a href="#"> <i class="ace-icon fa fa-link"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-paperclip"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-pencil"></i>
															</a> <a href="#"> <i class="ace-icon fa fa-times red"></i>
															</a>
														</div></li>
												</ul>
											</div>
											<!-- /#pictures -->
										</div>
									</div>
								</div>
							</div>

							<div class="hide">
								<div id="user-profile-3" class="user-profile row">
									<div class="col-sm-offset-1 col-sm-10">
										<div class="well well-sm">
											<!-- -
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		&nbsp; -->
											<div class="inline middle blue bigger-110">Your profile
												is 70% complete</div>

											&nbsp; &nbsp; &nbsp;
											<div style="width: 200px;" data-percent="70%"
												class="inline middle no-margin progress progress-striped active">
												<div class="progress-bar progress-bar-success"
													style="width: 70%"></div>
											</div>
										</div>
										<!-- /.well -->

										<div class="space"></div>

										<form class="form-horizontal">
											<div class="tabbable">
												<ul class="nav nav-tabs padding-16">
													<li class="active"><a data-toggle="tab"
														href="#edit-basic"> <i
															class="green ace-icon fa fa-pencil-square-o bigger-125"></i>
															Basic Info
													</a></li>

													<li><a data-toggle="tab" href="#edit-settings"> <i
															class="purple ace-icon fa fa-cog bigger-125"></i>
															Settings
													</a></li>

													<li><a data-toggle="tab" href="#edit-password"> <i
															class="blue ace-icon fa fa-key bigger-125"></i> Password
													</a></li>
												</ul>

												<div class="tab-content profile-edit-tab-content">
													<div id="edit-basic" class="tab-pane in active">
														<h4 class="header blue bolder smaller">General</h4>

														<div class="row">
															<div class="col-xs-12 col-sm-4">
																<input type="file" />
															</div>

															<div class="vspace-12-sm"></div>

															<div class="col-xs-12 col-sm-8">
																<div class="form-group">
																	<label class="col-sm-4 control-label no-padding-right"
																		for="form-field-username">Username</label>

																	<div class="col-sm-8">
																		<input class="col-xs-12 col-sm-10" type="text"
																			id="form-field-username" placeholder="Username"
																			value="alexdoe" />
																	</div>
																</div>

																<div class="space-4"></div>

																<div class="form-group">
																	<label class="col-sm-4 control-label no-padding-right"
																		for="form-field-first">Name</label>

																	<div class="col-sm-8">
																		<input class="input-small" type="text"
																			id="form-field-first" placeholder="First Name"
																			value="Alex" /> <input class="input-small"
																			type="text" id="form-field-last"
																			placeholder="Last Name" value="Doe" />
																	</div>
																</div>
															</div>
														</div>

														<hr />
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-date">Birth Date</label>

															<div class="col-sm-9">
																<div class="input-medium">
																	<div class="input-group">
																		<input class="input-medium date-picker"
																			id="form-field-date" type="text"
																			data-date-format="dd-mm-yyyy"
																			placeholder="dd-mm-yyyy" /> <span
																			class="input-group-addon"> <i
																			class="ace-icon fa fa-calendar"></i>
																		</span>
																	</div>
																</div>
															</div>
														</div>

														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right">Gender</label>

															<div class="col-sm-9">
																<label class="inline"> <input
																	name="form-field-radio" type="radio" class="ace" /> <span
																	class="lbl middle"> Male</span>
																</label> &nbsp; &nbsp; &nbsp; <label class="inline"> <input
																	name="form-field-radio" type="radio" class="ace" /> <span
																	class="lbl middle"> Female</span>
																</label>
															</div>
														</div>

														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-comment">Comment</label>

															<div class="col-sm-9">
																<textarea id="form-field-comment"></textarea>
															</div>
														</div>

														<div class="space"></div>
														<h4 class="header blue bolder smaller">Contact</h4>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-email">Email</label>

															<div class="col-sm-9">
																<span class="input-icon input-icon-right"> <input
																	type="email" id="form-field-email"
																	value="alexdoe@gmail.com" /> <i
																	class="ace-icon fa fa-envelope"></i>
																</span>
															</div>
														</div>

														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-website">Website</label>

															<div class="col-sm-9">
																<span class="input-icon input-icon-right"> <input
																	type="url" id="form-field-website"
																	value="http://www.alexdoe.com/" /> <i
																	class="ace-icon fa fa-globe"></i>
																</span>
															</div>
														</div>

														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-phone">Phone</label>

															<div class="col-sm-9">
																<span class="input-icon input-icon-right"> <input
																	class="input-medium input-mask-phone" type="text"
																	id="form-field-phone" /> <i
																	class="ace-icon fa fa-phone fa-flip-horizontal"></i>
																</span>
															</div>
														</div>

														<div class="space"></div>
														<h4 class="header blue bolder smaller">Social</h4>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-facebook">Facebook</label>

															<div class="col-sm-9">
																<span class="input-icon"> <input type="text"
																	value="facebook_alexdoe" id="form-field-facebook" /> <i
																	class="ace-icon fa fa-facebook blue"></i>
																</span>
															</div>
														</div>

														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-twitter">Twitter</label>

															<div class="col-sm-9">
																<span class="input-icon"> <input type="text"
																	value="twitter_alexdoe" id="form-field-twitter" /> <i
																	class="ace-icon fa fa-twitter light-blue"></i>
																</span>
															</div>
														</div>

														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-gplus">Google+</label>

															<div class="col-sm-9">
																<span class="input-icon"> <input type="text"
																	value="google_alexdoe" id="form-field-gplus" /> <i
																	class="ace-icon fa fa-google-plus red"></i>
																</span>
															</div>
														</div>
													</div>

													<div id="edit-settings" class="tab-pane">
														<div class="space-10"></div>

														<div>
															<label class="inline"> <input type="checkbox"
																name="form-field-checkbox" class="ace" /> <span
																class="lbl"> Make my profile public</span>
															</label>
														</div>

														<div class="space-8"></div>

														<div>
															<label class="inline"> <input type="checkbox"
																name="form-field-checkbox" class="ace" /> <span
																class="lbl"> Email me new updates</span>
															</label>
														</div>

														<div class="space-8"></div>

														<div>
															<label> <input type="checkbox"
																name="form-field-checkbox" class="ace" /> <span
																class="lbl"> Keep a history of my conversations</span>
															</label> <label> <span class="space-2 block"></span> for
																<input type="text" class="input-mini" maxlength="3" />
																days
															</label>
														</div>
													</div>

													<div id="edit-password" class="tab-pane">
														<div class="space-10"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-pass1">New Password</label>

															<div class="col-sm-9">
																<input type="password" id="form-field-pass1" />
															</div>
														</div>

														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right"
																for="form-field-pass2">Confirm Password</label>

															<div class="col-sm-9">
																<input type="password" id="form-field-pass2" />
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="clearfix form-actions">
												<div class="col-md-offset-3 col-md-9">
													<button class="btn btn-info" type="button">
														<i class="ace-icon fa fa-check bigger-110"></i> Save
													</button>

													&nbsp; &nbsp;
													<button class="btn" type="reset">
														<i class="ace-icon fa fa-undo bigger-110"></i> Reset
													</button>
												</div>
											</div>
										</form>
									</div>
									<!-- /.span -->
								</div>
								<!-- /.user-profile -->
							</div>

							<!-- PAGE CONTENT ENDS -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<div class="footer">
			<div class="footer-inner"></div>
		</div>

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script src="/Library/assets/js/jquery.2.1.1.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="/Library/assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='/Library/assets/js/jquery.min.js'>"
								+ "<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/Library/assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
		if ('ontouchstart' in document.documentElement)
			document
					.write("<script src='/Library/assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script src="/Library/assets/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="/Library/assets/js/excanvas.min.js"></script>
		<![endif]-->
	<script src="/Library/assets/js/jquery-ui.custom.min.js"></script>
	<script src="/Library/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="/Library/assets/js/jquery.gritter.min.js"></script>
	<script src="/Library/assets/js/bootbox.min.js"></script>
	<script src="/Library/assets/js/jquery.easypiechart.min.js"></script>
	<script src="/Library/assets/js/bootstrap-datepicker.min.js"></script>
	<script src="/Library/assets/js/jquery.hotkeys.min.js"></script>
	<script src="/Library/assets/js/bootstrap-wysiwyg.min.js"></script>
	<script src="/Library/assets/js/select2.min.js"></script>
	<script src="/Library/assets/js/fuelux.spinner.min.js"></script>
	<script src="/Library/assets/js/bootstrap-editable.min.js"></script>
	<script src="/Library/assets/js/ace-editable.min.js"></script>
	<script src="/Library/assets/js/jquery.maskedinput.min.js"></script>

	<!-- ace scripts -->
	<script src="/Library/assets/js/ace-elements.min.js"></script>
	<script src="/Library/assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
</body>
</html>
