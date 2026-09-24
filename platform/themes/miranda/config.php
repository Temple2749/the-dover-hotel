<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Shortcode\View\View;
use Botble\Theme\Theme;
use Illuminate\Support\Facades\App;

return [

    /*
    |--------------------------------------------------------------------------
    | Inherit from another theme
    |--------------------------------------------------------------------------
    |
    | Set up inherit from another if the file is not exists,
    | this is work with "layouts", "partials" and "views"
    |
    | [Notice] assets cannot inherit.
    |
    */

    'inherit' => null, //default

    /*
    |--------------------------------------------------------------------------
    | Listener from events
    |--------------------------------------------------------------------------
    |
    | You can hook a theme when event fired on activities
    | this is cool feature to set up a title, meta, default styles and scripts.
    |
    | [Notice] these event can be overridden by package config.
    |
    */

    'events' => [

        // Listen on event before render a theme,
        // this event should call to assign some assets,
        // breadcrumb template.
        'beforeRenderTheme' => function (Theme $theme) {
            $version = get_cms_version();

            // You may use this event to set up your assets.
            $theme->asset()->usePath()->add('animate-css', 'css/animate.min.css');
            if (BaseHelper::isRtlEnabled()) {
                $theme->asset()->usePath()->add('bootstrap-css', 'css/bootstrap.rtl.min.css');
            } else {
                $theme->asset()->usePath()->add('bootstrap-css', 'css/bootstrap.min.css');
            }

            $theme->asset()->usePath()->add('font-awesome-css', 'css/font-awesome.min.css');
            $theme->asset()->usePath()->add('flaticon', 'css/flaticon.css');
            $theme->asset()->usePath()->add('slick-css', 'css/slick.css');
            $theme->asset()->usePath()->add('nice-select-css', 'css/nice-select.css');
            $theme->asset()->usePath()->add('bootstrap-datepicker-css', 'css/bootstrap-datepicker.css');
            $theme->asset()->usePath()->add('style', 'css/style.css', [], [], $version);

            $theme->asset()->container('footer')->usePath()->add('modernizr', 'js/modernizr-3.6.0.min.js');
            $theme->asset()->container('header')->usePath()->add('jquery', 'js/jquery-1.12.4.min.js');
            $theme->asset()->container('footer')->usePath()->add('popper-js', 'js/popper.min.js');
            $theme->asset()->container('footer')->usePath()->add('bootstrap-js', 'js/bootstrap.min.js');
            $theme->asset()->container('footer')->usePath()->add('slick-js', 'js/slick.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery.nice-select', 'js/jquery.nice-select.min.js');
            $theme->asset()->container('footer')->usePath()->add('bootstrap-datepicker-js', 'js/bootstrap-datepicker.js');

            if (App::getLocale() !== 'en') {
                $theme->asset()
                    ->container('footer')
                    ->usePath(false)
                    ->add('bootstrap-datepicker-locale', sprintf('//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.%s.min.js', App::getLocale()), ['bootstrap-datepicker-js']);
            }

            $theme->asset()->container('footer')->usePath()->add('wow', 'js/wow.min.js');
            $theme->asset()->container('footer')->usePath()->add('main', 'js/main.js', ['bootstrap-datepicker-locale'], [], '1.39.11');

            if (function_exists('shortcode')) {
                $theme->composer(['page', 'post', 'hotel.room'], function (View $view) {
                    $view->withShortcodes();
                });
            }

            app()->booted(function () use ($theme) {
                $theme->asset()->remove('language-css');
                $theme->asset()->remove('language-public-js');
            });
        },
    ],
];
