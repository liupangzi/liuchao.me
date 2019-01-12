<?php

add_action('admin_menu', 'fifu_insert_menu');

function fifu_insert_menu() {
    add_menu_page(
            'Featured Image from URL', 'Featured Image from URL', 'administrator', 'featured-image-from-url', 'fifu_get_menu_html', plugins_url() . '/featured-image-from-url/admin/images/favicon.png', 57
    );

    add_action('admin_init', 'fifu_get_menu_settings');
}

function fifu_get_menu_html() {
    flush();
    $image_button = plugins_url() . '/featured-image-from-url/admin/images/onoff.jpg';

    $enable_social = get_option('fifu_social');
    $enable_original = get_option('fifu_original');
    $enable_lazy = get_option('fifu_lazy');
    $enable_content = get_option('fifu_content');
    $enable_content_page = get_option('fifu_content_page');
    $enable_fake = get_option('fifu_fake');
    $enable_fake2 = get_option('fifu_fake2');
    $css_style = get_option('fifu_css');
    $default_url = get_option('fifu_default_url');
    $default_width = get_option('fifu_default_width');
    $enable_default_url = get_option('fifu_enable_default_url');
    $enable_wc_lbox = get_option('fifu_wc_lbox');
    $enable_wc_zoom = get_option('fifu_wc_zoom');
    $enable_hide_page = get_option('fifu_hide_page');
    $enable_hide_post = get_option('fifu_hide_post');
    $enable_get_first = get_option('fifu_get_first');
    $enable_pop_first = get_option('fifu_pop_first');
    $enable_ovw_first = get_option('fifu_ovw_first');
    $column_height = get_option('fifu_column_height');
    $enable_priority = get_option('fifu_priority');
    $enable_grid_category = get_option('fifu_grid_category');
    $enable_auto_alt = get_option('fifu_auto_alt');
    $enable_data_generation = get_option('fifu_data_generation');
    $enable_data_clean = get_option('fifu_data_clean');

    include 'html/menu.html';

    fifu_update_menu_options();

    if (fifu_is_on('fifu_fake')) {
        update_option('fifu_data_generation', 'toggleon');
        fifu_enable_fake();
    } else {
        fifu_disable_fake();
    }

    if (fifu_is_on('fifu_fake2')) {
        update_option('fifu_data_generation', 'toggleoff');
        fifu_enable_fake2();
    } else if (fifu_is_off('fifu_fake2')) {
        fifu_disable_fake2();
    } else
        update_option('fifu_fake_created', null, 'no');

    if ($default_url && fifu_is_on('fifu_enable_default_url') && fifu_is_on('fifu_fake2')) {
        if (!wp_get_attachment_url(get_option('fifu_default_attach_id'))) {
            $attach_id = fifu_create_attachment_url($default_url);
            update_option('fifu_default_attach_id', $attach_id);
            fifu_set_default_url($attach_id);
        } else {
            fifu_update_default_url($default_url);
        }
    } else {
        fifu_delete_default_url();
    }

    if (fifu_is_on('fifu_data_clean')) {
        fifu_enable_clean();
        update_option('fifu_data_clean', 'toggleoff', 'no');
    }
}

function fifu_get_menu_settings() {
    fifu_get_setting('fifu_social');
    fifu_get_setting('fifu_original');
    fifu_get_setting('fifu_lazy');
    fifu_get_setting('fifu_content');
    fifu_get_setting('fifu_content_page');
    fifu_get_setting('fifu_enable_default_url');
    fifu_get_setting('fifu_fake');
    fifu_get_setting('fifu_fake2');
    fifu_get_setting('fifu_css');
    fifu_get_setting('fifu_default_url');
    fifu_get_setting('fifu_default_width');
    fifu_get_setting('fifu_wc_lbox');
    fifu_get_setting('fifu_wc_zoom');
    fifu_get_setting('fifu_hide_page');
    fifu_get_setting('fifu_hide_post');
    fifu_get_setting('fifu_get_first');
    fifu_get_setting('fifu_pop_first');
    fifu_get_setting('fifu_ovw_first');
    fifu_get_setting('fifu_column_height');
    fifu_get_setting('fifu_priority');
    fifu_get_setting('fifu_grid_category');
    fifu_get_setting('fifu_auto_alt');
    fifu_get_setting('fifu_data_generation');
    fifu_get_setting('fifu_data_clean');
}

