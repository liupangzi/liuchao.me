<?php

add_action( 'admin_menu', 'wpjam_qiniutek_admin_menu');
function wpjam_qiniutek_admin_menu() {
	//add_menu_page(						'七牛镜像存储',			'七牛镜像存储',	'manage_options',	'wpjam-qiniutek',		'wpjam_qiniutek_setting_page',	QINIUTEK_PLUGIN_URL.'/static/qiniutek-ico.png'	);
	add_menu_page(						'七牛镜像存储',			'七牛镜像存储',	'manage_options',	'wpjam-qiniutek',		'wpjam_qiniutek_setting_page',	'dashicons-cloud'	);
	add_submenu_page( 'wpjam-qiniutek',	'七牛镜像存储设置',		'基本设置',		'manage_options',	'wpjam-qiniutek',		'wpjam_qiniutek_setting_page'	);
	if( wpjam_qiniutek_get_setting('bucket') && wpjam_qiniutek_get_setting('access') && wpjam_qiniutek_get_setting('secret') ){
		add_submenu_page( 'wpjam-qiniutek',	'七牛镜像存储 &gt; 文件更新',			'文件更新',		'manage_options',	'wpjam-qiniutek-update','wpjam_qiniutek_update_page'	);
		add_submenu_page( 'wpjam-qiniutek',	'七牛镜像存储 &gt; 上传 Robots.txt',	'Robots.txt',	'manage_options',	'wpjam-qiniutek-robots','wpjam_qiniutek_robots_page'	);
	}
	add_submenu_page( 'wpjam-qiniutek',	'七牛镜像存储 &gt; 优惠码','优惠码',	'manage_options',	'wpjam-qiniutek-coupon','wpjam_qiniutek_coupon_page'	);
	if(!function_exists('wpjam_net_check_domain')){
		$wpjam_include_dir = wpjam_qiniutek_get_wpjam_include_dir();
		include($wpjam_include_dir.'/wpjam-net-api.php');	// WPJAM 应用商城接口
		remove_action('admin_menu', 'wpjam_net_admin_menu' );
		add_submenu_page( 'wpjam-qiniutek', 	'WPJAM应用商城', 		'WPJAM应用商城', 					'manage_options',	'wpjam-net',		'wpjam_net_page');
	}	
}

function wpjam_qiniutek_setting_page() {
	settings_errors();
	$labels =wpjam_qiniutek_get_option_labels();
	wpjam_option_page($labels, $title='七牛镜像存储设置', $type='default', $icon='qiniutek');
}


add_action( 'admin_init', 'wpjam_qiniutek_admin_init' );
function wpjam_qiniutek_admin_init() {
	wpjam_add_settings(wpjam_qiniutek_get_option_labels(),wpjam_qiniutek_get_default_option());
}


function wpjam_qiniutek_get_option_labels(){
	$option_group               =   'wpjam-qiniutek-group';
	$option_name = $option_page =   'wpjam-qiniutek';
	$field_validate				=	'wpjam_qiniutek_validate';


	$qiniutek_fields = array(
		'host'	=> array('title'=>'七牛绑定的域名',	'type'=>'text',		'description'=>'设置为你在七牛绑定的域名即可。<strong>注意要域名前面要加上 http://</strong>。<br />如果博客安装的是在子目录下，比如 http://www.xxx.com/blog/，这里也需要带上子目录 /blog/ '),
		'bucket'=> array('title'=>'七牛空间名',		'type'=>'text',		'description'=>'设置为你在七牛绑定的空间名即可。'),
		
		'access'=> array('title'=>'ACCESS KEY',		'type'=>'text'),
		'secret'=> array('title'=>'SECRET KEY',		'type'=>'text'),
	);

	$local_fields = array(		
		'exts'	=> array('title'=>'扩展名',			'type'=>'text',		'description'=>'设置要缓存静态文件的扩展名，请使用 | 分隔开，|前后都不要留空格。'),
		'dirs'	=> array('title'=>'目录',			'type'=>'text',		'description'=>'设置要缓存静态文件所在的目录，请使用 | 分隔开，|前后都不要留空格。'),
		'local'	=> array('title'=>'静态文件域名',		'type'=>'text',		'description'=>'如果图片等静态文件存储的域名和网站不同，可通过该字段设置。<br />使用该字段设置静态域名之后，请确保 JS 和 CSS 等文件也在该域名下，否则将不会加速。'),
		'jquery'=> array('title'=>'使用 jQuery 2.0',	'type'=>'checkbox',	'description'=>'jQuery 2.0 不再支持 IE 6/7/8，如果你的网站是面向移动或者不再向低端 IE 用户提供服务，可以勾选该选项。'),
	);

	$sections = array( 
    	'qiniutek-section'	=>array('title'=>'七牛设置',	'callback'=>'',	'fields'=>$qiniutek_fields),
    	'local-section'		=>array('title'=>'本地设置',	'callback'=>'',	'fields'=>$local_fields),
	);

	$sections =  apply_filters('qiniutek_setting',$sections);

	return compact('option_group','option_name','option_page','sections','field_validate');
}

