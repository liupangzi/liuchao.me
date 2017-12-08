<?php
/**
 * The template for displaying comments
 *
 * The area of the page that contains both current comments
 * and the comment form.
 *
 * @package Tannistha
 */

/*
 * If the current post is protected by a password and
 * the visitor has not yet entered the password we will
 * return early without loading the comments.
 */
if ( post_password_required() ) {
	return;
}
?>

<div id="comments" class="comments-area entry-comments">

	<?php if ( have_comments() ) : ?>
		<h3 class="comments-title">
			<?php
				$comments_number = get_comments_number();
				if ( 1 === $comments_number ) {
					/* translators: %s: post title */
					printf( _x( '<span>%s response to </span>', 'comments title', 'tannistha' ), get_the_title() );
				} else {
					printf(
						/* translators: 1: number of comments, 2: post title */
						_nx(
							'<span>%1$s response to <strong>"%2$s"</strong></span>',
							'<span>%1$s response to <strong>"%2$s"</strong></span>',
							$comments_number,
							'comments title',
							'tannistha'
						),
						number_format_i18n( $comments_number ),
						get_the_title()
					);
				}
			?>
		</h3>

		<?php the_comments_navigation(); ?>

		<ol class="comment-list">
			<?php wp_list_comments( 'type=comment&callback=tannistha_comment' ); ?>
		</ol>

		<?php the_comments_navigation(); ?>

	<?php endif; // Check for have_comments(). ?>

	<?php
		// If comments are closed and there are comments, let's leave a little note, shall we?
		if ( ! comments_open() && get_comments_number() && post_type_supports( get_post_type(), 'comments' ) ) :
	?>
		<p class="no-comments"><?php _e( 'Comments are closed.', 'tannistha' ); ?></p>
	<?php endif; ?>

	

</div><!-- .comments-area -->

<?php
	if ( is_user_logged_in() ) {
?>
		<div class="comment_form_wrap"><?php comment_form(); ?></div>
<?php
	}
	else {
?>
		<?php comment_form(); ?>
<?php
	}
?>