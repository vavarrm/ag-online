<?php $page = (isset($page)?$page:'');?>
<ul class="member-action-list jq-member-action-list">
	<li>会员中心</li>
	<li>
		<a href="Member-Deposit.php" class="btn btn-solid-blue <?php if($page=="Member-Deposit") echo "active" ?>">充值</a>
	</li>
	<li>
		<a href="Member-Withdrawal.php" class="btn btn-solid-blue <?php if($page=="Member-Withdrawal") echo "active" ?>">提款</a>
	</li>
	<li>
		<a href="Member-Transfer.php" class="btn btn-solid-blue <?php if($page=="Member-Transfer") echo "active" ?>">转帐</a>
	</li>
	<li>
		<a href="Member-DailyRecord.php" class="btn btn-solid-blue <?php if($page=="Member-DailyRecord") echo "active" ?>">日常纪录</a>
	</li>
	<li>
		<a href="Member-CashRecord.php" class="btn btn-solid-blue <?php if($page=="Member-CashRecord") echo "active" ?> ">投注纪录</a>
	</li>
	<li>
		<a href="Member-Balance.php" class="btn btn-solid-blue <?php if($page=="Member-Balance") echo "active" ?>">余额查询</a>
	</li>
	<li>
		<a href="Member-Discount.php" class="btn btn-solid-blue <?php if($page=="Member-Discount") echo "active" ?>">优惠讯息</a>
	</li>
	<li>
		<a href="Member-Message.php" class="btn btn-solid-blue <?php if($page=="Member-Message") echo "active" ?>">站内讯息</a>
	</li>
	<li>
		<a href="Member-Register.php" class="btn btn-solid-blue <?php if($page=="Member-Register") echo "active" ?>">邀请码管理</a>
	</li>
	<li>
		<a href="Member-Password.php" class="btn btn-solid-blue <?php if($page=="Member-Password") echo "active" ?>">密码管理</a>
	</li>
	<li>
		<a href="Member-CardManagement.php" class="btn btn-solid-blue <?php if($page=="Member-CardManagement") echo "active" ?>">银行卡管理</a>
	</li>
</ul>