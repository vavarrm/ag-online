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
    <link rel="stylesheet" href="lib/jquery-ui/jquery-ui.min.css">
	<script src="/js/iphone.browser.js"></script>
    <!--iphone+ 736(560)-->
    <!--iphone 667(555)-->
    <!--iphone5 568(460)-->
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
                        <p>投注纪录</p>
                    </div>
                </div>
            </section>
            <section class="sect-member-detail">
                <div class="container">
					<?php include('template/memberMenuList.php');?>
                    <div class="member-detail">
                        <div class="container" action="">
                            <div class="row" style="border-bottom: none;">
                                <div class="member-table-action">
                                    <div class="option-group-container clear">
                                        <p class="title">纪录类型</p>
                                        <a href="javascript:void(0)" class="option jq-member-option active">DG</a>
                                    </div>
                                    <div class="date-group-container jq-date-group-container clear">
                                        <p class="title">时间区间</p>
                                        <div class="inner">
                                            <input type="text" id="from" name="from" placeholder="起始时间">
                                            <label for="to">至</label>
                                            <input type="text" id="to" name="to" placeholder="结束时间">
                                            <a class="btn btn-bg-blue ajax-btn-cash-time" href="javascript:void(0)">
                                                <i class="icon-ic-search"></i>
                                                <span>搜寻</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="member-table" data-daily-table='1'>
                                    <div class="thead">
                                        <div class="tr">
                                            <div class="th">日期</div>
                                            <div class="th">游戏编号</div>
                                            <div class="th">游戏类别</div>
                                            <div class="th">下注金额</div>
                                        </div>
                                    </div>
                                    <div class="tbody"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
		<?php include('template/footer.php');?>
        <script src="js/jquery.min.js"></script>
        <script src="js/script.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="lib/jquery-ui/jquery-ui.min.js"></script>
		<script src="/js/main.js"></script>
		<script>
            Live.Global.intital();
            Live.Global.member();
            Live.Global.owl_banner();
            Live.Global.datepicker();
        </script>
        <script>
            // Privity
            function cash_change(_start_type, _end_type,p) {
                $("[data-daily-table]").find('.tbody').find('.tr').remove();
                if (_start_type == undefined || _end_type == undefined) {
                    $.ajax({
                        url: "/api/Api/getThirdBetByUser?sess=" + localStorage.session+"&p="+p,
                        type: "GET",
                        success: function (data) {
                            var _each = $("[data-daily-table=1]").find('.tbody');
                            var _length = data.body.list.length;
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        for (i = 0; i < _length; i++) {
                                            _each.append(
                                                '<div class="tr">' +
                                                    '<div class="td" data-title="日期">' + data.body.list[i].bet_time + '</div>' +
                                                    '<div class="td" data-title="游戏编号">' + data.body.list[i].t_id + '</div>' +
                                                    '<div class="td" data-title="游戏类别">' + data.body.list[i].game_type + '</div>' +
                                                    '<div class="td" data-title="下注金额">' + data.body.list[i].bet_points + '</div>' +
                                                '</div>'
                                            )
                                        }
									break;
                                }
                            }
                        }
                    });
                } else {
                    $.ajax({
                        url: "/api/Api/getThirdBetByUser?sess=" + localStorage.session +
                            "&start_date=" + _start_type + "&end_date=" + _end_type+"&p="+p,
                        type: "GET",
                        success: function (data) {
                            var _each = $("[data-daily-table=1]").find('.tbody');
                            var _length = data.body.list.length;
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        for (i = 0; i < _length; i++) {
                                            _each.append(
                                                '<div class="tr">' +
                                                    '<div class="td" data-title="日期">' + data.body.list[i].bet_time + '</div>' +
                                                    '<div class="td" data-title="游戏编号">' + data.body.list[i].t_id + '</div>' +
                                                    '<div class="td" data-title="游戏类别">' + data.body.list[i].game_type + '</div>' +
                                                    '<div class="td" data-title="下注金额">' + data.body.list[i].bet_points + '</div>' +
                                                '</div>'
                                            )
                                        }
                                        break;
                                }
                            }
                        }
                    });
                }
            }
            $(window).load(function () {
                cash_change();
            });
            $('.ajax-btn-cash-time').click(function () {
                var _start = $('.jq-date-group-container').find('[name=from]').val();
                var _end = $('.jq-date-group-container').find('[name=to]').val();
                cash_change(_start, _end,1);
            });
        </script>
    </div>
</body>
</html>