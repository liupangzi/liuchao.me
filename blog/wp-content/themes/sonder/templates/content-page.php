<?php the_content(); ?>
<?php wp_link_pages(['before' => '<nav class="page-nav"><p>' . __('Pages:', 'sonder'), 'after' => '</p></nav>']); ?>
<?php comments_template('/templates/comments.php'); ?>