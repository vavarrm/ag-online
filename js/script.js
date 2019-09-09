var Live = {

  Global: {

    intital: function () {

      $('.jq-cancelBubble').on('click', function (event) {

        event.cancelBubble = true;

        event.stopPropagation();

      });

      $('.jq-nav-option').click(function () {

        $('.jq-nav-option').removeClass('active');

        $(this).addClass('active');

      });

      $('.jq-login-member-detail').on('click', function () {

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

          $('.jq-pop-true-false').removeClass('active');

          $('.jq-pop-true-false').find('.jq-title').empty();

          $('.jq-pop-true-false').find('.jq-detail').empty();

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

        // $("#from").datepicker({

          // defaultDate: "+1w",

          // changeMonth: true,

          // numberOfMonths: 2,

          // dateFormat: "yy-mm-dd",

          // onClose: function (selectedDate) {

            // $("#to").datepicker("option", "minDate", selectedDate);

          // }

        // });

        // $("#to").datepicker({

          // defaultDate: "+1w",

          // changeMonth: true,

          // numberOfMonths: 2,

          // dateFormat: "yy-mm-dd",

          // onClose: function (selectedDate) {

            // $("#from").datepicker("option", "maxDate", selectedDate);

          // }

        // });

      });

    },

    member: function () {

      var action_length = $('.jq-member-action-list').find('li').length - 1;

      var action_height = 55 + (73 * action_length);

      $('.jq-member-action-list').parent().css('min-height', action_height + 'px');

      $('.jq-member-tag').click(function () {

        var key = $(this).attr('data-password');

        console.log(key);

        $('.jq-member-tag').removeClass('active');

        $(this).addClass('active');

        $('[type=password]').val('');

        if (key == 'user') {

          $('.jq-user-password').show();

          $('.jq-user-cashpassword-first').hide();

          $('.jq-user-cashpassword').hide();

        } else if (key == 'cash') {

          $('.jq-user-password').hide();

        };

      });

      $('.jq-member-option').click(function () {

        daily_key = $(this).attr('data-daily-option');

        $('.jq-member-option').removeClass('active');

        $(this).addClass('active');

        if (daily_key == '1,2') {

          $('[data-daily-table]').hide();

          $('[data-daily-table=1]').show();

        } else if (daily_key == '3') {

          $('[data-daily-table]').hide();

          $('[data-daily-table=2]').show();

        } else if (daily_key == '6') {

          $('[data-daily-table]').hide();

          $('[data-daily-table=3]').show();

        } else if (daily_key == '4,5') {

          $('[data-daily-table]').hide();

          $('[data-daily-table=4]').show();

        }

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

      $(document).on('click', '.jq-btn-message-delete', function () {

        delete_key = $(this)

        $('.jq-pop-window').addClass('active');

        $('.jq-pop-true-false').addClass('active');

        $('.jq-pop-true-false').find('.jq-title').html('删除讯息');

        $('.jq-pop-true-false').find('.jq-detail').html('是否确认删除此站内讯息');

      })

      $(document).on('click', '.jq-btn-message-view', function () {

        $('.jq-pop-window').addClass('active');

        $('.jq-pop-message-view').addClass('active');

        $(".jq-pop-message-view").find('.form-group').find('.row').remove();

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

      $(document).on('click', '.jq-btn-notice-more', function () {

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