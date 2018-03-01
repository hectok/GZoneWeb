<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	List<Producto> ofertas= (List <Producto>) request.getAttribute(SessionAttributeNames.SALE);
	List<Producto> explorar= (List <Producto>) request.getAttribute(SessionAttributeNames.EXPLORE);

%>
	<header class="bp-header">
		<h1>En Oferta</h1>
		<hr>
	</header>
	
	<div id="agrupar">
		<ul class="ofertas">
		<%
		if (ofertas!=null || ofertas.isEmpty()){
			for (Producto oferta: ofertas) {
				%>
			<li>
				<div class="producto ">
					<ul class="bordes">
						<li><img src="/GZoneWeb/CMS/producto_<%=oferta.getIdProducto()%>/preview<%=oferta.getIdProducto()%>.jpg" alt="<%=oferta.getNombre()%>"></li>
					</ul>
	
					<div class="barraBlanca">
						<div class="informacion_articulo">
							<b><a href="/GZoneWeb/ProductServlet?product=<%=oferta.getIdProducto()%>"><%=oferta.getNombre()%></a></b>
							<em><%=oferta.getPrecio()%>€</em>
						</div>
	
						<button class="anadir ">
							<em>anadir</em>
							<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
								<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
							</svg>
						</button>
					</div>
				</div>
			</li>
			<%
			}
			}
			else
			{
				%>
				<li>No se han encontrado Ofertas</li>
		<%
			}
		%>
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
		
		<%
		if (explorar!=null || explorar.isEmpty()){
			String big = null;
			for (int i=0; i<explorar.size();i++) {
				if ((i % 8== 0))
				{
					big="grid__item--size-a";
				}
				else {
					big=" ";
				}
				%>
		<div class="grid__item <%= big%> <%=explorar.get(i).getCategorias().get(0).getCategoria()%> ">
			<div class="producto">
				<a href="#0">
					<ul class="bordes">
						<li class="selected"><img src="/GZoneWeb/CMS/producto_<%=explorar.get(i).getIdProducto()%>/preview<%=explorar.get(i).getIdProducto()%>.jpg" alt="<%=explorar.get(i).getNombre()%>"></li>
					</ul>
				</a>

				<div class="barraBlanca">
					<div class="informacion_articulo">
						<b><a href="/GZoneWeb/ProductServlet?product=<%=explorar.get(i).getIdProducto()%>"><%=explorar.get(i).getNombre()%></a></b>
						<em><%=explorar.get(i).getPrecio()%>€</em>
					</div> <!-- informacion_articulo -->

					<button class=" anadir action action--button action--buy">
						<em>anadir Cart</em>
						<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
							<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
						</svg>
					</button>
				</div> <!-- .barraBlanca -->
			</div> <!-- .producto -->
		</div>
		<%
					
				}
			}
					else
					{
						%>
						<p>No se han encontrado nada para explorar</p>
				<%
					}
				%>
</section>
<!-- /grid-->
</div>

<%@include file="/html/common/footer.jsp"%>
