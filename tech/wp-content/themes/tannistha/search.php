<?php
/**
 * The template for displaying search results pages
 */

get_header(); ?>

	<section class="home-posts">
			<div class="container">
			  <div class="row">

			  <?php if ( $tannistha_post_sidebar == 'left-sidebar' ) { get_sidebar(); } ?>

				<div class="<?php if ( $tannistha_post_sidebar == 'without-sidebar' ) { echo 'col-sm-12'; } else { echo 'col-sm-8 col-md-9'; } ?>">
				
					<?php if ( have_posts() ) : ?>

						<header class="page-header">
							<h1 class="page-title"><?php printf( __( 'Search Results for: %s', 'tannistha' ), '<span>' . esc_html( get_search_query() ) . '</span>' ); ?></h1>
						</header><!-- .page-header -->

						<?php
						// Start the loop.
						while ( have_posts() ) : the_post();

							/**
							 * Run the loop for the search to output the results.
							 * If you want to overload this in a child theme then include a file
							 * called content-search.php and that will be used instead.
							 */
							get_template_part( 'template-parts/content', 'search' );

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
				<?php if ( $tannistha_post_sidebar == 'right-sidebar' ) { get_sidebar(); } ?>
			</div>	
		</div>        
  </section>
<?php
	get_footer();
?>