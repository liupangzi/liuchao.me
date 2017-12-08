<?php
	global $tannistha_post_sidebar, $tannistha_page_sidebar;
	$sidebar_pos = '';
	$sidebar_pos_page = '';
	if ( $tannistha_post_sidebar == 'left-sidebar' ) {
		$sidebar_pos = 'pulling-left';
	}
	if ( $tannistha_post_sidebar == 'right-sidebar' ) {
		$sidebar_pos = '';
	}
	if ( $tannistha_post_sidebar == 'without-sidebar' ) {
		$sidebar_pos = 'hide';
	}

	if ( $tannistha_page_sidebar == 'left-sidebar' ) {
		$sidebar_pos_page = 'pulling-left';
	}
	if ( $tannistha_page_sidebar == 'right-sidebar' ) {
		$sidebar_pos_page = '';
	}
	if ( $tannistha_page_sidebar == 'without-sidebar' ) {
		$sidebar_pos_page = 'hide';
	}
?>
<div class="col-sm-4 col-md-3 <?php if( is_page() ) { echo 'page-sidebar-location ' . $sidebar_pos_page; } else { echo 'sidebar-location ' . $sidebar_pos; } ?>">
	<?php
	/**
	 * The template for the sidebar containing the main widget area
	 */
	?>

	<?php if ( is_active_sidebar( 'sidebar-1' )  ) : ?>
		<aside id="secondary" class="sidebar widget-area" role="complementary">
			<?php dynamic_sidebar( 'sidebar-1' ); ?>
		</aside><!-- .sidebar .widget-area -->
	<?php endif; ?>

</div>