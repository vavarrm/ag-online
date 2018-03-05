var _phone_key



function setCookie(_sess) {



	localStorage.session = _sess;



};



function clearCookie() {



	localStorage.session = '';



};



function userInformation() {



	$.ajax({



		url: "/api/Api/getUser?sess=" + localStorage.session,



		type: "GET",



		success: function (data) {



			if (data.status) {


				
				switch (data.status) {



					case 100:
						if(data.body.user.u_receiving_bank_card_alert ==0)
						{
							alert('银行卡资料已更改 , 请勿记录旧的汇款资讯');
							localStorage.receiving_bank_card_alert =1;
						}else if(typeof localStorage.receiving_bank_card_alert == undefined)
						{
							alert('银行卡资料已更改 , 请勿记录旧的汇款资讯');
						}
						
						$('.jq-login-before').hide();



						$('.jq-login-after').show();



						$('.jq-member-nam').text(data.body.user.u_name);

						$('.nam span').eq(0).html(data.body.user.balance);
						$('.head-balance').html(data.body.user.balance);
	

						$('.nam span').eq(1).html(data.body.user.no_read_message_total);



						break;

					case '999':

						$('.jq-login-before').show();



						$('.jq-login-after').hide();

						break;



				}



			}



		}



	});



};



function captcha_get() {



	$.ajax({



			url: "/api/Api/getCaptcha",



			type: "GET",



			success: function (data) {



					$(".jq-pop-register").find('.jq-captcha-container').find('img').remove();



					var _each = $(".jq-pop-register").find('.jq-captcha-container');



					if (data.status) {



							switch (data.status) {



									case 100:



											_each.append(



													data.body.image



											)



											break;



							}



					}



			}



	});



}



function checkPhone(namber) {



	var phone = namber



	if (!(/^1[34578]\d{9}$/.test(phone))) {



		alert("手机号码有误，请重填");



		_phone_key = false;



		return false;



	} else {



		_phone_key = true;



	}



};



$('.ajax-btn-login').click(function () {



	var _account = $('input[name=account]').val();



	var _passwd = $('input[name=passwd]').val();






	$.ajax({



		url: "/api/Api/login",



		type: "POST",



		data: JSON.stringify({



			account: _account,



			passwd: _passwd



		}),



		success: function (data) {



			if (data.status) {



				switch (data.status) {



					case 100:



						setCookie(data.body.sess);



						console.log(data);



						alert('登入成功');



						$('.jq-pop-window').removeClass('active');



						$('.jq-pop-window').find('.jq-pop-login').removeClass('active');


						
						
						userInformation()



						break;



					case '999':



						alert('帐号或密码错误');



				}



			}



		}



	});



});



$('.ajax-btn-logout').click(function () {



	$.ajax({



		url: "/api/Api/logout",



		type: "GET",



		success: function (data) {



			if (data.status) {



				switch (data.status) {



					case 100:



						clearCookie();



						alert('登出成功');



						$('.jq-login-before').show();



						$('.jq-login-after').hide();



						$('.jq-member-nam').empty();



						window.location.href = '/Mobile/Home-Index.html';



						break;



				}



			}



		}



	});



});



$('.ajax-btn-pcb').click(function () {



	var _pcb_phone = $('.jq-pop-service').find('[name=phone-num]').val();



	var _pcb_message = $('.jq-pop-service').find('[name=message]').val();



	checkPhone(_pcb_phone);



	if (_phone_key == true) {



		$.ajax({



			url: "/api/Api/addPhonecCallBack?sess=" + localStorage.session,



			type: "POST",



			data: JSON.stringify({



				pcb_phone: _pcb_phone,



				pcb_message: _pcb_message



			}),



			success: function (data) {



				if (data.status) {



					switch (data.status) {



						case 100:



							alert('问题已送出，后续将会有专人客服与您联系。');



							window.location.reload();



							break;



					}



				}



			}



		});



	}



});



$('.jq-btn-pop-register').click(function () {



	captcha_get();



});



$('.ajax-btn-register').click(function () {



	var _username = $('.jq-pop-register').find('[name=username]').val();



	var _invitecode = $('.jq-pop-register').find('[name=invitecode]').val();



	var _account = $('.jq-pop-register').find('[name=account]').val();



	var _password = $('.jq-pop-register').find('[name=password]').val();



	var _captcha = $('.jq-pop-register').find('[name=captcha]').val();



	$.ajax({
		url: "/api/Api/registered/" + _invitecode,
		type: "POST",
		data: JSON.stringify({
			name: _username,
			account: _account,
			passwd: _password,
			captcha: _captcha
		}),
		success: function (data) {
			if (data.status == 100) 
			{
				alert('註冊成功');
				$.ajax({
					url: "/api/Api/login",
					type: "POST",
					data: JSON.stringify({
						account: _account,
						passwd: _password
					}),
					success: function (data) {
						if (data.status ==100) {
								setCookie(data.body.sess);
								$('.jq-pop-window').removeClass('active');

								$('.jq-pop-window').find('.jq-pop-login').removeClass('active');
								userInformation();
								window.location.reload();
						}
						else
						{
							alert('帐号或密码错误');
						}
					}
				})
			}
			else
			{
				alert(data.message)
			}
		},
		error: function (data) {
		}
	});
});



