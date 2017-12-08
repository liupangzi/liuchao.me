<?php
	/**
 * Registers a new setting for 'Primary Color' in the WordPress Theme Customizer
 * that will allow users to change the color of their anchors across the
 * entire site
 *
 * @param      object    $wp_customize    The WordPress Theme Customizer
 * @package    tannistha
 */

function tannistha_register_theme_customizer( $wp_customize ) {

	/**
   	 * Adds the setting with the unique id of 'tannistha_primary_color'. 
   	 *
   	 * Also defines the transport method to 'postMessage' so that 
   	 * we can use JavaScript to dynamically change the color without 
   	 * using the default method of 'refresh.'
   	 */

	//radio button sanitization function
  function tannistha_sanitize_radio( $input, $setting ) {
    //input must be a slug: lowercase alphanumeric characters, dashes and underscores are allowed only
    $input = sanitize_key($input);
    //get the list of possible radio box options
    $choices = $setting->manager->get_control( $setting->id )->choices;
    //return input if valid or return default option
    return ( array_key_exists( $input, $choices ) ? $input : $setting->default );
  }

  //checkbox sanitization function
  function tannistha_sanitize_checkbox( $input ) {
    //returns true if checkbox is checked
    return ( isset( $input ) ? true : false );
  }

  //select sanitization function
  function tannistha_sanitize_select( $input, $setting ) {
    //input must be a slug: lowercase alphanumeric characters, dashes and underscores are allowed only
    $input = sanitize_key($input);
    //get the list of possible select options
    $choices = $setting->manager->get_control( $setting->id )->choices;
    //return input if valid or return default option
    return ( array_key_exists( $input, $choices ) ? $input : $setting->default );
  }
  
  //url sanitization function
  function tannistha_sanitize_url( $url ) {
    return esc_url_raw( $url );
  }
  
  function tannistha_sanitize_number_range( $number, $setting ) {

    // Ensure input is an absolute integer.
    $number = absint( $number );

    // Get the input attributes associated with the setting.
    $atts = $setting->manager->get_control( $setting->id )->input_attrs;

    // Get minimum number in the range.
    $min = ( isset( $atts['min'] ) ? $atts['min'] : $number );

    // Get maximum number in the range.
    $max = ( isset( $atts['max'] ) ? $atts['max'] : $number );

    // Get step.
    $step = ( isset( $atts['step'] ) ? $atts['step'] : 1 );

    // If the number is within the valid range, return it; otherwise, return the default
    return ( $min <= $number && $number <= $max && is_int( $number / $step ) ? $number : $setting->default );
  }

	$wp_customize->add_setting(
		'tannistha_primary_color',
		array(
			'default'     => '#10498C',
			'sanitize_callback' => 'sanitize_hex_color',
			'transport'   => 'postMessage'
		)
  	);
	/**
   	 * Introduces a new color control to the Theme Customizer in the
	 * 'Colors' section. This is the actual control that will allow
	 * a user to pick a color.
	 */
	$wp_customize->add_control(
		new WP_Customize_Color_Control(
			$wp_customize,
			'primary_color',
			array(
			    'label'      => __( 'Primary Color', 'tannistha' ),
			    'section'    => 'colors',
			    'settings'   => 'tannistha_primary_color'
			)
		)
	);

	/**
   	 * Adds the setting with the unique id of 'tannistha_secondary_color'. 
   	 *
   	 * Also defines the transport method to 'postMessage' so that 
   	 * we can use JavaScript to dynamically change the color without 
   	 * using the default method of 'refresh.'
   	 */
	$wp_customize->add_setting(
		'tannistha_secondary_color',
		array(
			'default'     => '#4b4b4b',
			'sanitize_callback' => 'sanitize_hex_color',
			'transport'   => 'postMessage'
		)
  );
	/**
   	 * Introduces a new color control to the Theme Customizer in the
	 * 'Colors' section. This is the actual control that will allow
	 * a user to pick a color.
	 */
	$wp_customize->add_control(
		new WP_Customize_Color_Control(
			$wp_customize,
			'secondary_color',
			array(
			    'label'      => __( 'Secondary Color', 'tannistha' ),
			    'section'    => 'colors',
			    'settings'   => 'tannistha_secondary_color'
			)
		)
	);
  
  
  /**
   	 * Adds the setting with the unique id of 'tannistha_top_header_bg_color'. 
   	 *
   	 * Also defines the transport method to 'postMessage' so that 
   	 * we can use JavaScript to dynamically change the color without 
   	 * using the default method of 'refresh.'
   	 */
	$wp_customize->add_setting(
		'tannistha_top_header_bg_color',
		array(
			'default'     => '#10498C',
			'sanitize_callback' => 'sanitize_hex_color',
			
		)
  );
	/**
   	 * Introduces a new color control to the Theme Customizer in the
	 * 'Colors' section. This is the actual control that will allow
	 * a user to pick a color.
	 */
	$wp_customize->add_control(
		new WP_Customize_Color_Control(
			$wp_customize,
			'top_header_bg_color',
			array(
			    'label'      => __( 'Top Header Background Color', 'tannistha' ),
			    'section'    => 'colors',
			    'settings'   => 'tannistha_top_header_bg_color'
			)
		)
	);
  
  
  /**
   	 * Adds the setting with the unique id of 'tannistha_top_header_text_color'. 
   	 *
   	 * Also defines the transport method to 'postMessage' so that 
   	 * we can use JavaScript to dynamically change the color without 
   	 * using the default method of 'refresh.'
   	 */
	$wp_customize->add_setting(
		'tannistha_top_header_text_color',
		array(
			'default'     => '#ffffff',
			'sanitize_callback' => 'sanitize_hex_color',
			
		)
  );
	/**
   	 * Introduces a new color control to the Theme Customizer in the
	 * 'Colors' section. This is the actual control that will allow
	 * a user to pick a color.
	 */
	$wp_customize->add_control(
		new WP_Customize_Color_Control(
			$wp_customize,
			'top_header_text_color',
			array(
			    'label'      => __( 'Top Header Text Color', 'tannistha' ),
			    'section'    => 'colors',
			    'settings'   => 'tannistha_top_header_text_color'
			)
		)
	);

	/**
	 * Hover Color
	 */
	$wp_customize->add_setting(
		'tannistha_hover_color',
		array(
			'default'     => '#ff5d5d',
			'sanitize_callback' => 'sanitize_hex_color',
			'transport'   => 'postMessage'
		)
  );
	/**
   	 * Introduces a new color control to the Theme Customizer in the
	 * 'Colors' section. This is the actual control that will allow
	 * a user to pick a color.
	 */
	$wp_customize->add_control(
		new WP_Customize_Color_Control(
			$wp_customize,
			'hover_color',
			array(
			    'label'      => __( 'Hover Color', 'tannistha' ),
			    'section'    => 'colors',
			    'settings'   => 'tannistha_hover_color'
			)
		)
	);
  /*Top Header Band Text Customizer Code*/
  
  $wp_customize->add_section( 
		'top_header', 
		array(
			'capability'    => 'edit_theme_options',
			'title'			=> __('Top Header Contact Section', 'tannistha'),
		) 
	);
	/* Top Header Show or Hide */		
	$wp_customize->add_setting( 
		'hide_show_top_header' , 
			array(
			'default' => __( 'off', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_select'
		) 
	);
  
  $wp_customize->add_control(
    new WP_Customize_Control(
			$wp_customize,
      'hide_show_top_header' , 
      array(
        'label'          => __( 'Hide / Show Top Header Contact Section', 'tannistha' ),
        'section'        => 'top_header',
        'settings'       => 'hide_show_top_header',
        'type'           => 'radio',
        'choices'        => 
          array(
            'on' => __( 'Show', 'tannistha' ),
            'off'=> __( 'Hide', 'tannistha' )
          )  
      )
    )
	);
  
  /* Top Header Phone Number */
  $wp_customize->add_setting( 
		'top_header_phone' , 
			array(
			'default' => __( '', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'sanitize_text_field'
		) 
	);
  
  $wp_customize->add_control('top_header_phone', array(
	 'label'   => __( 'Header Phone No. Field', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'section' => 'top_header',
	 'type'    => 'text',
	));
  
  /* Top Header Address Field */
  $wp_customize->add_setting( 
		'top_header_address' , 
			array(
			'default' => __( '', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'sanitize_text_field'
		) 
	);
  
  $wp_customize->add_control('top_header_address', array(
	 'label'   => __( 'Header Address Field', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'section' => 'top_header',
	 'type'    => 'text',
	));
  
  /* Top Header Facebook */
  $wp_customize->add_setting ( 
		'top_header_fb_link' , 
			array(
			'default' => __( '', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_url'
		) 
	);
  
  $wp_customize->add_control('top_header_fb_link', array(
	 'label'   => __( 'Header Facebook Link', 'tannistha' ),
	 'sanitize_callback' => 'tannistha_sanitize_url',
	 'section' => 'top_header',
	 'type'    => 'text',
	));
  
  /* Top Header Twitter */
  $wp_customize->add_setting ( 
		'top_header_tw_link' , 
			array(
			'default' => __( '', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_url'
		) 
	);
  
  $wp_customize->add_control('top_header_tw_link', array(
	 'label'   => __( 'Header Twitter Link', 'tannistha' ),
	 'sanitize_callback' => 'tannistha_sanitize_url',
	 'section' => 'top_header',
	 'type'    => 'text',
	));
  
  /* Top Header G PLus */
  $wp_customize->add_setting ( 
		'top_header_gp_link' , 
			array(
			'default' => __( '', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_url'
		) 
	);
  
  $wp_customize->add_control('top_header_gp_link', array(
	 'label'   => __( 'Header Google Plus Link', 'tannistha' ),
	 'sanitize_callback' => 'tannistha_sanitize_url',
	 'section' => 'top_header',
	 'type'    => 'text',
	));
  
  /* Top Header Linkedin */
  $wp_customize->add_setting ( 
		'top_header_in_link' , 
			array(
			'default' => __( '', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_url'
		) 
	);
  
  $wp_customize->add_control('top_header_in_link', array(
	 'label'   => __( 'Header Linkedin Link', 'tannistha' ),
	 'sanitize_callback' => 'tannistha_sanitize_url',
	 'section' => 'top_header',
	 'type'    => 'text',
	));
  
  /* Top Header Instagram */
  $wp_customize->add_setting ( 
		'top_header_ing_link' , 
			array(
			'default' => __( '', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_url'
		) 
	);
  
  $wp_customize->add_control('top_header_ing_link', array(
	 'label'   => __( 'Header Instagram Link', 'tannistha' ),
	 'sanitize_callback' => 'tannistha_sanitize_url',
	 'section' => 'top_header',
	 'type'    => 'text',
	));
  
	/*Header Text Customizer Code*/
	//adding section in wordpress customizer   
	$wp_customize->add_section('tannistha_header_settings_section', array(
	  'title'          => __( 'Header Section( Pages )', 'tannistha' )
	));
  
  /* Top Header Banner Hide/Shoe Home Page */		
	$wp_customize->add_setting( 
		'hide_show_home_banner' , 
			array(
			'default' => __( 'on', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_select'
		) 
	);
  
  $wp_customize->add_control(
    new WP_Customize_Control(
			$wp_customize,
      'hide_show_home_banner' , 
      array(
        'label'          => __( 'Show / Hide Home Page Banner', 'tannistha' ),
        'section'        => 'tannistha_header_settings_section',
        'settings'       => 'hide_show_home_banner',
        'type'           => 'radio',
        'choices'        => 
          array(
            'on' => __( 'Show', 'tannistha' ),
            'off'=> __( 'Hide', 'tannistha' )
          )  
      )
    )
	);
  
  /* Top Header Banner Hide/Shoe Other Page */		
	$wp_customize->add_setting( 
		'hide_show_other_pages_banner' , 
			array(
			'default' => __( 'on', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_select'
		) 
	);
  
  $wp_customize->add_control(
    new WP_Customize_Control(
			$wp_customize,
      'hide_show_other_pages_banner' , 
      array(
        'label'          => __( 'Show / Hide Other Page Banner', 'tannistha' ),
        'section'        => 'tannistha_header_settings_section',
        'settings'       => 'hide_show_other_pages_banner',
        'type'           => 'radio',
        'choices'        => 
          array(
            'on' => __( 'Show', 'tannistha' ),
            'off'=> __( 'Hide', 'tannistha' )
          )  
      )
    )
	);
  
	//banner heading text
	$wp_customize->add_setting('tannistha_banner_heading', array(
	 'default'        => __( 'Enter banner heading text here', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'transport'         => 'postMessage',
	));
	//banner description text
	$wp_customize->add_setting('tannistha_banner_description', array(
	 'default'        => __( 'Enter banner description text here', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'transport'         => 'postMessage',
	));
	$wp_customize->add_control('tannistha_banner_heading', array(
	 'label'   => __( 'Banner Heading Text', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'section' => 'tannistha_header_settings_section',
	 'type'    => 'text',
	));
	$wp_customize->add_control('tannistha_banner_description', array(
	 'label'   => __( 'Banner Description Text', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_textarea_field',
	 'section' => 'tannistha_header_settings_section',
	 'type'    => 'textarea',
	));
  
  $wp_customize->add_setting( 'tannistha_banner_grayness', array(
    
    'capability' => 'edit_theme_options',
    
    'sanitize_callback' => 'tannistha_sanitize_number_range',
  ) );

  $wp_customize->add_control( 'tannistha_banner_grayness', array(
      'type' => 'range',
      'priority' => 10,
      'section' => 'tannistha_header_settings_section',
      'label' => __( 'Choose Grayness( Overlay ) of Header Image', 'tannistha' ),
      'description' => 'Lowest 0 for least grayness and 1 for highest',
      'input_attrs' => array(
          'min' => 1,
          'max' => 11,
          'step' => 1,
          'style' => 'color: #0a0',
      ),
  ) );

/*Footer Customizer Code*/
	//adding section in wordpress customizer   
	$wp_customize->add_section('tannistha_footer_settings_section', array(
	  'title'          => __( 'Footer Section', 'tannistha' )
	));
	//adding setting for footer copyright text area
	$wp_customize->add_setting('tannistha_copyright_text', array(
	 'default'        => __( 'Enter copyright text here', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_textarea_field',
	 'transport'         => 'postMessage',
	));
	$wp_customize->add_control('tannistha_copyright_text', array(
	 'label'   => __( 'Footer Copyright Text', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_textarea_field',
	 'section' => 'tannistha_footer_settings_section',
	 'type'    => 'textarea',
	));

/*Blog Customizer Code*/
	//adding section in wordpress customizer   
	$wp_customize->add_section('tannistha_blog_settings_section', array(
	  'title'          => __( 'Single Blog Section', 'tannistha' )
	));
  
  /* Top Header Banner Hide/Show Other Page */		
	$wp_customize->add_setting( 
		'hide_show_blog_banner' , 
			array(
			'default' => __( 'on', 'tannistha' ),
			'capability'     => 'edit_theme_options',
			'sanitize_callback' => 'tannistha_sanitize_select'
		) 
	);
  
  $wp_customize->add_control(
    new WP_Customize_Control(
			$wp_customize,
      'hide_show_blog_banner' , 
      array(
        'label'          => __( 'Show / Hide Other Page Banner', 'tannistha' ),
        'section'        => 'tannistha_blog_settings_section',
        'settings'       => 'hide_show_blog_banner',
        'type'           => 'radio',
        'choices'        => 
          array(
            'on' => __( 'Show', 'tannistha' ),
            'off'=> __( 'Hide', 'tannistha' )
          )  
      )
    )
	);
  
	//adding setting for blog banner heading
	$wp_customize->add_setting('tannistha_blog_banner_heading', array(
	 'default'        => __( 'Enter Blog Banner Heading Here', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'transport'         => 'postMessage',
	));
	//adding setting for blog banner description
	$wp_customize->add_setting('tannistha_blog_banner_description', array(
	 'default'        => __( 'Enter Blog Banner Description Here', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'transport'         => 'postMessage',
	));
	$wp_customize->add_control('tannistha_blog_banner_heading', array(
	 'label'   => __( 'Single Blog Banner Heading', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_text_field',
	 'section' => 'tannistha_blog_settings_section',
	 'type'    => 'text',
	));
	$wp_customize->add_control('tannistha_blog_banner_description', array(
	 'label'   => __( 'Single Blog Banner Description', 'tannistha' ),
	 'sanitize_callback' => 'sanitize_textarea_field',
	 'section' => 'tannistha_blog_settings_section',
	 'type'    => 'textarea',
	));
	//adding setting for blog banner
	$wp_customize->add_setting('tannistha_blog_banner', array(
	 'sanitize_callback' => 'esc_url_raw',
	 'transport'         => 'postMessage',
	 'default'    => get_template_directory_uri() . '/images/blog-banner.jpg',
	));
	$wp_customize->add_control(new WP_Customize_Image_Control($wp_customize,'tannistha_blog_banner',array(
	 'label'      => __( 'Single Blog Banner ( 1583px X 270px )', 'tannistha' ),
	 'sanitize_callback' => 'esc_url_raw',
	 'section'    => 'tannistha_blog_settings_section',
	 'settings'   => 'tannistha_blog_banner',
	)));
  
  $wp_customize->add_setting( 'tannistha_blog_banner_grayness', array(
    
    'capability' => 'edit_theme_options',
    
    'sanitize_callback' => 'tannistha_sanitize_number_range',
  ) );

  $wp_customize->add_control( 'tannistha_blog_banner_grayness', array(
      'type' => 'range',
      'priority' => 10,
      'section' => 'tannistha_blog_settings_section',
      'label' => __( 'Choose Grayness( Overlay ) of Single Blog Header Image', 'tannistha' ),
      'description' => 'Lowest 0 for least grayness and 1 for highest',
      'input_attrs' => array(
          'min' => 1,
          'max' => 11,
          'step' => 1,
          'style' => 'color: #0a0',
      ),
  ) );

/*Page Layout Customizer Code*/
	//adding section in wordpress customizer   
	$wp_customize->add_section('tannistha_layout_section', array(
	  'title'          => __( 'Layout Section', 'tannistha' )
	));
	$wp_customize->add_setting( 'tannistha_post_layout', array(
		'title'          => __( 'post_layout_with_right_sidebar', 'tannistha' ),
		'sanitize_callback' => 'tannistha_sanitize_radio',
		'default'   => __( 'post_layout_with_right_sidebar', 'tannistha' ),
	  'transport'         => 'postMessage',
  ) );
  $wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'tannistha_post_layout', array(
      'label'     => __( 'Post Layout', 'tannistha' ),
      'sanitize_callback' => 'tannistha_sanitize_radio',
      'section'   => 'tannistha_layout_section',
      'settings'  => 'tannistha_post_layout',
      'transport'   => 'refresh',
      'type'      => 'radio',
      'choices'   => array(
						          'post_layout_with_left_sidebar'   => __( 'Post Layout with Left Sidebar', 'tannistha' ),
						          'post_layout_with_right_sidebar'   => __( 'Post Layout with Right Sidebar', 'tannistha' ),
						          'post_layout_without_sidebar'   => __( 'Post Layout without Sidebar', 'tannistha' )
						        ),
  ) ) );
  $wp_customize->add_setting( 'tannistha_page_layout', array(
		'title'          => __( 'page_layout_with_right_sidebar', 'tannistha' ),
		'sanitize_callback' => 'tannistha_sanitize_radio',
		'default'   => __( 'page_layout_with_right_sidebar', 'tannistha' ),
	  'transport'         => 'postMessage',
  ) );
  $wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'tannistha_page_layout', array(
      'label'     => __( 'Page Layout', 'tannistha' ),
      'sanitize_callback' => 'tannistha_sanitize_radio',
      'section'   => 'tannistha_layout_section',
      'settings'  => 'tannistha_page_layout',
      'transport'   => 'refresh',
      'type'      => 'radio',
      'choices'   => array(
          'page_layout_with_left_sidebar'   => __( 'Page Layout with Left Sidebar', 'tannistha' ),
          'page_layout_with_right_sidebar'   => __( 'Page Layout with Right Sidebar', 'tannistha' ),
          'page_layout_without_sidebar'   => __( 'Page Layout without Sidebar', 'tannistha' )
          ),
  ) ) );

} // end tannistha_register_theme_customizer
add_action( 'customize_register', 'tannistha_register_theme_customizer' );
/**
 * Registers the Theme Customizer Preview JavaScript with WordPress.
 *
 * @package tannistha
 */
function tannistha_customizer_live_preview() {
	wp_enqueue_script(
		'tannistha-customize-preview',
		get_template_directory_uri() . '/js/tannistha-customize-preview.js',
		array( 'jquery', 'customize-preview' ),
		'1.1',
		true
	);
} // end tannistha_customizer_live_preview
add_action( 'customize_preview_init', 'tannistha_customizer_live_preview' );