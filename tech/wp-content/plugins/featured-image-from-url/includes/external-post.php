<?php

add_filter('wp_insert_post_data', 'fifu_remove_first_image_ext', 10, 2);

function fifu_remove_first_image_ext($data, $postarr) {
    if (isset($_POST['fifu_input_url']))
        return $data;

    $content = $postarr['post_content'];
    if (!$content)
        return $data;

    $contentClean = fifu_show_all_images($content);
    $data = str_replace($content, $contentClean, $data);

    $img = fifu_first_img_in_content($contentClean);
    if (!$img)
        return $data;

    if (fifu_is_off('fifu_pop_first'))
        return str_replace($img, fifu_show_image($img), $data);

    return str_replace($img, fifu_hide_image($img), $data);
}

add_action('save_post', 'fifu_save_properties_ext');

function fifu_save_properties_ext($post_id) {
    if (isset($_POST['fifu_input_url']))
        return;

    $url = fifu_first_url_in_content($post_id);

    if ($url && fifu_is_on('fifu_get_first')) {
        update_post_meta($post_id, 'fifu_image_url', fifu_convert($url));
        fifu_update_fake_attach_id($post_id);
    }
}

function fifu_first_img_in_content($content) {
    $matches = array();
    preg_match_all('/<img[^>]*>/', $content, $matches);
    return $matches && $matches[0] ? $matches[0][0] : null;
}

function fifu_show_all_images($content) {
    $matches = array();
    preg_match_all('/<img[^>]*display:[ ]*none[^>]*>/', $content, $matches);
    foreach ($matches[0] as $img) {
        $content = str_replace($img, fifu_show_image($img), $content);
    }
    return $content;
}

function fifu_hide_image($img) {
    if (strpos($img, 'style=\"') !== false)
        return preg_replace('/style=..[^"]*["]/', 'style=\"display:none\"', $img);
    return str_replace('/>', ' style=\"display:none\"/>', $img);
}

function fifu_show_image($img) {
    return preg_replace('/style=..display:[ ]*none../', '', $img);
}

function fifu_first_url_in_content($post_id) {
    $content = get_post_field('post_content', $post_id);
    if (!$content)
        return;
    $matches = array();
    preg_match_all('/<img[^>]*>/', $content, $matches);
    if (!$matches[0])
        return;

    //double quotes
    $aux1 = explode('src="', $matches[0][0]);
    if ($aux1) {
        $aux2 = explode('"', $aux1[1]);
    }

    //single quotes
    if (!$aux2[0]) {
        $aux1 = explode("src='", $matches[0][0]);
        if ($aux1)
            $aux2 = explode("'", $aux1[1]);
    }

    return $matches && $matches[0] ? $aux2[0] : null;
}