$('.ajax-btn-captcha-reload').click(function () {



	captcha_get();



});



$(function () {



	$.ajax({



		url: "/api/Api/getFooterInfo",



		type: "GET",



		success: function (data) {



			var _each_wechat = $('.jq-service-wechat');



			var _each_QQ = $('.jq-service-QQ')



			if (data.status) {



				switch (data.status) {



					case 100:



						_each_wechat.append(



							'<a href="javascript:void(0)" class="btn btn-bg-blue">微信客服</a>' +



							'<div class="img-container">' +



							'<img class="img absolute-center-xs" src="/images/webconfig/' + data.body.list.wechat_qr_image.wc_value + '" alt="">' +



							'</div>'



						)



						_each_QQ.append(



							'<a href="javascript:void(0)" class="btn btn-bg-blue">QQ客服</a>' +



							'<div class="img-container">' +



							'<img class="img absolute-center-xs" src="/images/webconfig/' + data.body.list.qq_qr_image.wc_value + '" alt="">' +



							'</div>'



						)



				}



			}



		}



	});





	if (localStorage.session == undefined || localStorage.session == '') {



		$('.jq-login-before').show();



		$('.jq-login-after').hide();



	} else {



		userInformation()



	}





});

var bank_transfer_data ;
var ajax_load = false;
$('.bank-transfe-step3').bind('click', function(){
	if(confirm('确认支付'))
	{
		if(ajax_load == true)
		{
			alert('系统执行中，请稍后');
			return false;
		}
		ajax_load = true;
		$.ajax({
			url: "/api/Api/addRechargeFromBank?sess=" + localStorage.session,
			type: "POST",
			data: JSON.stringify({
				rbc_id :$('select[name=rbc_id]').val(),
				amount :$('input[name=amount-1]').val(),
				orderid :$('.bank-transfe-orderid').text(),
			}),
			success: function (data) {
				if(data.status == 100)
				{
					alert('送出成功、请记下订单資料，汇款后請通知平台入帐');
					$('.bank-transfe-step3').hide();
					
				}else{
					alert(data.message);
				}
				ajax_load = false;
			},
			error: function (error) {
				alert('系统错误、请联系客服');
				ajax_load = false;
			}
		});
	}
})

$('select[name=rbc_id]').bind('change' ,function(){
	var index =$('select[name=rbc_id] option:selected').index();
	$('.rbc_bank_account').text(bank_transfer_data[index].rbc_bank_account);
	$('.rbc_bank_user_name').text(bank_transfer_data[index].rbc_bank_user_name);
	$('.rbc_branch_name').text(bank_transfer_data[index].rbc_branch_name);
})

$('.jq-input-radio').click(function(){
	if($(this).val() =='bank_transfer')
	{
		$('.step2-bank-transfer').show();
		$('.bank_transfer_step2').show();
		$('.step-btn1').hide();
		$('.bank_transfer').hide();
		$('.step2-wechat3').hide();
		$('.step2-alipay2').hide();
		$('.amount-min').text(100);
		$('.amount-max').text(50000);
		if(ajax_load == true)
		{
			alert('系统执行中，请稍后');
			return false;
		}
		ajax_load = true;
		$.ajax({
			url: "/api/Api/getReceivingBankCard?sess=" + localStorage.session,
			type: "POST",
			data: JSON.stringify({
			}),
			success: function (data) {
				if(data.status == 100)
				{
					bank_transfer_data  = data.body.list;
					ajax_load = false;
					$('.bank_transfer').show();
					$('.step2').show();
					$('select[name=rbc_id] option').remove();
					$.each(data.body.list,function(i,e){
						$('select[name=rbc_id]')
						.append($("<option data-rbc_branch_name='"+e.rbc_branch_name+"'></option>")
						.attr("value",e.rbc_id)
						.text(e.rbc_bank_name)); 
					});
					$('.rbc_bank_account').text(bank_transfer_data[0].rbc_bank_account);
					$('.rbc_bank_user_name').text(bank_transfer_data[0].rbc_bank_user_name);
					$('.rbc_branch_name').text(bank_transfer_data[0].rbc_branch_name);
				}else{
					alert(data.message);
				}
			},
			error: function (error) {
				alert('系统错误、请联系客服');
				ajax_load = false;
			}
		});
	}else if($(this).val() =='wechat3')
	{
		$('.amount-min').text(10);
		$('.amount-max').text(3000);
		$('.step-btn1').hide();
		$('.step2').show();
		$('.step2-wechat3').show();
		$('.bank_transfer').hide();
		$('.bank_transfer_step2').hide();
		$('.step2-bank-transfer').hide();
		$('.step2-alipay2').hide();
	}
	else if($(this).val() =='alipay2')
	{
		$('.amount-min').text(10);
		$('.amount-max').text(5000);
		$('.step-btn1').hide();
		$('.step2').show();
		$('.step2-wechat3').hide();
		$('.step2-alipay2').show();
		$('.bank_transfer').hide();
		$('.bank_transfer_step2').hide();
		$('.step2-bank-transfer').hide();
	}
	else{
		$('.amount-min').text(50);
		$('.amount-max').text(50000);
		$('.step2').show();
		$('.step2-bank-transfer').hide();
		$('.step-btn1').show();
		$('.bank_transfer').hide();
		$('.bank_transfer_step2').hide();
		$('.step2-wechat3').hide();
		$('.step2-alipay2').hide();
	}
})