function wpjam_qiniutek_get_default_option(){
 	$defaults = array(
		'host'		=> '',
		'bucket'	=> '',
		'access'	=> '',
		'secret'	=> '',
		'exts'		=> 'js|css|png|jpg|jpeg|gif|ico', 
		'dirs'		=> 'wp-content|wp-includes',
		'local'		=> home_url(),
		'jquery'	=> '0',
	);

	return  apply_filters('qiniutek_defaults',$defaults);
}

function wpjam_qiniutek_validate( $wpjam_qiniutek ) {
	$current = get_option( 'wpjam-qiniutek' );

	if(empty($wpjam_qiniutek['minify'])){ //checkbox 未选，Post 的时候 $_POST 中是没有的，
		$wpjam_qiniutek['minify'] = 0;
	}

	if(empty($wpjam_qiniutek['jquery'])){ //checkbox 未选，Post 的时候 $_POST 中是没有的，
		$wpjam_qiniutek['jquery'] = 0;
	}

	return $wpjam_qiniutek;
}

function wpjam_qiniutek_get_setting($setting_name){
	$option = wpjam_qiniutek_get_option();
	return wpjam_get_setting($option, $setting_name);
}

function wpjam_qiniutek_get_option(){
	$defaults = wpjam_qiniutek_get_default_option();
	return wpjam_get_option('wpjam-qiniutek',$defaults);
}

/**
* 优惠码 
**/

function wpjam_qiniutek_coupon_page(){
?>
	<div class="wrap">
		<div id="icon-qiniutek" class="icon32"><br></div>
		<h2>如何使用七牛云存储的优惠码</h2>
		<p>简单说就是<strong>复制专属我爱水煮鱼用户的优惠码“<span style="color:red;">63ff63a6</span>”，充值就能享受9折优惠</strong>。</p>
		<p>1. 登陆七牛开发者平台：<a href="https://portal.qiniu.com/">https://portal.qiniu.com/</a></p>
		<p>2. 然后点击“充值”，进入充值页面</p>
		<p><img src="<?php echo WPJAM_QINIUTEK_PLUGIN_URL; ?>/static//qiniu-coupon.png" alt="使用七牛优惠码" /></p>
		<p>3. 点击“使用优惠码”，并输入优惠码“<strong><span style="color:red;">63ff63a6</span></strong>”，点击“使用”。</p>
		<p>4. 输入计划充值的金额，点击“马上充值”，进入支付宝页面，完成支付。<br />
		*注意七牛的优惠不是在原价上优惠，是赠送的方式，所以比如你要充值100，你只要输入90即可，这个需要数学比较好的同学算下 <img src="http://wpjam.qiniudn.com/wpjam/smilies/icon_smile.gif" alt=":-)" class="wp-smiley" />  。</p>
		<p>5. 完成支付后，可至财务->>财务概况->>账户余额 查看实际到账金额。</p>
		<h3>新功能调查</h3>
		<iframe width="450" height="350"   frameborder="0" scrolling="no" src="http://vote.weibo.com/widget?vid=2560005&skin=1&isCustom=0&width=450&height=350&pad=20&isResult=1"></iframe>	
	</div>
<?php

}

/**
 * 更新缓存 
 **/

function wpjam_qiniutek_update_page(){
	global $plugin_page;

	$updates = '';
	
	if( $_SERVER['REQUEST_METHOD'] == 'POST' ){

		if ( !wp_verify_nonce($_POST[$plugin_page],'wpjam_qiniutek') ){
			ob_clean();
			wp_die('非法操作');
		}
		
		$updates = ($_POST['updates']);

		$updates_array = explode("\n", $updates);

		$msg = '';
		foreach ($updates_array as $update) {
			if(trim($update)){
				$msg = $msg.$update.wpjam_qiniutek_update_file($update);
			}
		}
	}

	?>
	<div class="wrap">
		<div id="icon-qiniutek" class="icon32"><br></div>
		<h2>更新文件</h2>

		<?php if(!empty($msg)){?>
		<div class="updated">
			<p><?php echo $msg;?></p>
		</div>
		<?php }?>

		<form method="post" action="<?php echo admin_url('admin.php?page='.$plugin_page); ?>" enctype="multipart/form-data" id="form">
		<table class="form-table" cellspacing="0">
			<tbody>
				<tr valign="top">
					<td>
						<p>请输入需要更新的文件，每行一个：</p>
						<textarea name="updates" rows="10" cols="50" id="updates" class="large-text code"><?php echo $updates; ?></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<?php wp_nonce_field('wpjam_qiniutek',$plugin_page); ?>
		<input type="hidden" name="action" value="edit" />
		<p class="submit"><input class="button-primary" type="submit" value="更新文件" /></p>
		</form>
		<ol>
			<li>点击“更新文件”按钮之后，只要文件后面显示更新成功，即代表更新成功。</li>
			<li>如果实时查看还是旧的文件，可能是你浏览器的缓存，你需要清理下缓存，或者等待自己更新。</li>
			<li>图片缩略图更新七牛是按照按照队列顺序进行的，需要等待一定的时间，只要看到原图更新即可。</li>
		</ol>
	</div>
<?php
}

