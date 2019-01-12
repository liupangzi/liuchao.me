<?php

class FifuDb {

    private $posts;
    private $postmeta;
    private $termmeta;
    private $term_taxonomy;
    private $term_relationships;
    private $query;
    private $wpdb;
    private $author;

    function __construct() {
        global $wpdb;
        $this->wpdb = $wpdb;
        $this->posts = $wpdb->prefix . 'posts';
        $this->postmeta = $wpdb->prefix . 'postmeta';
        $this->termmeta = $wpdb->prefix . 'termmeta';
        $this->term_taxonomy = $wpdb->prefix . 'term_taxonomy';
        $this->term_relationships = $wpdb->prefix . 'term_relationships';
        $this->author = 77777;
        $this->MAX_INSERT = 100;
        $this->MAX_URL_LENGTH = 2048;
    }

    /* alter table */

    function change_url_length() {
        $this->wpdb->get_results("
            ALTER TABLE " . $this->posts . "
            MODIFY COLUMN guid VARCHAR(" . $this->MAX_URL_LENGTH . ")"
        );
    }

    /* attachment meta data */

    // insert 1 _wp_attached_file for each attachment
    function insert_attachment_meta_url($ids) {
        $this->wpdb->get_results("
            INSERT INTO " . $this->postmeta . " (post_id, meta_key, meta_value) (
                SELECT p.id, '_wp_attached_file', CONCAT(';', p.guid) 
                FROM " . $this->posts . " p 
                WHERE p.post_parent IN (" . $ids . ") 
                AND p.post_type = 'attachment' 
                AND p.post_author = " . $this->author . " 
                AND NOT EXISTS (
                    SELECT 1 
                    FROM " . $this->postmeta . " 
                    WHERE post_id = p.post_parent 
                    AND meta_key = '_wp_attached_file'
                )
            )"
        );
    }

    // delete 1 _wp_attached_file or _wp_attachment_image_alt for each attachment
    function delete_attachment_meta($ids) {
        $this->wpdb->get_results("
            DELETE FROM " . $this->postmeta . "
            WHERE meta_key IN ('_wp_attached_file', '_wp_attachment_image_alt')
            AND EXISTS (
                SELECT 1 
                FROM " . $this->posts . " p
                WHERE p.id = post_id
                AND p.post_parent IN (" . $ids . ")
                AND p.post_type = 'attachment' 
                AND p.post_author = " . $this->author . " 
            )"
        );
    }

    // insert 1 _wp_attachment_image_alt for each attachment
    function insert_attachment_meta_alt($ids) {
        $this->wpdb->get_results("
            INSERT INTO " . $this->postmeta . " (post_id, meta_key, meta_value) (
                SELECT p.id, '_wp_attachment_image_alt', p.post_title 
                FROM " . $this->posts . " p 
                WHERE p.post_parent IN (" . $ids . ") 
                AND p.post_type = 'attachment' 
                AND p.post_author = " . $this->author . " 
                AND NOT EXISTS (
                    SELECT 1 
                    FROM " . $this->postmeta . " 
                    WHERE post_id = p.post_parent 
                    AND meta_key = '_wp_attachment_image_alt'
                )
            )"
        );
    }

    // insert 1 _thumbnail_id for each attachment (posts)
    function insert_thumbnail_id($ids) {
        $this->wpdb->get_results("
            INSERT INTO " . $this->postmeta . " (post_id, meta_key, meta_value) (
                SELECT p.post_parent, '_thumbnail_id', p.id 
                FROM " . $this->posts . " p 
                WHERE p.post_parent IN (" . $ids . ") 
                AND p.post_type = 'attachment' 
                AND p.post_author = " . $this->author . " 
                AND NOT EXISTS (
                    SELECT 1 
                    FROM " . $this->postmeta . " 
                    WHERE post_id = p.post_parent 
                    AND meta_key = '_thumbnail_id'
                )
            )"
        );
    }

    // get ids from categories with external media and no thumbnail_id
    function get_categories_without_meta() {
        return $this->wpdb->get_results("
            SELECT DISTINCT term_id
            FROM " . $this->termmeta . " a
            WHERE a.meta_key IN ('fifu_image_url')
            AND a.meta_value IS NOT NULL 
            AND a.meta_value <> ''
            AND NOT EXISTS (
                SELECT 1 
                FROM " . $this->termmeta . " b 
                WHERE a.term_id = b.term_id 
                AND b.meta_key = 'thumbnail_id'
                AND b.meta_value <> 0
            )"
        );
    }

