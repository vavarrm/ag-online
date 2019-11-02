        <ul class="pop-slider" style="display:none;">
            <li>
                <a href="javascript:void(0)" class="pop-btn-service jq-pop-btn-service">
                    <img class="img" src="img/service.png" alt="">
                    <p class="title">电话回拨</p>
                </a>
            </li>
        </ul>
        <div class="pop-window jq-pop-window">
			<?php include('template/register.php');?>
            <div class="pop-true-false jq-pop-true-false jq-cancelBubble absolute-center-xs">
                <p class="title jq-title"></p>
                <p class="detail jq-detail"></p>
                <div class="pop-action">
                    <a class="btn btn-bg-blue jq-cancelBubble" data-btn-true-false="false" href="javascript:void(0)">取消</a>
                    <a class="btn btn-bg-blue jq-cancelBubble" data-btn-true-false="true" href="javascript:void(0)">确认</a>
                </div>
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
                        <select class="select" name="message-type" >
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
        </div>