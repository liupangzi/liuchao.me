<?php global $tannistha_post_sidebar, $tannistha_page_sidebar; ?>
<!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
  <head>
    <meta charset="<?php bloginfo( 'charset' ); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="http://gmpg.org/xfn/11">
	<?php if ( is_singular() && pings_open( get_queried_object() ) ) : ?>
    <link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<?php endif; ?>
	<?php wp_head(); ?>
  </head>
  
  <body <?php body_class(); ?>>
    <header class="site-header">
      <?php $hide_show_top_header = esc_html( get_theme_mod( 'hide_show_top_header' ) ); 
      if ( isset($hide_show_top_header) && 'on' == $hide_show_top_header ) {
      ?>
        <div class="top-header-band">
          <div class="col-sm-7 left-contact">
            <?php $top_header_phone = esc_html( get_theme_mod( 'top_header_phone' ), 'tannistha' ); 
            if ( isset($top_header_phone) && $top_header_phone !=  '' ) {
            ?>
            <div class="phone">
              <span class="fa fa-phone"></span> 
              <span class="phone-no"><?php echo $top_header_phone; ?></span>
            </div>
            <?php } 
            $top_header_address = esc_html( get_theme_mod( 'top_header_address' ), 'tannistha' ); 
            if ( isset($top_header_address) && $top_header_address !=  '' ) {
            ?>
            <div class="address">
              <span class="fa fa-map-marker"></span> 
              <span class="address-txt"><?php echo $top_header_address; ?></span> 
            </div>
            <?php } ?>
          </div>
          <div class="col-sm-5 right-social">
            <?php $top_header_fb_link = esc_html( get_theme_mod( 'top_header_fb_link' ) ); 
            if ( isset($top_header_fb_link) && $top_header_fb_link !=  '' ) {
            ?>
            <a target="_blank" href="<?php echo $top_header_fb_link; ?>"><span class="fa fa fa-facebook"></span></a>
            <?php } 
            $top_header_tw_link = esc_html( get_theme_mod( 'top_header_tw_link' ) ); 
            if ( isset($top_header_tw_link) && $top_header_tw_link !=  '' ) {
            ?>
            <a target="_blank" href="<?php echo $top_header_tw_link; ?>"><span class="fa fa fa-twitter"></span></a>
            <?php } 
            $top_header_gp_link = esc_html( get_theme_mod( 'top_header_gp_link' ) ); 
            if ( isset($top_header_gp_link) && $top_header_gp_link !=  '' ) {
            ?>
            <a target="_blank" href="<?php echo $top_header_gp_link; ?>"><span class="fa fa-google-plus"></span></a>
            <?php } 
            $top_header_in_link = esc_html( get_theme_mod( 'top_header_in_link' ) ); 
            if ( isset($top_header_in_link) && $top_header_in_link !=  '' ) {
            ?>
            <a target="_blank" href="<?php echo $top_header_in_link; ?>"><span class="fa fa fa-linkedin"></span></a>
            <?php } 
            $top_header_ing_link = esc_html( get_theme_mod( 'top_header_ing_link' ) ); 
            if ( isset($top_header_ing_link) && $top_header_ing_link !=  '' ) {
            ?>
            <a target="_blank" href="<?php echo $top_header_ing_link; ?>"><span class="fa fa-instagram"></span> </a>       
            <?php
            }
            ?>
          </div>
        </div>
      <?php } ?>
      <div class="container navbar-header-band"> 
        <div class="navbar-header"> 
          <button type="button" data-toggle="collapse" data-target="#dc-navbar" class="collapsed navbar-toggle" aria-expanded="false" > 
            <span class="sr-only">Toggle navigation</span>  
            <span class="fa fa-align-justify"></span> 
          </button>
	<?php
		$tannistha_header_textcolor = esc_html( get_theme_mod( 'header_textcolor' ), 'tannistha' );
		$custom_logo = get_theme_mod( 'custom_logo' );
		if ( $tannistha_header_textcolor != 'blank' && empty( $custom_logo ) ) {
	?>
          <h1><a href="<?php echo site_url(); ?>"><?php bloginfo( 'name' ); ?></a></h1>
          <p><?php bloginfo('description'); ?></p>
	<?php
		}
		else {
			echo tannistha_the_custom_logo();
		}
	?>
    
        </div> 
		<?php
			wp_nav_menu( array( 
		  	'theme_location' 	  => 'primary',
		  	'container' 		    => 'nav',
		  	'container_class' 	=> 'collapse navbar-collapse',
		  	'container_id'    	=> 'dc-navbar',
		  	'menu_class'      	=> 'nav navbar-nav navbar-right dc-top-nav',
		  	'menu_id'         	=> '',
		  	'echo'            	=> true,
		  	'fallback_cb'     	=> 'wp_page_menu',
		  	'before'          	=> '',
		  	'after'           	=> '',
		  	'link_before'     	=> '',
		  	'link_after'      	=> '',
		  	'items_wrap'      	=> '<ul id="%1$s" class="%2$s">%3$s</ul>',
		  	'depth'           	=> 3,
		  	'walker'          	=> '',
		  	'fallback_cb'				=> 'tannistha_menu_fallback'
	    ));
		?>
      </div>
    </header>
   
    <div class="main-contain">
  <?php
  	if( is_single() ) {
  		$tannistha_blog_banner_heading = esc_html( get_theme_mod( 'tannistha_blog_banner_heading' ), 'tannistha' );
  		$tannistha_blog_banner_description = esc_html( get_theme_mod( 'tannistha_blog_banner_description' ), 'tannistha' );
      $hide_show_blog_banner = esc_html( get_theme_mod( 'hide_show_blog_banner' ), 'tannistha' );
      if( empty($hide_show_blog_banner) || 'on' == $hide_show_blog_banner ) {
  ?>
        <section style="background: url(<?php echo esc_url( get_theme_mod( 'tannistha_blog_banner', get_template_directory_uri() . '/images/blog-banner.jpg' ) ); ?>) no-repeat scroll 0 0 / 100% 15vw; min-height: 15vw;" class="all-banner">
          <div class="banner-caption">
            <h1 class="banner-text"><?php if ( !empty ( $tannistha_blog_banner_heading ) && !empty ( $tannistha_blog_banner_heading ) ) { echo $tannistha_blog_banner_heading; } ?></h1>
            <h4 class="banner-text"><?php if ( !empty ( $tannistha_blog_banner_description ) && !empty ( $tannistha_blog_banner_description ) ) { echo $tannistha_blog_banner_description; } ?></h4>
          </div>
        </section>
	<?php
      }
		}	else {
			$tannistha_banner_heading = esc_html( get_theme_mod( 'tannistha_banner_heading' ), 'tannistha' );
			$tannistha_banner_description = esc_html( get_theme_mod( 'tannistha_banner_description' ), 'tannistha' );
	?>
		  <?php if ( get_header_image() ) : ?>
					<?php
						$custom_header_sizes = apply_filters( 'tannishta_custom_header_sizes', '(max-width: 709px) 85vw, (max-width: 909px) 81vw, (max-width: 1362px) 88vw, 1200px' );
					?>
			<?php endif; ?>
      <?php 
        $hide_show_home_banner = esc_html( get_theme_mod( 'hide_show_home_banner' ), 'tannistha' );
        $hide_show_other_pages_banner = esc_html( get_theme_mod( 'hide_show_other_pages_banner' ), 'tannistha' );
        if( is_home() || is_front_page() ) {
          if ( empty($hide_show_home_banner) || 'on' == $hide_show_home_banner  ) {
      ?>
        <section class="home-banner" <?php if ( get_header_image() ) { ?> style="background: rgba(0, 0, 0, 0) url('<?php header_image(); ?>') no-repeat scroll 0 0 / 100% 27vw; min-height: 27vw; width: <?php echo esc_html( get_custom_header()->width, 'tannistha' ); ?>; height: <?php echo esc_html( get_custom_header()->height, 'tannistha' ); ?>;" <?php } ?>>
          <div class="banner-caption">
            <?php if ( get_header_image() && !empty ( $tannistha_banner_heading ) ) { ?>
            <h1 class="banner-text"><?php echo $tannistha_banner_heading; ?></h1>
            <?php } ?>
            <?php
              $tannistha_header_image = get_header_image();
              if ( $tannistha_header_image && !empty ( $tannistha_banner_description ) ) {
            ?>
            <h4 class="banner-text"><?php echo $tannistha_banner_description; ?></h4> 
            <?php } ?>
          </div>
        </section>
      <?php 
          }
        } else {
          if ( ( empty($hide_show_other_pages_banner) || 'on' == $hide_show_other_pages_banner ) ) { ?>
            <section class="home-banner" <?php if ( get_header_image() ) { ?> style="background: rgba(0, 0, 0, 0) url('<?php header_image(); ?>') no-repeat scroll 0 0 / 100% 27vw; min-height: 27vw; width: <?php echo esc_html( get_custom_header()->width, 'tannistha' ); ?>; height: <?php echo esc_html( get_custom_header()->height, 'tannistha' ); ?>;" <?php } ?>>
              <div class="banner-caption">
                <?php if ( get_header_image() && !empty ( $tannistha_banner_heading ) ) { ?>
                <h1 class="banner-text"><?php echo $tannistha_banner_heading; ?></h1>
                <?php } ?>
                <?php
                  $tannistha_header_image = get_header_image();
                  if ( $tannistha_header_image && !empty ( $tannistha_banner_description ) ) {
                ?>
                <h4 class="banner-text"><?php echo $tannistha_banner_description; ?></h4> 
                <?php } ?>
              </div>
            </section> 
      <?php
          }
        }
      ?>
	<?php
		}