<?php use Roots\Sage\Titles;

//get parent pages if this is called on single page
$ancestors = !is_page() ? [ ] : get_post_ancestors(get_the_ID());

?>
<div class="page-header">
    <?php if (!empty($ancestors)) { ?>
        <div class="breadcrumb-wrapper">
            <ol class="breadcrumb">
                <?php
                $ancestors = array_reverse($ancestors);
                foreach ($ancestors as $ancestor): ?>
                    <?php $parentPage = get_post($ancestor) ?>
                    <li>
                        <?php $parentTitle = (get_the_title($parentPage) == '' ? '...' :
                            get_the_title($parentPage));?>
                        <a href="<?php echo get_permalink($parentPage) ?>"><?php echo $parentTitle ?></a>
                    </li>
                <?php endforeach ?>
                <li class="active"><?php echo get_the_title() ?></li>
            </ol>

        </div>
    <?php } if (Titles\title() != '') {?>
        <h1><?php echo esc_html(Titles\title()); ?></h1>
    <?php } ?>
</div>
