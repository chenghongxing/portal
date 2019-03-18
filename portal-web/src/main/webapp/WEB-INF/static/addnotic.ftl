<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<script src="/portal-web/plugins/kindeditor/kindeditor-all-min.js"></script>
		<script src="/portal-web/plugins/kindeditor/lang/zh-CN.js"></script>
		<link rel="stylesheet" type="text/css" href="/portal-web/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="/portal-web/css/bootstrap.min.css"/>
		<script src="/portal-web/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/portal-web/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
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
			#ntcont{
				width: 800px;
				height: 450px;
				margin: 20px 0px 0px 130px;
			}
			.ntcontone{
				width: 100%;
				height: 30px;
			}
			.ntcontone span{
				width: 80px;
				height: 30px;
				line-height: 30px;
				font-size: 15px;
				font-weight: 600;
			}
			.ntcontone select{
				width: 100px;
				height: 20px;
				font-size: 13px;
				font-weight: 300;
			}
			#ntconttwo{
				width: 100%;
				height: 310px;
				margin: 10px 0px 0px 0px;
			}
			#ntconttwo span{
				display: inline-block;
				float: left;
			}
			.spertone{
				width: 60px;
				height: 30px;
				line-height: 30px;
				font-size: 15px;
				font-weight: 600;
			}
			.spertwo{
				display: inline-block;
				margin: 25px 0px 0px 0px;
			}
			.spertwo textarea{
				width: 660px;
				height: 270px;
				resize: none;
				overflow: scroll;
			}
			#subb input{
				display: inline-block;
				width: 80px;
				height: 28px;
				font-size: 14px;
				font-weight: 600;
				color: white;
				background: lightseagreen;
				border: none;
				line-height: 28px;
				border-radius: 2px;
				margin: 20px 0px 0px 60px;
			}
			.playt{
				display: none;
			}
		</style>
	</head>
	<body>
		<div id="info_head">
			<span id="head_one">新增企业公告 :</span>
		</div>
		<div id="ntcont">
			<div class="ntcontone">
				<span>类别*：</span>
				<select onchange="deptcg(this.options[this.options.selectedIndex].value)" class="selectpicker">
					<option value ="1">企业公告</option>
					<option value ="2">部门公告</option>
				</select>
			</div>
			<div id="plart" class="ntcontone playt">
				<span>部门*：</span>
				<select>
					<option value ="1">销售部</option>
					<option value ="2">市场部</option>
					<option value ="3">财务部</option>
					<option value ="4">人事部</option>
				</select>
			</div>
			<div id="ntconttwo">
				<span class="spertone">内容*：</span>
				<span class="spertwo">
					<textarea id="demo" cols="">
						
					</textarea>
				</span>
			</div>
			<div id="subb">
				<input type="submit" name="" id="" value="发送" />
			</div>
		</div>
	</body>
	<script type="text/javascript">
	    //KindEditor脚本
	    var editor;
	    KindEditor.ready(function(K) {
	        editor = K.create('#demo', {
	        });
	    });
		function deptcg(i){
			if(2==i){
				document.getElementById("plart").style.display="block";
			}else{
				document.getElementById("plart").style.display="none";
			}
		}
	</script>
</html>
