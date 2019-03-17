<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>修改密码</title>
		<link rel="stylesheet" type="text/css" href="/portal-web/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="/portal-web/css/bootstrap.min.css"/>
		<script src="/portal-web/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/portal-web/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			#pwd_head{
				width: 100%;
				height: 60px;
				margin: 10px 0px 0px 30px;
			}
			#sp{
				width: 100%;
				height: 40px;
				font-size: 16px;
				font-weight: 600;
				color: black;
				line-height: 40px;
				display: inline-block;
			}
			#op{
				width: 100%;
				height: 20px;
				font-size: 14px;
				font-weight: 500;
				color: gray;
				line-height: 20px;
				display: inline-block;
			}
			#pwd_cont{
				width: 100%;
				height: 320px;
				margin: 20px 0px 0px 100px;
			}
			.cont_one{
				width: 100%;
				height: 40px;
			}
			.put input{
				display: inline-block;
				width: 205px;
				height: 25px;
				border: 1px solid lightgray;
				margin: 5px 0px 0px 10px;
			}
			#aclass{
				display: inline-block;
				margin-left: 5px;
				color: lightseagreen;
				font-size: 14px;
				cursor: pointer;
			}
			.cont_two{
				width: 100%;
				height: 20px;
				font-size: 12px;
				line-height: 20px;
				color: lightgray;
				margin-left: 80px;
			}
			#cont_tree input{
				display: inline-block;
				width: 100px;
				height: 28px;
				font-size: 14px;
				font-weight: 500;
				color: white;
				background: lightseagreen;
				border: none;
				line-height: 28px;
				border-radius: 2px;
				margin: 10px 0px 0px 77px;
			}
			#contA{
				width: 100%;
				height: 200px;
			}
			#contB{
				display: none;
				width: 100%;
				height: 100px;
			}
			.confirm{
				width: 100%;
				height: 40px;
			}
			.cfm_one{
				width: 100%;
				height: 20px;
				line-height: 20px;
				margin: 0px 0px 0px 105px;
				color: red;
				font-size: 13px;
			}
			.cfm_two input{
				display: inline-block;
				width: 100px;
				height: 28px;
				font-size: 14px;
				font-weight: 500;
				color: white;
				background: lightseagreen;
				border: none;
				line-height: 28px;
				border-radius: 2px;
				margin: 10px 0px 0px 110px;
			}
			.put{
				color: lightseagreen;
			}
			#acla{
				display: inline-block;
				margin-left: 20px;
				color: white;
				font-size: 15px;
				cursor: pointer;
				border: none;
				border-radius: 3px;
				background: lightseagreen;
			}
			.put_one input{
				display: inline-block;
				margin: 0px 0px 0px 15px;
			}
			.put_two input{
				display: inline-block;
				margin: 0px 0px 0px 15px;
			}
		</style>
	</head>
	<body>
		<div id="pwd_head">
			<span id="sp">
				修改密码
			</span>
			<span id="op">提示：请妥善管理自己的密码</span>
		</div>
		<div id="pwd_cont">
			<div id="contA">
				<div class="cont_one">
					<span>当前密码*</span>
					<span class="put"><input type="password" name="" id="" value="" placeholder="当前密码" required="true"/></span>
					<span id="aclass">忘记密码？</span>
				</div>
				<div class="cont_one">
					<span>新的密码*</span>
					<span class="put"><input type="password" name="" id="" value="" placeholder="新密码" required="true"/></span>
				</div>
				<div class="cont_one">
					<span>确认密码*</span>
					<span class="put"><input type="password" name="" id="" value="" placeholder="确认密码" required="true"/></span>
				</div>
				<div class="cont_two">
					您的密码至少包括7个字符，为了保证密码强度，使用大小写字母、数字和符号。
				</div>
				<div id="cont_tree">
					<input type="submit" name="" id="" value="保存修改" />
				</div>
			</div>
			<div id="contB">
				<div class="cont_one">
					<span>当前邮箱*</span>
					<span class="put">17853668483@163.com</span>
					<button id="acla">邮箱验证</button>
				</div>
				<div class="cont_one">
					<span>验证码* </span>
					<span class="put_one"><input type="text" name="" id="" value="" placeholder="邮箱验证码" required="true"/></span>
				</div>
				<div class="cont_one">
					<span>新密码*</span>
					<span class="put_two"><input type="text" name="" id="" value="" placeholder="新密码" required="true"/></span>
				</div>
				<div id="cont_tree">
					<input type="submit" name="" id="" value="保存修改" />
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$("#aclass").click(function(){
				$("#contA").hide();
				$("#contB").show();
			})
		</script>
	</body>
</html>
