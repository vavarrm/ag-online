<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>乐鼎国际</title>
    <link rel="stylesheet" href="css/style.min.css">
    <link rel="stylesheet" href="font/style.css">
    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.theme.default.min.css">
    <script src="/js/iphone.browser.js"></script>
    <!--iphone+ 736(560)-->
    <!--iphone 667(555)-->
    <!--iphone5 568(460)-->
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="container clear">
                <a href="Home-Index.html" class="img-container">
                    <img src="img/logo.png" alt="乐鼎国际">
                </a>
                <div class="login-information">
                    <div class="login-before jq-login-before ajax-login-form" style="display: none;">
                        <div class="row">
                            <input class="account" type="text" name="account" placeholder="游戏账号">
                            <i class="icon-ic-user3"></i>
                        </div>
                        <div class="row">
                            <input class="password" type="password" name="passwd" placeholder="游戏密码">
                            <i class="icon-ic-lock1"></i>
                        </div>
                        <input class="btn btn-solid-blue ajax-btn-login" type="button" value="登入">
                        <a class="btn btn-bg-blue jq-btn-pop-register jq-cancelBubble" href="javascript:void(0)">
                            <i class="icon-ic-roulette1"></i>
                            <span>免费开户</span>
                        </a>
                    </div>
                    <div class="login-after jq-login-after" style="display: none;">
						<div class="btn btn-bg" style="box-shadow :0px 0px 0px 0px" >
                            <span class="nam">本地额度</span>
							<span class="head-balance">1</span>
                        </div>
                        <div class="login-member-detail jq-login-member-detail jq-cancelBubble">
                            <span class="member-nam jq-member-nam"></span>
                            <ul class="member-list jq-member-list jq-cancelBubble">
                                <li>
                                    <span class="title">本地额度</span>
                                    <a class="nam" href="Member-Deposit.html">
                                        <span>5000000</span>
                                    </a>
                                </li>
                                <li>
                                    <span class="title">站内信</span>
                                    <a class="nam" href="Member-Message.html">
                                        <span>10</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <a class="btn btn-bg-orange" href="Member-Deposit.html">
                            <i class="icon-ic-crown1"></i>
                            <span>充值/会员中心</span>
                        </a>
                        <input class="btn btn-solid-orange ajax-btn-logout" type="button" value="登出">
                    </div>
                </div>
            </div>
            <div class="nav-container">
                <ul class="container clear">
                    <li class="jq-nav-option">
                        <a href="Live-Entertainment.html">真人娱乐</a>
                    </li>
                    <!-- <li class="jq-nav-option"> -->
                        <!-- <a href="Live-Electric.html">电子游戏</a> -->
                    <!-- </li> -->
                    <li class="jq-nav-option">
                        <a href="Live-Discount.html">优惠讯息</a>
                    </li>
                    <li class="jq-nav-option">
                        <a href="Live-Notice.html">平台公告</a>
                    </li>
                    <!-- <li class="jq-nav-option"> -->
                        <!-- <a href="Home-Index.html">手机APP</a> -->
                    <!-- </li> -->
                </ul>
            </div>
        </header>
        <main>
            <section class="owl-carousel owl-theme owl-banner jq-owl-banner"></section>
            <section class="sect-game-list jq-sect-game-list">
                <div class="container">
                    <p class="title">热门游戏推荐</p>
                    <div class="list-group clear"></div>
                </div>
            </section>
        </main>
        <footer>
            <div class="row"></div>
            <div class="row">
                <div class="container clear">
                    <ul class="sitemap">
                        <li>
                            <a href="Live-Question.html">常见问题</a>
                        </li>
                        <li>
                            <a href="">游戏规则</a>
                        </li>
                        <li>
                            <a href="">客服信箱</a>
                        </li>
                    </ul>
                    <ul class="service">
                        <li class="jq-service-wechat">

                        </li>
                        <li class="jq-service-QQ">

                        </li>
                    </ul>
                    <p class="copyright">2018 乐鼎国际 版权所有.All Rights Reserved</p>
                </div>
            </div>
        </footer>

        <ul class="pop-slider">
            <li>
                <a href="javascript:void(0)" class="pop-btn-service jq-pop-btn-service">
                    <img class="img" src="img/service.png" alt="">
                    <p class="title">电话回拨</p>
                </a>
            </li>
        </ul>

        <div class="pop-window jq-pop-window">
            <div class="pop-true-false jq-pop-true-false jq-cancelBubble absolute-center-xs">
                <p class="title jq-title"></p>
                <p class="detail jq-detail"></p>
                <div class="pop-action">
                    <a class="btn btn-bg-blue jq-cancelBubble" data-btn-true-false="false" href="javascript:void(0)">取消</a>
                    <a class="btn btn-bg-blue jq-cancelBubble" data-btn-true-false="true" href="javascript:void(0)">确认</a>
                </div>
            </div>
            <div class="pop-cash-password jq-pop-cash-password jq-cancelBubble absolute-center-xs">
                <p class="title jq-title">設置資金密碼</p>
                <p class="detail jq-detail">請先設置資金密碼，才可進行充值喔</p>
                <div class="pop-action">
                    <a class="btn btn-bg-blue jq-pop-btn-confirm jq-cancelBubble" href="Member-Password.html">前往設置</a>
                </div>
            </div>
            <?php include('template/register.php');?>
            <div class="pop-service jq-pop-service jq-cancelBubble absolute-center-xs">
                <div class="pop-close jq-pop-close"></div>
                <p class="title">电话回拨</p>
                <form class="form-group">
                    <p class="warning-text">请填写您的电话与问题并送出，后续将会有专人客服与您联系。</p>
                    <div class="row">
                        <p class="title">手机号码</p>
                        <input class="input" type="text" name="phone-num" placeholder="请输入电话号码">
                    </div>
                    <div class="row">
                        <p class="title">讯息</p>
                        <textarea class="textarea" name="message" cols="30" rows="6"></textarea>
                    </div>
                    <div class="form-action">
                        <input class="btn btn-bg-blue ajax-btn-pcb" type="button" value="确认发送">
                    </div>
                </form>
            </div>
            <div class="pop-message jq-pop-message jq-cancelBubble absolute-center-xs">
                <div class="pop-close jq-pop-close"></div>
                <p class="title">新增站内信</p>
                <form class="form-group">
                    <div class="row">
                        <p class="title">类型</p>
                        <select class="select" name="message-type">
                            <option value="up">上級</option>
                            <option value="all-down">所有直接下級</option>
                            <option value="down">指定直接下級</option>
                        </select>
                    </div>
                    <div class="row">
                        <p class="title">收件人</p>
                        <input class="input" type="text" name="message-name" placeholder="请输入收件人资讯">
                    </div>
                    <div class="row">
                        <p class="title">标题</p>
                        <input class="input" type="text" name="message-title" placeholder="请输入标题名称">
                    </div>
                    <div class="row">
                        <p class="title">讯息</p>
                        <textarea class="textarea" name="message-content" cols="30" rows="6"></textarea>
                    </div>
                    <div class="form-action">
                        <input class="btn btn-bg-blue ajax-btn-message-submit" type="button" value="确认发送">
                    </div>
                </form>
            </div>
            <div class="pop-message-view jq-pop-message-view jq-cancelBubble absolute-center-xs">
                <div class="pop-close jq-pop-close"></div>
                <p class="title">站内信標題</p>
                <form class="form-group"></form>
            </div>
            <div class="pop-bankcard jq-pop-bankcard jq-cancelBubble absolute-center-xs">
                <div class="pop-close jq-pop-close"></div>
                <p class="title">新增银行卡</p>
                <form class="form-group">
                    <div class="row">
                        <p class="title">帐户名称</p>
                        <input class="input" type="text" name="account_name" placeholder="请输入帐户名称">
                    </div>
                    <div class="row">
                        <p class="title">银行帐号</p>
                        <input class="input" type="text" name="account" placeholder="请输入银行帐号">
                    </div>
                    <div class="row">
                        <p class="title">确认银行帐号</p>
                        <input class="input" type="text" name="account_check" placeholder="请再次输入银行帐号">
                    </div>
                    <div class="row">
                        <p class="title">分行名称</p>
                        <input class="input" type="text" name="branch_name" placeholder="请输入分行名称">
                    </div>
                    <div class="row clear">
                        <p class="title">开户所在地</p>
                        <div class="col-xs-6" style="padding-left: 0;">
                            <select class="select" id="province" name="P1"></select>
                        </div>
                        <div class="col-xs-6" style="padding-right: 0;">
                            <select class="select" id="city" name="C1"></select>
                        </div>
                    </div>
                    <div class="form-action">
                        <input class="btn btn-bg-blue ajax-btn-bankcard" type="button" value="确认新增">
                    </div>
                </form>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/script.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
		
			Live.Global.intital();
            Live.Global.notice_event();
            Live.Global.owl_banner();
            Live.Global.datepicker();
		
            // Privity
            $(window).load(function () {
                $.ajax({
                    url: "/api/Api/getGameList?game_type=RNG&p=1&limit=9999&platform=html5&client_type=web",
                    type: "GET",
                    success: function (data) {
                        var _each = $(".jq-sect-game-list").find('.list-group');
                        var _length = data.body.list.length;
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    for (i = 0; i < _length; i++) {
                                        _each.append(
                                            '<div class="col-xs-2">' +
                                            '<a href="javascript:void(0)" class="ajax-game-link" data-game-code="' +
                                            data.body.list[i].tcgGameCode + '">' +
                                            <!-- '<img class="img" src="http://images.uxgaming.com/TCG_GAME_ICONS/' + -->
                                            <!-- data.body.list[i].productCode + '/' + data.body.list[ -->
                                                <!-- i].tcgGameCode + '.png" alt="">' + -->
											'<img src="https://via.placeholder.com/161x203">'+
                                            '<p class="title">' + data.body.list[i].gameName +
                                            '</p>' +
                                            '</a>' +
                                            '</div>'
                                        )
                                    }
                                    break;
                            }
                        }
                    }
                });
                $.ajax({
                    url: "/api/Api/getBanner",
                    type: "GET",
                    success: function (data) {
                        <!-- console.log(data); -->
                        var _each = $(".jq-owl-banner");
                        var _length = data.body.list.length;
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    for (i = 0; i < _length; i++) {
                                        _each.append(
                                            '<div class="item">' +
                                            <!-- '<img src="/images/big_banner/' + data.body.list[i].bb_image + -->
                                            <!-- '" alt="">' + -->
											'<img src="https://via.placeholder.com/50x50">'+
                                            '</div>'
                                        )
                                    }
                                    <!-- Live.Global.owl_banner(); -->
                                    break;
                            }
                        }
                    }
                });
            });

            $(document).on('click', '.ajax-game-link', function (event) {
				event.preventDefault(); 
                var _key = $(this).attr('data-game-code');
                if (localStorage.session == undefined || localStorage.session == '') {
                    alert('请先登入会员');
                } else {
                    $.ajax({
                        url: "/api/Api/getGameUrl?sess=" + localStorage.session + "&game_code=" + _key +
                            "&platform=html5",
                        type: "GET",
                        success: function (data) {
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        window.location.href = data.body.data.pc;
                                        break;
                                }
                            }
                        }
                    });
                }
            });
        </script>
    </div>
</body>
</html>