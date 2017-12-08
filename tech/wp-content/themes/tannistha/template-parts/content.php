<?php
/**
 * The template part for displaying content
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">
	  <?php if ( is_sticky() && is_home() && ! is_paged() ) : ?>
			<span class="sticky-post"><?php _e( 'Featured', 'tannistha' ); ?></span>
		<?php endif; ?>

		<?php the_title( sprintf( '<h2 class="entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h2>' ); ?>
	</header>
	<p class="entry-meta">
      <span>
        <i class="fa fa-calendar"></i> <?php _e( 'Posted: ', 'tannistha' ); ?>
        <span class="posted-on">
	      	<a href="<?php echo esc_url( get_day_link( get_the_date('Y'), get_the_date('m'), get_the_date('d') ) ); ?>">
	      		<?php echo get_the_date('F d, Y'); ?>
	      	</a>
	      </span>
      </span> 
      <?php
      	$tannistha_categories = get_the_category();
      	$tannistha_category_term_id = $tannistha_categories[0]->term_id;
      	if ( ! empty( $tannistha_category_term_id ) ) { 
      ?>
          <span class="entry-categories">
						<i class="fa fa-th-list"></i> <?php _e( 'Under: ', 'tannistha' ); ?>
						<a rel="category tag" href="<?php echo esc_url( get_category_link( $tannistha_categories[0]->term_id ) ); ?>">
							<?php echo esc_html( $tannistha_categories[0]->name ); ?>
						</a>
          </span>
      <?php
      	}
      ?>
    	<span>
    		<i class="fa fa-user"></i> <?php _e( 'By', 'tannistha' ); ?>
				<span class="entry-author" itemtype="http://schema.org/Person" itemscope="" >
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
  <div class="entry-content">
		<?php
			if ( has_post_thumbnail() ) {
		?>
				<figure class="wp-caption alignleft" >
				 <?php echo get_the_post_thumbnail(get_the_ID(), 'tannistha-post-archive-thumb'); ?>
				</figure>
		<?php
			}
		?>
    <p><?php echo get_the_excerpt(); ?></p>
		<a href="<?php echo esc_url( get_the_permalink() ); ?>" class="button"><?php _e( 'Read More', 'tannistha' ); ?></a>

		<div class="clearfix"></div>
	</div>
</article>