function userInformation() {

	$.ajax({

		url: "/api/Api/getUser?sess=" + sessionStorage.session,

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

}

$(function() {
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

							'<img class="img absolute-center-xs" src="images/webconfig/' + data.body.list.wechat_qr_image.wc_value + '" alt="">' +

						'</div>'

					)

					_each_QQ.append(

						'<a href="javascript:void(0)" class="btn btn-bg-blue">QQ客服</a>' +

						'<div class="img-container">' +

							'<img class="img absolute-center-xs" src="images/webconfig/' + data.body.list.qq_qr_image.wc_value + '" alt="">' +

						'</div>'

					)

			}

		}

	}

});

if (sessionStorage.session == undefined || sessionStorage.session == '') {

	$('.jq-login-before').show();

	$('.jq-login-after').hide();

} else {

	userInformation()

}
});