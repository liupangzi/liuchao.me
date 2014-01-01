
                            <?php 
								if ( of_get_option('magpro_slider_type') == 'wilto' ) {
									get_template_part( 'slider', 'wilto' );
								} else {
									get_template_part( 'slider', 'cheader' );
								}
							?> 