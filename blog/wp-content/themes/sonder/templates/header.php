<header class="site-header <?php if (sonder_has_custom_background()) echo 'with-site-background' ?>" role="banner">
    <div class="container">
        <div class="col-xs-12 col-sm-3 col-md-2 no-l-padding">
            <div class="col-xs-12 col-sm-12 no-l-padding">
            <div class="logo">
                    <?php if (get_theme_mod('sonder_logo')): ?>
                        <a href="<?php echo esc_url(home_url('/')); ?>" rel="home">
                            <img alt="<?php bloginfo('name') ?>"
                                 src="<?php echo esc_url(get_theme_mod('sonder_logo')); ?>"/>
                        </a>
                    <?php else: ?>
                        <a class="header-logo-link" href="<?php echo esc_url(home_url('/')); ?>" rel="home">
                            <span class='site-title'><?php bloginfo('name'); ?></span>
                        </a>
                    <?php endif ?>
                </div>
                <div class="description"><?php bloginfo('description'); ?></div>
            </div>
            <div class="visible-xs-block col-xs-12 contact-section">
                <div class="contact-bar">
                    <?php
                    echo get_theme_mod('sonder_phone_number') ?
                        '<span class="contact-item">' .
                        esc_attr(get_theme_mod('sonder_phone_number')) .
                        '</span>' : '';

                    echo get_theme_mod('sonder_email') ?
                        '<span class="contact-item">' .
                        esc_attr(get_theme_mod('sonder_email')) .
                        '</span>' : '';
                    ?>
                </div>
                <div class="social-bar">
                    <?php
                    echo get_theme_mod('sonder_github_link') ?
                        '<a class="social-icon fa fa-github" target="_blank" title="GitHub Profile" href="' .
                        esc_url(get_theme_mod('sonder_github_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_facebook_link') ?
                        '<a class="social-icon fa fa-facebook" target="_blank" title="Facebook Profile" href="' .
                        esc_url(get_theme_mod('sonder_facebook_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_twitter_link') ?
                        '<a class="social-icon fa fa-twitter" target="_blank" title="Twitter Profile" href="' .
                        esc_url(get_theme_mod('sonder_twitter_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_google_plus_link') ?
                        '<a class="social-icon fa fa-google-plus" target="_blank" href="' .
                        esc_url(get_theme_mod('sonder_google_plus_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_linkedin_link') ?
                        '<a class="social-icon fa fa-linkedin" target="_blank" href="' .
                        esc_url(get_theme_mod('sonder_linked_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_youtube_link') ?
                        '<a class="social-icon fa fa-youtube" target="_blank" href="' .
                        esc_url(get_theme_mod('sonder_youtube_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_skype_link') ?
                        '<a class="social-icon fa fa-skype" target="_blank" href="skype:' .
                        esc_url(get_theme_mod('sonder_skype_link')) . '"></a>' : '';
                    ?>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-9 col-md-10 no-r-padding">
            <div class="hidden-xs contact-section">
                <div class="contact-bar">
                    <?php
                    echo get_theme_mod('sonder_phone_number') ?
                        '<span class="contact-item">' .
                        esc_attr(get_theme_mod('sonder_phone_number')) .
                        '</span>' : '';

                    echo get_theme_mod('sonder_email') ?
                        '<span class="contact-item">' .
                        esc_attr(get_theme_mod('sonder_email')) .
                        '</span>' : '';
                    ?>
                </div>
                <div class="social-bar">
                    <?php
                    echo get_theme_mod('sonder_github_link') ?
                        '<a class="social-icon fa fa-github" target="_blank" title="GitHub Profile" href="' .
                        esc_url(get_theme_mod('sonder_github_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_facebook_link') ?
                        '<a class="social-icon fa fa-facebook" target="_blank" title="Facebook Profile" href="' .
                        esc_url(get_theme_mod('sonder_facebook_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_twitter_link') ?
                        '<a class="social-icon fa fa-twitter" target="_blank" title="Twitter Profile" href="' .
                        esc_url(get_theme_mod('sonder_twitter_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_google_plus_link') ?
                        '<a class="social-icon fa fa-google-plus" target="_blank" href="' .
                        esc_url(get_theme_mod('sonder_google_plus_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_linkedin_link') ?
                        '<a class="social-icon fa fa-linkedin" target="_blank" href="' .
                        esc_url(get_theme_mod('sonder_linked_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_youtube_link') ?
                        '<a class="social-icon fa fa-youtube" target="_blank" href="' .
                        esc_url(get_theme_mod('sonder_youtube_link')) . '"></a>' : '';

                    echo get_theme_mod('sonder_skype_link') ?
                        '<a class="social-icon fa fa-skype" target="_blank" href="skype:' .
                        esc_url(get_theme_mod('sonder_skype_link')) . '"></a>' : '';
                    ?>
                </div>
            </div>

            <div class="banner navbar navbar-default navbar-right" role="banner">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target=".navbar-collapse">
                        <span class="sr-only"><?php _e('Toggle navigation', 'sonder'); ?></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <nav class="collapse navbar-collapse" role="navigation">
                    <?php
                    if (has_nav_menu('primary_navigation')) :
                        wp_nav_menu([
                            'theme_location' => 'primary_navigation',
                            'walker' => new wp_bootstrap_navwalker(),
                            'menu_class' => 'nav navbar-nav'
                        ]);
                    endif;
                    ?>
                </nav>
            </div>
        </div>
    </div>
</header>
