<?php
/**
 *
 * @package Tannistha
 */
	/*Tannistha Setup*/
	function tannistha_setup() {
		/* Make theme available for translation. */
		load_theme_textdomain( 'tannistha', get_template_directory() . '/languages' );

		/*Custom Header*/
		$defaults = array(
	    'default-image'          => get_template_directory_uri() . '/images/home-big-banner.jpg',
	    'random-default'         => false,
	    'width'                  => 1583,
	    'height'                 => 470,
	    'flex-height'            => true,
	    'flex-width'             => true,
	    'default-text-color'     => '',
	    'header-text'            => true,
	    'uploads'                => true,
	    'wp-head-callback'       => '',
	    'admin-head-callback'    => '',
	    'admin-preview-callback' => '',
		);
		add_theme_support( 'custom-header', $defaults );

		/*Custom Background*/
		$defaults = array(
			'default-color'          => '#dddddd',
			'default-image'          => '',
			'default-repeat'         => '',
			'default-position-x'     => '',
			'default-attachment'     => '',
			'wp-head-callback'       => '_custom_background_cb',
			'admin-head-callback'    => '',
			'admin-preview-callback' => ''
		);
		add_theme_support( 'custom-background', $defaults );

		// Add default posts and comments RSS feed links to head.
		add_theme_support( 'automatic-feed-links' );

		/*
		 * Let WordPress manage the document title.
		 * By adding theme support, we declare that this theme does not use a
		 * hard-coded <title> tag in the document head, and expect WordPress to
		 * provide it for us.
		 */
		add_theme_support( 'title-tag' );

		/*
		 * Enable support for custom logo.
		 *
		 */
		add_theme_support( 'custom-logo', array(
			'height'        => 60,
			'width'         => 200,
			'flex-height'   => true,
			'flex-height'   => true,
			'header-text' => array( 'site-title', 'site-description' ),
		) );

		/*
		 * Enable support for Post Thumbnails on posts and pages.
		 *
		 */
		add_theme_support( 'post-thumbnails' );
		set_post_thumbnail_size( 1200, 9999 );

		// 350 pixels wide by 239 pixels tall, hard crop mode
		add_image_size( 'tannistha-post-archive-thumb', 350, 239, true );

		// This theme uses wp_nav_menu() in two locations.
		register_nav_menus( array(
			'primary' => __( 'Primary Menu', 'tannistha' ),
			'footer'  => __( 'Footer Menu', 'tannistha' ),
		) );

		/*
		 * Switch default core markup for search form, comment form, and comments
		 * to output valid HTML5.
		 */
		add_theme_support( 'html5', array(
			'gallery',
			'caption',
		) );

		// Indicate widget sidebars can use selective refresh in the Customizer.
		add_theme_support( 'customize-selective-refresh-widgets' );

		global $tannistha_post_sidebar, $tannistha_page_sidebar;

		//Post Sidebar Display Checking
		$tannistha_post_sidebar = '';
		$tannistha_post_layout = esc_html( get_theme_mod( 'tannistha_post_layout' ), 'tannistha' );
		if ( !empty( $tannistha_post_layout )  ) {
			if ( $tannistha_post_layout == 'post_layout_with_left_sidebar' ) {
				$tannistha_post_sidebar = 'left-sidebar';
			}
			elseif ( $tannistha_post_layout == 'post_layout_with_right_sidebar' ) {
				$tannistha_post_sidebar = 'right-sidebar';
			}
			else {
				$tannistha_post_sidebar = 'without-sidebar';
			}
		}
		else {
			$tannistha_post_sidebar = 'right-sidebar';
		}

		//Page Sidebar Display Checking
		$tannistha_page_sidebar = '';
		$tannistha_page_layout = esc_html( get_theme_mod( 'tannistha_page_layout' ), 'tannistha' );
		if ( !empty( $tannistha_page_layout )  ) {
			if ( $tannistha_page_layout == 'page_layout_with_left_sidebar' ) {
				$tannistha_page_sidebar = 'left-sidebar';
			}
			elseif ( $tannistha_page_layout == 'page_layout_with_right_sidebar' ) {
				$tannistha_page_sidebar = 'right-sidebar';
			}
			else {
				$tannistha_page_sidebar = 'without-sidebar';
			}
		}
		else {
			$tannistha_page_sidebar = 'right-sidebar';
		}

	}
	add_action( 'after_setup_theme', 'tannistha_setup' );

	/**
	 * Add a pingback url auto-discovery header for singularly identifiable articles.
	 */
	function tannistha_pingback_header() {
		if ( is_singular() && pings_open() ) {
			printf( '<link rel="pingback" href="%s">' . "\n", get_bloginfo( 'pingback_url' ) );
		}
	}

	/**
	 * @global int $content_width
	 */
	if ( ! isset( $content_width ) ) {
		$content_width = 600;
	}

	/*Tannistha Widgets*/
	function tannistha_widgets_init() {
		register_sidebar( array(
			'name'          => __( 'Sidebar', 'tannistha' ),
			'id'            => 'sidebar-1',
			'description'   => __( 'Add widgets here to appear in your sidebar.', 'tannistha' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h3 class="widget-title">',
			'after_title'   => '</h3>',
		) );

		register_sidebar( array(
			'name'          => __( 'Footer 1', 'tannistha' ),
			'id'            => 'footer-1',
			'description'   => __( 'Appears at the first column of secondary footer.', 'tannistha' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h3 class="widget-title">',
			'after_title'   => '</h3>',
		) );

		register_sidebar( array(
			'name'          => __( 'Footer 2', 'tannistha' ),
			'id'            => 'footer-2',
			'description'   => __( 'Appears at the second column of secondary footer.', 'tannistha' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h3 class="widget-title">',
			'after_title'   => '</h3>',
		) );

		register_sidebar( array(
			'name'          => __( 'Footer 3', 'tannistha' ),
			'id'            => 'footer-3',
			'description'   => __( 'Appears at the second column of secondary footer.', 'tannistha' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h3 class="widget-title">',
			'after_title'   => '</h3>',
		) );

		register_sidebar( array(
			'name'          => __( 'Footer 4', 'tannistha' ),
			'id'            => 'footer-4',
			'description'   => __( 'Appears at the second column of secondary footer.', 'tannistha' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h3 class="widget-title">',
			'after_title'   => '</h3>',
		) );
	}
	add_action( 'widgets_init', 'tannistha_widgets_init' );

	/**
	 * Enqueues scripts and styles.
	 */
	function tannistha_scripts() {
		// Bootstrap CSS.
		wp_enqueue_style( 'tannistha-bootstrap', get_template_directory_uri() . '/css/bootstrap.css', array(), '1.0' );

		// Google Fonts
		wp_enqueue_style( 'tannistha-open-sans', 'https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700,800', false );
		wp_enqueue_style( 'tannistha-raleway', 'https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900', false );

		// Theme stylesheet.
		wp_enqueue_style( 'tannistha-style', get_template_directory_uri() . '/style.css', array(), '1.1' );

		// Font Awesome CSS.
		wp_enqueue_style( 'tannistha-font-awesome', get_template_directory_uri() . '/css/font-awesome.min.css', array(), '1.0' );

		//Default JS Library
		wp_enqueue_script('jquery');

		//Bootstrap JS
		wp_enqueue_script( 'tannistha-bootstrap', get_template_directory_uri() . '/js/bootstrap.js', array(), '1.0', true );

		//Custom JS
		wp_enqueue_script( 'tannistha-custom', get_template_directory_uri() . '/js/tannistha-custom.js', array(), '1.0', true );

		if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
			wp_enqueue_script( 'comment-reply' );
		}

		$tannistha_body_background_color = esc_html( get_theme_mod( 'background_color' ) );
		$tannistha_header_text_color = esc_html( get_theme_mod( 'header_textcolor' ) );
		$tannistha_primary_color = esc_html( get_theme_mod( 'tannistha_primary_color' ) );
		$tannistha_secondary_color = esc_html( get_theme_mod( 'tannistha_secondary_color' ) );
    $tannistha_top_header_bg_color = esc_html( get_theme_mod( 'tannistha_top_header_bg_color' ) ); 
    $tannistha_top_header_text_color = esc_html( get_theme_mod( 'tannistha_top_header_text_color' ) );
		$tannistha_hover_color = esc_html( get_theme_mod( 'tannistha_hover_color' ) );
    $tannistha_banner_grayness = esc_html( get_theme_mod( 'tannistha_banner_grayness' ) );
    $tannistha_blog_banner_grayness = esc_html( get_theme_mod( 'tannistha_blog_banner_grayness' ) );

		if ( empty( $tannistha_body_background_color ) ) {
			$tannistha_body_background_color = '#dddddd';
		}
		else {
	  	$tannistha_body_background_color = '#' . esc_html( get_theme_mod( 'background_color' ) );
	  }

		if ( empty( $tannistha_header_text_color ) ) {
			$tannistha_header_text_color = '#ffffff';
		}
		else {
	  	$tannistha_header_text_color = '#' . esc_html( get_theme_mod( 'header_textcolor' ) );
	  }

	  if ( empty( $tannistha_primary_color ) ) {
			$tannistha_primary_color = '#10498C';
		}
		else {
	  	$tannistha_primary_color = esc_html( get_theme_mod( 'tannistha_primary_color' ) );
	  }

	  if ( empty( $tannistha_secondary_color ) ) {
			$tannistha_secondary_color = '#4b4b4b';
		}
		else {
	  	$tannistha_secondary_color = esc_html( get_theme_mod( 'tannistha_secondary_color' ) );
	  }
    
    if ( empty( $tannistha_top_header_bg_color ) ) {
			$tannistha_top_header_bg_color = '#10498C';
		}
		else {
	  	$tannistha_top_header_bg_color = esc_html( get_theme_mod( 'tannistha_top_header_bg_color' ) );
	  }
    
    if ( empty( $tannistha_top_header_text_color ) ) {
			$tannistha_top_header_text_color = '#ffffff';
		}
		else {
	  	$tannistha_top_header_text_color = esc_html( get_theme_mod( 'tannistha_top_header_text_color' ) );
	  }
    

	  if ( empty( $tannistha_hover_color ) ) {
			$tannistha_hover_color = '#ff5d5d';
		}
		else {
	  	$tannistha_hover_color = esc_html( get_theme_mod( 'tannistha_hover_color' ) );
	  }
    
    if ( empty( $tannistha_banner_grayness ) ) {
			$tannistha_banner_grayness = 0.4;
		}
		else {
	  	$tannistha_banner_grayness = ( esc_html( get_theme_mod( 'tannistha_banner_grayness' ) ) - 1 ) * 0.1;
	  }
    
    if ( empty( $tannistha_blog_banner_grayness ) ) {
			$tannistha_blog_banner_grayness = 0.4;
		}
		else {
	  	$tannistha_blog_banner_grayness = ( esc_html( get_theme_mod( 'tannistha_blog_banner_grayness' ) ) -1 ) * 0.1;
	  }
           
    

    $tannistha_custom_css = "
    				body{
    					background-color: {$tannistha_body_background_color};
    				}
    				.home-banner h1.banner-text, 
    				.home-banner h4.banner-text, 
    				.all-banner h1.banner-text, 
    				.all-banner h4.banner-text{
    					color: {$tannistha_header_text_color};
    				}
            .top-header-band{
              background-color: {$tannistha_top_header_bg_color};
              
            }
            .home-banner::after {
              background: rgba(0, 0, 0, {$tannistha_banner_grayness}) none repeat scroll 0 0;
            }
            .all-banner::after {
              background: rgba(0, 0, 0, {$tannistha_blog_banner_grayness}) none repeat scroll 0 0;
            }            
            .top-header-band span {
              color: {$tannistha_top_header_text_color};
            }
            h2, 
            h3, 
            h5, 
            h6, 
            a, 
            cite,
            .site-header .left-contact,
            .site-header .logo, 
            .site-header .dc-top-nav li a, 
            .site-header .dc-top-nav li.current-menu-item > li a, 
            .site-header .dc-top-nav li.current-menu-ancestor > li a,
            .entry .entry-header .entry-title a, 
            .entry .entry-meta span a, 
            .widget ul li a, 
            .navigation .nav-links .nav-previous a, 
            .navigation .nav-links .nav-next a, 
            .entry-comments .comment-list .comment-author-link a, 
            .widget ul ul li a, 
            a.entry-author-link span, 
            .entry-meta span, 
            .widget h3, 
            .site-footer ul.foot-nav li, 
            .site-footer ul.foot-nav li a, 
            .theme_default_menu ul li a, 
            .entry-comments .comment-list .comment-author-link, 
            .entry-comments .comment-list .comment-meta, 
            h1:not(.banner-text), 
            h4:not(.banner-text){
              color: {$tannistha_primary_color};
            }
            .search-form input[type='submit'], 
            .comment-respond .comment-form input[type='submit'], 
            .entry .entry-content .button, 
            #back-to-top, input[type='submit'], 
            .navigation .nav-links a.page-numbers, 
            .navigation .nav-links span.dots,
            .navigation .nav-links .page-numbers{
            	background-color: {$tannistha_primary_color};
            }
            blockquote{
            	border-color: {$tannistha_primary_color};
            }
            p, 
            dl dd, 
            ol li, 
            ul li, 
            dl dt, 
            label, 
            table th, 
            pre, 
            .site-header .logo span,  
            .sticky, 
            .comment-form p label, 
            .comment-respond form .comment-notes, 
            .comment-respond .comment-reply-title, 
            .wp-caption-text, 
            .entry .entry-content p, 
            .entry-comments .comment-list .comment-content, 
            .gallery-caption, 
            .bypostauthor, 
            .commentlist .bypostauthor, 
            .commentlist li ul.children li.bypostauthor, 
            .widget ul li, 
            .site-footer p, 
            .site-footer p a{
            	color: {$tannistha_secondary_color};
            }
            input[type='reset']{
            	background-color: {$tannistha_secondary_color};
            }
            a:hover,
            .site-header .dc-top-nav li a:hover, 
            .site-header .dc-top-nav li.current-menu-item a:hover, 
            .site-header .dc-top-nav li.current-menu-item li a:hover,  
            .entry .entry-header .entry-title a:hover, 
            .entry .entry-meta span a:hover, 
            .widget ul li a:hover, 
            .navigation .nav-links .nav-previous a:hover, 
            .navigation .nav-links .nav-next a:hover, 
            .entry-comments .comment-list .comment-author-link a:hover, 
            .widget ul ul li a:hover, 
            a.entry-author-link span:hover,
            .site-header .dc-top-nav li.current-menu-item li a:hover,
            .site-header .dc-top-nav li.current-menu-item a:hover, 
            .site-header .dc-top-nav li a:hover, 
            .site-footer ul.foot-nav li:hover, 
            .site-footer ul.foot-nav li a:hover, 
            .site-header .dc-top-nav li.current-menu-item > a,            
            .site-header .dc-top-nav li.current-menu-ancestor > a,
            .site-header .dc-top-nav li.current-menu-ancestor a:hover, 
            .theme_default_menu ul li a:hover, 
						.theme_default_menu li.current_page_item a, 
            a:not(.button):hover{
            	color: {$tannistha_hover_color};
            }
            .navigation li a:hover, 
            .comment-respond .comment-form input[type='submit']:hover, 
            .search-form input[type='submit']:hover, 
            #back-to-top:hover, 
            .entry .entry-content .button:hover, 
            .navigation .nav-links a.page-numbers:hover, 
            .navigation .nav-links span.dots:hover{
            	background-color: {$tannistha_hover_color};
            }
            .navigation li.active a, 
            .navigation li.disabled, 
            .navigation .nav-links .page-numbers.current, 
						.navigation .nav-links .page-numbers:hover, 
						.navigation .nav-links .page-numbers:focus, 
            .entry .entry-content .button:hover{
            	background-color: {$tannistha_hover_color};
            }";
    wp_add_inline_style( 'tannistha-style', $tannistha_custom_css );

	}
	add_action( 'wp_enqueue_scripts', 'tannistha_scripts' );

	/**
	 * Adds custom classes to the array of body classes.
	 * @param array $classes Classes for the body element.
	 * @return array (Maybe) filtered body classes.
	 */
	function tannistha_body_classes( $classes ) {
		// Adds a class of custom-background-image to sites with a custom background image.
		if ( get_background_image() ) {
			$classes[] = 'custom-background-image';
		}

		// Adds a class of group-blog to sites with more than 1 published author.
		if ( is_multi_author() ) {
			$classes[] = 'group-blog';
		}

		// Adds a class of no-sidebar to sites without active sidebar.
		if ( ! is_active_sidebar( 'sidebar-1' ) ) {
			$classes[] = 'no-sidebar';
		}

		// Adds a class of hfeed to non-singular pages.
		if ( ! is_singular() ) {
			$classes[] = 'hfeed';
		}

		// Adds a class of entry to singular pages.
		/*if ( is_single() ) {
			$classes[] = 'entry';
		}*/

		return $classes;
	}
	add_filter( 'body_class', 'tannistha_body_classes' );

	//Post Class
	function tannistha_post_classes( $classes ) {
		// Adds a class of custom-background-image to sites with a custom background image.
		if ( get_background_image() ) {
			$classes[] = 'custom-background-image';
		}

		// Adds a class of group-blog to sites with more than 1 published author.
		if ( is_multi_author() ) {
			$classes[] = 'group-blog';
		}

		// Adds a class of no-sidebar to sites without active sidebar.
		if ( ! is_active_sidebar( 'sidebar-1' ) ) {
			$classes[] = 'no-sidebar';
		}

		// Adds a class of hfeed to non-singular pages.
		if ( ! is_singular() ) {
			$classes[] = 'hfeed';
		}

		// Adds a class of hfeed to non-singular pages.
		if ( is_single() || is_front_page() || is_search() || is_archive() || is_page() ) {
			$classes[] = 'entry';
		}

		return $classes;
	}
	add_filter( 'post_class', 'tannistha_post_classes' );

	/**
	 * Converts a HEX value to RGB.
	 *
	 * @param string $color The original color, in 3- or 6-digit hexadecimal form.
	 * @return array Array containing RGB (red, green, and blue) values for the given
	 *               HEX code, empty array otherwise.
	 */
	function tannistha_hex2rgb( $color ) {
		$color = trim( $color, '#' );

		if ( strlen( $color ) === 3 ) {
			$r = hexdec( substr( $color, 0, 1 ).substr( $color, 0, 1 ) );
			$g = hexdec( substr( $color, 1, 1 ).substr( $color, 1, 1 ) );
			$b = hexdec( substr( $color, 2, 1 ).substr( $color, 2, 1 ) );
		} else if ( strlen( $color ) === 6 ) {
			$r = hexdec( substr( $color, 0, 2 ) );
			$g = hexdec( substr( $color, 2, 2 ) );
			$b = hexdec( substr( $color, 4, 2 ) );
		} else {
			return array();
		}

		return array( 'red' => $r, 'green' => $g, 'blue' => $b );
	}

	//Comment field rearrange
	function tannistha_move_comment_field_to_bottom( $fields ) {
		$comment_field = $fields['comment'];
		unset( $fields['comment'] );
		$fields['comment'] = $comment_field;

		return $fields;
	}
	add_filter( 'comment_form_fields', 'tannistha_move_comment_field_to_bottom' );

	//Comment Display Customization
	function tannistha_comment($comment, $args, $depth) {
		$args['avatar_size'] = 96;
    if ( 'div' === $args['style'] ) {
        $tag       = 'div';
        $add_below = 'comment';
    } else {
        $tag       = 'li';
        $add_below = 'div-comment';
    }
    ?>
    <<?php echo $tag ?> <?php comment_class( empty( $args['has_children'] ) ? '' : 'parent' ) ?> id="comment-<?php comment_ID() ?>">
    <?php if ( 'div' != $args['style'] ) : ?>
        <article >
    <p class="comment-author vcard">
				<?php if ( $args['avatar_size'] != 0 ) echo get_avatar( $comment, $args['avatar_size'] ); ?>
    </p>
		<header class="comment-header"> 
		  <span class="comment-author-link">
		  <i class="fa fa-user"></i> <?php _e( 'By:', 'tannistha' ); ?>
		  <?php
		  	$comment_author_url = esc_url( get_comment_author_url( $comment->comment_ID ) );
		  	if ( !empty( $comment_author_url ) ) {
		  ?>
			  <a href="<?php echo esc_url( $comment_author_url ); ?>">
			   	<?php echo get_comment_author( $comment->comment_ID ); ?>
			  </a>
			<?php
				}
				else {
					echo get_comment_author( $comment->comment_ID );
				}
			?>
		  </span>
		  <span class="comment-meta">
				<i class="fa fa-calendar"></i> <?php _e( 'Posted: ', 'tannistha' ); ?>
        <?php
        	$date_format = get_option( 'date_format' );
					$comment_date = get_comment_date( $date_format, get_comment_ID() );
					echo '<span class="posted-on">' . $comment_date . '</span>';
        ?>
		  </span>
		</header>
		<div class="comment-content"> 
			<?php comment_text(); ?>
			<div class="reply">
        <?php esc_url( comment_reply_link( array_merge( $args, array( 'add_below' => $add_below, 'depth' => $depth, 'max_depth' => $args['max_depth'] ) ) ) ); ?>
    	</div>
		</div>
	</article>
    <?php endif; ?>
    <?php
  }

	/**
	 * Registers an editor stylesheet for the Tannistha theme.
	 */
	function tannistha_add_editor_styles() {
	    add_editor_style( 'custom-editor-style.css' );
	}
	add_action( 'admin_init', 'tannistha_add_editor_styles' );

	function tannistha_menu_fallback( $args ) {
		$args = array(
      'depth'       => 1,
      'sort_column' => 'menu_order, post_title',
      'menu_class'  => 'navbar-collapse collapse nav navbar-right theme_default_menu',
      'menu_id'     => 'dc-navbar',
      'include'     => '',
      'exclude'     => '',
      'echo'        => true,
      'show_home'   => true,
      'link_before' => '',
      'link_after'  => ''
    );
    wp_page_menu($args);
	}

	function tannistha_footer_menu_fallback( $args ) {
		$args = array(
      'depth'       => 1,
      'sort_column' => 'menu_order, post_title',
      'menu_class'  => 'menu foot-nav-default',
      'menu_id'     => '',
      'include'     => '',
      'exclude'     => '',
      'echo'        => true,
      'show_home'   => true,
      'link_before' => '',
      'link_after'  => ''
    );
    wp_page_menu($args);
	}

	/**
	 * Custom template tags for this theme.
	 */
	require get_template_directory() . '/include/template-tags.php';

	/**
	 * Customizer additions.
	 */
	require get_template_directory() . '/include/customizer.php';