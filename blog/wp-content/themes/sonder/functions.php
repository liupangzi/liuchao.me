<?php
/**
 * Sage includes
 *
 * The $sage_includes array determines the code library included in your theme.
 * Add or remove files to the array as needed. Supports child theme overrides.
 *
 * Please note that missing files will produce a fatal error.
 *
 * @link https://github.com/roots/sage/pull/1042
 */
$sage_includes = [
    'lib/utils.php',                 // Utility functions
    'lib/init.php',                  // Initial theme setup and constants
    'lib/wrapper.php',               // Theme wrapper class
    'lib/conditional-tag-check.php', // ConditionalTagCheck class
    'lib/config.php',                // Configuration
    'lib/assets_static.php',                // Scripts and stylesheets
    'lib/titles.php',                // Page titles
    'lib/extras.php',                // Custom functions
    'lib/wp_bootstrap_navwalker.php', // Bootstrap nav menu
    'lib/support_functions.php',      // Several support functions
    'lib/theme_customizer.php',      // Theme customizer options
];

foreach ($sage_includes as $file) {
    if (!$filepath = locate_template($file)) {
        trigger_error(sprintf(__('Error locating %s for inclusion', 'sonder'), $file), E_USER_ERROR);
    }

    require_once $filepath;
}
unset($file, $filepath);
