jQuery( document ).ready( function( $ ) {
	if ( $( '#back-to-top' ).length ) {
		var scrollTrigger = 100, // px
		    backToTop = function () {
		        var scrollTop = $( window ).scrollTop();
		        if ( scrollTop > scrollTrigger ) {
		            $( '#back-to-top' ).addClass( 'show' );
		        } else {
		            $( '#back-to-top' ).removeClass( 'show' );
		        }
		    };
		backToTop();
		$( window ).on( 'scroll', function () {
		    backToTop();
		});
		$( '#back-to-top' ).on( 'click', function ( e ) {
		    e.preventDefault();
		    $( 'html,body' ).animate({
		        scrollTop: 0
		    }, 700 );
		});
	}

	//Responsive Navbar
	var navLi = $('.navbar-nav li');
	navLi.each(function() {
		if ( $(this).find('ul').length > 0 && !$(this).hasClass('has_children') ){
		   $(this).addClass('has_children');
		   $(this).find('a').first().after('<p class="dropdownMarker"></p>');
		}
	});
	$('.dropdownMarker').click(function() {
		if( $(this).parent('li').hasClass('this-open') ) {
		   $(this).parent('li').removeClass('this-open');
		}
		else {
		   $(this).parent('li').addClass('this-open');
		}
	});
	navLi.find('a').click(function() {
		$('.navbar-toggle').addClass('collapsed');
		$('.collapse').removeClass('in');
	});

});