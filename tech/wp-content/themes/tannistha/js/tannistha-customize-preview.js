(function( $ ) {

/**
 * Connects to the Theme Customizer's color picker, and changes the anchor
 * color whenever the user changes colors in the Theme Customizer.
 */
 	wp.customize( 'header_textcolor', function( value ) {
		value.bind( function( to ) {
			$( '.home-banner h1.banner-text, .home-banner h4.banner-text, .all-banner h1.banner-text, .all-banner h4.banner-text' ).css( 'color', to );
		});
	});
  
  wp.customize( 'hide_show_top_header', function( value ) {
		value.bind( function( to ) {
      if( 'off' === to )
        $( '.top-header-band' ).css( 'display', 'none' );
      else
        $( '.top-header-band' ).css( 'display', 'block' );
		});
	});
  
  wp.customize( 'tannistha_top_header_bg_color', function( value ) {
		value.bind( function( to ) {
			$( '.top-header-band' ).css( 'background', to );
		});
	});

	wp.customize( 'tannistha_primary_color', function( value ) {
		value.bind( function( to ) {
			$('h1,h4').not(".banner-text").css( 'color', to );

			$( 'h2, h3, h5, h6, a, cite, .site-header .left-contact, .site-header .logo, .site-header .dc-top-nav li a, .site-header .dc-top-nav li.current-menu-item a, .site-header .dc-top-nav li.current-menu-item li a, .entry .entry-header .entry-title a, .entry .entry-meta span a, .widget ul li a, .navigation .nav-links .nav-previous a, .navigation .nav-links .nav-next a, .entry-comments .comment-list .comment-author-link a, .widget ul ul li a, a.entry-author-link span, .entry-meta span, .widget h3, .site-footer ul.foot-nav li, .site-footer ul.foot-nav li a, .theme_default_menu ul li a, .entry-comments .comment-list .comment-author-link, .entry-comments .comment-list .comment-meta' ).css( 'color', to );

			$( '.search-form input[type="submit"], .comment-respond .comment-form input[type="submit"], .entry .entry-content .button, #back-to-top, input[type="submit"], .navigation .nav-links a.page-numbers, .navigation .nav-links span.dots' ).css( 'background-color', to );
			$( '.entry .entry-content .button, #back-to-top, .navigation .nav-links a.page-numbers, .navigation .nav-links span.dots' ).css( 'color', '#fff' );

			$( 'blockquote' ).css( 'border-color', to );

			$('a').not(".button, #back-to-top").hover(function(){
        	$(this).css("color", wp.customize.instance( 'tannistha_hover_color').get());
        }, function() {
        	$(this).css("color", to);
      });

      $(".navigation .nav-links a.page-numbers, .navigation .nav-links span.dots").hover( function() {
      		$(this).css( 'background-color', wp.customize.instance( 'tannistha_hover_color').get() );
      		$(this).css("color", '#fff');
      	}, function() {
      		$(this).css( 'background-color', to );
      		$(this).css("color", '#fff');
      });
			
			$("a.entry-author-link span, .theme_default_menu ul li a, .theme_default_menu li.current_page_item a, .site-header .dc-top-nav li a, .site-header .dc-top-nav li.current-menu-item a, .site-header .dc-top-nav li.current-menu-item li a").hover(function(){
        	$(this).css("color", wp.customize.instance( 'tannistha_hover_color').get());
        }, function() {
        	$(this).css("color", to);
      });

			$('.navigation li a, .comment-respond .comment-form input[type="submit"], .search-form input[type="submit"], #back-to-top, .entry .entry-content .button').hover(function(){
        	$(this).css("background-color", wp.customize.instance( 'tannistha_hover_color').get());
        }, function() {
        	$(this).css("background-color", to);
      });

      $( '.navigation li.active a, .navigation li.disabled, .entry .entry-content .button:hover' ).css( 'background-color', to );

		});
	});

	wp.customize( 'tannistha_secondary_color', function( value ) {
		value.bind( function( to ) {
			$( 'p, dl dd, ol li, ul li, dl dt, label, table th, pre, .site-header .logo span, .sticky, .comment-form p label, .comment-respond form .comment-notes, .comment-respond .comment-reply-title, .entry-comments .comment-list .comment-meta a, .wp-caption-text, .entry .entry-content p, .entry-comments h3, .entry-comments .comment-list .comment-content, .gallery-caption, .bypostauthor, .commentlist .bypostauthor, .commentlist li ul.children li.bypostauthor, .widget ul li, .site-footer p, .site-footer p a' ).css( 'color', to );

			$( 'input[type="reset"]' ).css( 'background-color', to );
		});
	});

	wp.customize( 'tannistha_hover_color', function( value ) {

		value.bind( function( to ) {

			$('a').not(".button, #back-to-top").hover(function(){
        	$(this).css("color", to);
        }, function() {
        	$(this).css("color", wp.customize.instance( 'tannistha_primary_color').get());
      });
			
			$("a.entry-author-link span, .theme_default_menu ul li a, .theme_default_menu li.current_page_item a, .site-header .dc-top-nav li a, .site-header .dc-top-nav li.current-menu-item a, .site-header .dc-top-nav li.current-menu-item li a").hover(function(){
        	$(this).css("color", to);
        }, function() {
        	$(this).css("color", wp.customize.instance( 'tannistha_primary_color').get());
      });

			$('.navigation li a, .comment-respond .comment-form input[type="submit"], .search-form input[type="submit"], #back-to-top, .entry .entry-content .button, .navigation .nav-links a.page-numbers, .navigation .nav-links span.dots').hover(function(){
        	$(this).css("background-color", to);
        }, function() {
        	$(this).css("background-color", wp.customize.instance( 'tannistha_primary_color').get());
      });

      $( '.navigation li.active a, .navigation li.disabled, .entry .entry-content .button:hover, .navigation .nav-links span.current' ).css( 'background-color', to );

      $(".navigation .nav-links a.page-numbers, .navigation .nav-links span.dots").hover( function() {
      	$(this).css("color", '#fff');
      });

			//$( '.site-header .dc-top-nav li.current-menu-ancestor > a,.site-header .dc-top-nav li.current-menu-parent > a,.site-header .dc-top-nav li.current-menu-item a' ).css( 'color', to );

		});
	});

	wp.customize( 'home_banner', function( value ) {
		value.bind( function( to ) {
			$(".home-banner").css({"background": "url(" + to + ") no-repeat scroll 0 0 / cover"});
		});
	});

	wp.customize( 'tannistha_banner_heading', function( value ) {
		value.bind( function( to ) {
			$( '.home-banner h1' ).text( to );
		});
	});

	wp.customize( 'tannistha_banner_description', function( value ) {
		value.bind( function( to ) {
			$( '.home-banner h4' ).text( to );
		});
	});

	wp.customize( 'tannistha_copyright_text', function( value ) {
		value.bind( function( to ) {
			$( '.site-footer .container p' ).text( to );
		});
	});

	wp.customize( 'tannistha_blog_banner', function( value ) {
		value.bind( function( to ) {
			$(".all-banner").css({"background": "url(" + to + ") no-repeat scroll 0 0 / cover", "min-height" : "270px"});
			$( '.all-banner h1' ).text( wp.customize.instance( 'tannistha_blog_banner_heading').get() );
			$( '.all-banner h4' ).text( wp.customize.instance( 'tannistha_blog_banner_description').get() );
		});
	});

	wp.customize( 'tannistha_blog_banner_heading', function( value ) {
		value.bind( function( to ) {
			$( '.all-banner h1' ).text( to );
		});
	});

	wp.customize( 'tannistha_blog_banner_description', function( value ) {
		value.bind( function( to ) {
			$( '.all-banner h4' ).text( to );
		});
	});

	wp.customize( 'tannistha_post_layout', function( value ) {
		value.bind( function( to ) {
			if ( to == 'post_layout_with_left_sidebar' ) {
				$( '.sidebar-location' ).removeClass( 'hide' );
				$( '.sidebar-location' ).removeClass( 'pull-right' );
				$( '.sidebar-location' ).addClass( 'pull-left' );
				$( '.page-content-location' ).removeClass( 'pull-left' );
				$( '.page-content-location' ).addClass( 'pull-right' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-sm-12' );
				$( '.home-posts .container .row .page-content-location' ).addClass( 'col-sm-9' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-md-9' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-sm-8' );
			}
			if ( to == 'post_layout_with_right_sidebar' ) {
				$( '.sidebar-location' ).removeClass( 'hide' );
				$( '.sidebar-location' ).removeClass( 'pull-left' );
				$( '.sidebar-location' ).addClass( 'pull-right' );
				$( '.page-content-location' ).removeClass( 'pull-right' );
				$( '.page-content-location' ).addClass( 'pull-left' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-sm-12' );
				$( '.home-posts .container .row .page-content-location' ).addClass( 'col-sm-9' );
				$( '.home-posts .container .row .page-content-location' ).addClass( 'col-md-9' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-sm-8' );
			}
			if ( to == 'post_layout_without_sidebar' ) {
				$( '.sidebar-location' ).removeClass( 'pull-left' );
				$( '.sidebar-location' ).removeClass( 'pull-right' );
				$( '.page-content-location' ).removeClass( 'pull-right' );
				$( '.page-content-location' ).removeClass( 'pull-left' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-sm-9' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-md-9' );
				$( '.home-posts .container .row .page-content-location' ).removeClass( 'col-sm-8' );
				$( '.home-posts .container .row .page-content-location' ).addClass( 'col-sm-12' );
				$( '.sidebar-location' ).addClass( 'hide' );
			}
		});
	});

	wp.customize( 'tannistha_page_layout', function( value ) {
		value.bind( function( to ) {
			if ( to == 'page_layout_with_left_sidebar' ) {
				$( '.page-sidebar-location' ).removeClass( 'hide' );
				$( '.page-sidebar-location' ).removeClass( 'pull-right' );
				$( '.page-sidebar-location' ).addClass( 'pull-left' );
				$( '.inner-page-content-location' ).removeClass( 'pull-left' );
				$( '.inner-page-content-location' ).addClass( 'pull-right' );
				$( '.home-posts .container .row .inner-page-content-location' ).removeClass( 'col-sm-12' );
				$( '.home-posts .container .row .inner-page-content-location' ).removeClass( 'col-sm-8' );
				$( '.home-posts .container .row .inner-page-content-location' ).addClass( 'col-sm-9' );
				$( '.home-posts .container .row .inner-page-content-location' ).addClass( 'col-md-9' );
			}
			if ( to == 'page_layout_with_right_sidebar' ) {
				$( '.page-sidebar-location' ).removeClass( 'hide' );
				$( '.page-sidebar-location' ).removeClass( 'pull-left' );
				$( '.page-sidebar-location' ).addClass( 'pull-right' );
				$( '.inner-page-content-location' ).removeClass( 'pull-right' );
				$( '.inner-page-content-location' ).addClass( 'pull-left' );
				$( '.home-posts .container .row .inner-page-content-location' ).removeClass( 'col-sm-12' );
				$( '.home-posts .container .row .inner-page-content-location' ).removeClass( 'col-sm-8' );
				$( '.home-posts .container .row .inner-page-content-location' ).addClass( 'col-sm-9' );
				$( '.home-posts .container .row .inner-page-content-location' ).addClass( 'col-md-9' );
			}
			if ( to == 'page_layout_without_sidebar' ) {
				$( '.page-sidebar-location' ).removeClass( 'pull-left' );
				$( '.page-sidebar-location' ).removeClass( 'pull-right' );
				$( '.inner-page-content-location' ).removeClass( 'pull-right' );
				$( '.inner-page-content-location' ).removeClass( 'pull-left' );
				$( '.home-posts .container .row .inner-page-content-location' ).removeClass( 'col-sm-9' );
				$( '.home-posts .container .row .inner-page-content-location' ).removeClass( 'col-md-9' );
				$( '.home-posts .container .row .inner-page-content-location' ).removeClass( 'col-sm-8' );
				$( '.home-posts .container .row .inner-page-content-location' ).addClass( 'col-sm-12' );
				$( '.page-sidebar-location' ).addClass( 'hide' );
			}
		});
	});

	wp.customize( 'back_to_top', function( value ) {
		value.bind( function( to ) {
			$( '#back-to-top' ).css({"background-image": "url(" + to + ")"});
		});
	});

}( jQuery ));