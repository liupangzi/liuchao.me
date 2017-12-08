<?php
/**
 * The template for displaying all single posts and attachments
 */

get_header(); ?>

      <section class="home-posts">
			<div class="container">
			  <div class="row">
				<div class="page-content-location <?php if ( $tannistha_post_sidebar == 'without-sidebar' ) { echo 'col-sm-12'; } else if ( $tannistha_post_sidebar == 'left-sidebar' ) { echo 'col-sm-8 col-md-9 has_left_sidebar'; } else { echo 'col-sm-8 col-md-9'; } ?>">

					<?php
						// Start the loop.
						while ( have_posts() ) : the_post();
							get_template_part( 'template-parts/content', 'single' );

							// If comments are open or we have at least one comment, load up the comment template.
							if ( comments_open() || get_comments_number() ) {
								comments_template();
							}

							if ( is_singular( 'attachment' ) ) {
								// Parent post navigation.
								the_post_navigation( array(
									'prev_text' => _x( '<span class="meta-nav">Published in</span><span class="post-title">%title</span>', 'Parent post link', 'tannistha' ),
								) );
							} elseif ( is_singular( 'post' ) ) {
								// Previous/next post navigation.
								the_post_navigation( array(
									'next_text' => '<span class="screen-reader-text">' . __( 'Next Post', 'tannistha' ) . '</span> ',
									'prev_text' => '<span class="screen-reader-text">' . __( 'Previous Post', 'tannistha' ) . '</span> ',
									'screen_reader_text' => __( ' ', 'tannistha' ),
								) );
							}

						// End of the loop.
						endwhile;
					?>

				</div>
				<?php if ( $tannistha_post_sidebar == 'left-sidebar' ) { get_sidebar(); } ?>
				<?php if ( $tannistha_post_sidebar == 'right-sidebar' ) { get_sidebar(); } ?>
				<div class="clearfix"></div>

			  </div>	
			</div>        
      </section>

<?php get_footer(); ?>
