<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="false"%>  

<%@page import="com.gzone.ecommerce.model.*, com.gzone.ecommerce.web.model.*, com.gzone.ecommerce.web.util.*, com.gzone.ecommerce.web.controller.*" %>

<html lang="es">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>GZone.com - Your gaming zone</title>
	<link rel="stylesheet" href="/GZoneWeb/css/banner.css">
	<link rel="stylesheet" href="/GZoneWeb/css/index.css">
	<link rel="stylesheet" href="/GZoneWeb/css/footer.css">
	<link rel="stylesheet" href="/GZoneWeb/css/acerca.css">
	<link rel="stylesheet" href="/GZoneWeb/css/articulo.css">
	<link rel="stylesheet" href="/GZoneWeb/css/busqueda.css">
	<link rel="stylesheet" href="/GZoneWeb/css/soporte.css">
	<link rel="stylesheet" href="/GZoneWeb/css/perfil.css">
	
	<!-- Estilos comunes -->
	<link rel="stylesheet" href="/GZoneWeb/css/bootstrap/bootstrap.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="/GZoneWeb/js/jquery/jquery-2.1.4.js"></script>
	<script src="/GZoneWeb/js/bootstrap/bootstrap.min.js"></script>
	<script src="/GZoneWeb/js/index/modernizr.js"></script>

