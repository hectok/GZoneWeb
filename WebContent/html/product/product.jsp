 <%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="producto" value="${requestScope.product}" />
<c:set var="hoteles" value="${requestScope.hotusa}" />

	<script >
	$(document).ready(function() {
	    $('#fondo').css('background', 'url("/GZoneWeb/CMS/producto_${producto.getIdProducto()}/wall${producto.getIdProducto()}.jpg")');
	});
	</script>

<div id="fondo">
	<div class="articulo">
	    <div class="titulo">
	      <h1>${producto.getNombre()}</h1>
	      <hr>
	    </div>
	    <div class="izquierda">
	      <div class="galeriaP">
	        <div id="galProducto" class="carousel slide" data-ride="carousel">
	          <!-- Indicators -->
	          <ol class="carousel-indicators">
	            <li data-target="#galProducto" data-slide-to="0" class="active"></li>
	            <li data-target="#galProducto" data-slide-to="1"></li>
	            <li data-target="#galProducto" data-slide-to="2"></li>
	            <li data-target="#galProducto" data-slide-to="3"></li>
	            <li data-target="#galProducto" data-slide-to="4"></li>
	          </ol>
	
	          <!-- Wrapper for slides -->
	          <div class="carousel-inner" role="listbox">
	          
	            <div class="item active">
	              <img src="/GZoneWeb/CMS/producto_${producto.getIdProducto()}/slide${producto.getIdProducto()}_1.jpg" alt="${producto.getNombre()}">
	            </div>
	            <div class="item">
					<img src="/GZoneWeb/CMS/producto_${producto.getIdProducto()}/slide${producto.getIdProducto()}_2.jpg" alt="${producto.getNombre()}">	            
				</div>
	            <div class="item">
	              <img src="/GZoneWeb/CMS/producto_${producto.getIdProducto()}/slide${producto.getIdProducto()}_3.jpg" alt="${producto.getNombre()}">
	            </div>
	            <div class="item">
	              <img src="/GZoneWeb/CMS/producto_${producto.getIdProducto()}/slide${producto.getIdProducto()}_4.jpg" alt="${producto.getNombre()}">
	            </div>
	            <div class="item">
	              <img src="/GZoneWeb/CMS/producto_${producto.getIdProducto()}/slide${producto.getIdProducto()}_5.jpg" alt="${producto.getNombre()}">
	            </div>

	            <!-- Left and right controls -->
	            <a class="right carousel-control" href="#galProducto" role="button" data-slide="next">
	              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	              <span class="sr-only">Next</span>
	            </a>
	            <a class="left carousel-control" href="#galProducto" role="button" data-slide="prev">
	              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	              <span class="sr-only">Previous</span>
	            </a>
	          </div>
	        </div>
	      </div>
	      <div class="descripcion">
	        <input type="checkbox" class="read-more-state" id="post-1" />
	        <p class="read-more-wrap"> ${producto.getDetalles_largo().substring(0, 200)}
	          <span class="read-more-target">
	           ${producto.getDetalles_largo().substring(200)}
	        </p>    
	            <label for="post-1" class="read-more-trigger"></label>
	          </div>
	          
	        </div>
	
	        <div class="derecha">
	          <div class="comprar">
		          <form name="informacionProducto" method="POST" action="/GZoneWeb/ShoppingCartServlet" name="shopping-cart">
		          		<input type="hidden" name="nombreProducto" value="${producto.getNombre()}" >										
						<input type="hidden" name="idProducto" value=${producto.getIdProducto()}>		
			            <img src="/GZoneWeb/CMS/producto_${producto.getIdProducto()}/preview${producto.getIdProducto()}.jpg" alt="${producto.getNombre()}">
			            <div class="des_breve">
			              <p>${producto.getDetalles_corto()}</p>
			            </div>
			            <div class="elegir">
			              <p>${producto.getPrecio()}€</p>
			              <input type="hidden" name="precioProducto" value="${producto.getPrecio()}"> 
			              <button class="btn btn-primary" name="shopping-cart" value="anadir"><i class="fa fa-shopping-cart  "></i> Comprar</button>
			            </div>
			      </form>
	          </div>
	
	          <div class="detalles">
	            
	            <h4>Categoria :</h4>
	            <c:choose>
					<c:when test="${!producto.getCategorias().isEmpty()}">
						<c:forEach items="${producto.getCategorias()}" var="categorias">
							<p>${categorias.getCategoria()}</p>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>Este juego no tiene ninguna categoría asignada.</p>
					</c:otherwise>
				</c:choose>	
	           
	            
	            <h4>Idiomas disponibles :</h4>
	            <c:choose>
					<c:when test="${!producto.getIdioma().isEmpty()}">
						<c:forEach items="${producto.getIdioma()}" var="idioma">
							<p>${idioma.getNombreIdioma()}</p>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>Este juego no tiene ningun idioma asignado.</p>
					</c:otherwise>
				</c:choose>	
                	            
	            <h4>Requisitos minimos :</h4>
	            <p>${producto.getRequisitos()}</p>
	          </div>
	        </div>
	  </div>
  <c:choose>
		<c:when test="${!hoteles.isEmpty()}">
			<c:forEach items="${hoteles}" var="hotel">
				<section class="xml_request">
				    <div>
				      <div class="container py-3">
				        <div class="card">
				          <div class="row ">
				            <div class="col-md-4">
				                <img src="<c:out value="${hotel.getFotos()}"/>" width="400px" height="200px">
				              </div>
				              <div class="col-md-8 px-3">
				                <div class="card-block px-3">
				                  <h4 class="card-title">Visita los mismos sitios que tu heroína favorita!</h4>
				                  <p class="card-text">Bienvenido a <c:out value="${hotel.getNombre_hotel()}"/></p>
				                  <p class="card-text"><c:out value="${hotel.getDescripcion_hotel().substring(0, 304)}"/></p>
				                  <a href="http://<c:url value="${hotel.getWebsite()}"/>" target="_blank" class="btn btn-primary">Visitar la web</a>
				                </div>
				              </div>
				            </div>
				          </div>
				        </div>
				      </div>
				</section> 
			</c:forEach>
		</c:when> 
	</c:choose>  	
</div>
<c:import url="/html/common/footer.jsp"></c:import>
  