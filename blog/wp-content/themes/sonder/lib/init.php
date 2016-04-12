<?php

namespace Roots\Sage\Init;

use Roots\Sage\Assets;

/**
 * Theme setup
 */
function setup()
{
    // Make theme available for translation
    load_theme_textdomain('sonder', get_template_directory() . '/lang');

    // Enable plugins to manage the document title
    // http://codex.wordpress.org/Function_Reference/add_theme_support#Title_Tag
    add_theme_support('title-tag');

    // Register wp_nav_menu() menus
    // http://codex.wordpress.org/Function_Reference/register_nav_menus
    register_nav_menus([
        'primary_navigation' => __('Primary Navigation', 'sonder')
    ]);

    // Add post thumbnails
    // http://codex.wordpress.org/Post_Thumbnails
    // http://codex.wordpress.org/Function_Reference/set_post_thumbnail_size
    // http://codex.wordpress.org/Function_Reference/add_image_size
    add_theme_support('post-thumbnails');

    // Add HTML5 markup for captions
    // http://codex.wordpress.org/Function_Reference/add_theme_support#HTML5
    add_theme_support('html5', ['caption', 'comment-form', 'comment-list', 'gallery']);

    add_theme_support(
        'custom-background', [
            'default-repeat' => 'no-repeat',
            'default-position-x' => 'center',
            'default-attachment' => 'fixed',
        ]
    );

    // Tell the TinyMCE editor to use a custom stylesheet
    add_editor_style(get_template_directory_uri() . '/dist/styles/editor-style.css');
}

add_action('after_setup_theme', __NAMESPACE__ . '\\setup');

/**
 * Register sidebars
 */
function widgets_init()
{
    register_sidebar([
        'name' => __('Main Right', 'sonder'),
        'id' => 'main-right',
        'before_widget' => '<div id="%1$s" class="widget %2$s">',
        'after_widget' => '</div>',
    ]);

    register_sidebar([
        'name' => __('Footer Left', 'sonder'),
        'id' => 'footer-left',
        'before_widget' => '<div id="%1$s" class="widget %2$s">',
        'after_widget' => '</div>',
    ]);

    register_sidebar([
        'name' => __('Footer Right', 'sonder'),
        'id' => 'footer-right',
        'before_widget' => '<div id="%1$s" class="widget %2$s">',
        'after_widget' => '</div>',
    ]);
}

add_action('widgets_init', __NAMESPACE__ . '\\widgets_init');
