var Live = {

  Global: {

    intital: function () {

      $('.jq-cancelBubble').on('click', function () {
        event.cancelBubble = true;
        event.stopPropagation();
      });

      $('.jq-nav-option').click(function () {
        $('.jq-nav-option').removeClass('active');
        $(this).addClass('active');
      });

      $('.jq-login-member-detail').click(function () {
        if ($(this).hasClass('active')) {
          $(this).find('.jq-member-list').removeClass('active');
          $(this).removeClass('active');
        } else {
          $(this).find('.jq-member-list').addClass('active');
          $(this).addClass('active');
        };
      });

      $('.jq-btn-pop-register').click(function () {
        $('.jq-pop-window').addClass('active');
        $('.jq-pop-register').addClass('active');
      });

      $('.jq-pop-btn-service').click(function () {
        $('.jq-pop-window').addClass('active');
        $('.jq-pop-service').addClass('active');
      });

      $('.jq-pop-window').click(function () {
        if ($(this).find('.jq-pop-message').hasClass('active')) {} else {
          $('.jq-pop-window').removeClass('active');
          $('.jq-pop-register').removeClass('active');
          $('.jq-pop-service').removeClass('active');
        }
      });

      $('.jq-pop-close').click(function () {
        $('.jq-pop-window').removeClass('active');
        $('.jq-pop-register').removeClass('active');
        $('.jq-pop-service').removeClass('active');
      });

      $(window).click(function () {
        $('.jq-login-member-detail').removeClass('active');
        $('.jq-member-list').removeClass('active');
      });

    },

    owl_banner: function () {
      $('.owl-banner').owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        responsive: {
          0: {
            items: 1
          },
          600: {
            items: 1
          },
          1000: {
            items: 1
          }
        }
      });
    },

    datepicker: function () {
      $(function () {
        $("#from").datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2,
          dateFormat: "yy-mm-dd",
          onClose: function (selectedDate) {
            $("#to").datepicker("option", "minDate", selectedDate);
          }
        });
        $("#to").datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2,
          dateFormat: "yy-mm-dd",
          onClose: function (selectedDate) {
            $("#from").datepicker("option", "maxDate", selectedDate);
          }
        });
      });
    },

    member: function () {

      var delete_key

      var action_length = $('.jq-member-action-list').find('li').length - 1;
      var action_height = 55 + (73 * action_length);
      $('.jq-member-action-list').parent().css('min-height', action_height + 'px');

      $('.jq-member-tag').click(function () {
        $('.jq-member-tag').removeClass('active');
        $(this).addClass('active');
      });

      $('.jq-member-option').click(function () {
        var daily_key = $(this).attr('data-daily-option');
        $('.jq-member-option').removeClass('active');
        $(this).addClass('active');
        if (daily_key == 1) {
          $('[data-daily-table]').hide();
          $('[data-daily-table=1]').show();
        } else if (daily_key == 2) {
          $('[data-daily-table]').hide();
          $('[data-daily-table=2]').show();
        } else if (daily_key == 3) {
          $('[data-daily-table]').hide();
          $('[data-daily-table=3]').show();
        } else if (daily_key == 4) {
          $('[data-daily-table]').hide();
          $('[data-daily-table=4]').show();
        }
      });

      $('.jq-btn-card-lock').click(function () {
        $('.jq-pop-window').addClass('active');
        $('.jq-pop-true-false').addClass('active');
        $('.jq-pop-true-false').find('.jq-title').html('锁定银行卡');
        $('.jq-pop-true-false').find('.jq-detail').html('银行卡锁定可增强帐户安全，锁定后不能增加新银行卡绑定，自身不能解绑和解锁银行卡，如需解锁请联系在线客服申请');
      });

      $('.jq-btn-card-add').click(function () {
        $('.jq-pop-window').addClass('active');
        $('.jq-pop-bankcard').addClass('active');
      });

      $('.jq-input-radio').change(function () {
        $('.jq-input-radio').parent().removeClass('checked');
        $(this).parent().addClass('checked')
      });

      $('.jq-btn-message').click(function () {
        $('.jq-pop-window').addClass('active');
        $('.jq-pop-message').addClass('active');
      });

      $('.jq-btn-message-delete').on('click', function () {
        delete_key = $(this)
        $('.jq-pop-window').addClass('active');
        $('.jq-pop-true-false').addClass('active');
        $('.jq-pop-true-false').find('.jq-title').html('删除讯息');
        $('.jq-pop-true-false').find('.jq-detail').html('是否确认删除此站内讯息');
      });

      $('.jq-btn-message-view').on('click', function () {
        $('.jq-pop-window').addClass('active');
        $('.jq-pop-message-view').addClass('active');
      });

      $('[data-btn-true-false]').on('click', function () {
        var key = $(this).attr('data-btn-true-false');
        if (key == 'true') {
          delete_key.parents('.tr').remove();
          $('.jq-pop-window').removeClass('active');
          $('.jq-pop-true-false').removeClass('active');
        } else {
          $('.jq-pop-window').removeClass('active');
          $('.jq-pop-true-false').removeClass('active');
        };
      });

      $('.jq-pop-window').click(function () {
        if ($(this).find('.jq-pop-message').hasClass('active')) {} else {
          $('.jq-pop-window').removeClass('active');
          $('.jq-pop-message-view').removeClass('active');
          $('.jq-pop-bankcard').removeClass('active');
          $('.jq-pop-true-false').removeClass('active');
        }
      });

      $('.jq-pop-close').click(function () {
        $('.jq-pop-window').removeClass('active');
        $('.jq-pop-message').removeClass('active');
        $('.jq-pop-message-view').removeClass('active');
        $('.jq-pop-bankcard').removeClass('active');
      });

    },

    notice_event: function () {

      $('.jq-btn-notice-more').on('click', function () {
        if ($(this).hasClass('open')) {
          $(this).parents('.jq-notice-group').find('.jq-detail').removeClass('open');
          $(this).removeClass('open');
          $(this).empty();
          $(this).html('更多内容 >');
        } else {
          $(this).parents('.jq-notice-group').find('.jq-detail').addClass('open');
          $(this).addClass('open');
          $(this).empty();
          $(this).html('收合讯息 >');
        }
      });

    },

  },

}