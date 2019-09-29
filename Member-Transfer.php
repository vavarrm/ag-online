<!DOCTYPE html>
<html lang="en"><head>	<?php include('template/head.php');?></head>
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
                <div class="container" id="transferDiv">
					<?php $page="Member-Transfer";?>
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
        <?php include('template/pop-slider.php');?>
		<?php include('template/script.php');?>
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
				$( "#transferDiv" ).loading();
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
							$( "#transferDiv" ).loading("stop");
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
							$( "#transferDiv" ).loading("stop");
                        }
                    });
                }
            });       
        </script>
    </div>
</body>
</html>