<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/portal-web/css/reset.css"/>
    <script src="/portal-web/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        body{
            background: url(/portal-web/img/login-bg.png) no-repeat bottom center fixed;
            background-size: 100% 100%;
        }
        #logo{
            width: 203px;
            height: 80px;
            margin: 50px 0 0 50px;
        }
        #logo>img{
            opacity: 0.4;
        }
        #center{
            width: 380px;
            height: 400px;
            background: rgba(255,255,255,0.6);
            position: absolute;
            top: 20%;
            left: 55%;
        }
        #centerSon{
            width: 280px;
            height: 310px;
            margin: 20px auto;
        }
        #select1{
            width: 280px;
            height: 254px;
        }
        #select2{
            width: 280px;
            height: 254px;
            display: none;
        }
        .tp1{
            width: 100%;
            height: 16px;
        }
        .tp1>hr{
            width: 60px;
            color: gray;
            float: left;
        }
        .tp1>p{
            width: 130px;
            height: 100%;
            line-height: 16px;
            float: left;
            font-size: 14px;
            margin: 0 10px;
        }
        .tp2{
            width: 100%;
            height: 40px;
            border-bottom: 1px solid lightgray;
        }
        .tp2>a{
            display: inline-block;
            width: 80px;
            height: 38px;
            line-height: 38px;
            color: gray;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            margin:0 28px;
            text-align: center;
        }
        .tp2>a:hover{
            color: red;
            border-bottom: 1px solid red;
        }
        .tp3{
            width: 100%;
            height: 128px;
        }
        .tp3>p{
            font-size: 12px;
            color: red;
            width: 100%;
            height: 12px;
            line-height: 12px;
        }
        .tpj{
            width: 100%;
            height: 128px;
            margin-top: 35px;
        }
        .tpj>p{
            font-size: 12px;
            color: red;
            width: 100%;
            height: 12px;
            line-height: 12px;
        }
        .p1{
            margin-top: 20px;
        }
        .p2{
            margin-top: 10px;
        }
        .username{
            width: 236px;
            height: 35px;
            margin-top: 6px;
            background: #FFFFFF url(/portal-web/img/user.png) no-repeat;
            background-size: 20px 20px;
            background-position: 5px 8px;
            padding-left: 30px;
            border: 1px solid lightgray;
        }
        .phone{
            width: 236px;
            height: 40px;
            margin-top: 6px;
            background: #FFFFFF url(/portal-web/img/phone.png) no-repeat;
            background-size: 22px 22px;
            background-position: 5px 10px;
            padding-left: 30px;
            border: 1px solid lightgray;
        }
        .password{
            width: 236px;
            height: 35px;
            margin-top: 6px;
            background: #FFFFFF url(/portal-web/img/suo.png) no-repeat;
            background-size: 30px 30px;
            background-position: 0 5px;
            padding-left: 30px;
            border: 1px solid lightgray;
        }
        .code{
            width: 150px;
            height: 40px;
            margin-top: 6px;
            border: 1px solid lightgray;
        }
        .tp4{
            width: 100%;
            height: 18px;
            font-size: 12px;
            background: url(/portal-web/img/wen.png) no-repeat;
            background-size: 16px 16px;
            background-position: 180px 1px;
        }
        .tp4>a{
            display: inline-block;
            width: 80px;
            height: 18px;
            font-size: 12px;
            line-height: 18px;
            float: right;
            text-decoration: none;
            color: gray;
        }
        .tp4>a:hover{
            color: red;
        }
        .tp4>input{
            width: 14px;
            height: 14px;
            margin: 0 5px 0 20px;
            vertical-align: bottom;
            border: none;
        }
        .tp4>p{
            display: inline-block;
            width: 50px;
            height: 15px;
            line-height: 15px;
            color: gray;
            border: none;
            font-size: 12px;
            margin-top: 2px;
        }
        .tp5{
            width: 100%;
            height: 60px;
            margin-top: 10px;
        }
        .tp5>p{
            font-size: 12px;
            color: red;
            width: 100%;
            height: 12px;
            line-height: 12px;
            margin-bottom: 5px;
        }
        .tp5>input{
            width: 140px;
            height: 35px;
            border: 1px solid lightgray;
        }
        .tp5Son{
            width: 85px;
            height: 45px;
            float: right;
            margin-right: 20px;
            cursor: pointer;
        }
        .tp5Son:hover p{
            color: red;
        }
        .tp5Son>img{
            width: 100%;
            height: 23px;
            margin-top: 5px;
        }
        .tp5Son>p{
            font-size: 12px;
            color: gray;
        }
        .tp6{
            width: 100%;
            height: 35px;
            margin-top: 15px;
        }
        .tp6>input{
            width: 100%;
            height: 100%;
            border-radius: 8px;
            background: blue;
            border: none;
            color: white;
            font-size: 15px;
            cursor: pointer;
        }
        .tp7{
            width: 100%;
            height: 35px;
            margin-top: 30px;
        }
        .tp7>input{
            width: 100%;
            height: 100%;
            border-radius: 8px;
            background: blue;
            border: none;
            color: white;
            font-size: 15px;
            cursor: pointer;
        }
        .sty{
            border-bottom: 1px solid red;
        }
        #phone_send{
            width: 112px;
            height: 40px;
            background-color: blue;
            margin-top: 6px;
            color: white;
            font-size: 14px;
            font-weight: 600;
            border: 1px solid lightgray;
        }
        #phone_send:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="logo">
    <img src="img/simpchn_icon.png"/>
