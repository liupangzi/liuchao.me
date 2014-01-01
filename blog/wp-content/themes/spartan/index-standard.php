<?php get_header(); ?>

								
                    <!-- Inner Content Section starts here -->
                    <div id="inner_content_section">
						<?php if(!of_get_option('show_magpro_slider_home') || of_get_option('show_magpro_slider_home') == 'true') : ?>  
                        <?php get_template_part( 'slider' ); ?>                
                        <?php endif; ?>
                        
                        	             
                        <!-- Main Content Section starts here -->
                        <div id="main_content_section_standard">
                

										<?php if (have_posts()) : ?>
											<?php $count = 0; while (have_posts()) : the_post(); $count++; ?>
												<!-- Actual Post starts here -->
												<div <?php post_class('actual_post') ?> id="post-<?php the_ID(); ?>">
													
													 <?php 
													 	
														$postformatstandard = get_post_format();
														
														if ( $postformatstandard == 'quote') {
															get_template_part( 'post', 'quote' ); 
														}else {
															get_template_part( 'post', 'standard' ); 
														}
														
													?>
                                                    
												</div>
												<!-- Actual Post ends here -->		
												<?php endwhile; ?>
									
												<?php 
													$next_page = get_next_posts_link(__('Previous', 'Spartan')); 
													$prev_pages = get_previous_posts_link(__('Next', 'Spartan'));
													if(!empty($next_page) || !empty($prev_pages)) :
													?>
													<div class="pagination">
														<?php if(!function_exists('wp_pagenavi')) : ?>
														<div class="al"><?php echo $next_page; ?></div>
														<div class="ar"><?php echo $prev_pages; ?></div>
														<?php else : wp_pagenavi(); endif; ?>
													</div><!-- /pagination -->
													<?php endif; ?>
													
												<?php else : ?>
													<div class="nopost">
														<p><?php _e('Sorry, but you are looking for something that isn\'t here.', 'Spartan') ?></p>
													 </div><!-- /nopost -->
												<?php endif; ?>
                
                
                        </div>	
                        <!-- Main Content Section ends here -->

                        <!-- Sidebar Section starts here -->
                        <?php get_sidebar(); ?> 	
                        <!-- Sidebar Section ends here -->





                    </div>	
                    <!-- Inner Content Section ends here -->
                    
           			<?php get_footer(); ?>
							
								
									

							
								
									
