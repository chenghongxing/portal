<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>手机号修改</title>
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
				margin: 50px 0px 0px 100px;
			}
			.cont_one{
				width: 100%;
				height: 40px;
			}
			.put{
				display: inline-block;
				width: 100px;
				height: 25px;
				color: lightseagreen;
				margin: 5px 0px 0px 10px;
			}
			#aclass{
				display: inline-block;
				margin-left: 8px;
				color: white;
				font-size: 15px;
				cursor: pointer;
				border: none;
				border-radius: 3px;
				background: lightseagreen;
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
			.put_one input{
				display: inline-block;
				margin: 0px 0px 0px 15px;
			}
			.put_two input{
				display: inline-block;
				margin: 0px 0px 0px 3px;
			}
		</style>
	</head>
	<body>
		<div id="pwd_head">
			<span id="sp">
				修改手机号
			</span>
			<span id="op">提示：修改手机号需要验证之前手机号</span>
		</div>
		<div id="pwd_cont">
			<div id="contA">
				<form action="/portal-web/relPhone" method="post">
				<div class="cont_one">
					<span>当前手机号*</span>
					<span class="put" id="phoneval">${phone}</span>
					<button id="aclass">短信验证</button>
				</div>
				<div class="cont_one">
					<span>验证码* </span>
					<span class="put_one"><input type="text" name="phoneCode" id="" value="" placeholder="短信验证码" required="true"/><b style="color: red;margin-left: 5px;">${message!''}</b></span>
				</div>
				<div class="cont_one">
					<span>新手机号*</span>
					<span class="put_two"><input type="text" name="newPhone" id="" value="${newPhone!''}" placeholder="新手机号" required="true"/></span>
				</div>
				<div id="cont_tree">
					<input type="submit" name="" id="" value="保存修改" />
				</div>
                </form>
			</div>
		</div>
	</body>
<script type="text/javascript">
    $("#aclass").click(function () {
        var phoneNo=$("#phoneval").val();
        $.ajax({
            type:"GET",
            url:"/portal-web/sendMsg/"+phoneNo,
            success:function () {
                var i=30;
                var time=document.getElementById("aclass");
                var jishi=setInterval(function(){
                    time.style.backgroundColor="gray";
                    time.value=i+"秒后重新发送";
                    i--;
                    if(i==-1){
                        clearInterval(jishi);
                        time.style.backgroundColor="lightseagreen";
                        time.value="重新发送";
                    }
                },1000);
            }
        })
    })
</script>
</html>