$('.wechat3-step3').click(function(){
	if(confirm('确认支付'))
	{
		if(ajax_load == true)
		{
			alert('系统执行中，请稍后');
			return false;
		}
		ajax_load = true;
		$.ajax({
			url: "/api/Api/addRechargeWechat3?sess=" + localStorage.session,
			type: "POST",
			data: JSON.stringify({
				orderid :$('.wechat3-orderid').text(),
				amount :$('input[name=amount-1]').val(),
			}),
			success: function (data) {
				if(data.status == 100)
				{
					alert('送出成功、请记下订单資料，汇款后請通知平台入帐');
					$('.wechat3-step3').hide();
				}else{
					alert(data.message);
				}
				ajax_load = false;
			},
			error: function (error) {
				alert('系统错误、请联系客服');
				ajax_load = false;
			}
		});
	}
})

$('.alipay2-step3').click(function(){
	if(confirm('确认支付'))
	{
		if(ajax_load == true)
		{
			alert('系统执行中，请稍后');
			return false;
		}
		ajax_load = true;
		$.ajax({
			url: "/api/Api/addRechargeAlipay?sess=" + localStorage.session,
			type: "POST",
			data: JSON.stringify({
				orderid :$('.alipay2-orderid').text(),
				amount :$('input[name=amount-1]').val(),
			}),
			success: function (data) {
				if(data.status == 100)
				{
					alert('送出成功、请记下订单資料，汇款后請通知平台入帐');
					$('.wechat3-step3').hide();
				}else{
					alert(data.message);
				}
				ajax_load = false;
			},
			error: function (error) {
				alert('系统错误、请联系客服');
				ajax_load = false;
			}
		});
	}
})

$('.step2-wechat3').click(function(){
	if(ajax_load == true)
	{
		alert('系统执行中，请稍后');
		return false;
	}
	
	if($('.jq-input-radio:checked').length ==0)
	{
		alert('请选择充值渠道');
		return false;
	}

	if($('input[name=amount-1]').val() =='')
	{
		alert('请输入充值金额');
		return false;
	}

	if($('input[name=amount-1]').val() <10)
	{
		alert('單筆充值限額最低 10元');
		return false;
	}
	
	if($('input[name=amount-1]').val() >3000)
	{
		alert('單筆充值限額最高 3000元');
		return false;
	}
	
	
	$.ajax({
		url: "/api/Api/getReceivingWechat3CardOrderID?sess=" + localStorage.session,
		type: "POST",
		data: JSON.stringify({
		}),
		success: function (data) {
			if(data.status == 100)
			{
				$('.step1').hide();
				$('.bank-transfe-checkpay').hide();
				$('.wechat3-checkpay').show();
				$('.wechat3-u_account').text(data.body.u_account);
				$('.wechat3-orderid').text(data.body.orderid);
				$('.wechat3-amount').text($('input[name=amount-1]').val());
				$('.wechat3-wechat-account').text(data.body.wechat_account);
				$('.wechat3-wechat-QR').attr('src','/images/wechatpayQR/'+data.body.wechat3_pay_QR);
				ajax_load = false;
			}else{
				alert(data.message);
			}
		},
		error: function (error) {
			alert('系统错误、请联系客服');
			ajax_load = false;
		}
	});
})

