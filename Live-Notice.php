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
			<?php $active = "notice"?>
            <?php include('template/nav2.php');?>
        </header>
        <main>
            <section class="sect-notice jq-sect-notice">
                <div class="container"></div>
                <div class="btn-action">
                    <input class="btn btn-bg-blue jq-btn-more" type="button" value="MORE">
                </div>
            </section>
        </main>
		<?php include('template/footer.php');?>
        <?php include('template/pop-slider.php');?>
		<?php include('template/script.php');?>
        <script>
            Live.Global.intital();
            Live.Global.notice_event();
            Live.Global.owl_banner();
            Live.Global.datepicker();
        </script>
        <script>
            var _more_key = 2;
            var _page_total
            var _result_length
            $(window).load(function () {
                $.ajax({
                    url: "/api/Api/getAnnouncemetList?limit=5&p=1&type=public",
                    type: "GET",
                    success: function (data) {
                        _page_total = data.body.pageinfo.total;
                        var _each = $(".jq-sect-notice").find('.container');
                        var _length = data.body.list.length;
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    for (i = 0; i < _length; i++) {
                                        _each.append(
                                            '<div class="row">' +
                                            '<div class="notice-group jq-notice-group">' +
                                            '<p class="title">' +
                                            '<i class="icon-ic-broadcast1"></i>' +
                                            '<span style="display: inline-block; margin-right: 20px;">' +
                                            data.body.list[i].an_title + '</span>' +
                                            '<span>' + data.body.list[i].an_datetime +
                                            '</span>' +
                                            '</p>' +
                                            '<div class="detail jq-detail">' + data.body.list[i].an_content +
                                            '</div>' +
                                            '<div class="notice-action">' +
                                            '<a class="jq-btn-notice-more" href="javascript:void(0)">更多内容 ></a>' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>'
                                        )
                                    }
                                    break;
                            }
                        }
                    }
                });
            });
            $('.jq-btn-more').click(function () {
                $.ajax({
                    url: "/api/Api/getAnnouncemetList?limit=5&p=" + _more_key +
                        "&type=public",
                    type: "GET",
                    success: function (data) {
                        var _each = $(".jq-sect-notice").find('.container');
                        var _length = data.body.list.length;
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    _result_length = $('.jq-sect-notice').find('.row').length;
                                    for (i = 0; i < _length; i++) {
                                        console.log(i)
                                        _each.append(
                                            '<div class="row">' +
                                            '<div class="notice-group jq-notice-group">' +
                                            '<p class="title">' +
                                            '<i class="icon-ic-broadcast1"></i>' +
                                            '<span style="display: inline-block; margin-right: 20px;">' +
                                            data.body.list[i].an_title + '</span>' +
                                            '<span>' + data.body.list[i].an_datetime +
                                            '</span>' +
                                            '</p>' +
                                            '<div class="detail jq-detail">' + data.body.list[i].an_content +
                                            '</div>' +
                                            '<div class="notice-action">' +
                                            '<a class="jq-btn-notice-more" href="javascript:void(0)">更多内容 ></a>' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>'
                                        )
                                    }
                                    if (_result_length == _page_total) {
                                        $('.jq-btn-more').hide();
                                    } else {
                                        _more_key += 1;
                                    }
                                    break;
                            }
                        }
                    }
                });
            });

        </script>
    </div>
</body>
</html>