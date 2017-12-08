  </div>
  
  <?php if( is_active_sidebar( 'footer-1' ) || is_active_sidebar( 'footer-2' ) || is_active_sidebar( 'footer-3' ) || is_active_sidebar( 'footer-4' )  ) { ?>
    <div class="footer-widgets">
      <div class="container">
        <div class="row">
          <div class="col-md-3 footer-widgets-1 widget-area">
            <?php if ( is_active_sidebar( 'footer-1' )  ) : ?>
              <aside id="footer1" class="sidebar widget-area" role="complementary">
                <?php dynamic_sidebar( 'footer-1' ); ?>
              </aside><!-- .sidebar .widget-area -->
            <?php endif; ?>
          </div>	
          <div class="col-md-3 footer-widgets-2 widget-area">
            <?php if ( is_active_sidebar( 'footer-2' )  ) : ?>
              <aside id="footer2" class="sidebar widget-area" role="complementary">
                <?php dynamic_sidebar( 'footer-2' ); ?>
              </aside><!-- .sidebar .widget-area -->
            <?php endif; ?>
          </div>
          <div class="col-md-3 footer-widgets-3 widget-area">
            <?php if ( is_active_sidebar( 'footer-3' )  ) : ?>
              <aside id="footer3" class="sidebar widget-area" role="complementary">
                <?php dynamic_sidebar( 'footer-3' ); ?>
              </aside><!-- .sidebar .widget-area -->
            <?php endif; ?>
          </div>
          <div class="col-md-3 footer-widgets-4 widget-area">
            <?php if ( is_active_sidebar( 'footer-4' )  ) : ?>
              <aside id="footer3" class="sidebar widget-area" role="complementary">
                <?php dynamic_sidebar( 'footer-4' ); ?>
              </aside><!-- .sidebar .widget-area -->
            <?php endif; ?>   	                
          </div>
        </div>
     </div>
    </div>
  <?php } ?>
 <footer class="site-footer" itemtype="http://schema.org/WPFooter" itemscope="">
 	<div class="container">
		<?php
			wp_nav_menu( array( 
		  	'theme_location' 	  => 'footer',
		  	'menu_class'      	=> 'menu foot-nav',
		  	'menu_id'         	=> '',
		  	'echo'            	=> true,
		  	'fallback_cb'     	=> 'wp_page_menu',
		  	'before'          	=> '',
		  	'after'           	=> '',
		  	'link_before'     	=> '<span>',
		  	'link_after'      	=> '</span>',
		  	'items_wrap'      	=> '<ul id="%1$s" class="%2$s">%3$s</ul>',
		  	'depth'           	=> 1,
		  	'walker'          	=> '',
		  	'fallback_cb'				=> 'tannistha_footer_menu_fallback'
	    ));
		?>
		<p>
			<?php
				$tannistha_copyright_text = esc_html( get_theme_mod( 'tannistha_copyright_text' ), 'tannistha' );
				if ( !empty( $tannistha_copyright_text ) ) {
      		echo $tannistha_copyright_text;
      	}
      ?>
    </p>
    <a href="#" id="back-to-top" title="<?php esc_attr_e( 'Back to top', 'tannistha' ); ?>"> </a>
 	</div> 
 </footer>  
 <?php wp_footer(); ?>
</body>
</html>