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
                </div>
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
                                    <div class="radio-group clear pay_category">
                                   
                                    </div>
                                </div>
                            </div>
						   <div class="row step2" style="display:none;">
                                <div class="radio-group-container">
                                    <div class="radio-group clear pay_method">
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="row step3"  style="display:none;">
                                <div class="input-group-container clear">
                                    <p class="title">充值金额</p>
                                    <div class="input-group">
                                        <input type="number" min="1" value="100" id="amount" name="amount" placeholder="请输入充值金额">
                                        <!--<span style="">* 單筆充值限額：最低
                                            <span style="color:red;" class="amount-min"></span> 元，最高
                                            <span style="color:red;" class="amount-max"></span> 元 *
                                        </span>-->
                                    </div>
                                </div>								
                            </div>
                            <div class="row btn-action">
                                <input class="btn btn-bg-blue step4" type="button" style="display:none;" value="送出">
                                <input class="btn btn-bg-blue step-btn1" type="button" style="display:none;" value="下一步">
                                <input class="btn btn-bg-blue step2-bank-transfer" style="display:none;" type="button" value="下一步">
                                <input class="btn btn-bg-blue step2-wechat3" style="display:none;" type="button" value="下一步">
                                <input class="btn btn-bg-blue step2-alipay2" style="display:none;" type="button" value="下一步">
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
								<form action="" method="post" id="payfrm"  target="_blank">
								</form>
                            </div>			
                        </div>
						<div class="container bank-transfe-checkpay" style="display:none;">
                            <div class="row" >
                                <div class="confirm-group-container clear">
                                    <p class="title">用户名</p>
                                    <p class="detail bank-transfe-u_account" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">充值金额</p>
                                    <p class="detail bank-transfe-amount" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">订单号码</p>
                                    <p class="detail bank-transfe-orderid" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">收款银行</p>
                                    <p class="detail bank-transfe-bank_name" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">分行名称</p>
                                    <p class="detail bank-transfe-branch_name" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">收款银行帐户</p>
                                    <p class="detail bank-transfe-bank_account" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">收款人姓名</p>
                                    <p class="detail bank-transfe-bank_user_name" ></p>
                                </div>
								<div class="row btn-action">
                                    <input class="btn btn-bg-blue bank-transfe-step3" type="submit" value="确认送出">
                                </div>
                            </div>
                        </div>					
						<div class="container wechat3-checkpay" style="display:none;">
                            <div class="row" >
                                <div class="confirm-group-container clear">
                                    <p class="title">用户名</p>
                                    <p class="detail wechat3-u_account" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">充值金额</p>
                                    <p class="detail wechat3-amount" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">订单号码</p>
                                    <p class="detail wechat3-orderid" >11</p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">微信号</p>
                                    <p class="detail wechat3-wechat-account" >11</p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">微信QR 码</p>
                                    <image width="200px" height="200px" class="wechat3-wechat-QR" src="">
                                </div>
								<p>请先添加微信好友，提供会员帐号后，在进行转帐</p>
								<div class="row btn-action">
                                    <input class="btn btn-bg-blue wechat3-step3" type="submit" value="确认送出">
                                </div>
                            </div>
                        </div>
						<div class="container alipay2-checkpay" style="display:none;">
                            <div class="row" >
                                <div class="confirm-group-container clear">
                                    <p class="title">用户名</p>
                                    <p class="detail alipay2-u_account" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">充值金额</p>
                                    <p class="detail alipay2-amount" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">订单号码</p>
                                    <p class="detail alipay2-orderid" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">支付宝帐号</p>
                                    <p class="detail alipay2-account" ></p>
                                </div>
								<div class="confirm-group-container clear">
                                    <p class="title">支付宝QR码</p>
									<image width="200px" height="200px" class="wechat3-wechat-QR" src="">
                                </div>
								<p>请先添加支付宝好友，提供会员帐号后，在进行转帐</p>
								<div class="row btn-action">
                                    <input class="btn btn-bg-blue alipay2-step3" type="submit" value="确认送出">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
		<?php include('template/footer.php');?>
		<?php include('template/pop-slider.php');?>
	</div>
		<?php include('template/script.php');?>
        <script>
				var method ;
				$.ajax({
                    url: "/api/Api/getPayCategory?sess=" + localStorage.session ,
                    type: "POST",
                    data: JSON.stringify(),
                    success: function (response) {
						var _each = $(".pay_category");
						method = response.body.data.method;
                        $.each(response.body.data.category,function(i,e)
						{
							var category_name = e.category_name;
							var category_code = e.category_code;
							var html ='<label class="col-xs-3 pay_category_radio">'
									  +'<input class="jq-input-radio" data-title="'+category_name+'" value="'+category_code+'" type="radio" name="paytype-1">'
                                      +'<span>'+category_name+'</span>'
                                      +'</label>';
							_each.append(html);
						})
                    }
                });
				
				$( document ).on( "click", ".pay_category_radio", function(e) {
					e.stopPropagation();
					$('.pay_category_radio').removeClass('checked');
					$(this).addClass('checked');
					var _each = $(".pay_method");
					_each.empty();
					$('.step2').show()
					var category_code =$('.pay_category_radio.checked').find('.jq-input-radio').val();
					$.each(method[category_code], function(i,e){
						var name = e.name;
						var code = e.code;
						var type = e.type;
						var min = e.min;
						var max = e.max;
						var provide_code = e.provide_code;
						var html ='<label class="col-xs-3 pay_method_radio">'
									  +'<input data-max="'+max+'" data-min="'+min+'" data-provide_code="'+provide_code+'" data-type="'+type+'" class="jq-input-radio" data-title="'+name+'" value="'+code+'" type="radio" name="paytype-1">'
                                      +'<span>'+name+'</span>'
                                      +'</label>';
						_each.append(html);
					})
				});
				
				$( document ).on( "click", ".pay_method_radio", function(e) {
					e.stopPropagation();
					var min = $('.pay_method_radio.checked').find('.jq-input-radio').data('min');
					var max = $('.pay_method_radio.checked').find('.jq-input-radio').data('max');
					$('#amount').val(min);
					$('.pay_method_radio').removeClass('checked');
					$(this).addClass('checked');
					$('.step3').show();
					$('.step4').show();
				});
			
				$('.step4').click(function(){
					var method =$('.pay_method_radio.checked').find('.jq-input-radio').val();
					var provide_code = $('.pay_method_radio.checked').find('.jq-input-radio').data('provide_code');
					var type = $('.pay_method_radio.checked').find('.jq-input-radio').data('type');
					var min = $('.pay_method_radio.checked').find('.jq-input-radio').data('min');
					var max = $('.pay_method_radio.checked').find('.jq-input-radio').data('max');
					var code = $('.pay_method_radio.checked').find('.jq-input-radio').val();
					var amount = $('#amount').val();
					var category_code =$('.pay_category_radio.checked').find('.jq-input-radio').val();
					if(amount <=0)
					{
						layer.alert('请输入金额', {icon: 0});
						return false;
					}
					min = parseFloat(min);
					max = parseFloat(max);
					if(amount <min || amount>max)
					{
						layer.alert('充值限制'+min+"-"+max, {icon: 0});
						return false;
					}
					data ={
						method:method,
						provide_code:provide_code,
						amount:amount,
						type:type,
						code:code,
						category_code:category_code
					};
					$.ajax({
						url: "/api/Api/payRedirection?sess=" + localStorage.session ,
						type: "POST",
						data: JSON.stringify(data),
						success: function (response) {
							$('#payfrm').empty();
							var _each =$('#payfrm');
							var pay = response.body.pay;
							_each.attr('action',pay.url);
							$.each(pay.item,function(i,e){
								var html ="<input type='hiqdden' name='"+i+"' value='"+e+"'>";
								_each.append(html);
							})
							// $('.checkpay').show();
							_each.submit();
						}
					});
				})
        </script>
    </div>
</body>
</html>