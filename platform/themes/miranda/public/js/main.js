/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./platform/plugins/language/resources/js/language-public.js":
/*!*******************************************************************!*\
  !*** ./platform/plugins/language/resources/js/language-public.js ***!
  \*******************************************************************/
/***/ (() => {

"use strict";


$(function () {
  $('.language-wrapper .dropdown .dropdown-toggle').off('click').on('click', function (event) {
    event.preventDefault();
    var _self = $(event.currentTarget);
    if (_self.hasClass('active')) {
      _self.closest('.language-wrapper').find('.dropdown .dropdown-menu').hide();
      _self.removeClass('active');
    } else {
      _self.closest('.language-wrapper').find('.dropdown .dropdown-menu').show();
      _self.addClass('active');
    }
  });
  $(document).on('click', function (event) {
    var _self = $(event.currentTarget);
    if (_self.closest('.language-wrapper').length === 0) {
      _self.closest('.language-wrapper').find('.dropdown .dropdown-menu').hide();
      _self.closest('.language-wrapper').find('.dropdown .dropdown-toggle').removeClass('active');
    }
  });
});

/***/ }),

/***/ "./platform/themes/miranda/assets/js/main.js":
/*!***************************************************!*\
  !*** ./platform/themes/miranda/assets/js/main.js ***!
  \***************************************************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

/*---------------------------
	JS INDEX
	===================
	01. Main Menu
	02. Banner Slider
	03. ROOM Slider(Big)
	04. Testimonial Slider
	05. Latest Post Slider
	06. Feature Room Slider
	07. CounterUp
	08. Instagram Feed Slider
	09. Food Menu Slider
	10. Gallery Sliders & Popup
	11. Room Slider Two
	12. Banner Image Slider
	13. offCanvas Active
	14. init extra plugin
	15. Active Gallery And Video Popup
	16. Search Form
	17. Preloader
	18. Back to top
	19. Sticky header

-----------------------------*/