    // get ids from posts with external media and no _thumbnail_id
    function get_posts_without_meta() {
        return $this->wpdb->get_results("
            SELECT DISTINCT post_id
            FROM " . $this->postmeta . " a
            WHERE a.meta_key IN ('fifu_image_url')
            AND a.meta_value IS NOT NULL 
            AND a.meta_value <> ''
            AND NOT EXISTS (
                SELECT 1 
                FROM " . $this->postmeta . " b 
                WHERE a.post_id = b.post_id 
                AND b.meta_key = '_thumbnail_id'
            )"
        );
    }

    // get ids from posts with external url
    function get_posts_with_url() {
        return $this->wpdb->get_results("
            SELECT post_id 
            FROM " . $this->postmeta . " 
            WHERE meta_key = 'fifu_image_url'"
        );
    }

    // get ids from terms with external url
    function get_terms_with_url() {
        return $this->wpdb->get_results("
            SELECT term_id 
            FROM " . $this->termmeta . " 
            WHERE meta_key = 'fifu_image_url'
            AND meta_value <> ''
            AND meta_value IS NOT NULL"
        );
    }

    // get ids from fake attachments
    function get_fake_attachments() {
        return $this->wpdb->get_results("
            SELECT id 
            FROM " . $this->posts . " 
            WHERE post_type = 'attachment' 
            AND post_author = " . $this->author
        );
    }

    // clean meta data

    function delete_thumbnail_ids($ids) {
        $this->wpdb->get_results("
            DELETE FROM " . $this->postmeta . " 
            WHERE meta_key = '_thumbnail_id' 
            AND meta_value IN (" . $ids . ")"
        );
    }

    function delete_thumbnail_ids_category($ids) {
        $this->wpdb->get_results("
            DELETE FROM " . $this->termmeta . " 
            WHERE meta_key = 'thumbnail_id' 
            AND term_id IN (" . $ids . ")"
        );
    }

    function delete_thumbnail_ids_category_without_attachment() {
        $this->wpdb->get_results("
            DELETE FROM " . $this->termmeta . " 
            WHERE meta_key = 'thumbnail_id' 
            AND NOT EXISTS (
                SELECT 1 
                FROM " . $this->posts . " p 
                WHERE p.id = meta_value
            )"
        );
    }

    function delete_invalid_thumbnail_ids($ids) {
        $this->wpdb->get_results("
            DELETE FROM " . $this->postmeta . " 
            WHERE meta_key = '_thumbnail_id' 
            AND post_id IN (" . $ids . ") 
            AND (
                meta_value = -1 
                OR meta_value IS NULL 
                OR meta_value LIKE 'fifu:%'
            )"
        );
    }

    function delete_fake_thumbnail_id($ids) {
        $att_id = get_option('fifu_fake_attach_id');
        if ($att_id) {
            $this->wpdb->get_results("
                DELETE FROM " . $this->postmeta . " 
                WHERE meta_key = '_thumbnail_id' 
                AND post_id IN (" . $ids . ") 
                AND meta_value = " . $att_id
            );
        }
    }

    function delete_attachments($ids) {
        $this->wpdb->get_results("
            DELETE FROM " . $this->posts . " 
            WHERE id IN (" . $ids . ")"
        );
    }

    function delete_attachment_meta_url($ids) {
        $this->wpdb->get_results("
            DELETE FROM " . $this->postmeta . " 
            WHERE meta_key = '_wp_attached_file' 
            AND post_id IN (" . $ids . ")"
        );
    }

    function delete_thumbnail_id_without_attachment() {
        $this->wpdb->get_results("
            DELETE FROM " . $this->postmeta . " 
            WHERE meta_key = '_thumbnail_id' 
            AND NOT EXISTS (
                SELECT 1 
                FROM " . $this->posts . " p 
                WHERE p.id = meta_value
            )"
        );
    }

    function delete_attachment_meta_without_attachment() {
        $this->wpdb->get_results("
            DELETE FROM " . $this->postmeta . " 
            WHERE meta_key IN ('_wp_attached_file', '_wp_attachment_image_alt') 
            AND NOT EXISTS (
                SELECT 1
                FROM " . $this->posts . " p 
                WHERE p.id = post_id
            )"
        );
    }

    function delete_empty_urls_category() {
        $this->wpdb->get_results("
            DELETE FROM " . $this->termmeta . " 
            WHERE meta_key = 'fifu_image_url'
            AND (
                meta_value = ''
                OR meta_value is NULL
            )"
        );
    }

    function delete_empty_urls() {
        $this->wpdb->get_results("
            DELETE FROM " . $this->postmeta . " 
            WHERE meta_key = 'fifu_image_url'
            AND (
                meta_value = ''
                OR meta_value is NULL
            )"
        );
    }

