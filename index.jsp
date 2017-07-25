<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="" %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>登录|注册</title>
    <script type="text/javascript"></script>
    <link rel="shortcut icon" href="img/icon/fire.ico" type="image/x-icon">
    <link rel="icon" href="img/icon/fire.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    </head>
    <body>
    <div class="main">
    <div class="sign main1">
    <!--标题-->
    <div class="sign-top">
    <h1 id="fire">火眼探测调度指挥中心</h1>
    </div>
    <!--登录-->
    <div class="sign-middle">
    <form action="login.do" method ="post">
    <ul>
    <li><input type="" name="username" class="input-margin" value="" placeholder="用户名"/></li>
    <li><input type="" name="password" class="input-margin" value="" placeholder="密码"/></li>
    <li><button type="submit" class="input-margin" style="background-color: #006699;color: #fff;margin-bottom: 8vh;">登录</button></li>
    </ul>
    </form>
    </div>
    </div>
    </div>
    </body>
    </html>