var mirandaDoc;
(function ($) {
  'use strict';

  var isRTL = $('body').prop('dir') === 'rtl';
  mirandaDoc = {
    init: function init() {
      this.mainMenu();
      this.bannerSlider();
      this.roomSlider();
      this.testimonialSlider();
      this.latestPostlider();
      this.featureRoom();
      this.roomDetailsSlider();
      this.counterToUp();
      this.instaFeedSlider();
      this.menuSlider();
      this.gallery();
      this.roomSliderTwo();
      this.bannerImgSlider();
      this.offCanvas();
      this.extraPlugin();
      this.popUpExtra();
      this.searchForm();
    },
    //===== 01. Main Menu
    mainMenu: function mainMenu() {
      // Variables
      var var_window = $(window),
        navContainer = $('.nav-container'),
        pushedWrap = $('.nav-pushed-item'),
        pushItem = $('.nav-push-item'),
        pushedHtml = pushItem.html(),
        pushBlank = '',
        navbarToggler = $('.navbar-toggler'),
        navMenu = $('.nav-menu'),
        navMenuLi = $('.nav-menu ul li'),
        closeIcon = $('.navbar-close');

      // navbar toggler
      navbarToggler.on('click', function () {
        navbarToggler.toggleClass('active');
        navMenu.toggleClass('menu-on');
        $('body').toggleClass('menu-open', navMenu.hasClass('menu-on'));
      });

      // close icon
      closeIcon.on('click', function () {
        navMenu.removeClass('menu-on');
        navbarToggler.removeClass('active');
        $('body').removeClass('menu-open');
      });

      // adds toggle button to li items that have children
      navMenu.find('li a').each(function () {
        if ($(this).next().length > 0) {
          $(this).parent('li').append('<span class="dd-trigger"><i class="fal fa-angle-down"></i></span>');
        }
      });

      // expands the dropdown menu on each click
      navMenu.find('li .dd-trigger').on('click', function (e) {
        e.preventDefault();
        $(this).parent('li').children('ul').stop(true, true).slideToggle(350);
        $(this).parent('li').toggleClass('active');
      });

      // check browser width in real-time
      function breakpointCheck() {
        navContainer.addClass('breakpoint-on');
        pushedWrap.html(pushedHtml);
        pushItem.hide();
      }
      breakpointCheck();
      var_window.on('resize', function () {
        breakpointCheck();
      });
    },
    //===== 02. Banner Slider
    bannerSlider: function bannerSlider() {
      var bannerSliderOne = $('#bannerSlider');
      bannerSliderOne.on('init', function () {
        var $firstAnimatingElements = $('.single-banner:first-child').find('[data-animation]');
        doAnimations($firstAnimatingElements);
      });
      bannerSliderOne.on('beforeChange', function (e, slick, currentSlide, nextSlide) {
        var $animatingElements = $('.single-banner[data-slick-index="' + nextSlide + '"]').find('[data-animation]');
        doAnimations($animatingElements);
      });

      // active banner slider
      bannerSliderOne.slick({
        rtl: isRTL,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 5000,
        dots: false,
        fade: true,
        arrows: false,
        prevArrow: '<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
        nextArrow: '<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>'
      });

      // Do for slider animation
      function doAnimations(elements) {
        var animationEndEvents = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        elements.each(function () {
          var $this = $(this);
          var $animationDelay = $this.data('delay');
          var $animationType = 'animated ' + $this.data('animation');
          $this.css({
            'animation-delay': $animationDelay,
            '-webkit-animation-delay': $animationDelay
          });
          $this.addClass($animationType).one(animationEndEvents, function () {
            $this.removeClass($animationType);
          });
        });
      }
    },
    //===== 03. ROOM Slider (On Home Page One)
    roomSlider: function roomSlider() {
      var sliderImg = $('.rooms-slider-one'),
        sliderContent = $('.room-content-slider'),
        countStatus = $('.slider-count'),
        countBig = $('.slider-count-big');
      sliderImg.slick({
        rtl: isRTL,
        slidesToShow: 3,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: false,
        dots: false,
        centerMode: true,
        centerPadding: '6%',
        asNavFor: sliderContent,
        responsive: [{
          breakpoint: 1600,
          settings: {
            slidesToShow: 2
          }
        }, {
          breakpoint: 992,
          settings: {
            slidesToShow: 1,
            centerPadding: '15%'
          }
        }]
      });
      sliderContent.slick({
        rtl: isRTL,
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: false,
        dots: true,
        asNavFor: sliderImg
      });
      sliderContent.on('init reInit afterChange', function (event, slick, currentSlide) {
        if (!slick.$dots) {
          return;
        }
        var i = (currentSlide ? currentSlide : 0) + 1;
        var statusText = i > 10 ? i : '0' + i;
        countStatus.html('<span class="current">' + statusText + '</span>/' + slick.$dots[0].children.length);
        countBig.html('<span >' + statusText + '</span> ');
      });
    },
    //===== 04. Testimonial Slider
    testimonialSlider: function testimonialSlider() {
      var tslider = $('.testimonial-slider');
      tslider.slick({
        rtl: isRTL,
        slidesToShow: 3,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: false,
        dots: true,
        responsive: [{
          breakpoint: 992,
          settings: {
            slidesToShow: 2
          }
        }, {
          breakpoint: 576,
          settings: {
            slidesToShow: 1
          }
        }]
      });
    },
    //===== 05. Latest Post Slider
    latestPostlider: function latestPostlider() {
      var tslider = $('.latest-post-slider');
      var arrows = $('.latest-post-arrow');
      tslider.slick({
        rtl: isRTL,
        slidesToShow: 3,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: true,
        dots: false,
        prevArrow: '<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
        nextArrow: '<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
        appendArrows: arrows,
        responsive: [{
          breakpoint: 992,
          settings: {
            slidesToShow: 2
          }
        }, {
          breakpoint: 576,
          settings: {
            slidesToShow: 1
          }
        }]
      });
    },
    //===== 06. Feature Room Slider
    featureRoom: function featureRoom() {
      var fslider = $('.feature-room-slider');
      var arrows = $('.feature-room-arrow');
      fslider.slick({
        rtl: isRTL,
        slidesToShow: 3,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: true,
        dots: false,
        prevArrow: '<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
        nextArrow: '<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
        appendArrows: arrows,
        responsive: [{
          breakpoint: 992,
          settings: {
            slidesToShow: 2
          }
        }, {
          breakpoint: 576,
          settings: {
            slidesToShow: 1
          }
        }]
      });
    },
    //===== 07. CounterUp
    counterToUp: function counterToUp() {
      $('.counter-box').bind('inview', function (event, visible) {
        if (visible) {
          $(this).find('.counter').each(function () {
            var $this = $(this);
            $({
              Counter: 0
            }).animate({
              Counter: $this.text()
            }, {
              duration: 2000,
              easing: 'swing',
              step: function step() {
                $this.text(Math.ceil(this.Counter));
              }
            });
          });
          $(this).unbind('inview');
        }
      });
    },
    //===== 08. Instagram Feed Slider
    instaFeedSlider: function instaFeedSlider() {
      var tslider = $('.instagram-slider');
      tslider.slick({
        rtl: isRTL,
        slidesToShow: 6,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: false,
        dots: false,
        responsive: [{
          breakpoint: 992,
          settings: {
            slidesToShow: 4
          }
        }, {
          breakpoint: 768,
          settings: {
            slidesToShow: 3
          }
        }, {
          breakpoint: 576,
          settings: {
            slidesToShow: 2
          }
        }]
      });

      // Init magnificPopup on Instagram Gallery
      if (jQuery().magnificPopup) {
        $('.instagram-slider').each(function () {
          // the containers for all your galleries
          var additionalImages = $('.image a.insta-popup').not('.slick-slide.slick-cloned a.insta-popup');
          additionalImages.magnificPopup({
            type: 'image',
            gallery: {
              enabled: true
            },
            mainClass: 'mfp-fade'
          });
        });
      }
    },
    //===== 09. Food Menu SLider
    menuSlider: function menuSlider() {
      var mslider = $('.menu-slider');
      var arrows = $('.menu-slider-arrow');
      mslider.slick({
        rtl: isRTL,
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: true,
        dots: false,
        prevArrow: '<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
        nextArrow: '<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
        appendArrows: arrows
      });
    },
    //===== 10. Gallery Sliders & Popup
    gallery: function gallery() {
      var gslider = $('.gallery-slider');
      gslider.slick({
        rtl: isRTL,
        slidesToShow: 3,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: false,
        dots: false,
        responsive: [{
          breakpoint: 768,
          settings: {
            slidesToShow: 2
          }
        }, {
          breakpoint: 500,
          settings: {
            slidesToShow: 1
          }
        }]
      });

      // Init magnificPopup on Menu Gallery
      if (jQuery().magnificPopup) {
        $('.gallery-slider').each(function () {
          // the containers for all your galleries
          var additionalImages = $('.slick-slide a.gallery-popup').not('.slick-slide.slick-cloned a.gallery-popup');
          additionalImages.magnificPopup({
            type: 'image',
            gallery: {
              enabled: true
            },
            mainClass: 'mfp-fade'
          });
        });
      }
    },
    //===== 11. Room Slider Two (on Home Page Three)
    roomSliderTwo: function roomSliderTwo() {
      var sliderTwo = $('.rooms-slider-two');
      sliderTwo.slick({
        rtl: isRTL,
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: false,
        infinite: true,
        autoplay: false,
        autoplaySpeed: 4000,
        arrows: true,
        dots: false,
        centerMode: true,
        centerPadding: '28%',
        prevArrow: '<div class="slick-arrow prev-arrow"><i class="fal fa-arrow-left"></i></div>',
        nextArrow: '<div class="slick-arrow next-arrow"><i class="fal fa-arrow-right"></i></div>',
        responsive: [{
          breakpoint: 1600,
          settings: {
            centerPadding: '20%'
          }
        }, {
          breakpoint: 992,
          settings: {
            centerPadding: '15%'
          }
        }, {
          breakpoint: 768,
          settings: {
            centerPadding: '10%'
          }
        }, {
          breakpoint: 576,
          settings: {
            centerPadding: '5%'
          }
        }]
      });
    },
    //===== Room Details Slider
    roomDetailsSlider: function roomDetailsSlider() {
      var roomDetailsSlider = $('.room-details-slider');
      if (roomDetailsSlider.length) {
        var roomDetailsSliderNav = $('.room-details-slider-nav');
        roomDetailsSlider.slick({
          rtl: isRTL,
          slidesToShow: 1,
          slidesToScroll: 1,
          infinite: true,
          autoplay: false,
          arrows: false,
          dots: false,
          asNavFor: '.room-details-slider-nav'
        });
        roomDetailsSlider.lightGallery({
          selector: 'a',
          thumbnail: true,
          share: false,
          fullScreen: false,
          autoplay: false,
          autoplayControls: false,
          actualSize: false
        });
        roomDetailsSliderNav.slick({
          rtl: isRTL,
          slidesToShow: 6,
          slidesToScroll: 1,
          asNavFor: '.room-details-slider',
          dots: false,
          arrows: false,
          centerMode: false,
          focusOnSelect: true,
          responsive: [{
            breakpoint: 1200,
            settings: {
              slidesToShow: 4
            }
          }, {
            breakpoint: 576,
            settings: {
              slidesToShow: 3
            }
          }]
        });
      }
    },
    //===== 12. Banner Image Slider
    bannerImgSlider: function bannerImgSlider() {
      var sliderOne = $('.hero-slider-one');
      sliderOne.slick({
        rtl: isRTL,
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 4000,
        arrows: false,
        dots: false
      });
    },
    //===== 13. offCanvas Active
    offCanvas: function offCanvas() {
      // Set Click Function For open
      $('#offCanvasBtn').on('click', function (e) {
        e.preventDefault();
        $('.offcanvas-wrapper').addClass('show-offcanvas');
        $('.offcanvas-overly').addClass('show-overly');
      });
      // Set Click Function For Close
      $('.offcanvas-close').on('click', function (e) {
        e.preventDefault();
        $('.offcanvas-overly').removeClass('show-overly');
        $('.offcanvas-wrapper').removeClass('show-offcanvas');
      });
      // Set Click Function on Overly For open on
      $('.offcanvas-overly').on('click', function () {
        $(this).removeClass('show-overly');
        $('.offcanvas-wrapper').removeClass('show-offcanvas');
      });
    },
    //===== 14. init extra plugin
    extraPlugin: function extraPlugin() {
      // init nice selects
      $('select:not(.ignore-nice-select)').niceSelect();

      // init datepicker
      this.initDatePicker();

      // init wow js
      new WOW().init();
    },
    initDatePicker: function initDatePicker() {
      if ($('.date-picker').length > 0) {
        var date = new Date();
        var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        $('.date-picker').each(function () {
          var options = {
            autoclose: true,
            startDate: today
          };
          var language = $(this).data('locale');
          if (language) {
            options.language = language;
          }
          var dateFormat = $(this).data('date-format');
          if (dateFormat) {
            options.format = dateFormat;
          }
          $(this).datepicker(options);
        });
        $(document).on('change', '#arrival-date', function () {
          var date = $(this).datepicker('getDate');
          date.setTime(date.getTime() + 1000 * 60 * 60 * 24);
          $('#departure-date').datepicker('setDate', date).datepicker('option', 'startDate', date);
        });
      }
    },
    //===== 15. Active Gallery And Video Popup
    popUpExtra: function popUpExtra() {
      // Init magnificPopup on Popup Video
      if (jQuery().magnificPopup) {
        $('.popup-video').magnificPopup({
          type: 'iframe'
        });

        // Init magnificPopup on Gallery
        $('.gallery-loop .popup-image').magnificPopup({
          type: 'image',
          gallery: {
            enabled: true
          },
          mainClass: 'mfp-fade'
        });
      }
    },
    //===== 16. Search Form
    searchForm: function searchForm() {
      // Set Click Function For open
      $('#searchBtn').on('click', function (e) {
        e.preventDefault();
        $('.search-form').slideToggle(350);
        $(this).toggleClass('active');
      });
    }
  };

  // Document Ready
  $(document).ready(function () {
    mirandaDoc.init();
  });
  $(document).ready(function () {
    $('.room-book').on('click', function (e) {
      e.preventDefault();
      var confirmbtn = $(this).next('.confirm-btn');
      var itembox = $(this).parent().prev('.item-boxs');
      confirmbtn.toggleClass('d-flex');
      itembox.slideToggle('d-flex');
    });
    $('.remove-item').on('click', function (e) {
      e.preventDefault();
      var hideitem = $(this).closest('.item-boxs');
      var confirmbtn = hideitem.next('.actions').find('.confirm-btn');
      hideitem.hide();
      confirmbtn.toggleClass('d-flex');
    });
  });

  // Window Load
  $(window).on('load', function () {
    //===== 17. Preloader
    $('.preloader').fadeOut('slow', function () {
      $(this).remove();
    });

    //===== 18. Back to top
    $('#backToTop').on('click', function (e) {
      e.preventDefault();
      $('html, body').animate({
        scrollTop: '0'
      }, 1200);
    });
  });

  // Window Scroll
  $(window).on('scroll', function () {
    //===== 19. Sticky header
    var scroll = $(window).scrollTop();
    if (scroll < 150) {
      $('.sticky-header').removeClass('sticky-active');
    } else {
      $('.sticky-header').addClass('sticky-active');
    }

    //===== 20. Scroll Event on back to top
    if (scroll > 300) $('#backToTop').addClass('active');
    if (scroll < 300) $('#backToTop').removeClass('active');
  });
  $(document).ready(function () {
    $('.service-item').on('change', function () {
      var services = [];
      $('.service-item:checked').each(function (i, el) {
        services[i] = $(el).val();
      });
      $('body').css('cursor', 'progress');
      $('.custom-checkbox label').css('cursor', 'progress');
      var $checkoutButton = $(document).find('.payment-checkout-btn');
      $checkoutButton.prop('disabled', true);
      var $selectedPaymentMethod = $(document).find('.payment-checkout-form .list_payment_method input[name="payment_method"]:checked').val();
      $.ajax({
        type: 'GET',
        cache: false,
        url: '/ajax/calculate-amount',
        data: {
          room_id: $('input[name=room_id]').val(),
          start_date: $('input[name=start_date]').val(),
          end_date: $('input[name=end_date]').val(),
          rooms: $('input[name=rooms]').val(),
          services: services
        },
        success: function success(res) {
          if (!res.error) {
            $('.total-amount-text').text(res.data.total_amount);
            $('.amount-text').text(res.data.sub_total);
            $('.tax-text').text(res.data.tax_amount);
            $('.discount-text').text(res.data.discount_amount);
            $('input[name=amount]').val(res.data.amount_raw);
          }
          $('body').css('cursor', 'default');
          $('.custom-checkbox label').css('cursor', 'pointer');
          $('.payment-checkout-form .list_payment_method').load(window.location.href + ' .payment-checkout-form .list_payment_method > *', function () {
            $checkoutButton.prop('disabled', false);
            $(document).find('.payment-checkout-form .list_payment_method input[value="' + $selectedPaymentMethod + '"]').prop('checked', true).trigger('change');
          });
        },
        error: function error() {
          $('body').css('cursor', 'default');
          $('.custom-checkbox label').css('cursor', 'pointer');
        }
      });
    });
  });
  var showError = function showError(message) {
    window.showAlert('alert-danger', message);
  };
  var showSuccess = function showSuccess(message) {
    window.showAlert('alert-success', message);
  };
  var handleError = function handleError(data) {
    if (typeof data.errors !== 'undefined' && data.errors.length) {
      handleValidationError(data.errors);
    } else if (typeof data.responseJSON !== 'undefined') {
      if (typeof data.responseJSON.errors !== 'undefined') {
        if (data.status === 422) {
          handleValidationError(data.responseJSON.errors);
        }
      } else if (typeof data.responseJSON.message !== 'undefined') {
        showError(data.responseJSON.message);
      } else {
        $.each(data.responseJSON, function (index, el) {
          $.each(el, function (key, item) {
            showError(item);
          });
        });
      }
    } else {
      showError(data.statusText);
    }
  };
  var handleValidationError = function handleValidationError(errors) {
    var message = '';
    $.each(errors, function (index, item) {
      if (message !== '') {
        message += '<br />';
      }
      message += item;
    });
    showError(message);
  };
  window.showAlert = function (messageType, message) {
    if (messageType && message !== '') {
      var alertId = Math.floor(Math.random() * 1000);
      var html = "<div class=\"alert ".concat(messageType, " alert-dismissible\" id=\"").concat(alertId, "\">\n                <span class=\"close fa fa-times-circle\" data-dismiss=\"alert\" aria-label=\"close\"></span>\n                <i class=\"fas fa-") + (messageType === 'alert-success' ? 'check-circle' : 'exclamation-circle') + " message-icon\"></i>\n                ".concat(message, "\n            </div>");
      $('#alert-container').append(html).ready(function () {
        window.setTimeout(function () {
          $("#alert-container #".concat(alertId)).remove();
        }, 6000);
      });
    }
  };
  var refreshCoupon = function refreshCoupon() {
    var services = [];
    $('.service-item:checked').each(function (i, el) {
      services[i] = $(el).val();
    });
    var $checkoutButton = $(document).find('.payment-checkout-btn');
    $checkoutButton.prop('disabled', true);
    var $selectedPaymentMethod = $(document).find('.payment-checkout-form .list_payment_method input[name="payment_method"]:checked').val();
    $.ajax({
      url: '/ajax/calculate-amount',
      type: 'GET',
      data: {
        room_id: $('input[name=room_id]').val(),
        start_date: $('input[name=start_date]').val(),
        end_date: $('input[name=end_date]').val(),
        rooms: $('input[name=rooms]').val(),
        services: services
      },
      success: function success(_ref) {
        var _$$val;
        var error = _ref.error,
          message = _ref.message,
          data = _ref.data;
        if (error) {
          showError(message);
          return;
        }
        $('.total-amount-text').text(data.total_amount);
        $('input[name=amount]').val(data.amount_raw);
        $('.amount-text').text(data.sub_total);
        $('.discount-text').text(data.discount_amount);
        $('.tax-text').text(data.tax_amount);
        $('.payment-checkout-form .list_payment_method').load(window.location.href + ' .payment-checkout-form .list_payment_method > *', function () {
          $checkoutButton.prop('disabled', false);
          $(document).find('.payment-checkout-form .list_payment_method input[value="' + $selectedPaymentMethod + '"]').prop('checked', true).trigger('change');
        });
        var refreshUrl = $('.order-detail-box').data('refresh-url');
        $.ajax({
          url: refreshUrl,
          type: 'GET',
          data: {
            coupon_code: (_$$val = $('input[name=coupon_hidden]').val()) !== null && _$$val !== void 0 ? _$$val : $('input[name=coupon_code]').val()
          },
          success: function success(_ref2) {
            var error = _ref2.error,
              message = _ref2.message,
              data = _ref2.data;
            if (error) {
              showError(message);
              return;
            }
            $('.order-detail-box').html(data);
          },
          error: function error(_error) {
            handleError(_error);
          }
        });
      },
      error: function error(_error2) {
        handleError(_error2);
      }
    });
  };
  $(document).on('click', '.toggle-coupon-form', function () {
    return $(document).find('.coupon-form').toggle('fast');
  }).on('click', '.apply-coupon-code', function (e) {
    e.preventDefault();
    var $button = $(e.currentTarget);
    $.ajax({
      url: $button.data('url'),
      type: 'POST',
      data: {
        coupon_code: $('input[name=coupon_code]').val(),
        _token: $button.closest('form').find('input[name="_token"]').val()
      },
      beforeSend: function beforeSend() {
        $button.addClass('button-loading');
      },
      success: function success(_ref3) {
        var error = _ref3.error,
          message = _ref3.message;
        if (error) {
          showError(message);
          return;
        }
        showSuccess(message);
        refreshCoupon();
      },
      error: function error(_error3) {
        handleError(_error3);
      },
      complete: function complete() {
        $button.removeClass('button-loading');
      }
    });
  }).on('click', '.remove-coupon-code', function (e) {
    e.preventDefault();
    var $button = $(e.currentTarget);
    $.ajax({
      url: $button.data('url'),
      type: 'POST',
      data: {
        _token: $button.closest('form').find('input[name="_token"]').val()
      },
      beforeSend: function beforeSend() {
        $button.addClass('button-loading');
      },
      success: function success(_ref4) {
        var message = _ref4.message,
          error = _ref4.error;
        if (error) {
          showError(message);
          return;
        }
        showSuccess(message);
        refreshCoupon();
      },
      error: function error(_error4) {
        handleError(_error4);
      },
      complete: function complete() {
        $button.removeClass('button-loading');
      }
    });
  });
  __webpack_require__(/*! ../../../../../platform/plugins/language/resources/js/language-public */ "./platform/plugins/language/resources/js/language-public.js");
  $('a.down-arrow').on('click', function (event) {
    event.preventDefault();
    var targetID = $(event.currentTarget).attr('href');
    $([document.documentElement, document.body]).animate({
      scrollTop: $(targetID).offset().top
    }, 1000);
  });
  $(document).on('click', '[data-bb-toggle="decrement-room"]', function (e) {
    var currentTarget = $(e.currentTarget);
    var $input = currentTarget.closest('.input-quantity').find('input');
    var inputName = $input.prop('name');
    var min = parseInt($input.prop('min'));
    var value = parseInt($input.val());
    if (value > min) {
      $input.val(value - 1);
      $("[data-bb-toggle=\"filter-".concat(inputName, "-count\"]")).text(value - 1);
    }
  });
  $(document).on('click', '[data-bb-toggle="increment-room"]', function (e) {
    var currentTarget = $(e.currentTarget);
    var $input = currentTarget.closest('.input-quantity').find('input');
    var inputName = $input.prop('name');
    var max = parseInt($input.prop('max'));
    var value = parseInt($input.val());
    if (value < max) {
      $input.val(value + 1);
      $("[data-bb-toggle=\"filter-".concat(inputName, "-count\"]")).text(value + 1);
    }
  }).on('click', '[data-bb-toggle="toggle-guests-and-rooms"]', function (e) {
    var currentTarget = $(e.currentTarget);
    var $target = $(currentTarget.data('target'));
    $target.toggle('fast');
  });
})(jQuery);