    /* insert attachment */

    function insert_attachment_by($value) {
        $this->wpdb->get_results("
            INSERT INTO " . $this->posts . " (post_author, guid, post_title, post_mime_type, post_type, post_status, post_parent, post_date, post_date_gmt, post_modified, post_modified_gmt, post_content, post_excerpt, to_ping, pinged, post_content_filtered) 
            VALUES " . $value);
    }

    function get_formatted_value($url, $alt, $post_parent) {
        return "(" . $this->author . ", '" . $url . "', '" . $alt . "', 'image/jpeg', 'attachment', 'inherit', '" . $post_parent . "', now(), now(), now(), now(), '', '', '', '', '')";
    }

    /* insert fake internal featured image */

    function insert_attachment_category() {
        $ids = null;
        $value = null;
        $i = 0;
        // insert 1 attachment for each selected category
        foreach ($this->get_categories_without_meta() as $res) {
            $ids = ($i++ == 0) ? $res->term_id : ($ids . "," . $res->term_id);
            $url = get_term_meta($res->term_id, 'fifu_image_url', true);
            $value = $this->get_formatted_value($url, get_term_meta($res->term_id, 'fifu_image_alt', true), $res->term_id);
            $this->insert_attachment_by($value);
            $att_id = $this->wpdb->insert_id;
            update_term_meta($res->term_id, 'thumbnail_id', $att_id);
        }
        if ($ids) {
            $this->insert_attachment_meta_url($ids);
            $this->insert_attachment_meta_alt($ids);
        }
    }

    function insert_attachment() {
        $ids = null;
        $value = null;
        $i = 1;
        $count = 1;
        // insert 1 attachment for each selected post
        $result = $this->get_posts_without_meta();
        foreach ($result as $res) {
            $ids = ($i == 1) ? $res->post_id : ($ids . "," . $res->post_id);
            $aux = $this->get_formatted_value(fifu_main_image_url($res->post_id), get_post_meta($res->post_id, 'fifu_image_alt', true), $res->post_id);
            $value = ($i == 1) ? $aux : ($value . "," . $aux);
            if ($value && (($i % $this->MAX_INSERT == 0) || ($i % $this->MAX_INSERT != 0 && count($result) == $count))) {
                $this->insert_attachment_by($value);
                $this->insert_thumbnail_id($ids);
                $this->insert_attachment_meta_url($ids);
                $this->insert_attachment_meta_alt($ids);
                $ids = null;
                $value = null;
                $i = 1;
            } else
                $i++;
            $count++;
        }
    }

    /* delete fake internal featured image */

    function delete_attachment() {
        $ids = null;
        $i = 0;
        // delete fake attachments and _thumbnail_ids
        foreach ($this->get_fake_attachments() as $res)
            $ids = ($i++ == 0) ? $res->id : ($ids . "," . $res->id);
        if ($ids) {
            $this->delete_thumbnail_ids($ids);
            $this->delete_attachments($ids);
        }

        $ids = null;
        $i = 0;
        // delete attachment data and more _thumbnail_ids
        foreach ($this->get_posts_with_url() as $res)
            $ids = ($i++ == 0) ? $res->post_id : ($ids . "," . $res->post_id);
        if ($ids) {
            $this->delete_invalid_thumbnail_ids($ids);
            $this->delete_fake_thumbnail_id($ids);
            $this->delete_attachment_meta_url($ids);
        }

        // delete data without attachment
        $this->delete_thumbnail_id_without_attachment();
        $this->delete_attachment_meta_without_attachment();

        $this->delete_empty_urls();
    }

    function delete_attachment_category() {
        $ids = null;
        $i = 0;
        foreach ($this->get_terms_with_url() as $res)
            $ids = ($i++ == 0) ? $res->term_id : ($ids . "," . $res->term_id);
        if ($ids) {
            $this->delete_thumbnail_ids_category($ids);
            $this->delete_attachment_meta($ids);
            $this->delete_thumbnail_ids_category_without_attachment();
        }
        $this->delete_empty_urls_category();
    }

}

/* fake internal featured image */

function fifu_db_insert_attachment_category() {
    $db = new FifuDb();
    $db->insert_attachment_category();
}

function fifu_db_insert_attachment() {
    $db = new FifuDb();
    $db->insert_attachment();
}

function fifu_db_delete_attachment_category() {
    $db = new FifuDb();
    $db->delete_attachment_category();
}

function fifu_db_delete_attachment() {
    $db = new FifuDb();
    $db->delete_attachment();
}

function fifu_db_change_url_length() {
    $db = new FifuDb();
    $db->change_url_length();
}

