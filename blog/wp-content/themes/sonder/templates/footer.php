<footer class="bottom-footer content-info" role="contentinfo">
    <div class="container">
        <div class="top row">
            <?php if (is_active_sidebar('footer-left')): ?>
                <div class="left-block col-xs-12 col-sm-6">
                    <?php dynamic_sidebar('footer-left') ?>
                </div>
            <?php endif ?>
            <?php if (is_active_sidebar('footer-right')): ?>
                <div class="right-block col-xs-12 col-sm-6">
                    <?php dynamic_sidebar('footer-right') ?>
                </div>
            <?php endif ?>
        </div>
        <div class="bottom row">
            <div class="col-xs-6 copyright-text">
                <?php if (get_theme_mod('sonder_copyright_text')): ?>
                    <?php echo esc_html(get_theme_mod('sonder_copyright_text')) ?>
                <?php else: ?>
                    <?php printf(__('Copyright %1$s %2$s', 'sonder'), date_i18n('Y'), get_bloginfo('name')); ?>
                <?php endif ?>
            </div>
            <div class="col-xs-6">
                <div class="contact-section">
                    <div class="contact-bar">
                        <?php
                        echo get_theme_mod('sonder_phone_number') ?
                            '<span class="contact-item"><a href="tel:' .
                            esc_attr(get_theme_mod('sonder_phone_number')) .
                            '">' . esc_html(get_theme_mod('sonder_phone_number')) : '';

                        echo get_theme_mod('sonder_email') ?
                            '<span class="contact-item"><a href="mailto:' .
                            esc_attr(get_theme_mod('sonder_email')) .
                            '">' . esc_html(get_theme_mod('sonder_email')) . '</a></span>' : '';
                        ?>
                    </div>
                    <div class="contact-bar">
                        <span class="contact-item">
                            <i>
                                <?php _e('Sonder Theme by <a href="http://www.creotex.com" target="_blank">Creotex</a>',
                                    'sonder') ?>
                            </i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
</footer>
