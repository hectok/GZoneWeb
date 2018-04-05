<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="com.gzone.ecommerce.model.*, com.gzone.ecommerce.web.model.*, com.gzone.ecommerce.web.util.*, com.gzone.ecommerce.web.controller.*,java.util.List " %>

<html lang="es">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>GZone.com - Your gaming zone</title>
	<link rel="icon" href="/GZoneWeb/images/logo.png">
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
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="/GZoneWeb/js/jquery/jquery-2.1.4.js"></script>
	<script src="/GZoneWeb/js/product/background.js"></script>
	<script src="/GZoneWeb/js/bootstrap/bootstrap.min.js"></script>
	<script src="/GZoneWeb/js/index/modernizr.js"></script>
	
</head>
<body>
	<%	
		Usuario user = (Usuario) SessionManager.get(request, SessionAttributeNames.USER); 
		ShoppingCart carrito = (ShoppingCart) SessionManager.get(request, SessionAttributeNames.SHOPPING_CART);
		Cookie cookie = (Cookie) request.getAttribute(ParameterNames.COOKIE);
	%>
		
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
					<a class="navbar-brand" href="/GZoneWeb/IndexServlet"><img src="/GZoneWeb/images/logo.png" alt="Logo GZone" width=40px></a>
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
											<li><a href="/GZoneWeb/UserServlet?profile=<%=user.getIdUsuario()%>">Mi perfil</a></li>
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
							<form id="busquedaBanner" action="/GZoneWeb/SearchServlet" method="post">
								<input type="search" placeholder="Buscar" NAME="product">
								<input type="submit" name="submit" value="simple" style="display:none;" />							
							</form>
						</li>
						<li>
							<a href="#" >
								<button class="cart cd-cart" id="carrito">
									<i class="cart__icon fa fa-shopping-cart"></i>
									<span class="text-hidden">Shopping cart</span>
									<%
										if (carrito==null || carrito.numeroLineas()==0){
									%>
										<span class="cart__count">0</span>
									<%
										} else {
									%>
										<span class="cart__count"><%=carrito.numeroLineas()%></span>
									<%
										}
									%>
								</button>
							</a>
						</li>
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
						<a href=""><img src="/GZoneWeb/images/logo.png" alt="Logo GZone" width=40px></a>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<%
						String value = "";
						if (cookie!=null) {
							value = cookie.getValue();
						}
					%>
					<!-- Body -->
					<div class="modal-body">
						<form action="/GZoneWeb/SignInServlet" method="post">
							<div class="form-group">
								<label for="usuario">Nombre de usuario:</label> <input type="text" class="form-control" name="user" value="<%=value%>" placeholder="Introduce tu usuario" required>
							</div>
							<div class="form-group">
								<label for="pwd">Contraseña:</label> <input type="password" class="form-control" id="pwd" name="password" placeholder="Introduce tu contraseña" required>
							</div>
							<%
								String errorSignIn = (String) request.getAttribute("El usuario no existe");
								String errorDoNotExist = (String) request.getAttribute("Contraseña incorrecta");
								String signInFirst = (String) request.getAttribute("signInFirst");
								if (errorSignIn!=null || errorDoNotExist!=null || signInFirst!=null) {
									%>
									<script type="text/javascript">
									    $(window).on('load',function(){
									        $('#iniciar').modal('show');
									    });
									</script>
									<div class="alert alert-danger" role="alert">
									  	<strong>Ups!</strong> <%=errorSignIn%>
									</div>
									<%
								}
							%>
					
							<div class="checkbox">
								<label><input type="checkbox" name="checked" value="ON"> Recuerdame</label>
							</div>
							<div class="modal-footer">
								<button type="submit" value="Submit" class="btn registro">Iniciar sesion</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		</script>
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
						<form action="/GZoneWeb/CreateServlet" method="post">
							<div class="form-group">
								<label for="user">Usuario:</label> <input type="text" class="form-control" id="user" name="user" placeholder="Introduce tu nuevo nombre de usuario" required>
							</div>
							<div class="form-group">
								<label for="email">Correo electrónico:</label> <input type="email" class="form-control" id="email" name="email" placeholder="Introduce tu correo" required>
							</div>
							<div class="form-group">
								<label for="pwd">Contraseña:</label> <input type="password" class="form-control" id="pwd" name="password" placeholder="Introduce tu contraseña" required>
							</div>
							<%
								String errorCreating =(String) request.getAttribute("Ese nombre de usuario ya esta cogido.");
								if (errorCreating!=null) {
									%>							
            						<script type="text/javascript">
									    $(window).on('load',function(){
									        $('#registro').modal('show');
									    });
									</script>	
									<div class="alert alert-danger" role="alert">
									  	<strong>Ups!</strong> <%=errorCreating%>
									</div>
									<%
									
								}
							%>
							<div class="modal-footer">
								<button type="submit" value="Subtmit" class="btn registro">Registrarse</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!--Modal carrito -->
		<div id="carrito" >
			<div class="shopping-cart cd-cart-container empty">
				<div class="shopping-cart-header">
					<i class="fa fa-shopping-cart cart-icon"></i><%
										if (carrito==null || carrito.numeroLineas()==0){
									%>
										<span class="badge">0</span>
									<%
										} else {
									%>
										<span class="badge"><%=carrito.numeroLineas()%></span>
									<%
										}
									%>
					<div class="shopping-cart-total">
						<%
							if (carrito==null || carrito.numeroLineas()==0){
						%>
							<span class="lighter-text">Total:</span> <span class="main-color-text">0€</span>
						<%
							} else {
						%>
							<span class="lighter-text">Total:</span> <span class="main-color-text"><%= carrito.getTicketTotal() %>€</span>						
						<%
							}
						%>					
					</div>
				</div>
				<!--end shopping-cart-header -->

				<ul class="pre-scrollable shopping-cart-items" >
				<% 	
					if (carrito!=null)
					{
						if (carrito.numeroLineas()!=0)
						{
							for (ShoppingCartLine lineas: carrito.getLines()) {
							%>
								<li class="clearfix"><img src="/GZoneWeb/CMS/producto_<%=lineas.getProduct().getIdProducto()%>/preview<%=lineas.getProduct().getIdProducto()%>.jpg" alt="<%=lineas.getProduct().getNombre()%>" width="120" height="60">
									<span class="item-price"><%= lineas.getProduct().getNombre() %></span>
									<span class="item-price"><%= lineas.getProduct().getPrecio() %>€</span>
									<form name="informacionProducto" method="POST" action="/GZoneWeb/ShoppingCartServlet" name="shopping-cart">
										<span><button type="submit" class="fa fa-close " name="shopping-cart" value="eliminar" style="color:red;background-color:transparent"></button></span>
										<input type="hidden" name="idProducto" value="<%= lineas.getProduct().getIdProducto() %>"  />
									</form>
								</li>
							
					<% 
							}
					%>
								<li><a href="/GZoneWeb/html/shopping/shopping.jsp"><button type="button" id="cerrado" class="btn btn-lg btn-primary">Checkout</button></a></li>		
					<%			
						}else {
					%>
						<li class="clearfix caritacentrada"><i class="fa fa-frown-o" aria-hidden="true" style="font-size:56px;padding-left: 115px;"></i><p>Tu carrito está vacio </p></li>
						<li><button type="button" id="cerrado" class="btn btn-lg btn-primary" disabled>Checkout</button></li>		
				<%
						}
					}
				%>
						
				</ul>
			</div>
		<!--end shopping-cart -->
	</div>

	</div>
	<!--end container -->