</div>
<div id="center">
    <div id="centerSon">
        <div class="tp1">
            <hr />
            <p>欢迎登录帮作业系统</p>
            <hr />
        </div>
        <div class="tp2">
            <a href="#" id="stu" class="sty">账号登录</a>
            <a href="#" id="adm">短信登录</a>
        </div>
        <!--学生登录-->
        <div id="select1">
            <form id="form1" method="post" action="/portal-web/doLogin">
                <div class="tp3">
                    <p class="p1" id="notice1">${message!''}</p>
                    <input type="text"  name="emp_no" id="username" class="username"  placeholder="工号" onblur="check1()" required/>
                    <p class="p2" ></p>
                    <input type="password" name="password" id="password" class="password"  placeholder="密码" required/>
                </div>
                <div class="tp4">
                    <input type="checkbox" name="status" id="status"  value="1" />
                    <p>记住我</p>
                    <a href="javascript:forgetPwd('username')">忘记密码</a>
                </div>
                <div class="tp5">
                    <p>${codeMsg!''}</p>
                    <input type="text"  id="vericode" name="verifyCode" placeholder="请输入验证码" />
                    <div class="tp5Son" onclick="changeImg('ch1')">
                        <img src="/portal-web/verifyCode" id="ch1"/>
                        <p>看不清，换一张</p>
                    </div>
                </div>
                <div class="tp6">
                    <input type="submit"  value="登录" />
                </div>
            </form>
        </div>
        <!--短信登录-->
        <div id="select2">
            <form method="post" action="/portal-web/msgLogin">
                <div class="tpj">
                    <p class="p1" id="notice2"></p>
                    <input type="text" id="phone" name="phoneNo" class="phone"  placeholder="手机号" onblur="check2()" required/>
                    <p class="p2" >${sendMsg!''}</p>
                    <input type="text" name="msgCode" class="code"  placeholder="请输入短信验证码" required/>
                    <input type="button" id="phone_send"  value="获取验证码" />
                </div>
                <div class="tp7">
                    <input type="submit"  value="登录" />
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#phone_send").click(function () {
        var phoneNo=$("#phone").val();
        $.ajax({
            type:"GET",
            url:"/portal-web/sendMsg/"+phoneNo,
            success:function () {
                var i=30;
                var time=document.getElementById("phone_send");
                var jishi=setInterval(function(){
                    time.style.backgroundColor="gray";
                    time.value=i+"秒后重新发送";
                    i--;
                    if(i==-1){
                        clearInterval(jishi);
                        time.style.backgroundColor="blue";
                        time.value="重新发送";
                    }
                },1000);
            }
        })
    })
    $("#stu").click(function(){
        $("#select1").slideDown();
        $("#stu").addClass("sty");
        $("#adm").removeClass("sty");
        $("#select2").css("display","none");
    })
    $("#adm").click(function(){
        $("#select2").slideDown();
        $("#adm").addClass("sty");
        $("#stu").removeClass("sty");
        $("#select1").css("display","none");
    })
    function check1() {
        $username = document.getElementById("username").value;
        var reg = /^[0-9]{12}$/;
        if ($username != "" && !reg.test($username)) {
            document.getElementById("notice1").innerHTML = "工号格式不正确！";
        } else {
            document.getElementById("notice1").innerHTML = "";
        }
    }
    function check2() {
        $username = document.getElementById("phone").value;
        var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if ($username != "" && !reg.test($username)) {
            document.getElementById("notice2").innerHTML = "请输入正确的手机号！";
        } else {
            document.getElementById("notice2").innerHTML = "";
        }
    }
    function changeImg(n) {
        $par=document.getElementById(n);
        $par.src="/portal-web/verifyCode?aa="+new Date().getTime();
    }
//    function sendCode(){
//        var i=30;
//        var time=document.getElementById("phone_send");
//        var jishi=setInterval(function(){
//            time.style.backgroundColor="gray";
//            time.value=i+"秒后重新发送";
//            i--;
//            if(i==-1){
//                clearInterval(jishi);
//                time.style.backgroundColor="blue";
//                time.value="重新发送";
//            }
//        },1000);
//    }
</script>
</html>





