<!DOCTYPE html>
<html lang="en">
<head>	<?php include('template/head.php');?>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="container clear">
                <a href="index.php" class="img-container">
                    <img src="img/logo.png" alt="乐鼎国际">
                </a>
                <?php include('template/login.php');?>
            </div>			<?php include('template/nav.php');?>
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
                <div class="container">					<?php $page="Member-DailyRecord";?>
                    <?php include('template/memberMenuList.php');?>
                    <div class="member-detail">
                        <div class="container" action="">
                            <div class="row" style="border-bottom: none;">
                                <div class="member-table-action">
                                    <div class="option-group-container clear">
                                        <p class="title">纪录类型</p>
                                        <a href="javascript:void(0)" class="option jq-member-option" data-daily-option="1">充值</a>
                                        <a href="javascript:void(0)" class="option jq-member-option" data-daily-option="2">提款</a>
                                        <!--<a href="javascript:void(0)" class="option jq-member-option" data-daily-option="6">优惠</a>-->
                                        <a href="javascript:void(0)" class="option jq-member-option" data-daily-option="4">转换金额</a>
                                    </div>
                                    <div class="date-group-container jq-date-group-container clear">
                                        <p class="title">时间区间</p>
                                        <div class="inner">
                                            <input type="text" id="from" name="from" placeholder="起始时间">
                                            <label for="to">至</label>
                                            <input type="text" id="to" name="to" placeholder="结束时间">
                                            <a class="btn btn-bg-blue ajax-btn-daily-time" href="javascript:void(0)">
                                                <i class="icon-ic-search"></i>
                                                <span>搜寻</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--充值-->
                                <div class="member-table" data-daily-table="1" style="display: none;">
                                    <div class="thead">
                                        <div class="tr">
                                            <div class="th">充值时间</div>											<div class="th">充值类型</div>											<div class="th">订单号</div>										
                                            <div class="th">充值金额</div>
                                            <!-- <div class="th">充值方式</div> -->
                                            <div class="th">状态</div>
                                            <!-- <div class="th">操作</div> -->
                                        </div>
                                    </div>
                                    <div class="tbody"></div>									<div>										<ul class="pagination page1">										</ul>									</div>
                                </div>
                                <!--提款-->
                                <div class="member-table" data-daily-table="2" style="display: none;">
                                    <div class="thead">
                                        <div class="tr">
                                            <div class="th">提款日期</div>
                                            <div class="th">提款金额</div>
                                            <div class="th">操作</div>
                                            <!-- <div class="th">提款状态</div> -->
                                            <!-- <div class="th">操作</div> -->
                                        </div>
                                    </div>
                                    <div class="tbody"></div>									<div>										<ul class="pagination page2">										</ul>									</div>
                                </div>
                                <!--優惠-->
                                <div class="member-table" data-daily-table="3" style="display: none;">
                                    <div class="thead">
                                        <div class="tr">
                                            <div class="th">申请时间</div>
                                            <!-- <div class="th">优惠类型</div> -->
                                            <div class="th">优惠金额</div>
                                            <div class="th">状态</div>
                                            <!-- <div class="th">操作</div> -->
                                        </div>
                                    </div>
                                    <div class="tbody"></div>									<div>										<ul class="pagination page3">										</ul>									</div>
                                </div>
                                <!--轉帳-->
                                <div class="member-table" data-daily-table="4" style="display: none;">
                                    <div class="thead">
                                        <div class="tr">
                                            <div class="th">时间</div>                                            <div class="th">交易单号</div>
                                            <div class="th">操作</div>											<div class="th">转帐金额</div>											<div class="th">用户馀额</div>											<div class="th">第三方馀额</div>
                                        </div>
                                    </div>
                                    <div class="tbody"></div>									<div>										<ul class="pagination page4">										</ul>									</div>
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
            var daily_key = '1';
            function daily_change(_type, _start_type, _end_type, p=1) {				$('.member-table').hide();
				$(".member-table[data-daily-table='"+daily_key+"']").show();				var url ;				$("a[data-daily-option='"+_type+"']").addClass('active');				if(_type == '4')				{					url ="/api/Api/transferReport?sess=" + localStorage.session ;				}else				{					url = "/api/Api/payReport?sess=" + localStorage.session ;				}
                $("[data-daily-table]").find('.tbody').find('.tr').remove();
                $.ajax({
                    url: url,
                    type: "POST",
                    data: JSON.stringify({
                        type: _type,
                        start_date: _start_type,
                        end_date: _end_type,						limit :'10',						p:p
                    }),
                    success: function (data) {
                        if (_type == '1') {
                            var _each = $("[data-daily-table=1]").find('.tbody');
                            var _length = data.body.data.list.length;
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        for (i = 0; i < _length; i++) {
                                            _each.append(
                                            '<div class="tr">' +'<div class="td" data-title="充值时间">' + data.body.data.list[i].create_at + '</div>' +											'<div class="td" data-title="充值方法">' + data.body.data.list[i].name + '</div>' +											'<div class="td" data-title="订单号">' + data.body.data.list[ i].order_number + '</div>' +
                                            '<div class="td" data-title="充值金额">' + data.body.data.list[i].amount + '</div>' +											'<div class="td" data-title="状态">' + data.body.data.list[i].status +'</div>'+											'</div>'
                                            )
                                        }
                                        break;
                                }
                            }
                        } else if (_type == '2') {
                            var _each = $("[data-daily-table=2]").find('.tbody');
                            var _length = data.body.list.length;
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        for (i = 0; i < _length; i++) {
                                            _each.append(
                                                '<div class="tr">' +
                                                '<div class="td" data-title="提款日期">' + data.body.list[i]
                                                .ua_add_datetime + '</div>' +
                                                '<div class="td" data-title="提款金额">' + data.body.list[i]
                                                .ua_value + '</div>' +
                                                '<div class="td" data-title="状态">' + data.body.list[i].ua_status_str +
                                                '</div>'
                                                // '<div class="td" data-title="提款状态">' + 'none' +
                                                // '</div>' +
                                                // '<div class="td" data-title="操作">' + 'none' + '</div>' +
                                                // '</div>'
                                            )
                                        }
                                        break;
                                }
                            }
                        } else if (_type == '3') {
                            var _each = $("[data-daily-table=3]").find('.tbody');
                            var _length = data.body.list.length;
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        for (i = 0; i < _length; i++) {
                                            _each.append(
                                                '<div class="tr">' +
                                                '<div class="td" data-title="申请时间">' + data.body.list[i]
                                                .ua_add_datetime + '</div>' +
                                                // '<div class="td" data-title="优惠类型">' + 'none' +
                                                // '</div>' +
                                                '<div class="td" data-title="优惠金额">' + data.body.list[i]
                                                .ua_value + '</div>' +
                                                '<div class="td" data-title="状态">' + data.body.list[i].ua_status_str +
                                                '</div>'
                                                // '<div class="td" data-title="操作">' + 'none' + '</div>' +
                                                // '</div>'
                                            )
                                        }
                                        break;
                                }
                            }
                        } else if (_type == '4') {
							// console.log('d');
                            var _each = $("[data-daily-table=4]").find('.tbody');
                            var _length = data.body.data.list.length;
							// console.log(data);
                            if (data.status) {
                                switch (data.status) {
                                    case 100:
                                        for (i = 0; i < _length; i++) {
											// console.log(i);
                                            _each.append(
                                                '<div class="tr">' +
                                                '<div class="td" data-title="申请时间">' + data.body.data.list[i].add_datetime+'</div>' +
                                                '<div class="td" data-title="交易单号">' + data.body.data.list[i].reference_no+'</div>' +
                                                '<div class="td" data-title="操作">' + data.body.data.list[i].action+'</div>' +
                                                '<div class="td" data-title="转帐金额">' + data.body.data.list[i].amount + '</div>' +                                                '<div class="td" data-title="用户馀额">' + data.body.data.list[i].u_balance + '</div>'+                                                '<div class="td" data-title="第三方馀额">' + data.body.data.list[i].third_balance + '</div>' 												+'</div>'
                                            )
                                        }
                                        break;
                                }
                            }
                        }						var _totalPage=data.body.data.page_info.totalPage;						var _p =data.body.data.page_info.p;						var _paginationEach = $(".page"+_type);
						// console.log(data);						_paginationEach.find('li').empty();						var _start = $('.jq-date-group-container').find('[name=from]').val();						var _end = $('.jq-date-group-container').find('[name=to]').val();						for(i=1;i<=_totalPage;i++)						{
							// console.log(i);							if(i == _p)							{								var active="active";							}else							{								var active="";							}							_paginationEach.append(								"<li><a  href='javascript:daily_change("+_type+","+_start_type+","+_end_type+","+i+")'; class='"+active+"'>"+i+"</a></li>"							);						}
                    }
                });
            }
            $(window).load(function () {				daily_change(daily_key);				$("[data-daily-table="+daily_key+"]").show();								$( "#from" ).datepicker({					"dateFormat":"yy-mm-dd",					"onClose":function(){						if($( "#from" ).val()>$( "#to" ).val() && $( "#to" ).val() !="")						{							alert('起始时间不能大于结束时间');							$(this).val('');						}					}				}).datepicker('setDate', 'today'); 				$( "#to" ).datepicker({					"dateFormat":"yy-mm-dd",					"onClose":function(){						if($( "#from" ).val()>$( "#to" ).val())						{							alert('起始时间不能大于结束时间');							$(this).val('');						}					}				}).datepicker('setDate', 'today');			
            });
            $('[data-daily-option]').click(function () {
                $('.jq-date-group-container').find('[name=from]').val('');
                $('.jq-date-group-container').find('[name=to]').val('');
                daily_change(daily_key);
            });
            $('.ajax-btn-daily-time').click(function () {
                var _start = $('.jq-date-group-container').find('[name=from]').val();
                var _end = $('.jq-date-group-container').find('[name=to]').val();				if(_start>_end&& _end !="")				{					alert('起始时间不能大于结束时间');					$(this).val('');				}				var _daily_key = $('.jq-member-option.active').data('daily-option');
                console.log(_daily_key);
				daily_change(daily_key, _start, _end);
            });
        </script>
    </div>
</body>
</html>