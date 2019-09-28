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
				<?php include('template/login.php');?>
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
                </div
            </section>
            <section class="sect-member-detail">
                <div class="container">
					<?php $page="Member-Deposit";?>
					<?php include('template/memberMenuList.php');?>
                    <div class="member-detail">
                        <form class="container step1" action="">
                            <div class="row">
                                <div class="radio-group-container">
                                    <p class="title">请选择充值渠道</p>
                                    <div class="radio-group clear">
                                        <label class="col-xs-3">
                                            <input class="jq-input-radio" data-title="快捷支付" value="unionpay2" type="radio" name="paytype-1">
                                            <span>快捷支付</span>
                                        </label>
										<label class="col-xs-3">
                                            <input class="jq-input-radio" data-title="银联支付" value="unionpay3" type="radio" name="paytype-1">
                                            <span>银联支付</span>
                                        </label>
                                            <input class="jq-input-radio" data-title="银行汇款" value="bank_transfer" type="radio" name="paytype-1">
                                            <span>银行汇款</span>
                                        </label>
                                            <input class="jq-input-radio" data-title="微信支付" value="wechat3" type="radio" name="paytype-1">
                                            <span>微信支付</span>
                                        </label>							
                                    </div>
                                </div>
                            </div>
                            <div class="row step2"  style="display:none;">
                                <div class="input-group-container clear">
                                    <p class="title">充值金额</p>
                                    <div class="input-group">
                                        <input type="number" min="1"  name="amount-1" placeholder="请输入充值金额">
                                        <span style="">* 單筆充值限額：最低
                                            <span style="color:red;" class="amount-min"></span> 元，最高
                                            <span style="color:red;" class="amount-max"></span> 元 *
                                        </span>
                                    </div>
                                </div>								
                            </div>
                            <div class="row btn-action">
                                <input class="btn btn-bg-blue step-btn1" type="button" value="下一步">
                            </div>
                        </form>				
                        <div class="container checkpay" style="display:none;">
                            <div class="row" >
                                <div class="confirm-group-container clear">
                                    <p class="title">用户名</p>
                                    <p class="detail" id="_u_account">monsters</p>
                                </div>
                                <div class="confirm-group-container clear"> 
                                    <p class="title">订单号码</p>
                                    <p class="detail" id="_order_id">ct_bank2018116153339fe535a5fda8</p>
                                </div>
                                <div class="confirm-group-container clear">
                                    <p class="title">支付渠道</p>
                                    <p class="detail" id="_paytype">充提中心网银</p>
                                </div>
                                <div class="confirm-group-container clear">
                                    <p class="title">充值金额</p>
                                    <p class="detail">RMB
                                        <span  id="_amount" style="color:red; font-weight: bold;">5,000.00</span>
                                    </p>
                                </div>
                            </div>
                            <div class="row btn-action">
								<form action="" method="post" id="payfrm">
								<input type="hidden" name="scode" value="">
								<input type="hidden" name="orderid" value="">
								<input type="hidden" name="paytype" value="">
								<input type="hidden" name="amount" value="">
								<input type="hidden" name="productname" value="充值">
								<input type="hidden" name="currcode" value="CNY">
								<input type="hidden" name="userid" value="">
								<input type="hidden" name="memo" value="">
								<input type="hidden" name="callbackurl" value="">
								<input type="hidden" name="sign" value="">
                                <input class="btn btn-bg-blue" type="submit" value="确认支付">
								</form>
                            </div>			
                        </div>
						<div class="container bank-transfe-checkpay" style="display:none;">
						<div class="container alipay2-checkpay" style="display:none;">
                    </div>
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
        <script src="js/jquery.min.js"></script>
        <script src="js/script.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="js/main.js"></script>
        <script>
            Live.Global.intital();
            Live.Global.member();
            Live.Global.owl_banner();
        </script>
        <script>

        </script>
    </div>
</body>
</html>