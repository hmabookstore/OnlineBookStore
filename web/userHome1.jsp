<!DOCTYPE html>
<html lang="en">
	<head>
            <%@page import="java.sql.Statement"%>
            <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.Connection"%>
            <%@page import="java.sql.PreparedStatement"%>
            <%@page import="onlinebookstore.MyDb"%>
		<meta charset="utf-8">
		<title>User Home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
		
		<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="themes/css/flexslider.css" rel="stylesheet"/>
		<link href="themes/css/main.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>		
        <script>
            function redirectToCart(elem)
            {
                elem.setAttribute("action","cartPage.jsp");
                elem.submit();
            }
            function redirectToOrders(elem)
            {
                elem.setAttribute("action","viewOrders.jsp");
                elem.submit();
            }
            function redirectToRecommend(elem)
            {
                elem.setAttribute("action","recommendPage.jsp");
                elem.submit();
            }  
            function redirectToWishlist(elem)
            {
                elem.setAttribute("action","wishlistPage.jsp");
                elem.submit();
            }
        </script>
        <% 
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
            if(session.getAttribute("user")==null) //USE WITH CARE, changing variable name will lead to total confusion
                response.sendRedirect("login1.jsp");
            MyDb db=new MyDb();
            Connection con=db.getCon();
            session.setAttribute("genre",null);
        %>
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
                                    <div class="account pull-left">
						<ul class="user-menu">				
							<li><a href="userProfile.jsp">Your Profile</a></li>		
						</ul>
					</div>
