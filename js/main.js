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

						$('.jq-login-before').hide();

						$('.jq-login-after').show();

						$('.jq-member-nam').text(data.body.user.u_name);
						$('.nam span').eq(0).html(data.body.user.balance);
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


			if (data.status) {

				switch (data.status) {

					case 100:

						alert('註冊成功');

						window.location.reload();

						break;

					case '999':

						alert(data.message);

				}

			}

		},

		error: function (data) {

			console.log(data)

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