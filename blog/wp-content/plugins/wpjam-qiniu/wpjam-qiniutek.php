<?php
/*
Plugin Name: WPJAM 七牛镜像存储
Description: 使用七牛云存储实现 WordPress 博客静态文件 CDN 加速！
Plugin URI: http://blog.wpjam.com/project/wpjam-qiniutek/
Author: Denis
Author URI: http://blog.wpjam.com/
Version: 0.83
*/

define('WPJAM_QINIUTEK_PLUGIN_URL', plugins_url('', __FILE__));
define('WPJAM_QINIUTEK_PLUGIN_DIR', WP_PLUGIN_DIR.'/'. dirname(plugin_basename(__FILE__)));

// 让插件正确获取最新版的 WPJAM 基本函数库
function wpjam_qiniutek_get_wpjam_include_dir(){
    $wpjam_include_versions = get_transient('wpjam_include_versions');
    $version = '20130310';
    if($wpjam_include_versions === false || empty($wpjam_include_versions[$version])){
        $wpjam_include_versions[$version] = WPJAM_QINIUTEK_PLUGIN_DIR.'/include';
        set_transient('wpjam_include_versions', $wpjam_include_versions, 600);
    }
    krsort($wpjam_include_versions);
    return current($wpjam_include_versions);
}

$wpjam_include_dir = wpjam_qiniutek_get_wpjam_include_dir();

if(!function_exists('wpjam_option_page')){
	include($wpjam_include_dir.'/wpjam-setting-api.php');
}

include(WPJAM_QINIUTEK_PLUGIN_DIR.'/qiniutek-options.php');
if(!function_exists('wpjam_post_thumbnail')){
	include(WPJAM_QINIUTEK_PLUGIN_DIR.'/wpjam-thumbnail.php');
}

//定义在七牛绑定的域名。
if(wpjam_qiniutek_get_setting('host')){
	define('CDN_HOST',wpjam_qiniutek_get_setting('host'));
}
if(wpjam_qiniutek_get_setting('host')){
	define('LOCAL_HOST',wpjam_qiniutek_get_setting('local'));
}else{
	define('LOCAL_HOST',home_url());
}

function wpjam_qiniutek_cdn_replace($html){
	$cdn_exts	= wpjam_qiniutek_get_setting('exts');
	$cdn_dirs	= str_replace('-','\-',wpjam_qiniutek_get_setting('dirs'));

	$html = apply_filters('wpjam_html_replace',$html);

	if($cdn_dirs){
		$regex	=  '/'.str_replace('/','\/',LOCAL_HOST).'\/(('.$cdn_dirs.')\/[^\s\?\\\'\"\;\>\<]{1,}.('.$cdn_exts.'))([\"\\\'\s\?]{1})/';
		$html =  preg_replace($regex, CDN_HOST.'/$1$4', $html);
	}else{
		$regex	= '/'.str_replace('/','\/',LOCAL_HOST).'\/([^\s\?\\\'\"\;\>\<]{1,}.('.$cdn_exts.'))([\"\\\'\s\?]{1})/';
		$html =  preg_replace($regex, CDN_HOST.'/$1$3', $html);
	}

	return $html;
}

if(!is_admin() && defined('CDN_HOST') && CDN_HOST && defined('LOCAL_HOST') && LOCAL_HOST){
	add_action("wp_loaded", 'wpjam_qiniutek_start_ob_cache');
	function wpjam_qiniutek_start_ob_cache(){
		ob_start('wpjam_qiniutek_cdn_replace');
	}
}

add_action( 'wp_enqueue_scripts', 'wpjam_qiniutek_enqueue_scripts', 1 );
function wpjam_qiniutek_enqueue_scripts() {

	if(wpjam_qiniutek_get_setting('jquery')){
		wp_deregister_script( 'jquery' );
	    wp_register_script( 'jquery', 'http://cdn.staticfile.org/jquery/2.0.3/jquery.min.js', array(), '2.0.3' );
	}else{
		wp_deregister_script( 'jquery-core' );
	    wp_register_script( 'jquery-core', 'http://cdn.staticfile.org/jquery/1.10.2/jquery.min.js', array(), '1.10.2' );

		wp_deregister_script( 'jquery-migrate' );
	    wp_register_script( 'jquery-migrate', 'http://cdn.staticfile.org/jquery-migrate/1.2.1/jquery-migrate.min.js', array(), '1.2.1' );
	}
}

//使用七牛缩图 API 进行裁图
add_filter('wpjam_thumbnail','wpjam_get_qiniu_thumbnail',10,4);
function wpjam_get_qiniu_thumbnail($img_url, $width=0, $height=0, $crop=1, $quality='',$format=''){
	if(defined('CDN_HOST')){
		$img_url = str_replace(LOCAL_HOST, CDN_HOST, $img_url);

		if($width || $height){
			$arg = 'imageView/';
			if($crop){
				$arg .= '1';
			}else{
				$arg .= '2';
			}
			if($width)		$arg .= '/w/'.$width;
			if($height) 	$arg .= '/h/'.$height;
			if($quality)	$arg .= '/q/'.$quality;
			if($format)		$arg .= '/format/'.$format;

			$img_url = add_query_arg( array($arg => ''), $img_url );
		}
	}

	$img_url = apply_filters('qiniu_thumb',$img_url,$width,$height,$crop);

	return $img_url;
}
