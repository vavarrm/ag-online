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
                        <p>投注纪录</p>
                    </div>
                </div>
            </section>
            <section class="sect-member-detail">
                <div class="container">					<?php $page="Member-CashRecord";?>
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
											<div class="th">玩家帐号</div>
                                            <div class="th">下注金额</div>                                            <div class="th">有效投注</div>                                            <div class="th">输赢</div>
                                            <div class="th"></div>
                                        </div>
                                    </div>
                                    <div class="tbody"></div>									<div>										<ul class="pagination">										</ul>									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
		<?php include('template/footer.php');?>		<?php include('template/pop-slider.php');?>
		<?php include('template/script.php');?>
        <script>
            // Privity
			
			function drawTable(data,_each,_totalPage,_p)
			{
					var _start_type = $('.jq-date-group-container').find('[name=from]').val();
					var _end_type = $('.jq-date-group-container').find('[name=to]').val();
					let _length = data.length;
					var _paginationEach = $(".pagination");
					for (i = 0; i < _length; i++) 
					{
						var href ;
						var action ='';
						if(data[i].child >1)
						{
							action ='<a href="javascript:cash_change(1,'+"'"+data[i].tree+"'"+')">查看下级</a>';
						}
						_each.append(
							'<div class="tr">' +
								'<div class="td" data-title="玩家帐号">' + data[i].u_account + '</div>' +
								'<div class="td" data-title="下注金额">' + data[i].bet_points + '</div>' +
								'<div class="td" data-title="有效投注">' + data[i].available_bet + '</div>' +
								'<div class="td" data-title="输赢">' + data[i].win_loss + '</div>' +
								'<div class="td" data-title="动作">' + action+ '</div>' +
							'</div>'
						)
					}
					_paginationEach.find('li').remove();
					$(".pagination li").empty();										
					for(i=1;i<=_totalPage;i++)
					{
						if(i == _p)
						{
							var active="active";
						}else
						{
							var active="";
						}
						_paginationEach.append(
							"<li><a  href='javascript:cash_change("+i+")'; class='"+active+"'>"+i+"</a></li>"
						);
					}
			}
			

			
            function cash_change(p,tree='') 
			{
				$( ".member-table" ).loading();				if ( typeof p ==="undefined")				{					p = 1;				}
                $("[data-daily-table]").find('.tbody').find('.tr').remove();
				var _start_type = $('.jq-date-group-container').find('[name=from]').val();
				var	_end_type = $('.jq-date-group-container').find('[name=to]').val();
				$.ajax({
					url: "/api/Api/getThirdBetByUser?sess=" + localStorage.session +
						"&start_date=" + _start_type + "&end_date=" + _end_type+"&p="+p+"&tree="+tree,
					type: "GET",
					success: function (data) {
						var _each = $("[data-daily-table=1]").find('.tbody');
						var _paginationEach = $(".pagination");
						var _length = data.body.list.length;
						var _totalPage = data.body.page_info.totalPage;
						var _p = data.body.page_info.p;
						if (data.status) {
							switch (data.status) {
								case 100:
									drawTable(data.body.list,_each,_totalPage,_p)
								break;
							}
						}
					}
				});
				$( ".member-table" ).loading("stop");
            }
            $(window).load(function () {
                cash_change(1);				$( "#from" ).datepicker({					"dateFormat":"yy-mm-dd",					"onClose":function(){						if($( "#from" ).val()>$( "#to" ).val() && $( "#to" ).val() !="")						{							alert('起始时间不能大于结束时间');							$(this).val('');						}					}				}).datepicker('setDate', 'today'); 				$( "#to" ).datepicker({					"dateFormat":"yy-mm-dd",					"onClose":function(){						if($( "#from" ).val()>$( "#to" ).val())						{							alert('起始时间不能大于结束时间');							$(this).val('');						}					}				}).datepicker('setDate', 'today'); 
            });
            $('.ajax-btn-cash-time').click(function () {
                var _start = $('.jq-date-group-container').find('[name=from]').val();
                var _end = $('.jq-date-group-container').find('[name=to]').val();				if(_start>_end&& _end !="")				{					alert('起始时间不能大于结束时间');					$(this).val('');				}
                cash_change(1);
            });
        </script>
    </div>
</body>
</html>