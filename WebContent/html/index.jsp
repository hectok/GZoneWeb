<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="explore" value="${requestScope.explore}" />

	<header class="bp-header">
		<h1>En Oferta</h1>		
		<hr>
	</header>
	
	<div id="agrupar">
		<ul class="ofertas">
			<c:choose>
	  			<c:when test="${!requestScope.sales.isEmpty()}">
					<c:forEach items="${requestScope.sales}" var="oferta">
					<li>
						<div class="producto ">
							<ul class="bordes">
								<li><img src="/GZoneWeb/CMS/producto_${oferta.getIdProducto()}/preview${oferta.getIdProducto()}.jpg" alt="${oferta.getNombre()}"></li>
							</ul>
							<form name="informacionProducto" method="POST" action="/GZoneWeb/ShoppingCartServlet" name="shopping-cart">
								<div class="barraBlanca">
									<div class="informacion_articulo">
										<b><a href="/GZoneWeb/SearchServlet?action=<%=Actions.UNIQUE%>&product=${oferta.getIdProducto()}">${oferta.getNombre()} </a></b>
										<input type="hidden" name="nombreProducto" value="${oferta.getNombre()}" >										
										<input type="hidden" name="idProducto" value="${oferta.getIdProducto()}">
										<em id="ofertaTachada"> ${oferta.getPrecio()}€</em>
										<c:forEach items="${requestScope.salesList}" var="salesList">
										<c:choose>
	  										<c:when test="${salesList.getIdOferta()==oferta.getOferta()}">
	  											<em id="ofertaNueva"> <fmt:formatNumber type="number" maxFractionDigits="2" value="${oferta.getPrecio()-oferta.getPrecio()*salesList.getPrecio()}" />€</em>
	  											<input  type="hidden" name="precioProducto" value="${oferta.getPrecio()-oferta.getPrecio()*salesList.getPrecio()}">
	  										</c:when>
	  									</c:choose>
										</c:forEach>									
									</div>
									<button type="submit" class="anadir" name="shopping-cart" value="anadir">
										<em>Añadir</em>
										<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
											<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
										</svg>
									</button>
								</div>
							</form>
						</div>
					</li>
					</c:forEach>
	  			</c:when>
	  			<c:otherwise>
	  				<li>Ahora mismo no hay ninguna oferta para ofrecerte.Lo sentimos. </li>
	  			</c:otherwise>
  			</c:choose>
		</ul> <!-- ofertas -->
	</div>

<!-- Main view -->
<div class="view">
	<!-- Blueprint header -->
	<header class="bp-header">
		<h1>Explorar</h1>
		<hr>
	</header>
	<!-- Bottom bar with filter and cart info -->
	<div id="anchoBarra">
		<div class="bar">
			<div class="filter">
				<span class="filter__label">Filter: </span>
				<button class="action filter__item filter__item--selected" data-filter="*">All</button>
				<button class="action filter__item" data-filter=".Accion"><i class="icon icon--accion"></i><span class="action__text">Accion</span></button>
				<button class="action filter__item" data-filter=".aventura"><i class="icon icon--aventura"></i><span class="action__text">Aventura</span></button>
				<button class="action filter__item" data-filter=".indie"><i class="icon icon--indie"></i><span class="action__text">Indie</span></button>
				<button class="action filter__item" data-filter=".rol"><i class="icon icon--rpg"></i><span class="action__text">Rol</span></button>
				<button class="action filter__item" data-filter=".simulacion"><i class="icon icon--shooter"></i><span class="action__text">Simulacion</span></button>
			</div>
		</div>
	</div>
	<!-- Grid -->
	<section class="grid grid--loading">
		<!-- Loader -->
		<img class="grid__loader" src="/GZoneWeb/images/grid.svg" width="60" alt="Loader image" />
		<div class="grid__sizer"></div>
		<c:choose>
	  			<c:when test="${!explore.isEmpty()}">
					<c:forEach var = "i" begin = "0" end = "${explore.size()-1}">
						<c:choose>
							<c:when test="${i%6==0}">
								<c:set var="big" value=" grid__item--size-a " />
							</c:when>
							<c:otherwise>
								<c:set var="big" value=" " />
							</c:otherwise>
						</c:choose>	
						<div class="grid__item ${big} ${explore.get(i).getCategorias().get(0).getCategoria()}  ">
							<div class="producto">
								<a href="#0">
									<ul class="bordes">
										<li class="selected"><img src="/GZoneWeb/CMS/producto_${explore.get(i).getIdProducto()}/preview${explore.get(i).getIdProducto()}.jpg" alt="${explore.get(i).getNombre()}"></li>
									</ul>
								</a>
								<form name="informacionProducto" method="POST" action="/GZoneWeb/ShoppingCartServlet" name="shopping-cart">
									<div class="barraBlanca">
										<div class="informacion_articulo">
											<b><a href="/GZoneWeb/ProductServlet?action=<%=Actions.UNIQUE%>&product=${explore.get(i).getIdProducto()}">${explore.get(i).getNombre()}</a></b>
											<input type="hidden" name="nombreProducto" value="${explore.get(i).getNombre()}">										
											<input type="hidden" name="idProducto" value="${explore.get(i).getIdProducto()}">
											<em>${explore.get(i).getPrecio()}€</em>
											<input type="hidden" name="precioProducto" value="${explore.get(i).getPrecio()}">	
										</div> <!-- informacion_articulo -->
					
										<button class="anadir action action--button action--buy" name="shopping-cart" value="anadir">
											<em>Añadir</em>
											<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
												<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
											</svg>
										</button>
									</div> <!-- .barraBlanca -->
								</form>
							</div> <!-- .producto -->
						</div>
					</c:forEach>
	  			</c:when>
	  			<c:otherwise>
	  				<p>No se han encontrado nada para explorar</p>
	  			</c:otherwise>
  		</c:choose>
  		
  		
</section>
<!-- /grid-->
</div>
<c:import url="/html/common/footer.jsp"></c:import>
