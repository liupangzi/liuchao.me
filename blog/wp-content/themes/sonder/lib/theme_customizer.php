<?php
/**
 * This file contains the customizer options for the theme.
 */

/**
 * @param $wp_customize WP_Customize_Manager
 */
function sonder_theme_customizer($wp_customize)
{
    // logo section
    $wp_customize->add_section('sonder_logo_section', array(
        'title' => __('Logo', 'sonder'),
        'priority' => 30,
        'description' => __('Upload a logo to replace the default site name and description in the header', 'sonder'),
    ));
    $wp_customize->add_setting('sonder_logo', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control(new WP_Customize_Image_Control($wp_customize, 'sonder_logo', array(
        'label' => __('Logo', 'sonder'),
        'section' => 'sonder_logo_section',
        'settings' => 'sonder_logo',
    )));

    //-- contact details section
    $wp_customize->add_section('sonder_contact_details_section', array(
        'title' => __('Contact Details', 'sonder'),
        'priority' => 40,
    ));
    // phone number
    $wp_customize->add_setting('sonder_phone_number', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'sanitize_text_field',
    ]);
    $wp_customize->add_control('sonder_phone_number', [
        'section' => 'sonder_contact_details_section',
        'label' => __('Phone Number', 'sonder'),
        'priority' => 1,
        'input_attrs' => [
            'placeholder' => __('+94 123 1234', 'sonder'),
        ],
    ]);
    // email
    $wp_customize->add_setting('sonder_email', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'sonder_check_email',
    ]);
    $wp_customize->add_control('sonder_email', [
        'section' => 'sonder_contact_details_section',
        'priority' => 2,
        'label' => __('Email', 'sonder'),
        'input_attrs' => [
            'placeholder' => 'my_address@site.com'
        ],
    ]);
    // github link
    $wp_customize->add_setting('sonder_github_link', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control('sonder_github_link', [
        'section' => 'sonder_contact_details_section',
        'priority' => 3,
        'label' => __('GitHub Link', 'sonder'),
        'input_attrs' => [
            'placeholder' => 'https://github.com/username'
        ],
    ]);
    // facebook link
    $wp_customize->add_setting('sonder_facebook_link', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control('sonder_facebook_link', [
        'section' => 'sonder_contact_details_section',
        'priority' => 3,
        'label' => __('Facebook Link', 'sonder'),
        'input_attrs' => [
            'placeholder' => 'https://www.facebook.com/creotex'
        ],
    ]);
    // twitter link
    $wp_customize->add_setting('sonder_twitter_link', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control('sonder_twitter_link', [
        'section' => 'sonder_contact_details_section',
        'priority' => 4,
        'label' => __('Twitter Link', 'sonder'),
        'input_attrs' => [
            'placeholder' => 'https://www.twitter.com/creotex'
        ],
    ]);
    // google_plus link
    $wp_customize->add_setting('sonder_google_plus_link', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control('sonder_google_plus_link', [
        'section' => 'sonder_contact_details_section',
        'priority' => 5,
        'label' => __('Google+ Link', 'sonder'),
        'input_attrs' => [
            'placeholder' => 'https://www.google.com/+Creotex'
        ],
    ]);
// linkedin link
    $wp_customize->add_setting('sonder_linkedin_link', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control('sonder_linkedin_link', [
        'section' => 'sonder_contact_details_section',
        'priority' => 3,
        'label' => __('linkedin Link', 'sonder'),
        'input_attrs' => [
            'placeholder' => __('Your linkedin profile', 'sonder'),
        ],
    ]);
    // Skype link
    $wp_customize->add_setting('sonder_skype_link', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control('sonder_skype_link', [
        'section' => 'sonder_contact_details_section',
        'priority' => 3,
        'label' => __('Skype Username', 'sonder'),
        'input_attrs' => [
            'placeholder' => __('Your Skype username', 'sonder')
        ],
    ]);
    // youtube link
    $wp_customize->add_setting('sonder_youtube_link', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'esc_url_raw',
    ]);
    $wp_customize->add_control('sonder_youtube_link', [
        'section' => 'sonder_contact_details_section',
        'priority' => 3,
        'label' => __('youtube Link', 'sonder'),
        'input_attrs' => [
            'placeholder' => 'https://www.youtube.com/user/creotex'
        ],
    ]);


    //-- copyright section section
    $wp_customize->add_section('sonder_copyright_section', array(
        'title' => __('Copyright Text', 'sonder'),
        'priority' => 50,
        'description' => __('Copyright text displayed bottom of page.', 'sonder')
    ));
    $wp_customize->add_setting('sonder_copyright_text', [
        'default' => '',
        'transport' => 'refresh',
        'sanitize_callback' => 'sanitize_text_field',
    ]);
    $wp_customize->add_control('sonder_copyright_text', [
        'section' => 'sonder_copyright_section',
        'priority' => 1,
        'input_attrs' => [
            'placeholder' => __('Copyright 2016', 'sonder')
        ],
    ]);
}

add_action('customize_register', 'sonder_theme_customizer');