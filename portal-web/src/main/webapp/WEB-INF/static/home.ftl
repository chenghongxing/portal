<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <link rel="stylesheet" href="/portal-web/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/portal-web/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/portal-web/css/style.css">
    <script src="/portal-web/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="/portal-web/plugins/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">

<!-- 内容区域 -->


<!-- 内容头部 -->
<section class="content-header">
    <h1>
        控制面板
        <small>首页</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
    </ol>
</section>
<!-- 内容头部 /-->

<!-- 正文区域 -->
<section class="content">


    <!-- 统计数值 -->
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>签到</h3>

                    <p>打卡</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <a href="/portal-web/signDoPage" class="small-box-footer">Go <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>签退</h3>

                    <p>打卡</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
                <a href="/portal-web/signDoPage" class="small-box-footer">Go <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3>考勤信息</h3>

                    <p>查看</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
                <a href="/portal-web/signInfoPage" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>个人档案</h3>

                    <p>查看</p>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>
                <a href="/portal-web/userInfoPage" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->
</section>
<!-- 正文区域 /-->

<!-- 内容区域 /-->
</body>

</html>