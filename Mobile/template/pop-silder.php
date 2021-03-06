<ul class="pop-slider">
<li>
	<a href="javascript:void(0)" class="pop-btn-service jq-pop-btn-service">
		<img class="img" src="img/service.png" alt="">
		<p class="title">电话回拨</p>
	</a>
</li>
</ul>
<div class="pop-window jq-pop-window">
	<div class="pop-true-false jq-pop-true-false jq-cancelBubble absolute-center-xs">
		<p class="title jq-title"></p>
		<p class="detail jq-detail"></p>
		<div class="pop-action">
			<a class="btn btn-bg-blue jq-cancelBubble" data-btn-true-false="false" href="javascript:void(0)">取消</a>
			<a class="btn btn-bg-blue jq-cancelBubble" data-btn-true-false="true" href="javascript:void(0)">确认</a>
		</div>
	</div>
	<div class="pop-cash-password jq-pop-cash-password jq-cancelBubble absolute-center-xs">
		<p class="title jq-title">設置資金密碼</p>
		<p class="detail jq-detail">請先設置資金密碼，才可進行充值喔</p>
		<div class="pop-action">
			<a class="btn btn-bg-blue jq-pop-btn-confirm jq-cancelBubble" href="Member-Password.html">前往設置</a>
		</div>
	</div>
	<div class="pop-login jq-pop-login jq-cancelBubble absolute-center-xs">
		<div class="pop-close jq-pop-close"></div>
		<p class="title">会员登入</p>
		<form class="form-group">
			<div class="row">
				<i class="icon-ic-user3"></i>
				<input class="input" type="text" name="account" placeholder="请输入帐号...">
			</div>
			<div class="row">
				<i class="icon-ic-lock1"></i>
				<input class="input" type="password" name="passwd" placeholder="请输入密码...">
			</div>
			<div class="form-action">
				<input class="btn btn-bg-blue ajax-btn-login" type="button" value="登入">
			</div>
		</form>
	</div>
	<div class="pop-register jq-pop-register jq-cancelBubble absolute-center-xs">
		<div class="pop-close jq-pop-close"></div>
		<p class="title">来乐鼎玩游戏，欢迎注册</p>
		<form class="form-group">
			<div class="row">
				<i class="icon-ic-user3"></i>
				<input class="input" type="text" name="username" placeholder="请输入姓名...">
			</div>
			<div class="row">
				<i class="icon-key"></i>
				<input class="input" type="text" name="invitecode" placeholder="请输入邀请码(非必填)...">
			</div>
			<div class="row">
				<i class="icon-ic-user3"></i>
				<input class="input" type="text" name="account" placeholder="帐号必须由4-9位数字或小写英文字母组合">
			</div>
			<div class="row">
				<i class="icon-ic-lock1"></i>
				<input class="input" type="password" name="password" placeholder="密码必须由8至10个字符之间">
			</div>
			<div class="row">
				<i class="icon-ic-shield"></i>
				<input class="input" type="text" name="captcha" placeholder="请输入验证码">
				<div class="captcha-container jq-captcha-container"></div>
				<p class="captcha-reload">看不清楚？
					<a class="ajax-btn-captcha-reload" href="javascript:void(0)">重新取得验证码</a>
				</p>
			</div>
			<div class="form-action">
				<input class="btn btn-bg-blue ajax-btn-register" type="button" value="注册">
				<input type="checkbox" name="" checked>
				<span>我已经阅读并同意乐鼎國際</span>
				<a href="">《客户协议》</a>
			</div>
		</form>
	</div>
	<div class="pop-service jq-pop-service jq-cancelBubble absolute-center-xs">
		<div class="pop-close jq-pop-close"></div>
		<p class="title">电话回拨</p>
		<form class="form-group">
			<p class="warning-text">请填写您的电话与问题并送出，后续将会有专人客服与您联系。</p>
			<div class="row">
				<p class="title">手机号码</p>
				<input class="input" type="text" name="phone-num" placeholder="请输入电话号码">
			</div>
			<div class="row">
				<p class="title">讯息</p>
				<textarea class="textarea" name="message" cols="30" rows="6"></textarea>
			</div>
			<div class="form-action">
				<input class="btn btn-bg-blue ajax-btn-pcb" type="button" value="确认发送">
			</div>
		</form>
	</div>
	<div class="pop-message jq-pop-message jq-cancelBubble absolute-center-xs">
		<div class="pop-close jq-pop-close"></div>
		<p class="title">新增站内信</p>
		<form class="form-group">
			<div class="row">
				<p class="title">类型</p>
				<select class="select" name="message-type">
					<option value="up">上級</option>
					<option value="all-down">所有直接下級</option>
					<option value="down">指定直接下級</option>
				</select>
			</div>
			<div class="row">
				<p class="title">收件人</p>
				<input class="input" type="text" name="message-name" placeholder="请输入收件人资讯">
			</div>
			<div class="row">
				<p class="title">标题</p>
				<input class="input" type="text" name="message-title" placeholder="请输入标题名称">
			</div>
			<div class="row">
				<p class="title">讯息</p>
				<textarea class="textarea" name="message-content" cols="30" rows="6"></textarea>
			</div>
			<div class="form-action">
				<input class="btn btn-bg-blue ajax-btn-message-submit" type="button" value="确认发送">
			</div>
		</form>
	</div>
	<div class="pop-message-view jq-pop-message-view jq-cancelBubble absolute-center-xs">
		<div class="pop-close jq-pop-close"></div>
		<p class="title">站内信標題</p>
		<form class="form-group"></form>
	</div>
	<div class="pop-bankcard jq-pop-bankcard jq-cancelBubble absolute-center-xs">
		<div class="pop-close jq-pop-close"></div>
		<p class="title">新增银行卡</p>
		<form class="form-group">
			<div class="row">
				<p class="title">帐户名称</p>
				<input class="input" type="text" name="account_name" placeholder="请输入帐户名称">
			</div>
			<div class="row">
				<p class="title">银行帐号</p>
				<input class="input" type="text" name="account" placeholder="请输入银行帐号">
			</div>
			<div class="row">
				<p class="title">确认银行帐号</p>
				<input class="input" type="text" name="account_check" placeholder="请再次输入银行帐号">
			</div>
			<div class="row">
				<p class="title">分行名称</p>
				<input class="input" type="text" name="branch_name" placeholder="请输入分行名称">
			</div>
			<div class="row clear">
				<p class="title">开户所在地</p>
				<div class="col-xs-6" style="padding-left: 0;">
					<select class="select" id="province" name="P1"></select>
				</div>
				<div class="col-xs-6" style="padding-right: 0;">
					<select class="select" id="city" name="C1"></select>
				</div>
			</div>
			<div class="form-action">
				<input class="btn btn-bg-blue ajax-btn-bankcard" type="button" value="确认新增">
			</div>
		</form>
	</div>
</div>