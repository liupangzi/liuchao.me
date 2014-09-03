<?php
/** Enable W3 Total Cache Edge Mode */
define('W3TC_EDGE_MODE', true); // Added by W3 Total Cache

/** Enable W3 Total Cache */
define('WP_CACHE', true); // Added by W3 Total Cache

/**
 * WordPress基础配置文件。
 *
 * 本文件包含以下配置选项：MySQL设置、数据库表名前缀、密钥、
 * WordPress语言设定以及ABSPATH。如需更多信息，请访问
 * {@link http://codex.wordpress.org/zh-cn:%E7%BC%96%E8%BE%91_wp-config.php
 * 编辑wp-config.php}Codex页面。MySQL设置具体信息请咨询您的空间提供商。
 *
 * 这个文件被安装程序用于自动生成wp-config.php配置文件，
 * 您可以手动复制这个文件，并重命名为“wp-config.php”，然后填入相关信息。
 *
 * @package WordPress
 */

// ** MySQL 设置 - 具体信息来自您正在使用的主机 ** //
/** WordPress数据库的名称 */
define('DB_NAME', 'blog_liuchao_me');

/** MySQL数据库用户名 */
define('DB_USER', 'root');

/** MySQL数据库密码 */
define('DB_PASSWORD', '');

/** MySQL主机 */
define('DB_HOST', '127.0.0.1');

/** 创建数据表时默认的文字编码 */
define('DB_CHARSET', 'utf8');

/** 数据库整理类型。如不确定请勿更改 */
define('DB_COLLATE', '');

/**#@+
 * 身份认证密钥与盐。
 *
 * 修改为任意独一无二的字串！
 * 或者直接访问{@link https://api.wordpress.org/secret-key/1.1/salt/
 * WordPress.org密钥生成服务}
 * 任何修改都会导致所有cookies失效，所有用户将必须重新登录。
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '@4oWIkveFjib]+aLd4LU;1@Bv[{eY.kmc?FEU6o!j=p!27w_5d1?n+FY<IaLNe+%');
define('SECURE_AUTH_KEY',  'Jt8?y(|os9_//@Z^9Sq3n@.)rG~7QDs|aodd[AcdS?N_-p~O:ZX|L/2J$3Po AI^');
define('LOGGED_IN_KEY',    'Fg9XPX/(j B{k#lMIRbfDPA|riVjM@H`CU}$qIbsdpS|W#_>t;u;Bh(^}cSR~enR');
define('NONCE_KEY',        'bLysN88.o+Q}5Fa9qe<VH[WU`V`1:O)4sdwg{rZ`a hH_NA#)8,L~1VKUh!S;+/<');
define('AUTH_SALT',        'gw+&&s#fL^Q+.c%-(ITj_OY&ZS0ifI=~MKs@f)@-v-9v 5%?A(2-?dMy6S.efuE!');
define('SECURE_AUTH_SALT', '5d<DB}=NbXPb>]l?T(5Y7U4hAKwBa+Ii-sGO;dJ=XA4DGuD/<iJgp5J+a-+VEzJE');
define('LOGGED_IN_SALT',   'CD_K-<]@/Ev$(>/BTRaEK<4=TPmp0H+fldnsg^z%vF3fLofUo+DC[kW~EyHwQsVW');
define('NONCE_SALT',       'h3BMKUZ`w#Mz8O_-q$#`U!+dD3S3Tdo]e28e!ZCd>z{-a4d]5jYiV+~l-/qJ{kZc');

/**#@-*/

/**
 * WordPress数据表前缀。
 *
 * 如果您有在同一数据库内安装多个WordPress的需求，请为每个WordPress设置
 * 不同的数据表前缀。前缀名只能为数字、字母加下划线。
 */
$table_prefix  = 'lc_';

/**
 * WordPress语言设置，中文版本默认为中文。
 *
 * 本项设定能够让WordPress显示您需要的语言。
 * wp-content/languages内应放置同名的.mo语言文件。
 * 例如，要使用WordPress简体中文界面，请在wp-content/languages
 * 放入zh_CN.mo，并将WPLANG设为'zh_CN'。
 */
define('WPLANG', 'zh_CN');

/**
 * 开发者专用：WordPress调试模式。
 *
 * 将这个值改为true，WordPress将显示所有用于开发的提示。
 * 强烈建议插件开发者在开发环境中启用WP_DEBUG。
 */
define('WP_DEBUG', false);

/**
 * zh_CN本地化设置：启用ICP备案号显示
 *
 * 可在设置→常规中修改。
 * 如需禁用，请移除或注释掉本行。
 */
define('WP_ZH_CN_ICP_NUM', true);

/* 好了！请不要再继续编辑。请保存本文件。使用愉快！ */

/** WordPress目录的绝对路径。 */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** 设置WordPress变量和包含文件。 */
require_once(ABSPATH . 'wp-settings.php');