/***/ }),

/***/ "./platform/themes/miranda/assets/sass/style.scss":
/*!********************************************************!*\
  !*** ./platform/themes/miranda/assets/sass/style.scss ***!
  \********************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = __webpack_modules__;
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/chunk loaded */
/******/ 	(() => {
/******/ 		var deferred = [];
/******/ 		__webpack_require__.O = (result, chunkIds, fn, priority) => {
/******/ 			if(chunkIds) {
/******/ 				priority = priority || 0;
/******/ 				for(var i = deferred.length; i > 0 && deferred[i - 1][2] > priority; i--) deferred[i] = deferred[i - 1];
/******/ 				deferred[i] = [chunkIds, fn, priority];
/******/ 				return;
/******/ 			}
/******/ 			var notFulfilled = Infinity;
/******/ 			for (var i = 0; i < deferred.length; i++) {
/******/ 				var [chunkIds, fn, priority] = deferred[i];
/******/ 				var fulfilled = true;
/******/ 				for (var j = 0; j < chunkIds.length; j++) {
/******/ 					if ((priority & 1 === 0 || notFulfilled >= priority) && Object.keys(__webpack_require__.O).every((key) => (__webpack_require__.O[key](chunkIds[j])))) {
/******/ 						chunkIds.splice(j--, 1);
/******/ 					} else {
/******/ 						fulfilled = false;
/******/ 						if(priority < notFulfilled) notFulfilled = priority;
/******/ 					}
/******/ 				}
/******/ 				if(fulfilled) {
/******/ 					deferred.splice(i--, 1)
/******/ 					var r = fn();
/******/ 					if (r !== undefined) result = r;
/******/ 				}
/******/ 			}
/******/ 			return result;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/jsonp chunk loading */
/******/ 	(() => {
/******/ 		// no baseURI
/******/ 		
/******/ 		// object to store loaded and loading chunks
/******/ 		// undefined = chunk not loaded, null = chunk preloaded/prefetched
/******/ 		// [resolve, reject, Promise] = chunk loading, 0 = chunk loaded
/******/ 		var installedChunks = {
/******/ 			"/themes/miranda/js/main": 0,
/******/ 			"themes/miranda/css/style": 0
/******/ 		};
/******/ 		
/******/ 		// no chunk on demand loading
/******/ 		
/******/ 		// no prefetching
/******/ 		
/******/ 		// no preloaded
/******/ 		
/******/ 		// no HMR
/******/ 		
/******/ 		// no HMR manifest
/******/ 		
/******/ 		__webpack_require__.O.j = (chunkId) => (installedChunks[chunkId] === 0);
/******/ 		
/******/ 		// install a JSONP callback for chunk loading
/******/ 		var webpackJsonpCallback = (parentChunkLoadingFunction, data) => {
/******/ 			var [chunkIds, moreModules, runtime] = data;
/******/ 			// add "moreModules" to the modules object,
/******/ 			// then flag all "chunkIds" as loaded and fire callback
/******/ 			var moduleId, chunkId, i = 0;
/******/ 			if(chunkIds.some((id) => (installedChunks[id] !== 0))) {
/******/ 				for(moduleId in moreModules) {
/******/ 					if(__webpack_require__.o(moreModules, moduleId)) {
/******/ 						__webpack_require__.m[moduleId] = moreModules[moduleId];
/******/ 					}
/******/ 				}
/******/ 				if(runtime) var result = runtime(__webpack_require__);
/******/ 			}
/******/ 			if(parentChunkLoadingFunction) parentChunkLoadingFunction(data);
/******/ 			for(;i < chunkIds.length; i++) {
/******/ 				chunkId = chunkIds[i];
/******/ 				if(__webpack_require__.o(installedChunks, chunkId) && installedChunks[chunkId]) {
/******/ 					installedChunks[chunkId][0]();
/******/ 				}
/******/ 				installedChunks[chunkId] = 0;
/******/ 			}
/******/ 			return __webpack_require__.O(result);
/******/ 		}
/******/ 		
/******/ 		var chunkLoadingGlobal = self["webpackChunk"] = self["webpackChunk"] || [];
/******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
/******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module depends on other loaded chunks and execution need to be delayed
/******/ 	__webpack_require__.O(undefined, ["themes/miranda/css/style"], () => (__webpack_require__("./platform/themes/miranda/assets/js/main.js")))
/******/ 	var __webpack_exports__ = __webpack_require__.O(undefined, ["themes/miranda/css/style"], () => (__webpack_require__("./platform/themes/miranda/assets/sass/style.scss")))
/******/ 	__webpack_exports__ = __webpack_require__.O(__webpack_exports__);
/******/ 	
/******/ })()
;