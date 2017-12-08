<?php
/**
 * The template part for displaying single posts
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">
	  <?php the_title( '<h2 class="entry-title">', '</h2>' ); ?>
	</header>
	<p class="entry-meta">
    <span>
      <i class="fa fa-calendar"></i> <?php _e( 'Posted:', 'tannistha' ); ?> 
      <span class="posted-on">
      	<a href="<?php echo esc_url( get_day_link( get_the_date('Y'), get_the_date('m'), get_the_date('d') ) ); ?>">
      		<?php echo get_the_date('F d, Y'); ?>
      	</a>
      </span>
    </span> 
    <span class="entry-categories">
			<i class="fa fa-th-list"></i> <?php _e( 'Under:', 'tannistha' ); ?> 
			<?php
      	$tannistha_categories = get_the_category();
      	$tannistha_category_term_id = $tannistha_categories[0]->term_id;
      	if ( ! empty( $tannistha_category_term_id ) ) { 
      ?>
					<a rel="category tag" href="<?php echo esc_url( get_category_link( $tannistha_categories[0]->term_id ) ); ?>">
						<?php echo esc_html( $tannistha_categories[0]->name ); ?>
					</a>
			<?php
      	}
      ?>
    </span>
		<span>
		  <i class="fa fa-user"></i> <?php _e( 'By', 'tannistha' ); ?>
			<span class="entry-author" >
			<a class="entry-author-link" rel="author" href="<?php echo esc_url( get_author_posts_url( get_the_author_meta( 'ID' ), get_the_author_meta( 'user_nicename' ) ) ); ?>">
				<span class="entry-author-name"><?php echo get_the_author(); ?></span>
			</a>
			</span>
		</span>
		<span>
        <i class="fa fa-comments"></i>  
        <span class="entry-comments-link">
					<a href="<?php echo esc_url( get_comments_link( get_the_ID() ) ); ?>"><?php comments_number( 'no Comments', '1 Comment', '% Comments' ); ?></a>
				</span>  
	  </span>
  </p>
  <div class="entry-content single-post-content">
  	<?php
			if ( has_post_thumbnail() ) {
		?>
				<figure class="wp-caption alignleft" >
					<?php echo get_the_post_thumbnail(get_the_ID(), 'full'); ?>
				</figure>
		<?php
			}
		?>
  	<?php
  		the_content();
  		wp_link_pages( array(
				'before'      => '<div class="page-links"><span class="page-links-title">' . __( 'Pages:', 'tannistha' ) . '</span>',
				'after'       => '</div>',
				'link_before' => '<span>',
				'link_after'  => '</span>',
				'pagelink'    => '<span class="screen-reader-text">' . __( 'Page', 'tannistha' ) . ' </span>%',
				'separator'   => '<span class="screen-reader-text">, </span>',
			) );

			if ( '' !== get_the_author_meta( 'description' ) ) {
				get_template_part( 'template-parts/biography' );
			}
  	?>
	</div>
</article>