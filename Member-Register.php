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
                        <p>银行卡管理</p>
                    </div>
                </div>
            </section>
            <section class="sect-member-detail">
                <div class="container">
					<?php $page="Member-Register";?>                    <?php include('template/memberMenuList.php');?>
                    <div class="member-detail">
                        <div class="container" action="">
                            <div class="row btn-action" style="text-align: left;">
                                <input class="btn btn-bg-blue jq-btn-addregister jq-cancelBubble" type="button" value="新增邀请码">
                            </div>
                            <div class="row" style="border-bottom: none;">
                                <div class="member-table jq-member-table">
                                    <div class="thead">
                                        <div class="tr">
                                            <div class="th">邀请码列表</div>
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
		<?php include('template/footer.php');?>        <?php include('template/pop-slider.php');?>		<?php include('template/script.php');?>
        <script>
            // Privity
            $(window).load(function () {
                $.ajax({
                    url: "/api/Api/getRegisteredLink?sess=" + localStorage.session,
                    type: "POST",
                    success: function (data) {
                        var _each = $(".jq-member-table").find('.tbody');
                        var _length = data.body.list.length;
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    for (i = 0; i < _length; i++) {
                                        _each.append(
                                            '<div class="tr">' +
                                            '<div class="td" data-title="邀请码">' + data.body.list[
                                                i].rl_id + '</div>' +
                                            '</div>'
                                        )
                                    }
                                    break;
                            }
                        }
                    }
                });
            });
            $('.jq-btn-addregister').click(function () {
                $.ajax({
                    url: "/api/Api/addRegisteredLink?sess=" + localStorage.session,
                    type: "POST",
                    success: function (data) {
                        console.log(data)
                        if (data.status) {
                            switch (data.status) {
                                case 100:
                                    alert(data.message);
                                    window.location.reload();
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