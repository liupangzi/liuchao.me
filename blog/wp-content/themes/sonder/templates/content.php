<?php
/**
 *
 */

$isStickyPostWithBackground = is_sticky() && is_home() && has_post_thumbnail();
?>
<?php if ($isStickyPostWithBackground): ?>
    <article <?php post_class('with-background') ?>>
        <header <?php echo 'style="background-image:url(' . (wp_get_attachment_image_src(get_post_thumbnail_id(), 'medium')[0]) . ');"' ?>>
            <h2 class="entry-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
            <?php get_template_part('templates/entry-meta'); ?>
        </header>
        <div class="entry-summary">
            <?php the_excerpt(); ?>
        </div>
    </article>
<?php else: ?>
    <article <?php post_class(); ?>>
        <div class="row">
        <?php if (has_post_thumbnail()): ?>
            <div class="col-xs-offset-3 col-xs-6 col-sm-offset-0 col-md-4 col-lg-3">
                <a href="<?php the_permalink(); ?>">
                    <?php echo get_the_post_thumbnail(null, 'thumbnail'); ?>
                </a>
            </div>
            <div class="col-xs-12 col-md-8 col-lg-9">
                <header>
                    <h2 class="entry-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
                    <?php get_template_part('templates/entry-meta'); ?>
                </header>
                <div class="entry-summary">
                    <?php the_excerpt(); ?>
                </div>
            </div>
            <?php else: ?>
            <div class="col-lg-12">
                <header>
                    <h2 class="entry-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
                    <?php get_template_part('templates/entry-meta'); ?>
                </header>
                <div class="entry-summary">
                    <?php the_excerpt(); ?>
                </div>
            </div>
        <?php endif ?>
        </div>
        <hr/>
    </article>
<?php endif ?>