function fifu_get_setting($type) {
    register_setting('settings-group', $type);

    $arrEmpty = array('fifu_default_url', 'fifu_default_width', 'fifu_css');
    $arr64 = array('fifu_column_height');
    $arrOn = array('fifu_fake2', 'fifu_auto_alt', 'fifu_wc_zoom', 'fifu_wc_lbox');
    $arrOffNo = array('fifu_data_clean');

    if (!get_option($type)) {
        if (in_array($type, $arrEmpty))
            update_option($type, '');
        else if (in_array($type, $arr64))
            update_option($type, "64", 'no');
        else if (in_array($type, $arrOn))
            update_option($type, 'toggleon');
        else if (in_array($type, $arrOffNo))
            update_option($type, 'toggleoff', 'no');
        else
            update_option($type, 'toggleoff');
    }
}

function fifu_update_menu_options() {
    fifu_update_option('fifu_input_social', 'fifu_social');
    fifu_update_option('fifu_input_original', 'fifu_original');
    fifu_update_option('fifu_input_lazy', 'fifu_lazy');
    fifu_update_option('fifu_input_content', 'fifu_content');
    fifu_update_option('fifu_input_content_page', 'fifu_content_page');
    fifu_update_option('fifu_input_fake', 'fifu_fake');
    fifu_update_option('fifu_input_fake2', 'fifu_fake2');
    fifu_update_option('fifu_input_css', 'fifu_css');
    fifu_update_option('fifu_input_default_url', 'fifu_default_url');
    fifu_update_option('fifu_input_default_width', 'fifu_default_width');
    fifu_update_option('fifu_input_enable_default_url', 'fifu_enable_default_url');
    fifu_update_option('fifu_input_wc_lbox', 'fifu_wc_lbox');
    fifu_update_option('fifu_input_wc_zoom', 'fifu_wc_zoom');
    fifu_update_option('fifu_input_hide_page', 'fifu_hide_page');
    fifu_update_option('fifu_input_hide_post', 'fifu_hide_post');
    fifu_update_option('fifu_input_get_first', 'fifu_get_first');
    fifu_update_option('fifu_input_pop_first', 'fifu_pop_first');
    fifu_update_option('fifu_input_ovw_first', 'fifu_ovw_first');
    fifu_update_option('fifu_input_column_height', 'fifu_column_height');
    fifu_update_option('fifu_input_priority', 'fifu_priority');
    fifu_update_option('fifu_input_grid_category', 'fifu_grid_category');
    fifu_update_option('fifu_input_auto_alt', 'fifu_auto_alt');
    fifu_update_option('fifu_input_data_generation', 'fifu_data_generation');
    fifu_update_option('fifu_input_data_clean', 'fifu_data_clean');
}

function fifu_update_option($input, $type) {
    if (isset($_POST[$input])) {
        if ($_POST[$input] == 'on')
            update_option($type, 'toggleon');
        else if ($_POST[$input] == 'off')
            update_option($type, 'toggleoff');
        else
            update_option($type, wp_strip_all_tags($_POST[$input]));
    }
}

function fifu_enable_fake2() {
    if (get_option('fifu_fake_created') && get_option('fifu_fake_created') != null)
        return;
    update_option('fifu_fake_created', true, 'no');

    fifu_db_insert_attachment();
    fifu_db_insert_attachment_category();
}

function fifu_disable_fake2() {
    if (!get_option('fifu_fake_created') && get_option('fifu_fake_created') != null)
        return;
    update_option('fifu_fake_created', false, 'no');

    fifu_db_delete_attachment();
    fifu_db_delete_attachment_category();
}

