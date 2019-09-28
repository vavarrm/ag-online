<!DOCTYPE html>
<html lang="en"><head>    <meta charset="UTF-8">    <meta http-equiv="X-UA-Compatible" content="ie=edge">    <title>乐鼎国际</title>    <link rel="stylesheet" href="css/style.min.css">    <link rel="stylesheet" href="font/style.css">    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css">    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.theme.default.min.css">	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">    <script src="/js/iphone.browser.js"></script>    <!--iphone+ 736(560)-->    <!--iphone 667(555)-->    <!--iphone5 568(460)--></head>
<body>
    <div id="wrapper">
        <header>
            <div class="container clear">
                <a href="index.php" class="img-container">
                    <img src="img/logo.png" alt="乐鼎国际">
                </a>				<?php include('template/login.php');?>
            </div>
			<?php include('template/nav.php');?>
        </header>
        <main>
            <section class="sect-nav">
                <div class="container clear">
                    <div class="row">
                        <i class="icon-ic-home"></i>
                    </div>
                    <div class="row">
                        <p>会员中心</p>
                    </div>
                    <div class="row">
                        <p>充值</p>
                    </div>
                </div>
            </section>
            <section class="sect-member-detail">
                <div class="container">
                    <?php include('template/memberMenuList.php');?>
                    <div class="member-detail">
                        <div class="container">
                            <div class="row">
                                <div class="radio-group-container">
                                    <p class="title">转帐方式</p>
                                    <div class="radio-group clear">
                                        <label class="col-xs-3 checked">
                                            <input class="jq-input-radio" type="radio" name="transfer-option" value="1" checked='checked'>
                                            <span>从平台转出</span>
                                        </label>
                                        <label class="col-xs-3">
                                            <input class="jq-input-radio" type="radio" name="transfer-option" value="2">
                                            <span>转回平台</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row jq-row-account">
                                <div class="confirm-group-container clear">
                                    <p class="title">帐户金额</p>
                                    <p class="detail jq-balance-num"></p>
                                </div>
                                <div class="select-group-container clear">
                                    <p class="title">选择平台</p>
                                    <div class="select-group">
                                        <select class="select" name="" >
                                            <option value="">DG</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-group-container clear">
                                    <p class="title">输入金额</p>
                                    <div class="input-group">
                                        <input type="text" class="jq-cash-nam" placeholder="请输入转帐金额">
                                    </div>
                                </div>
                            </div>
                            <div class="row jq-row-game" style="display: none;">
                                <div class="confirm-group-container clear">
                                    <p class="title">DG金额</p>
                                    <p class="detail jq-balance-num"></p>
                                </div>
                                <div class="input-group-container clear">
                                    <p class="title">输入金额</p>
                                    <div class="input-group">
                                        <input type="text" class="jq-cash-nam" placeholder="请输入转帐金额">
                                    </div>
                                </div>
                            </div>
                            <div class="row btn-action">
                                <input class="btn btn-bg-blue ajax-btn-transfer-submit" type="button" value="确认转帐">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
		<?php include('template/footer.php');?>
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
            <div class="pop-register jq-pop-register jq-cancelBubble absolute-center-xs">
                <div class="pop-close jq-pop-close"></div>
                <p class="title">来乐鼎玩游戏，欢迎注册</p>
                <form class="form-group">
                    <div class="row">
                        <i class="icon-ic-user3"></i>
                        <input class="input" type="text" name="username" placeholder="请输入姓名...">
                    </div>
                    <div class="row">
                        <i class="icon-key"></i>
                        <input class="input" type="text" name="invitecode" placeholder="请输入邀请码(非必填)...">
                    </div>
                    <div class="row">
                        <i class="icon-ic-user3"></i>
                        <input class="input" type="text" name="account" placeholder="帐号必须由4-9位数字或小写英文字母组合">
                    </div>
                    <div class="row">
                        <i class="icon-ic-lock1"></i>
                        <input class="input" type="password" name="password" placeholder="密码必须由8至10个字符之间">
                    </div>
                    <div class="row">
                        <i class="icon-ic-shield"></i>
                        <input class="input" type="text" name="captcha" placeholder="请输入验证码">
                        <div class="captcha-container jq-captcha-container"></div>
                    </div>
                    <div class="form-action">
                        <input class="btn btn-bg-blue ajax-btn-register" type="button" value="注册">
                        <input type="checkbox" name="" checked>
                        <span>我已经阅读并同意乐鼎國際</span>
                        <a href="">《客户协议》</a>
                    </div>
                </form>
            </div>
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
                        <select class="select" name="message-type" >
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
        <script src="js/jquery.min.js"></script>		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/script.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            Live.Global.intital();
            Live.Global.member();
            Live.Global.owl_banner();
        </script>
        <script>
            // Privity
            var _transfer_key = 1;
            $(window).load(function () {
                $.ajax({
                    url: "/api/Api/withdrawalForm?sess=" + localStorage.session,
                    type: "GET",
                    success: function (data) {
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    var _each = $(".jq-row-account").find('.jq-balance-num');
                                    _each.html(data.body.balance);
                                    break;
                            }
                        }
                    }
                });

                $.ajax({
                    url: "/api/Api/getThirdBlance?sess=" + localStorage.session,
                    type: "GET",
                    success: function (data) {
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    var _each = $(".jq-row-game").find('.jq-balance-num');
                                    _each.html(data.body.balance);
                                    break;
                            }
                        }
                    }
                });
            });

            $('[name=transfer-option]').change(function () {
                _transfer_key = $(this).val();
                if (_transfer_key == 1) {
                    $('.jq-row-account').show();
                    $('.jq-row-game').hide();
                    $('.jq-row-game').find('.jq-cash-nam').val('');
                } else if (_transfer_key == 2) {
                    $('.jq-row-account').hide();
                    $('.jq-row-game').show();
                    $('.jq-row-account').find('.jq-cash-nam').val('');
                }
            });
            $('.ajax-btn-transfer-submit').click(function () {
                var _cash_nam1 = $('.jq-row-account').find('.jq-cash-nam').val();
                var _cash_nam2 = $('.jq-row-game').find('.jq-cash-nam').val();
                if (_transfer_key == 1) {
                    $.ajax({
                        url: "/api/Api/transferToThird?sess=" + localStorage.session + "&amount=" + _cash_nam1,
                        type: "GET",
                        success: function (data) {
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        alert('转帐完成');
                                        window.location.reload();
                                        break;
                                    case '999':
                                        alert(data.message);
                                }
                            }
                        }
                    });
                } else if (_transfer_key == 2) {
                    $.ajax({
                        url: "/api/Api/transferToLdyl?sess=" + localStorage.session + "&amount=" + _cash_nam2,
                        type: "GET",
                        success: function (data) {
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        alert('转帐完成');
                                        window.location.reload();
                                        break;
                                    case '999':
                                        alert(data.message);
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