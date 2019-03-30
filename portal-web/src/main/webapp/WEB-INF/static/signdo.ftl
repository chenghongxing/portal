<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>签到签退</title>
		<link rel="stylesheet" type="text/css" href="/portal-web/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="/portal-web/css/bootstrap.min.css"/>
		<script src="/portal-web/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/portal-web/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			body{
				background: lightgoldenrodyellow;
			}
			#sg_time{
				width: 100%;
				height: 100px;
				line-height: 100px;
				text-align: center;
				font-size: 60px;
				font-weight: 700;
				color: black;
				margin: 10px auto 0px auto;
				background: lightgoldenrodyellow;
			}
			#sg_date{
				width: 100%;
				height: 40px;
				color: lightseagreen;
				font-size: 20px;
				font-weight: 600;
				margin: 0px auto 0px auto;
				text-align: center;
				background: lightgoldenrodyellow;
			}
			#sg_op{
				width: 100%;
				height: 140px;
				background: lightgoldenrodyellow;
			}
			.op_one{
				width: 220px;
				height: 60px;
				margin: 0px auto;
			}
			.spone{
				display: inline-block;
				width: 80px;
				height: 50px;
				float: left;
				margin:8px 0px 0px 30px ;
			}
			.spone p{
				width: 80px;
				height: 18px;
				line-height: 18px;
				font-size: 16px;
				font-weight: 600;
			}
			.sptwo{
				width: 80px;
				height: 50px;
				line-height: 50px;
				font-size: 16px;
				font-weight: 600;
				color: lightslategray;
			}
			.btnone{
				width: 70px;
				height: 30px;
				color: lightseagreen;
				border: 1px solid lightseagreen;
				line-height: 30px;
				font-size: 16px;
				font-weight: 600;
				margin:14px;
				background: lightgoldenrodyellow;
				border-radius: 8px;
			}
			.bottb{
				border-bottom: 1px solid lightgray;
			}
			#info_head{
				width: 100%;
				height: 60px;
			}
			#head_one{
				width: 100%;
				height: 40px;
				font-size: 16px;
				font-weight: 600;
				color: black;
				line-height: 40px;
				display: inline-block;
				margin: 15px 0px 0px 20px;
			}
			#bottm{
				width: 100%;
				height: 400px;
				background: lightgoldenrodyellow;
				margin-top: 100px;
			}
			.werone{
				display: inline-block;
				width: 100px;
				height: 80px;
				float: left;
			}
			.weroneu{
				display: inline-block;
				width: 100px;
				height: 80px;
				float: left;
			}
			#bottcent{
				width: 200px;
				height: 80px;
				margin: 0 auto;
			}
			.werpOne{
				font-size: 30px;
				display: inline-block;
				width: 30px;
				height: 35px;
				font-weight: 700;
				line-height: 35px;
				color: green;
				margin-left: 10px;
			}
			.werpTwo{
				font-size: 15px;
				font-weight: 600;
			}
			.werpfont{
				display: inline-block;
				margin-left: -15px;
			}
			.werpTree{
				font-size: 14px;
				font-weight: 600;
			}
			.qwer{
				color: red;
			}
		</style>
	</head>
	<body>
		<div id="info_head">
			<span id="head_one">系统考勤 :</span>
		</div>
		<div id="sg_time">
			
		</div>
		<div id="sg_date">
			
		</div>
		<div id="sg_op">
			<div class="op_one bottb">
				<span class="spone">
					<p>上班</p>
					<p>09:00</p>
				</span>
				<#if (signRecord.signTime)??>
                    <span class="sptwo" id="sgpan">${signRecord.signTime} &nbsp;签到</span>
				    <#else >
                        <button type="button" id="sgbut" class="btnone" onclick="doSignIn()">签到</button>
				</#if>
			</div>
			<div class="op_one">
				<span class="spone">
					<p>下班</p>
					<p>17:30</p>
				</span>
				<#if (signRecord.sgoutTime)??>
                    <span class="sptwo" id="sgpan2">${signRecord.sgoutTime} &nbsp;签退</span>
				    <#else >
                        <button type="button" class="btnone" id="sgbut2" onclick="doSignOut()">签退</button>
				</#if>

			</div>
		</div>
		<div id="bottm">
				<div id="bottcent">
					<span class="werone">
						<p>
							<span class="werpOne">${attendance}</span>
							<span class="werpTwo">%</span>
						</p>
						<p class="werpTree" style="margin-left: 18px;">出勤率</p>
					</span>
					<span class="weroneu">
						<p style="margin-left: 15px;">
							<span class="werpOne qwer">${abnormal}</span>
							<span class="werpTwo werpfont">次</span>
						</p>
						<p class="werpTree">异常考勤次数</p>
					</span>
				</div>
		</div>
		<script type="text/javascript">
			setInterval(function(){
				var myDate = new Date();
				var hour = myDate.getHours();
				var mins = myDate.getMinutes();
				if(hour<10){
					hour="0"+hour;
				}
                if(mins<10){
                    mins="0"+mins;
                }
				$("#sg_time").html(hour+":"+mins);
			},1000);
			setInterval(function(){
				var myDate = new Date();
				var ta =myDate.toLocaleDateString();
				var day = myDate.getDay();
				var reg = new RegExp("/","g");
				var tb = ta.replace(reg,"-");
				var Week = ['日','一','二','三','四','五','六'];
				day = '星期' + Week[day];
				$("#sg_date").html(tb+"&nbsp;&nbsp;"+day);
			},1000);
			function doSignIn() {
                $.ajax({
                    type:"GET",
                    url:"/portal-web/doSignIn",
                    dataType:"json",
                    success:function (data) {
                        if (data["flag"]=="false"){
                            alert(data["respMsg"]);
                        }else {
                            window.location.reload();
                        }
                    }
                })
            }
            function doSignOut() {
                $.ajax({
                    type:"GET",
                    url:"/portal-web/doSignOut",
                    dataType:"json",
                    success:function (data) {
                        if (data["flag"]=="false"){
                            alert(data["respMsg"]);
                        }else {
                            window.location.reload();
                        }
                    }
                })
            }
		</script>
	</body>
</html>