<!--                                    <button><a href="userProfile.jsp">Your Profile</a></button>-->
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="recommendPage1.jsp">View Recommendations</a></li>
							<li><a href="cartPage1.jsp">Your Cart</a></li>
							<li><a href="checkoutPage1.jsp">Checkout</a></li>					
							<li><a href="userLogout">Logout</a></li>		
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="userHome1.jsp" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
					<!-- <nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products.html">Woman</a>					
								<ul>
									<li><a href="./products.html">Lacinia nibh</a></li>									
									<li><a href="./products.html">Eget molestie</a></li>
									<li><a href="./products.html">Varius purus</a></li>									
								</ul>
							</li>															
							<li><a href="./products.html">Man</a></li>			
							<li><a href="./products.html">Sport</a>
								<ul>									
									<li><a href="./products.html">Gifts and Tech</a></li>
									<li><a href="./products.html">Ties and Hats</a></li>
									<li><a href="./products.html">Cold Weather</a></li>
								</ul>
							</li>							
							<li><a href="./products.html">Hangbag</a></li>
							<li><a href="./products.html">Best Seller</a></li>
							<li><a href="./products.html">Top Seller</a></li>
						</ul>
					</nav> -->
				</div>
			</section>
			<section  class="homepage-slider" id="home-slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<img src="themes/images/carousel/banner-1.jpg" alt="" />
						</li>
						<li>
							<img src="themes/images/carousel/banner-3.jpg" alt="" />
							<div class="intro">
								<h1>Wide range of variety</h1>
								<p><span>From Action to Historical Fiction</span></p>
							</div>
						</li>
                                                <li>
							<img src="themes/images/carousel/banner-4.jpg" alt="" />
                                                        <div class="intro">
								<h1>Great discounts and offers</h1>
								<p><span>For all the avid readers</span></p>
							</div>
						</li>
                                                <li>
							<img src="themes/images/carousel/banner-5.jpg" alt="" />
                                                        <div class="intro">
								<h1>Check out our best sellers</h1>
								<p><span>Read what everyone else is reading</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
			<section class="header_text">
				Hello, ${name} 
				<br/>Don't miss out our weekly offers.
			</section>
			<section class="main-content">
				<div class="row">
					<div class="span12">													
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">Available <strong>Genres
									</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
									</span>
								</h4>
                                                            <form action="redirectToGenre" method="post"> <!issue>
								
                                                                <div id="myCarousel" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">												
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="redirectToGenre?genre=Wrestling"><img src="images/111.jpg" alt="Wrestling" /></a></p>
														<a href="redirectToGenre?genre=Wrestling" class="title">Wrestling</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="redirectToGenre?genre=Fantasy Fiction"><img src="images/116.jpg" alt="Fantasy Fiction" /></a></p>
														<a href="redirectToGenre?genre=Fantasy Fiction" class="title">Fantasy Fiction</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="redirectToGenre?genre=Self-Help"><img src="images/114.jpg" alt="Self-Help"/></a></p>
														<a href="redirectToGenre?genre=Self-Help" class="title">Self-Help</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="redirectToGenre?genre=Action and Adventure"><img src="images/151.jpg" alt="Action and Adventure" /></a></p>
														<a href="redirectToGenre?genre=Action and Adventure" class="title">Action and Adventure</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<p><a href="redirectToGenre?genre=Science Fiction"><img src="images/160.jpg" alt="Science Fiction" /></a></p>
														<a href="redirectToGenre?genre=Science Fiction" class="title">Science Fiction</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="redirectToGenre?genre=Classics"><img src="images/154.jpg" alt="Classics"/></a></p>
														<a href="redirectToGenre?genre=Classics" class="title">Classics</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="redirectToGenre?genre=Mystery"><img src="images/155.jpg" alt="Mystery" /></a></p>
														<a href="redirectToGenre?genre=Mystery" class="title">Mystery</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="redirectToGenre?genre=Historical Fiction"><img src="images/158.jpg" alt="Historical Fiction" /></a></p>
														<a href="redirectToGenre?genre=Historical Fiction" class="title">Historical Fiction</a><br/>
														<a href="products.html" class="category"></a>
														<p class="price"></p>
													</div>
												</li>																																	
											</ul>
										</div>
                                                                            
									</div>							
								</div>
                                                            </form> <!issue>
							</div>						
						</div>
						<br/>
						
						<div class="row feature_box">						
							<div class="span4">
								<div class="service">
									<div class="responsive">	
										<img src="themes/images/feature_img_2.png" alt="" />
										<h4>LATEST <strong>COLLECTION</strong></h4>
										<p>Wide range of variety and Best Selling Collection</p>									
									</div>
								</div>
							</div>
							<div class="span4">	
								<div class="service">
									<div class="customize">			
										<img src="themes/images/feature_img_1.png" alt="" />
										<h4>FREE <strong>SHIPPING</strong></h4>
										<p>Avail Free Shipping on first 3 orders with us.</p>
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="service">
									<div class="support">	
										<img src="themes/images/feature_img_3.png" alt="" />
										<h4>24/7 LIVE <strong>SUPPORT</strong></h4>
										<p>Get live updates on the order tracking with our team and customer service</p>
									</div>
								</div>
							</div>	
						</div>		
					</div>				
				</div>
			</section>
			<section class="our_client">
				<h4 class="title"><span class="text">Authors</span></h4>
				<div class="row">					
					<div class="span2">
						<a href="redirectToBook?bookid=122"><img alt="Chris Jericho" src="images/Chris Jericho.jpg" width="150"></a>
					</div>
					<div class="span2">
						<a href="redirectToBook?bookid=115"><img alt="J.K. Rowling" src="images/J.K. Rowling.jpg" width="150"></a>
					</div>
					<div class="span2">
						<a href="redirectToBook?bookid=141"><img alt="John Cena" src="images/John Cena.jpg"></a>
					</div>
					<div class="span2">
						<a href="redirectToBook?bookid=163"><img alt="Neal Asher" src="images/Neal Asher.JPG"></a>
					</div>
					<div class="span2">
						<a href="redirectToBook?bookid=129"><img alt="Jim Ross" src="images/Jim Ross.JPG"></a>
					</div>
					<div class="span2">
						<a href="redirectToBook?bookid=113"><img alt="Robin Sharma" src="images/Robin Sharma.JPG"></a>
					</div>
				</div>
			</section>
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
<!--							<li><a href="./index.html">Home Page</a></li>  -->
							<li><a href="./about.html">About Us</a></li>
							<li><a href="contact1.jsp">Contact Us</a></li>
							<li><a href="cartPage1.jsp">Your Cart</a></li>
							<li><a href="userLogout">Logout</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="recommendPage1.jsp">View Recommendations</a></li>
							<li><a href="viewOrders1.jsp">Order History</a></li>
							<li><a href="wishlistPage1.jsp">Wish List</a></li>
							<li><a href="newsletter1">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
						<p>Bookstore is a user friendly platform to avail offers and redeem discounts on a wide range of books with variety of quality content</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script src="themes/js/jquery.flexslider-min.js"></script>
		<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
		</script>
    </body>
</html>