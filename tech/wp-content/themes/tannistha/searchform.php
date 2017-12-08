<?php
/**
 * Template for displaying search forms in Tannistha
 */
?>
  <div class="widget-wrap">
		<form role="search" method="get" class="search-form" action="<?php echo esc_url( home_url( '/' ) ); ?>">
			<input type="search" class="search-field" placeholder="<?php echo esc_attr_x( 'Search your criteria', 'placeholder', 'tannistha' ); ?>" value="<?php echo get_search_query(); ?>" name="s" />
			<input type="submit" class="search-submit" value="" /><?php echo _x( '<span class="fa fa-search"></span>', 'submit input', 'tannistha' ); ?>
		</form>
	</div>