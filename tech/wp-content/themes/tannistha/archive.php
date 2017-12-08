<?php
/**
 * @package Tannistha
 */

get_header(); ?>

	<section class="home-posts">
		<div class="container">
		  <div class="row">
		  <?php if ( $tannistha_post_sidebar == 'left-sidebar' ) { get_sidebar(); } ?>
			<div class="<?php if ( $tannistha_post_sidebar == 'without-sidebar' ) { echo 'col-sm-12'; } else { echo 'col-sm-8 col-md-9'; } ?>">

				<?php if ( have_posts() ) : ?>

					<header class="page-header">
						<?php
							the_archive_title( '<h1 class="page-title">', '</h1>' );
							the_archive_description( '<div class="taxonomy-description">', '</div>' );
						?>
					</header><!-- .page-header -->

					<?php
					// Start the Loop.
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
					    'screen_reader_text' => __( '&nbsp;', 'tannistha' ),
					) );

				// If no content, include the "No posts found" template.
				else :
					get_template_part( 'template-parts/content', 'none' );

				endif;
			?>
		</div> 
		<?php if ( $tannistha_post_sidebar == 'right-sidebar' ) { get_sidebar(); } ?>
		<div class="clearfix"></div>
		</div>	
	</div>        
</section>
<?php
	get_footer();
?>
