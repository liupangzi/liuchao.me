<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @package Tannistha
 */

get_header(); ?>

	<section class="home-posts">
		<div class="container">
		  <div class="row">
		  <?php if ( $tannistha_post_sidebar == 'left-sidebar' ) { get_sidebar(); } ?>
			<div class="<?php if ( $tannistha_post_sidebar == 'without-sidebar' ) { echo 'col-sm-12'; } else { echo 'col-sm-8 col-md-9'; } ?>">
				<header class="page-header">
					<h1 class="page-title"><?php _e( 'Oops! That page can&rsquo;t be found.', 'tannistha' ); ?></h1>
				</header><!-- .page-header -->

				<div class="page-content">
					<p><?php _e( 'It looks like nothing was found at this location. Maybe try a search?', 'tannistha' ); ?></p>

					<?php get_search_form(); ?>
				</div><!-- .page-content -->
			
		</div> 
			<?php if ( $tannistha_post_sidebar == 'right-sidebar' ) { get_sidebar(); } ?>
			<div class="clearfix"></div>
		</div>	
	</div>        
</section>
<?php
	get_footer();
?>
