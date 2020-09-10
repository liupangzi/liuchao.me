<?php
// Redis Object Cache
define('WP_REDIS_CLIENT', 'credis');
define('WP_REDIS_DATABASE', 2);
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'blog_liuchao_me');

/** MySQL database username */
define('DB_USER', 'liuchao');

/** MySQL database password */
define('DB_PASSWORD', 'liuchao');

/** MySQL hostname */
define('DB_HOST', '127.0.0.1');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '4-bH~VtQ|PVa(f`D.}A-~8)Q-A-9X2p{&?EtX>U1@zC1r0j80$Ma5n^PK/-RmJp2');
define('SECURE_AUTH_KEY',  '5mG$MIvk] 0yl;ce4P:/pCH[6u{4<^K_#ML_i;3mW#0AaW*X/GHI$_8x*$Mt~`i/');
define('LOGGED_IN_KEY',    '#&-gk-9!Fc`A*Z;8s?Rd{x_6pc(rarIRAt5cibbZ =N-rn^z5XvPwC#VlyQ#)=>7');
define('NONCE_KEY',        'z>Mzxom_wL`jo_p*N_ojB$^+Y<,@OJ&5^3dGjekC~,:%/-b/Qq;6^$^xrGFK}vF^');
define('AUTH_SALT',        'bCZZ40Z+0^C#{wB/xz9yJ_lB@W7QAIemvZ2)*5(JX7sdC;Yl:)`R8Fhz;][_P40M');
define('SECURE_AUTH_SALT', 'UZo]9q$UuIez(p`6_u?z]L[wLqqE44P1Xtr0k)ls,yK=tH xU4%{Dsh<+H]WgUw>');
define('LOGGED_IN_SALT',   '*8=];0Hjm3,-D#+y]WiL4z?LDYa.#6@Zt.=cmCns3SCGtE*4L4OZukd@5}0zpwKU');
define('NONCE_SALT',       'x]xUgYA/X:DL EP]zfIH?a1gQSQVc24PRjw^f@-@yAts53SDkRQIXR}+r~#<{@nw');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 't_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

