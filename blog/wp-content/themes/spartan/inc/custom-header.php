<?php

  // Add Custom header feature  
function Spartan_custom_header_setup() {
	 
  $spartan_customhargs = array(
	'default-image' => get_template_directory_uri() . '/images/defaulth.png',
	'flex-width'    => true,
	'width'         => 1200,
	'flex-height'    => true,
	'height'        => 500,
	'header-text'   => false,
  );
  
  add_theme_support( 'custom-header', $spartan_customhargs );
  
}
add_action( 'after_setup_theme', 'Spartan_custom_header_setup' );  
?>