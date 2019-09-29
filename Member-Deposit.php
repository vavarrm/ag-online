<!DOCTYPE html>
<html lang="en">
<head>
   <?php include('template/head.php');?>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="container clear">
                <a href="index.php" class="img-container">
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
                                        </label>										<label class="col-xs-3">
                                            <input class="jq-input-radio" data-title="银行汇款" value="bank_transfer" type="radio" name="paytype-1">
                                            <span>银行汇款</span>
                                        </label>										<label class="col-xs-3">
                                            <input class="jq-input-radio" data-title="微信支付" value="wechat3" type="radio" name="paytype-1">
                                            <span>微信支付</span>
                                        </label>																	<label class="col-xs-3">                                            <input class="jq-input-radio" data-title="支付宝" value="alipay2" type="radio" name="paytype-1">                                            <span>支付宝</span>                                        </label>
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
                                </div>																<div class="input-group-container clear bank_transfer" style="display:none;">                                    <p class="title">收款银行</p>                                    <div class="input-group clear">                                        <select name="rbc_id">                                        </select>                                    </div>                                </div>																					<div class="input-group-container clear bank_transfer_step2">									<p class="title">收款银行帐户</p>									<div class="input-group">										<span style="" class="rbc_bank_account"></span>									</div>								</div>								<div class="input-group-container clear bank_transfer_step2">									<p class="title">收款分行</p>									<div class="input-group">										<span style="" class="rbc_branch_name"></span>									</div>								</div>								<div class="input-group-container clear bank_transfer_step2">									<p class="title"  >收款人姓名</p>									<div class="input-group">										<span style="" class="rbc_bank_user_name">1</span>									</div>								</div>
                            </div>
                            <div class="row btn-action">
                                <input class="btn btn-bg-blue step-btn1" type="button" value="下一步">                                <input class="btn btn-bg-blue step2-bank-transfer" style="display:none;" type="button" value="下一步">                                <input class="btn btn-bg-blue step2-wechat3" style="display:none;" type="button" value="下一步">                                <input class="btn btn-bg-blue step2-alipay2" style="display:none;" type="button" value="下一步">
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
						<div class="container bank-transfe-checkpay" style="display:none;">                            <div class="row" >                                <div class="confirm-group-container clear">                                    <p class="title">用户名</p>                                    <p class="detail bank-transfe-u_account" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">充值金额</p>                                    <p class="detail bank-transfe-amount" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">订单号码</p>                                    <p class="detail bank-transfe-orderid" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">收款银行</p>                                    <p class="detail bank-transfe-bank_name" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">分行名称</p>                                    <p class="detail bank-transfe-branch_name" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">收款银行帐户</p>                                    <p class="detail bank-transfe-bank_account" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">收款人姓名</p>                                    <p class="detail bank-transfe-bank_user_name" ></p>                                </div>								<div class="row btn-action">                                    <input class="btn btn-bg-blue bank-transfe-step3" type="submit" value="确认送出">                                </div>                            </div>                        </div>											<div class="container wechat3-checkpay" style="display:none;">                            <div class="row" >                                <div class="confirm-group-container clear">                                    <p class="title">用户名</p>                                    <p class="detail wechat3-u_account" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">充值金额</p>                                    <p class="detail wechat3-amount" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">订单号码</p>                                    <p class="detail wechat3-orderid" >11</p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">微信号</p>                                    <p class="detail wechat3-wechat-account" >11</p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">微信QR 码</p>                                    <image width="200px" height="200px" class="wechat3-wechat-QR" src="">                                </div>								<p>请先添加微信好友，提供会员帐号后，在进行转帐</p>								<div class="row btn-action">                                    <input class="btn btn-bg-blue wechat3-step3" type="submit" value="确认送出">                                </div>                            </div>                        </div>
						<div class="container alipay2-checkpay" style="display:none;">                            <div class="row" >                                <div class="confirm-group-container clear">                                    <p class="title">用户名</p>                                    <p class="detail alipay2-u_account" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">充值金额</p>                                    <p class="detail alipay2-amount" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">订单号码</p>                                    <p class="detail alipay2-orderid" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">支付宝帐号</p>                                    <p class="detail alipay2-account" ></p>                                </div>								<div class="confirm-group-container clear">                                    <p class="title">支付宝QR码</p>									<image width="200px" height="200px" class="wechat3-wechat-QR" src="">                                </div>								<p>请先添加支付宝好友，提供会员帐号后，在进行转帐</p>								<div class="row btn-action">                                    <input class="btn btn-bg-blue alipay2-step3" type="submit" value="确认送出">                                </div>                            </div>                        </div>
                    </div>
                </div>
            </section>
        </main>
		<?php include('template/footer.php');?>
		<?php include('template/pop-slider.php');?>
		<?php include('template/script.php');?>
        <script>

        </script>
    </div>
</body>
</html>