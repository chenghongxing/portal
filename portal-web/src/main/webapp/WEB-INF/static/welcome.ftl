<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>portal考勤管理系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">


    <link rel="stylesheet" href="/portal-web/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/portal-web/css/style.css">

    <script src="/portal-web/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="/portal-web/plugins/jQueryUI/jquery-ui.min.js"></script>
    <script src="/portal-web/plugins/bootstrap/js/bootstrap.min.js"></script>

    <script src="/portal-web/plugins/adminLTE/js/app.min.js"></script>

    <script type="text/javascript">
        function SetIFrameHeight(){
            var iframeid=document.getElementById("iframe"); //iframe id
            if (document.getElementById){
                iframeid.height =document.documentElement.clientHeight;
            }
        }

    </script>

</head>

<body class="hold-transition skin-green sidebar-mini" >

<div class="wrapper">

    <!-- 页面头部 -->
    <header class="main-header">
        <!-- Logo -->
        <a href="index.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>Portal</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Protal-考勤管理系统</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">4条待读公告</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="/portal-web/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                系统消息
                                                <small><i class="fa fa-clock-o"></i> 5 分钟前</small>
                                            </h4>
                                            <p>欢迎登录系统！</p>
                                        </a>
                                    </li>
                                    <!-- end message -->
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="/portal-web/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                团队消息
                                                <small><i class="fa fa-clock-o"></i> 2 小时前</small>
                                            </h4>
                                            <p>你有新的任务了</p>
                                        </a>
                                    </li>

                                </ul>
                            </li>
                            <li class="footer"><a href="#">See All Messages</a></li>
                        </ul>
                    </li>


                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/portal-web/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">${user.username}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="/portal-web/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    ${user.username}
                                    <small>最后登录 ${user.lastLoginTime}</small>
                                </p>
                            </li>

                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="/portal-web/relPwdPage" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">注销</a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="/portal-web/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p> ${user.username}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>

            <!-- /.search form -->


            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu"  >
                <li class="header">菜单</li>
                <li id="admin-index"><a href="/portal-web/welcome"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

                <!-- 菜单 -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>考勤管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="admin-login">
                            <a href="/portal-web/signDoPage" target="iframe">
                                <i class="fa fa-circle-o"></i>签到
                            </a>
                        </li>
                        <li id="admin-login">
                            <a href="/portal-web/signDoPage" target="iframe">
                                <i class="fa fa-circle-o"></i>签退
                            </a>
                        </li>
                        <li id="admin-login">
                            <a href="/portal-web/signInfoPage" target="iframe">
                                <i class="fa fa-circle-o"></i>个人考勤信息
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>信息维护</span>
                        <span class="pull-right-container">
												<i class="fa fa-angle-left pull-right"></i>
										</span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="admin-login">
                            <a href="/portal-web/relPwdPage" target="iframe">
                                <i class="fa fa-circle-o"></i>密码修改
                            </a>
                        </li>
                        <li id="admin-login">
                            <a href="/portal-web/relPhonePage" target="iframe">
                                <i class="fa fa-circle-o"></i>手机号修改
                            </a>
                        </li>
                        <li id="admin-login">
                            <a href="/portal-web/relEmailPage" target="iframe">
                                <i class="fa fa-circle-o"></i>邮箱修改
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>企业管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="admin-login">
                            <a href="/portal-web/userPage" target="iframe">
                                <i class="fa fa-circle-o"></i>员工管理
                            </a>
                        </li>
                        <li id="admin-login">
                            <a href="/portal-web/deptPage" target="iframe">
                                <i class="fa fa-circle-o"></i>部门管理
                            </a>
                        </li>
                        <li id="admin-login">
                            <a href="/portal-web/noticePage" target="iframe">
                                <i class="fa fa-circle-o"></i>公告管理
                            </a>
                        </li>
                        <li id="admin-login">
                            <a href="/portal-web/signInfoPage" target="iframe">
                                <i class="fa fa-circle-o"></i>考勤信息管理
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 菜单 /-->

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <iframe width="100%" id="iframe" name="iframe"	onload="SetIFrameHeight()"
                frameborder="0" src="/portal-web/home"></iframe>

    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.8
        </div>
        <strong>Copyright &copy; 2018-2019 <a href="#">行建科技研发</a>.</strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>

</body>

</html>