<?php
/**
 * @package Tannistha
 */

get_header(); ?>

<section class="home-posts">
	<div class="container">
		<div class="row">
			<div class="inner-page-content-location <?php if ( $tannistha_post_sidebar == 'without-sidebar' ) { echo 'col-sm-12'; } else if ( $tannistha_post_sidebar == 'left-sidebar' ) { echo 'col-sm-8 col-md-9 has_left_sidebar'; } else { echo 'col-sm-8 col-md-9'; } ?>">
				<?php
					// Start the loop.
					while ( have_posts() ) : the_post();

						// Include the page content template.
						get_template_part( 'template-parts/content', 'page' );

						// If comments are open or we have at least one comment, load up the comment template.
						if ( comments_open() || get_comments_number() ) {
							comments_template();
						}

						// End of the loop.
					endwhile;
				?>
			</div> 
			<?php if ( $tannistha_page_sidebar == 'left-sidebar' ) { get_sidebar(); } ?>
			<?php if ( $tannistha_page_sidebar == 'right-sidebar' ) { get_sidebar(); } ?>
			<div class="clearfix"></div>
		</div>	
	</div>        
</section>
<?php
	get_footer();
?>