function fifu_enable_fake() {
    if (get_option('fifu_fake_attach_id'))
        return;

    global $wpdb;
    $old_attach_id = get_option('fifu_fake_attach_id');

    // create attachment 
    $filename = 'Featured Image from URL';
    $parent_post_id = null;
    $filetype = wp_check_filetype('fifu.png', null);
    $attachment = array(
        'guid' => basename($filename),
        'post_mime_type' => $filetype['type'],
        'post_title' => '',
        'post_excerpt' => '',
        'post_content' => 'Please don\'t remove that. It\'s just an empty symbolic file',
        'post_status' => 'inherit'
    );
    $attach_id = wp_insert_attachment($attachment, $filename, $parent_post_id);
    require_once( ABSPATH . 'wp-admin/includes/image.php' );
    $attach_data = wp_generate_attachment_metadata($attach_id, $filename);
    wp_update_attachment_metadata($attach_id, $attach_data);
    update_option('fifu_fake_attach_id', $attach_id);

    // insert _thumbnail_id
    $table = $wpdb->prefix . 'postmeta';
    $query = "
        SELECT DISTINCT post_id
        FROM " . $table . " a
        WHERE a.meta_key IN ('fifu_image_url', 'fifu_video_url', 'fifu_slider_image_url_0', 'fifu_shortcode')
        AND a.meta_value IS NOT NULL 
        AND a.meta_value <> ''
        AND NOT EXISTS (
            SELECT 1 
            FROM " . $table . " c 
            WHERE a.post_id = c.post_id 
            AND c.meta_key = '_thumbnail_id'
        )";
    $result = $wpdb->get_results($query);
    foreach ($result as $i) {
        $data = array('post_id' => $i->post_id, 'meta_key' => '_thumbnail_id', 'meta_value' => $attach_id);
        $wpdb->insert($table, $data);
    }

    // update _thumbnail_id
    $data = array('meta_value' => $attach_id);
    $where = array('meta_key' => '_thumbnail_id', 'meta_value' => $old_attach_id);
    $wpdb->update($table, $data, $where, null, null);

    // update _thumbnail_id
    $query = "
        SELECT post_id 
        FROM " . $table . " a
        WHERE a.meta_key IN ('fifu_image_url', 'fifu_video_url', 'fifu_slider_image_url_0', 'fifu_shortcode')
        AND a.meta_value IS NOT NULL 
        AND a.meta_value <> ''";
    $result = $wpdb->get_results($query);
    foreach ($result as $i) {
        $data = array('meta_value' => $attach_id);
        $where = array('post_id' => $i->post_id, 'meta_key' => '_thumbnail_id', 'meta_value' => -1);
        $wpdb->update($table, $data, $where, null, null);
    }
}

function fifu_disable_fake() {
    global $wpdb;
    $table = $wpdb->prefix . 'postmeta';
    $where = array('meta_key' => '_thumbnail_id', 'meta_value' => get_option('fifu_fake_attach_id'));
    $wpdb->delete($table, $where);

    wp_delete_attachment(get_option('fifu_fake_attach_id'));
    delete_option('fifu_fake_attach_id');
}

function fifu_create_attachment_url($url) {
    // create attachment 
    $filename = ';' . $url;
    $parent_post_id = null;
    $filetype = wp_check_filetype('fifu.png', null);
    $attachment = array(
        'guid' => $url,
        'post_mime_type' => $filetype['type'],
        'post_author' => 77777,
        'post_title' => '',
        'post_excerpt' => '',
        'post_content' => 'Please don\'t remove me. I\'m just an empty symbolic file that keeps the attached field filled ' .
        '(some themes/plugins depend on having an attached file to work). Anyway you are free to use any internal image you want instead of me.',
        'post_status' => 'inherit'
    );
    $attach_id = wp_insert_attachment($attachment, $filename, $parent_post_id);
    require_once( ABSPATH . 'wp-admin/includes/image.php' );
    $attach_data = wp_generate_attachment_metadata($attach_id, $filename);
    wp_update_attachment_metadata($attach_id, $attach_data);
    return $attach_id;
}

