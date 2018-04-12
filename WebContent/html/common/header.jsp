<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>

<%@page import="com.gzone.ecommerce.model.*, com.gzone.ecommerce.web.model.*, com.gzone.ecommerce.web.util.*, com.gzone.ecommerce.web.controller.*,java.util.List " %>

<c:set var="user" value='${sessionScope["user"]}' scope="session"/>
<c:set var="carrito" value='${sessionScope["shopping-cart"]}' scope="session"/>
<c:set var="cookie" value='${requestScope.cookie}'/>


<html lang="es">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><fmt:message key="head.titulo" bundle="${messages}"/></title>
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
						<li class="active"><a href="/GZoneWeb/IndexServlet"><fmt:message key="header.tienda" bundle="${messages}"/></a></li>
						<li><a href="/GZoneWeb/html/support/support.jsp"><fmt:message key="header.soporte" bundle="${messages}"/></a></li>
						<li><a href="/GZoneWeb/html/about/about.jsp"><fmt:message key="header.acerca" bundle="${messages}"/></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><fmt:message key="header.idioma" bundle="${messages}"/><span class="caret"></span></a>
							<ul id="menu_idiomas" class="dropdown-menu" role="menu">
								<li><a href="/GZoneWeb/SignInServlet?action=change-locale&locale=es"><fmt:message key="header.espanol" bundle="${messages}"/></a></li>
								<li><a href="/GZoneWeb/SignInServlet?action=change-locale&locale=en"><fmt:message key="header.ingles" bundle="${messages}"/></a></li>
							</ul>
						</li>
						<c:choose>  
						    <c:when test="${user!=null}">  
						       <li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${user.getUsuario()}<span class="caret"></span> </a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="/GZoneWeb/UserServlet?profile=${user.getIdUsuario()}"><fmt:message key="header.perfil" bundle="${messages}"/></a></li>
										<li class="divider"></li>
										<li class="dropdown-header"><fmt:message key="header.otro" bundle="${messages}"/></li>
										<li><a href="/GZoneWeb/SignInServlet?action=${Actions.SIGN_OUT}"><fmt:message key="header.cerrar_sesion" bundle="${messages}"/></a></li>
									</ul>
								</li>  
						    </c:when>  
							<c:otherwise>  
									<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><b><fmt:message key="header.login" bundle="${messages}"/></b> <span class="caret"></span></a>
										<ul id="cuadro-login" class="dropdown-menu">
											<li>
												<div class="row">
													<div class="col-md-12">
														<div class="elegir">
															<a href="#" class="btn iniciar" data-toggle="modal"	data-target="#iniciar"><i class="fa fa-sign-in "></i><fmt:message key="header.iniciar_sesion" bundle="${messages}"/></a>
															<a href="#" class="btn registro" data-toggle="modal" data-target="#registro"><i	class="fa fa-user-plus  "></i><fmt:message key="header.registro" bundle="${messages}"/></a>
														</div>
														<div class="muestra">
															<img class="img-responsive"
																src="/GZoneWeb/images/banner/muestra.png" alt="Muestra juegos"></img>
														</div>
														<div class="muestra">
															<p><fmt:message key="header.bienvenida" bundle="${messages}"/></p>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</li>
						    </c:otherwise>  
						</c:choose>  
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<form id="busquedaBanner" action="/GZoneWeb/SearchServlet?action=${Actions.SIMPLE}" method="post">
								<input type="search" placeholder="<fmt:message key="header.buscar" bundle="${messages}"/>" NAME="product">
							</form>
						</li>
						<li>
							<a href="#" >
								<button class="cart cd-cart" id="carrito">
									<i class="cart__icon fa fa-shopping-cart"></i>
									<span class="text-hidden">Shopping cart</span>
									<c:choose>
										<c:when test="${carrito==null || carrito.numeroLineas()==0}">
											<span class="cart__count">0</span>
										</c:when>
										<c:otherwise>
											<span class="cart__count">${carrito.numeroLineas()}</span>									
										</c:otherwise>
									</c:choose>
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
					<!-- Body -->
					<div class="modal-body">
						<form action="/GZoneWeb/SignInServlet" method="post">
							<div class="form-group">
								<label for="usuario"><fmt:message key="header.nombre_usuario" bundle="${messages}"/></label> <input type="text" class="form-control" name="user" value="${requestScope.cookie.getValue()}" placeholder="Introduce tu usuario" required>
							</div>
							<div class="form-group">
								<label for="pwd"><fmt:message key="header.contrasena" bundle="${messages}"/></label> <input type="password" class="form-control" id="pwd" name="password" placeholder="Introduce tu contraseña" required>
							</div>
							<c:if test="${requestScope.sign_in_error!=null }">	
									<script type="text/javascript">
									    $(window).on('load',function(){
									        $('#iniciar').modal('show');
									    });
									</script>
									<div class="alert alert-danger" role="alert">
										<strong>Ups!</strong> ${requestScope.sign_in_error}								
									</div>
							</c:if>
					
							<div class="checkbox">
								<label><input type="checkbox" name="checked" value="ON"><fmt:message key="header.recuerdame" bundle="${messages}"/></label>
							</div>
							<div class="modal-footer">
								<button type="submit" value="Submit" class="btn registro"><fmt:message key="header.iniciar_sesion" bundle="${messages}"/></button>
								<input type="hidden" name="action" value="${Actions.SIGN_IN}"/>							
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
						<form action="/GZoneWeb/SignInServlet" method="post">				
							<div class="form-group">
								<label for="user"><fmt:message key="header.nombre_usuario" bundle="${messages}"/></label> <input type="text" class="form-control" id="user" name="user" placeholder="Introduce tu nuevo nombre de usuario" required>
							</div>
							<div class="form-group">
								<label for="email"><fmt:message key="header.correo" bundle="${messages}"/></label> <input type="email" class="form-control" id="email" name="email" placeholder="Introduce tu correo" required>
							</div>
							<div class="form-group">
								<label for="pwd"><fmt:message key="header.contrasena" bundle="${messages}"/></label> <input type="password" class="form-control" id="pwd" name="password" placeholder="Introduce tu contraseña" required>
							</div>
	
							<c:if test="${requestScope.sign_up_error!=null }">						
           						<script type="text/javascript">
								    $(window).on('load',function(){
								        $('#registro').modal('show');
								    });
								</script>	
								<div class="alert alert-danger" role="alert">
									<strong>Ups!</strong> ${requestScope.sign_up_error}						
								</div>
							</c:if>	

							<div class="modal-footer">
								<button type="submit" value="submit" class="btn registro"><fmt:message key="header.registro" bundle="${messages}"/></button>
								<input type="hidden" name="action" value="${Actions.SIGN_UP}"/>
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
					<i class="fa fa-shopping-cart cart-icon"></i>
						<c:choose>
							<c:when test="${carrito==null || carrito.numeroLineas()==0}">
								<span class="badge">0</span>										
							</c:when>
							<c:otherwise>
								<span class="badge">${carrito.numeroLineas()}</span>
							</c:otherwise>
						</c:choose>
					<div class="shopping-cart-total">	
						<c:choose>
							<c:when test="${carrito==null || carrito.numeroLineas()==0}">
								<span class="lighter-text">Total:</span> <span class="main-color-text">0€</span>										
							</c:when>
							<c:otherwise>
								<span class="lighter-text">Total:</span> <span class="main-color-text">${carrito.getTicketTotal()}€</span>	
							</c:otherwise>
						</c:choose>				
					</div>
				</div>
				<!--end shopping-cart-header -->

				<ul class="pre-scrollable shopping-cart-items" >
				<c:choose>
					<c:when test="${carrito!=null && carrito.numeroLineas()!=0}">
						<c:forEach items="${carrito.getLines()}" var="lineas">
								<li class="clearfix"><img src="/GZoneWeb/CMS/producto_${lineas.getProduct().getIdProducto()}/preview${lineas.getProduct().getIdProducto()}.jpg" alt="{lineas.getProduct().getNombre()}" width="120" height="60">
									<span class="item-price">${lineas.getProduct().getNombre()}</span>
									<span class="item-price">${lineas.getProduct().getPrecio()}€</span>
									<form name="informacionProducto" method="POST" action="/GZoneWeb/ShoppingCartServlet" name="shopping-cart">
										<span><button type="submit" class="fa fa-close " name="shopping-cart" value="eliminar" style="color:red;background-color:transparent"></button></span>
										<input type="hidden" name="idProducto" value="${lineas.getProduct().getIdProducto()}"  />
									</form>
								</li>
						</c:forEach>
						<li><a href="/GZoneWeb/html/shopping/shopping.jsp"><button type="button" id="cerrado" class="btn btn-lg btn-primary">Checkout</button></a></li>										
					</c:when>
					<c:otherwise>
						<li class="clearfix caritacentrada"><i class="fa fa-frown-o" aria-hidden="true" style="font-size:56px;padding-left: 115px;"></i><p><fmt:message key="cart.carrito" bundle="${messages}"/></p></li>
						<li><button type="button" id="cerrado" class="btn btn-lg btn-primary" disabled>Checkout</button></li>		
					</c:otherwise>
				</c:choose>	
						
				</ul>
			</div>
		<!--end shopping-cart -->
	</div>

	</div>
	<!--end container -->
