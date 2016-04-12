<?php

if (!function_exists('sonder_has_custom_background')) {
    function sonder_has_custom_background()
    {
        return get_background_image() !== '' || get_background_color() !== '';
    }
}
if (!function_exists('sonder_check_email')) {
    function sonder_check_email($value)
    {
        $value = sanitize_email($value);
        return (is_email($value)) ? $value : null;
    }
}