$('.step2-alipay2').click(function(){
	if(ajax_load == true)
	{
		alert('系统执行中，请稍后');
		return false;
	}
	
	if($('.jq-input-radio:checked').length ==0)
	{
		alert('请选择充值渠道');
		return false;
	}

	if($('input[name=amount-1]').val() =='')
	{
		alert('请输入充值金额');
		return false;
	}

	if($('input[name=amount-1]').val() <10)
	{
		alert('單筆充值限額最低 10元');
		return false;
	}
	
	if($('input[name=amount-1]').val() >5000)
	{
		alert('單筆充值限額最高 5000元');
		return false;
	}
	
	
	$.ajax({
		url: "/api/Api/getReceivingalipay2CardOrderID?sess=" + localStorage.session,
		type: "POST",
		data: JSON.stringify({
		}),
		success: function (data) {
			if(data.status == 100)
			{
				$('.step1').hide();
				$('.bank-transfe-checkpay').hide();
				$('.wechat3-checkpay').hide();
				$('.alipay2-checkpay').show();
				$('.alipay2-u_account').text(data.body.u_account);
				$('.alipay2-orderid').text(data.body.orderid);
				$('.alipay2-amount').text($('input[name=amount-1]').val());
				$('.alipay2-account').text(data.body.alipay2_account);
				$('.wechat3-wechat-QR').attr('src','/images/alipay2payQR/'+data.body.alipay2_pay_QR);
				ajax_load = false;
			}else{
				alert(data.message);
			}
		},
		error: function (error) {
			alert('系统错误、请联系客服');
			ajax_load = false;
		}
	});
})

$('.step2-bank-transfer').click(function(){
	if(ajax_load == true)
	{
		alert('系统执行中，请稍后');
		return false;
	}
	
	if($('.jq-input-radio:checked').length ==0)
	{
		alert('请选择充值渠道');
		return false;
	}

	if($('input[name=amount-1]').val() =='')
	{
		alert('请输入充值金额');
		return false;
	}

	
	if($('input[name=amount-1]').val() <100)
	{
		alert('單筆充值限額最低 100元');
		return false;
	}
	
	if($('input[name=amount-1]').val() >50000)
	{
		alert('單筆充值限額最高 50000元');
		return false;
	}
	
	
	$.ajax({
		url: "/api/Api/getReceivingBankCardOrderID?sess=" + localStorage.session,
		type: "POST",
		data: JSON.stringify({
			rbc_id :$('select[name=rbc_id]').val()
		}),
		success: function (data) {
			if(data.status == 100)
			{
				$('.step1').hide();
				$('.bank-transfe-checkpay').show();
				$('.bank-transfe-amount').text($('input[name=amount-1]').val());
				$('.bank-transfe-orderid').text(data.body.orderid);
				$('.bank-transfe-u_account').text(data.body.u_account);
				$('.bank-transfe-bank_name').text($('select[name=rbc_id] option:selected').text());
				var index = $('select[name=rbc_id] option:selected').index();
				$('.bank-transfe-bank_account').text(bank_transfer_data[index].rbc_bank_account);
				$('.bank-transfe-bank_user_name').text(bank_transfer_data[index].rbc_bank_user_name);
				$('.bank-transfe-branch_name').text(bank_transfer_data[index].rbc_branch_name);
				ajax_load = false;
			}else{
				alert(data.message);
			}
		},
		error: function (error) {
			alert('系统错误、请联系客服');
			ajax_load = false;
		}
	});
})

$('.step-btn1').click(function () {
	if($('.jq-input-radio:checked').val() =="bank_transfer")
	{
		return false;
	}

	if($('.jq-input-radio:checked').length ==0)
	{
		alert('请选择充值渠道');
		return false;
	}

	if($('input[name=amount-1]').val() =='')
	{
		alert('请输入充值金额');
		return false;
	}
	
	if($('input[name=amount-1]').val() <50)
	{
		alert('單筆充值限額最低 50元');
		return false;
	}

	if($('input[name=amount-1]').val() >50000)
	{
		alert('單筆充值限額最高 50000元');
		return false;
	}

	$.ajax({
		url: "/api/Api/getRechargeOrder?sess=" + localStorage.session,
		type: "POST",		
		data: JSON.stringify({
			paytype: $('.jq-input-radio:checked').val(),
			amount: $('input[name=amount-1]').val()
		}),

		success: function (data) {
			if (data.status == '100') {
				$('#_u_account').html(data.body.u_account);
				$('#_order_id').html(data.body.orderid);
				$('#_paytype').html($('.jq-input-radio:checked').data('title'));
				$('#_amount').html(data.body.amount);

				$('.step1').hide();
				$('.checkpay').show();
				$.each(data.body, function(i,e){

					$('input[type=hidden][name='+i+']').val(e);

				});
				$('#payfrm').attr('action',data.body.pay_url);

			}else

			{
				alert(data.message);
			}
		}
	});
})

$('input[name=amount-1]').bind('keypress', function(e) {
    if(e.keyCode==13){
		e.preventDefault();
		return false;
    }
});