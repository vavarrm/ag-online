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
        </header>
        <main>
            <section class="owl-carousel owl-theme owl-banner jq-owl-banner"></section>
            <section class="sect-game-list jq-sect-game-list">
                <div class="container">
                    <p class="title">热门游戏推荐</p>
                    <div class="list-group clear"></div>
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
		
            // Privity
            $(window).load(function () {
                $.ajax({
                    url: "/api/Api/getGameList?game_type=RNG&p=1&limit=9999&platform=html5&client_type=web",
                    type: "GET",
                    success: function (data) {
                        var _each = $(".jq-sect-game-list").find('.list-group');
                        var _length = data.body.list.length;
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    for (i = 0; i < _length; i++) {
                                        _each.append(
                                            '<div class="col-xs-2">' +
                                            '<a href="javascript:void(0)" class="ajax-game-link" data-game-code="' +
                                            data.body.list[i].tcgGameCode + '">' +
                                            <!-- '<img class="img" src="http://images.uxgaming.com/TCG_GAME_ICONS/' + -->
                                            <!-- data.body.list[i].productCode + '/' + data.body.list[ -->
                                                <!-- i].tcgGameCode + '.png" alt="">' + -->
											'<img src="img/gamelist'+(i+1)+'.jpg">'+
                                            '<p class="title">' + data.body.list[i].gameName +
                                            '</p>' +
                                            '</a>' +
                                            '</div>'
                                        )
                                    }
                                    break;
                            }
                        }
                    }
                });
                $.ajax({
                    url: "/api/Api/getBanner",
                    type: "GET",
                    success: function (data) {
                        <!-- console.log(data); -->
                        var _each = $(".jq-owl-banner");
                        var _length = data.body.list.length;
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    for (i = 0; i < _length; i++) {
                                        _each.append(
                                            '<div class="item">' +
                                            <!-- '<img src="/images/big_banner/' + data.body.list[i].bb_image + -->
                                            <!-- '" alt="">' + -->
											'<img width="100%" src="https://via.placeholder.com/1510x300">'+
                                            '</div>'
                                        )
                                    }
                                    <!-- Live.Global.owl_banner(); -->
                                    break;
                            }
                        }
                    }
                });
            });

            $(document).on('click', '.ajax-game-link', function (event) {
				event.preventDefault(); 
                var _key = $(this).attr('data-game-code');
                if (localStorage.session == undefined || localStorage.session == '') {
                    alert('请先登入会员');
                } else {
                    $.ajax({
                        url: "/api/Api/getGameUrl?sess=" + localStorage.session + "&game_code=" + _key +
                            "&platform=html5",
                        type: "GET",
                        success: function (data) {
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        window.location.href = data.body.data.pc;
                                        break;
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