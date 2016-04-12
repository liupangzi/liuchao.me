<?php if(is_single()) :?>
        <div class="tag-block">
                <span><?php _e('Tagged As', 'sonder')?>: </span>
                <?php the_tags( '<ul class="post-tag-list"><li>', '</li><li>', '</li></ul>' );?>
        </div>
<?php endif; ?>
<time class="updated" datetime="<?php echo get_post_time('c', true); ?>"><?php echo get_the_date(); ?></time>
<p class="byline author vcard"><?php echo __('By', 'sonder'); ?> <a
        href="<?php echo get_author_posts_url(get_the_author_meta('ID')); ?>" rel="author"
        class="fn"><?php echo get_the_author(); ?></a></p>
