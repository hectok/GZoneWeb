<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="false"%>
<%@page import="com.gzone.ecommerce.model.*, com.gzone.ecommerce.web.model.*, com.gzone.ecommerce.web.util.*, com.gzone.ecommerce.web.controller.*,java.util.List " %>

 <html>
 <head>
 	<title>Resumen de tu pedido</title>
 	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css'>
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600|Raleway:300,400,600&amp;subset=latin-ext'>
	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
	<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css'>
	<link rel="stylesheet" href="/GZoneWeb/css/checkout.css">
</head>
<body>
	<%	
		Usuario user = (Usuario) SessionManager.get(request, SessionAttributeNames.USER); 
		ShoppingCart carrito = (ShoppingCart) SessionManager.get(request, SessionAttributeNames.SHOPPING_CART);
	%>
  <div class="container-fluid background">
      <div class="row padding-top-20">
          <div class="col-12 col-sm-12 col-md-10 col-lg-10 col-xl-8 offset-md-1 offset-lg-1 offset-xl-2 padding-horizontal-40">
              <div class="row">
                  <div class="col-12 main-wrapper">
                      <div class="row">
                          <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                              <div id="template" class="row panel-wrapper">
                                  <div class="col-12 panel-header basket-header">
                                      <div class="row">
                                          <div class="col-6 basket-title">
                                              <span class="description">Revisa tu</span><br><span class="emphasized">Resumen de tu carrito</span>
                                          </div>
                                          <div class="col-6 order-number align-right">
                                              <span class="description">Pedido #</span><br><span class="emphasized">1-234</span>
                                          </div>
                                      </div>
                                      <div class="row column-titles padding-top-10">
                                          <div class="col-2 align-center"><span>Photo</span></div>
                                          <div class="col-5 align-center"><span>Name</span></div>
                                          <div class="col-2 align-center"><span>Quantity</span></div>
                                          <div class="col-3 align-right"><span>Price</span></div>
                                      </div>
                                  </div>
                                  <div class="col-12 panel-body basket-body">
									<% 	
										if (carrito!=null)
										{
											if (carrito.numeroLineas()!=0)
											{
												for (ShoppingCartLine lineas: carrito.getLines()) {
												%>
			                                      <div class="row product">
			                                          <div class="col-2 product-image"><img src="/GZoneWeb/CMS/producto_<%=lineas.getProduct().getIdProducto()%>/preview<%=lineas.getProduct().getIdProducto()%>.jpg" alt="<%=lineas.getProduct().getNombre()%>"></div>
			                                          <div class="col-5"><%= lineas.getProduct().getNombre() %></div>
			                                          <div class="col-3 align-right"><span class="sub"><%= lineas.getProduct().getPrecio() %>€</span></div>
			                                      </div>
														
												<% 
												}
											}
										}
												%>
                                  </div>
                                  <div class="col-12 panel-footer basket-footer">
                                      <hr>

                                      <div class="row">
                                          <div class="col-8 align-right description"><div class="dive">Total</div></div>
                                          <div class="col-4 align-right"><span class="very emphasized"><%= carrito.getTicketTotal() %> €</span></div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                              <div class="row panel-wrapper">
                                  <div class="col-12 panel-header creditcard-header">
                                      <div class="row">
                                          <div class="col-12 creditcard-title">
                                              <span class="description">Introduzca</span><br><span class="emphasized">Informacion de la tarjeta de crédito</span>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-12 panel-body creditcard-body">
                                      <form action="#" method="post" target="_self">
                                          <fieldset>
                                              <label for="card-name">Nombre del titular</label><br>
                                              <i class="fa fa-user-o" aria-hidden="true"></i><input type='text' id='card-name' name='card-name' placeholder='Hector Ledo' title='Titular'>
                                          </fieldset>
                                          <fieldset>
                                              <label for="card-number">Numero de la tarjeta</label><br>
                                              <i class="fa fa-credit-card" aria-hidden="true"></i><input type='text' id='card-number' name='card-number' placeholder='1234 5678 9123 4567' title='Numero de tarjeta'>
                                          </fieldset>
                                          <fieldset>
                                              <label for="card-expiration">Fecha de caducidad</label><br>
                                              <i class="fa fa-calendar" aria-hidden="true"></i><input type='text' id='card-expiration' name='card-expiration' placeholder='AA/MM' title='Caducidad' class="card-expiration">
                                          </fieldset>
                                          <fieldset>
                                              <label for="card-ccv">CVC/CCV</label>&nbsp;<i class="fa fa-info-circle" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="El CCV es el número de 3 cifras que aparece por la parte posterior de tu tarjeta de crédito."></i><br>
                                              <i class="fa fa-lock" aria-hidden="true"></i><input type='text' id='card-ccv' name='card-ccv' placeholder='123' title='CVC/CCV'>
                                          </fieldset>
                                      </form>
                                  </div>
                                  <div class="col-12 panel-footer creditcard-footer">
                                      <div class="row">
                                          <div class="col-12 align-right"><a href="/GZoneWeb/IndexServlet"><button class="cancel">Cancelar</button></a>&nbsp;<button class="confirm">Confirmar y pagar</button></div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
	<script src='https://code.jquery.com/jquery-3.2.1.slim.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js'></script>