function fifu_enable_clean() {
    global $wpdb;

    $table = $wpdb->prefix . 'postmeta';
    $table_posts = $wpdb->prefix . 'posts';

    $where = array('meta_key' => '_thumbnail_id', 'meta_value' => -1);
    $wpdb->delete($table, $where);

    $where = array('meta_key' => '_thumbnail_id', 'meta_value' => get_option('fifu_fake_attach_id'));
    $wpdb->delete($table, $where);

    $where = array('meta_key' => '_thumbnail_id', 'meta_value' => get_option('fifu_default_attach_id'));
    $wpdb->delete($table, $where);

    $where = array('meta_key' => '_product_image_gallery', 'meta_value' => -1);
    $wpdb->delete($table, $where);

    $where = array('meta_key' => '_product_image_gallery', 'meta_value' => get_option('fifu_fake_attach_id'));
    $wpdb->delete($table, $where);

    $where = array('meta_key' => '_wp_attached_file', 'meta_value' => 'Featured Image from URL');
    $wpdb->delete($table, $where);

    $where = array('meta_key' => '_wp_attached_file', 'meta_value' => 'fifu.png');
    $wpdb->delete($table, $where);

    $where = array('guid' => 'http://fifu.png');
    $wpdb->delete($table_posts, $where);

    wp_delete_attachment(get_option('fifu_fake_attach_id'));
    wp_delete_attachment(get_option('fifu_default_attach_id'));
    delete_option('fifu_fake_attach_id');
    fifu_disable_fake();
    fifu_disable_fake2();
    update_option('fifu_fake', 'toggleoff');
    update_option('fifu_fake2', 'toggleoff');
    update_option('fifu_fake_created', false, 'no');
}

function fifu_set_default_url($attach_id) {
    global $wpdb;
    $table_postmeta = $wpdb->prefix . 'postmeta';
    $table_posts = $wpdb->prefix . 'posts';
    $query = "
        SELECT id
        FROM " . $table_posts . " p
        INNER JOIN " . $table_postmeta . " pm ON p.id = pm.post_id
        WHERE post_type IN ('post','page','product')
        AND post_status = 'publish'
        AND NOT EXISTS (
            SELECT 1 FROM " . $table_postmeta . " pm2
            WHERE pm2.post_id = pm.post_id
            AND pm2.meta_key IN ('_thumbnail_id', 'fifu_image_url', 'fifu_video_url', 'fifu_slider_image_url_0', 'fifu_shortcode')
            AND pm2.meta_value <> -1
        )";
    $result = $wpdb->get_results($query);
    foreach ($result as $i) {
        set_post_thumbnail($i->id, $attach_id);
    }
}

function fifu_update_default_url($url) {
    global $wpdb;
    $table_posts = $wpdb->prefix . 'posts';
    $attach_id = get_option('fifu_default_attach_id');
    if ($url != wp_get_attachment_url($attach_id)) {
        $wpdb->update($table_posts, $set = array('guid' => $url), $where = array('id' => $attach_id), null, null);
        update_post_meta($attach_id, '_wp_attached_file', ';' . $url);
    }
}

function fifu_delete_default_url() {
    $attach_id = get_option('fifu_default_attach_id');
    wp_delete_attachment($attach_id);
    delete_option('fifu_default_attach_id');

    global $wpdb;
    $table_postmeta = $wpdb->prefix . 'postmeta';
    $where = array('meta_key' => '_thumbnail_id', 'meta_value' => $attach_id);
    $wpdb->delete($table_postmeta, $where);
}

function fifu_version() {
    $plugin_data = get_plugin_data(FIFU_PLUGIN_DIR . 'featured-image-from-url.php');
    return $plugin_data ? $plugin_data['Name'] . ':' . $plugin_data['Version'] : '';
}

