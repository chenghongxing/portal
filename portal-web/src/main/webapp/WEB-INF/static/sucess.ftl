<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>提示信息</title>
    <script src="/portal-web/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        body{
            background: rgb(248,249,252);
        }
        .div1 {
            position:relative;
            margin: 180px auto;
            display:none;
            width:200px;
            height:200px;
            border:2px solid lightblue;
            border-radius:50%;
            text-align:center;
            line-height:200px;
            font-size:18px;
            font-family:"微软雅黑";
        }
        .bounceinDown {
            -webkit-animation:bounceinDownAnimate 1s ease .5s infinite;
            animation:bounceinDownAnimate 5s ease .5s infinite;
        }
        @-webkit-keyframes bounceinDownAnimate {
            0% {
                -webkit-transform:translateY(-200px);
            }
            30% {
                -webkit-transform:translateY(30px);
            }
            70% {
                -webkit-transform:translateY(-10px);
            }
            100% {
                -webkit-transform:translateY(0px);
            }
        }
    </style>
</head>
<body>
<div id="test1" class="div1"><span style="color: red">${message!''}</span></div>
</body>
<script type="text/javascript">
    $("#test1").fadeToggle(3000);
    $("#test1").addClass("bounceinDown");
    $("#test1").fadeToggle(3000);
    function tiao() {
        window.history.back();
    }
    setTimeout("tiao()",4000);
</script>
</html>
