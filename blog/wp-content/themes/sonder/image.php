<?php
/**
 * The template for displaying image attachments
 */
while (have_posts()) : the_post(); ?>
	<article <?php post_class(); ?>>
		<header>
			<h1 class="entry-title"><?php the_title(); ?></h1>
			<?php get_template_part('templates/entry-meta'); ?>
		</header>
		<div class="entry-content">
            <div class="entry-attachment">
                <a href="<?php echo wp_get_attachment_image_src( get_the_ID(), 'full' )[0]; ?>">
                    <img src="<?php echo wp_get_attachment_image_src( get_the_ID(), 'full' )[0]; ?>"/>
                </a>
                <?php if ( has_excerpt() ) : ?>
                    <div class="entry-caption">
                        <?php the_excerpt(); ?>
                    </div>
                <?php endif; ?>
            </div>
			<?php the_content(); ?>
		</div>
		<footer>
			<?php wp_link_pages([
				'before' => '<nav class="page-nav"><p>' . __('Pages:', 'sonder'),
				'after' => '</p></nav>'
			]); ?>
		</footer>
		<?php comments_template('/templates/comments.php'); ?>
	</article>
<?php endwhile; ?>