</head>
<body>
	<%	Usuario user = (Usuario) SessionManager.get(request, SessionAttributeNames.USER); %>
	<div class="maximo">
		<nav id="barra_principal" class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/GZoneWeb/html/index.jsp"><img src="/GZoneWeb/images/logo.png" alt="Logo GZone" width=40px></a>
				</div>
				<div id="navbar1" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="dropdown active"><a href="#"	class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Tienda <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Nuevos</a></li>
								<li><a href="#">En oferta</a></li>
								<li><a href="#">Mas</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Categorias</li>
								<li><a href="#">Acción</a></li>
								<li><a href="#">Indie</a></li>
								<li><a href="#">Aventuras</a></li>
							</ul>
						</li>
						<li><a href="/GZoneWeb/html/support/support.jsp">Soporte</a></li>
						<li><a href="/GZoneWeb/html/about/about.jsp">Acerca de</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Idioma <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Inglés</a></li>
							</ul>
						</li>
							<%							
								if (user!=null) {
									%>
									<li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=user.getUsuario()%><span class="caret"></span> </a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Mi biblioteca</a></li>
											<li><a href="#">Mi perfil</a></li>
											<li class="divider"></li>
											<li class="dropdown-header">Otros</li>
											<li><a href="/GZoneWeb/SignOutServlet">Cerrar sesión</a></li>
										</ul>
									</li>
									<%
								} else {
									%>
									<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
										<ul id="cuadro-login" class="dropdown-menu">
											<li>
												<div class="row">
													<div class="col-md-12">
														<div class="elegir">
															<a href="#" class="btn iniciar" data-toggle="modal"	data-target="#iniciar"><i class="fa fa-sign-in "></i>Iniciar sesion</a> 
															<a href="#" class="btn registro" data-toggle="modal" data-target="#registro"><i	class="fa fa-user-plus  "></i> Registrarse</a>
														</div>
														<div class="muestra">
															<img class="img-responsive"
																src="/GZoneWeb/images/banner/muestra.png" alt="Muestra juegos"></img>
														</div>
														<div class="muestra">
															<p>GZone es un servicio de venta y distribución de videojuegos para que puedas descargarlos y disfrutarlos libremente.</p>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</li>
							<%
								}
							%>
						
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a href="#" >			
								<button class="cart" id="cart">
									<i class="cart__icon fa fa-shopping-cart"></i>
									<span class="text-hidden">Shopping cart</span>
									<span class="cart__count">0</span>
								</button>
							</a>
						</li>
						<li><a href="/GZoneWeb/html/search/search.jsp"><span class="fa fa-search"></span> Buscar</a></li>
					</ul>
				</div>
			</div>
		</nav>


		<!-- Modal inicio sesion -->
		<div class="modal fade bd-example-modal-sm" id="iniciar">
			<div class="modal-dialog modal-sm modal-dialog-centered">
				<div class="modal-content">

					<!--Header -->
					<div class="modal-header">
						<a href=""><img src="/GZoneWeb/images/logo.png" alt="Logo GZone"
							width=40px></a>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Body -->
					<div class="modal-body">					
						<form action="/GZoneWeb/SignInServlet" method="post">
							<div class="form-group">
								<label for="usuario">Nombre de usuario:</label> <input type="text" class="form-control" name="user" placeholder="Introduce tu usuario">
							</div>
							<div class="form-group">
								<label for="pwd">Contraseña:</label> <input type="password" class="form-control" id="pwd" name="password" placeholder="Introduce tu contraseña">
							</div>
							<%
								String error = (String) request.getAttribute("error");
								if (error!=null) {
									%><%=error%><%
								}
							%>	
							<div class="checkbox">
								<label><input type="checkbox"> Recuerdame</label>
							</div>
							<div class="modal-footer">
								<button type="submit" value="Submit" class="btn registro">Iniciar sesion</button>
							</div>
						</form>
					</div>		
				</div>
			</div>
		</div>

		<!-- Modal registro -->
		<div class="modal fade bd-example-modal-sm" id="registro">
			<div class="modal-dialog modal-sm modal-dialog-centered">
				<div class="modal-content">

					<!--Header -->
					<div class="modal-header">
						<a href=""><img src="/GZoneWeb/images/logo.png" alt="Logo GZone"
							width=40px></a>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Body -->
					<div class="modal-body">
						<form action="/action_page.php">
							<div class="form-group">
								<label for="user">Usuario:</label> <input type="user"
									class="form-control" id="user"
									placeholder="Introduce tu nuevo nombre de usuario">
							</div>
							<div class="form-group">
								<label for="email">Correo electrónico:</label> <input
									type="email" class="form-control" id="email"
									placeholder="Introduce tu correo">
							</div>
							<div class="form-group">
								<label for="pwd">Contraseña:</label> <input type="password"
									class="form-control" id="pwd"
									placeholder="Introduce tu contraseña">
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn registro">Registrarse</button>
					</div>
				</div>
			</div>
		</div>
		<!--Modal carrito -->
		<div id="carrito" >
			<div class="shopping-cart">
				<div class="shopping-cart-header">
					<i class="fa fa-shopping-cart cart-icon"></i><span class="badge">3</span>
					<div class="shopping-cart-total">
						<span class="lighter-text">Total:</span> <span
							class="main-color-text">$2,229.97</span>
					</div>
				</div>
				<!--end shopping-cart-header -->
	
				<ul class="shopping-cart-items">
					<li class="clearfix"><img src="/GZoneWeb/images/borderlands.jpg"
						alt="borderlands 2" width="120" height="60" /> <span
						class="item-name">Borderlands 2</span> <span class="item-price">29.99€</span>
						<span class="item-quantity">Quantity: 01</span></li>
	
					<li class="clearfix"><img src="/GZoneWeb/images/Darksouls.jpg"
						alt="Darksouls 3" width="120" height="60" /> <span
						class="item-name">Darksouls 3</span> <span class="item-price">19.99€</span>
						<span class="item-quantity">Quantity: 01</span></li>
	
					<li class="clearfix"><img src="/GZoneWeb/images/dont starve.jpg"
						alt="Dont starve" width="120" height="60" /> <span
						class="item-name">Dont starve</span> <span class="item-price">39.99€</span>
						<span class="item-quantity">Quantity: 01</span></li>
				</ul>
	
				<a href="/GZoneWeb/html/shopping/shopping.jsp" class="button">Checkout</a>
			</div>
		<!--end shopping-cart -->
	</div>
	</div>
	<!--end container -->
