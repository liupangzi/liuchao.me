<?php
	global $tannistha_post_sidebar, $tannistha_page_sidebar;
	get_header();
?>
      <section class="home-posts">
			<div class="container">
			  <div class="row">
				<div class="page-content-location <?php if ( $tannistha_post_sidebar == 'without-sidebar' ) { echo 'col-sm-12'; } else if ( $tannistha_post_sidebar == 'left-sidebar' ) { echo 'col-sm-8 col-md-9 has_left_sidebar'; } else { echo 'col-sm-8 col-md-9'; } ?>">

					<?php if ( have_posts() ) : ?>

					<?php if ( is_home() && ! is_front_page() ) : ?>
						<header>
							<h1 class="page-title screen-reader-text"><?php single_post_title(); ?></h1>
						</header>
					<?php endif; ?>

					<?php
						// Start the loop.
						while ( have_posts() ) : the_post();

							/*
							 * Include the Post-Format-specific template for the content.
							 * If you want to override this in a child theme, then include a file
							 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
							 */
							get_template_part( 'template-parts/content', get_post_format() );

						// End the loop.
						endwhile;

						// Pagination.
						the_posts_pagination( array(
						    'prev_text' => __( '&laquo; Previous Page', 'tannistha' ),
						    'next_text' => __( 'Next Page &raquo;', 'tannistha' ),
						    'screen_reader_text' => '&nbsp;',
						) );

						// If no content, include the "No posts found" template.
						else :
							get_template_part( 'template-parts/content', 'none' );

						endif;
					?>

				</div> 
				<?php if ( $tannistha_post_sidebar == 'left-sidebar' ) { get_sidebar(); } ?>
				<?php if ( $tannistha_post_sidebar == 'right-sidebar' ) { get_sidebar(); } ?>
				<div class="clearfix"></div>
			  </div>	
			</div>        
      </section>
<?php
	get_footer();
?>