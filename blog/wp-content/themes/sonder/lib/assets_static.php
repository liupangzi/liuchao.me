<?php

namespace Roots\Sage\Assets;

/**
 * Scripts and stylesheets
 *
 * Enqueue stylesheets in the following order:
 * 1. /theme/dist/styles/main.css
 *
 * Enqueue scripts in the following order:
 * 1. /theme/dist/scripts/modernizr.js
 * 2. /theme/dist/scripts/main.js
 */

function assets()
{

    if (is_single() && comments_open() && get_option('thread_comments')) {
        wp_enqueue_script('comment-reply');
    }

    // Theme stylesheet.
    wp_enqueue_style('sonder-style-main', get_template_directory_uri() . '/dist/styles/main.css');
    wp_enqueue_style('sonder-font-awesome', get_template_directory_uri() . '/dist/styles/font-awesome.css');
    wp_enqueue_style('sonder-style', get_stylesheet_uri());


    // Theme JS files
    wp_enqueue_script('sonder-modernizr', get_template_directory_uri() . '/dist/scripts/modernizr.js');
    wp_enqueue_script('sonder-main', get_template_directory_uri() . '/dist/scripts/main.js', ['jquery'], '1.2', true);
}

function fonts()
{
    wp_enqueue_style('sonder-google-fonts-lato', 'https://fonts.googleapis.com/css?family=Lato');
    wp_enqueue_style('sonder-google-fonts-open-sans', 'https://fonts.googleapis.com/css?family=Open+Sans');
}

add_action('wp_enqueue_scripts', __NAMESPACE__ . '\\assets', 100);
add_action('wp_enqueue_scripts', __NAMESPACE__ . '\\fonts', 101);