/**
 * 提交 Robots 
 **/

function wpjam_qiniutek_robots_page(){
	global $plugin_page;

	if( $_SERVER['REQUEST_METHOD'] == 'POST' ){

		if ( !wp_verify_nonce($_POST[$plugin_page],'wpjam_qiniutek') ){
			ob_clean();
			wp_die('非法操作');
		}
		
		$robots = ($_POST['robots']);

		if($robots){
			$msg = '';

			update_option('qiniutek_robots',$robots);

			wpjam_qiniutek_update_file('robots.txt'); // 如果有，先清理。
			$msg = wpjam_qiniutek_put('robots.txt', $robots); // 再上传

		}
	}

	$qiniutek_robots = get_option('qiniutek_robots');

	if(!$qiniutek_robots){
		$qiniutek_robots = '
User-agent: *
Disallow: /
User-agent: Googlebot-Image
Allow: /
User-agent: Baiduspider-image
Allow: /
		';
	}

	?>
	<div class="wrap">
		<div id="icon-qiniutek" class="icon32"><br></div>
		<h2>上传 Robots.txt</h2>

		<?php if(!empty($msg)){?>
		<div class="updated">
			<p><?php echo $msg;?></p>
		</div>
		<?php }?>

		<form method="post" action="<?php echo admin_url('admin.php?page='.$plugin_page); ?>" enctype="multipart/form-data" id="form">
		<table class="form-table" cellspacing="0">
			<tbody>
				<tr valign="top">
					<td>
						<p>上传 Robots.txt 文件，防止搜索引擎索引镜像的网页。</p>
						<textarea name="robots" rows="10" cols="50" id="robots" class="large-text code"><?php echo $qiniutek_robots; ?></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<?php wp_nonce_field('wpjam_qiniutek',$plugin_page); ?>
		<input type="hidden" name="action" value="edit" />
		<p class="submit"><input class="button-primary" type="submit" value="更新Robots.txt" /></p>
		</form>
	</div>
<?php
}

function wpjam_qiniutek_update_file($file){
	global $qiniutek_client;

	if(!$qiniutek_client){
		$qiniutek_client = wpjam_get_qiniutek_client();
	}

	$wpjam_qiniutek = get_option( 'wpjam-qiniutek' );
	$qiniutek_bucket = $wpjam_qiniutek['bucket'];

	$file_array = parse_url($file);
	$key = str_replace('http://'.$file_array['host'].'/', '', $file);
	$err = Qiniu_RS_Delete($qiniutek_client, $qiniutek_bucket, $key);

	if ($err !== null) {
		$msg = ' 发生错误：<span style="color:red">'.$err->Err.'</span><br />';
	} else {
		$msg = ' 清理成功<br />';
	}
	return $msg;
}

function wpjam_qiniutek_put_file($key, $file){
	global $qiniutek_client;

	if(!$qiniutek_client){
		$qiniutek_client = wpjam_get_qiniutek_client();
	}

	$wpjam_qiniutek = get_option( 'wpjam-qiniutek' );
	$qiniutek_bucket = $wpjam_qiniutek['bucket'];

	$putPolicy = new Qiniu_RS_PutPolicy($bucket);
	$upToken = $putPolicy->Token(null);

	if(!function_exists('Qiniu_Put')){
		require_once(WP_CONTENT_DIR."/plugins/wpjam-qiniu/sdk/io.php");
	}

	list($ret, $err) = Qiniu_PutFile($upToken, $key, $file);
	if ($err !== null) {
		$msg = ' 发生错误：<span style="color:red">'.$err->Err.'</span><br />';
	} else {
		$msg = ' 上传成功<br />';
	}
	return $msg;
}

function wpjam_qiniutek_put($key, $str){
	global $qiniutek_client;

	if(!$qiniutek_client){
		$qiniutek_client = wpjam_get_qiniutek_client();
	}

	$wpjam_qiniutek = get_option( 'wpjam-qiniutek' );
	$qiniutek_bucket = $wpjam_qiniutek['bucket'];

	$putPolicy = new Qiniu_RS_PutPolicy($qiniutek_bucket);
	$upToken = $putPolicy->Token(null);

	if(!function_exists('Qiniu_Put')){
		require_once(WP_CONTENT_DIR."/plugins/wpjam-qiniu/sdk/io.php");
	}

	list($ret, $err) = Qiniu_Put($upToken, $key, $str, null);

	if ($err !== null) {
		$msg = ' 发生错误：<span style="color:red">'.$err->Err.'</span><br />';
	} else {
		$msg = ' 上传成功<br />';
	}
	return $msg;
}

function wpjam_get_qiniutek_client(){

	$wpjam_qiniutek = get_option( 'wpjam-qiniutek' );
	if(!class_exists('Qiniu_MacHttpClient')){
		require_once(WP_CONTENT_DIR."/plugins/wpjam-qiniu/sdk/rs.php");
	}	
	Qiniu_SetKeys($wpjam_qiniutek['access'], $wpjam_qiniutek['secret']);
	$qiniutek_client = new Qiniu_MacHttpClient(null);

	return $qiniutek_client;
}