function fifu_update_fake_attach_id($post_id) {
    if (fifu_is_on('fifu_data_generation')) {
        if (get_option('fifu_fake_attach_id') && !get_post_thumbnail_id($post_id))
            set_post_thumbnail($post_id, get_option('fifu_fake_attach_id'));
        return;
    }

    global $wpdb;
    $posts_table = $wpdb->prefix . 'posts';
    $postmeta_table = $wpdb->prefix . 'postmeta';
    $att_id = get_post_thumbnail_id($post_id);
    $url = fifu_main_image_url($post_id);
    $AUTHOR = 77777;
    if ($att_id && $att_id != null)
        $has_fifu_attachment = $wpdb->get_row('SELECT 1 FROM ' . $posts_table . ' WHERE ID = ' . $att_id . ' AND POST_AUTHOR = ' . $AUTHOR) != null;
    else
        $has_fifu_attachment = false;

    // delete
    if (!fifu_main_image_url($post_id)) {
        if ($has_fifu_attachment) {
            if (fifu_get_default_url()) {
                set_post_thumbnail($post_id, get_option('fifu_default_attach_id'));
            } else {
                wp_delete_attachment($att_id);
                delete_post_thumbnail($post_id);
            }
        } else {
            if (fifu_get_default_url())
                set_post_thumbnail($post_id, get_option('fifu_default_attach_id'));
        }
    }
    // update
    else {
        $alt = get_post_meta($post_id, 'fifu_image_alt', true);
        if ($has_fifu_attachment) {
            update_post_meta($att_id, '_wp_attached_file', ';' . $url);
            update_post_meta($att_id, '_wp_attachment_image_alt', $alt);
            $wpdb->update($posts_table, $set = array('post_title' => $alt), $where = array('id' => $att_id), null, null);
            $wpdb->update($posts_table, $set = array('guid' => $url), $where = array('id' => $att_id), null, null);
        }
        // insert
        else {
            $filename = ';' . fifu_main_image_url($post_id);
            $parent_post_id = $post_id;
            $filetype = wp_check_filetype('fifu.png', null);
            $attachment = array(
                'guid' => fifu_main_image_url($post_id),
                'post_mime_type' => $filetype['type'],
                'post_author' => $AUTHOR,
                'post_title' => $alt,
                'post_excerpt' => '',
                'post_content' => 'Please don\'t remove that. It\'s just an empty symbolic file',
                'post_status' => 'inherit'
            );
            $attach_id = wp_insert_attachment($attachment, $filename, $parent_post_id);
            require_once(ABSPATH . 'wp-admin/includes/image.php');
            $attach_data = wp_generate_attachment_metadata($attach_id, $filename);
            wp_update_attachment_metadata($attach_id, $attach_data);
            set_post_thumbnail($post_id, $attach_id);
            update_post_meta($attach_id, '_wp_attachment_image_alt', $alt);
        }
    }
}

function fifu_ctgr_update_fake_attach_id($term_id) {
    if (fifu_is_on('fifu_data_generation'))
        return;

    global $wpdb;
    $posts_table = $wpdb->prefix . 'posts';
    $postmeta_table = $wpdb->prefix . 'postmeta';
    $termmeta_table = $wpdb->prefix . 'termmeta';
    $aux = $wpdb->get_row('SELECT meta_value FROM ' . $termmeta_table . ' WHERE term_id = ' . $term_id . ' AND meta_key = "thumbnail_id"');
    $att_id = $aux ? $aux->meta_value : null;

    $url = get_term_meta($term_id, 'fifu_image_url', true);

    $AUTHOR = 77777;
    if ($att_id && $att_id != null && $att_id != 0)
        $has_fifu_attachment = $wpdb->get_row('SELECT 1 FROM ' . $posts_table . ' WHERE ID = ' . $att_id . ' AND POST_AUTHOR = ' . $AUTHOR) != null;
    else
        $has_fifu_attachment = false;

    // delete
    if (!$url) {
        if ($has_fifu_attachment) {
            wp_delete_attachment($att_id);
            update_term_meta($term_id, 'thumbnail_id', 0);
        }
    }
    // update
    else {
        $alt = get_term_meta($term_id, 'fifu_image_alt', true);
        if ($has_fifu_attachment) {
            update_post_meta($att_id, '_wp_attached_file', ';' . $url);
            update_post_meta($att_id, '_wp_attachment_image_alt', $alt);
            $wpdb->update($posts_table, $set = array('post_title' => $alt), $where = array('id' => $att_id), null, null);
            $wpdb->update($posts_table, $set = array('guid' => $url), $where = array('id' => $att_id), null, null);
        }
        // insert
        else {
            $filename = ';' . $url;
            $parent_post_id = 0;
            $filetype = wp_check_filetype('fifu.png', null);
            $attachment = array(
                'guid' => $url,
                'post_mime_type' => $filetype['type'],
                'post_author' => $AUTHOR,
                'post_title' => $alt,
                'post_excerpt' => '',
                'post_content' => 'Please don\'t remove that. It\'s just an empty symbolic file',
                'post_status' => 'inherit'
            );
            $attach_id = wp_insert_attachment($attachment, $filename, $parent_post_id);
            require_once(ABSPATH . 'wp-admin/includes/image.php');
            $attach_data = wp_generate_attachment_metadata($attach_id, $filename);
            wp_update_attachment_metadata($attach_id, $attach_data);
            update_term_meta($term_id, 'thumbnail_id', $attach_id);
            update_post_meta($attach_id, '_wp_attachment_image_alt', $alt);
        }
    }
}

