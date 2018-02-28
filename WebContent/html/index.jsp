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
				<button class="action filter__item" data-filter=".action"><i class="icon icon--accion"></i><span class="action__text">Accion</span></button>
				<button class="action filter__item" data-filter=".aventura"><i class="icon icon--aventura"></i><span class="action__text">Aventura</span></button>
				<button class="action filter__item" data-filter=".indie"><i class="icon icon--indie"></i><span class="action__text">Indie</span></button>
				<button class="action filter__item" data-filter=".rpg"><i class="icon icon--rpg"></i><span class="action__text">RPG</span></button>
				<button class="action filter__item" data-filter=".shooter"><i class="icon icon--shooter"></i><span class="action__text">Shooter</span></button>
			</div>
		</div>
	</div>
	<!-- Grid -->
	<section class="grid grid--loading">
		<!-- Loader -->
		<img class="grid__loader" src="/GZoneWeb/images/grid.svg" width="60" alt="Loader image" />
		<div class="grid__sizer"></div>

		<div class="grid__item aventura">
			<div class="producto">
				<a href="#0">
					<ul class="bordes">
						<li class="selected"><img src="/GZoneWeb/images/batman.jpg" alt="Preview image"></li>
					</ul>
				</a>

				<div class="barraBlanca">
					<div class="informacion_articulo">
						<b><a href="#0">Batman: Arkham Assylum</a></b>
						<em>14.99€</em>
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

		<div class="grid__item shooter">
			<div class="producto">
				<ul class="bordes">
					<li><img src="/GZoneWeb/images/borderlands.jpg" alt="Borderlands 2"></li>
				</ul>

			<div class="barraBlanca">
				<div class="informacion_articulo">
					<b><a href="#0">Borderlands 2</a></b>
					<em>29.99€</em>
				</div>

				<button class="anadir action action--button action--buy">
					<em>anadir</em>
					<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
						<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
					</svg>
				</button>
			</div>
		</div>
	</div>

	<div class="grid__item grid__item--size-a indie">
		<div class="producto">
			<ul class="bordes">
				<li><img src="/GZoneWeb/images/cuphead.jpg" alt="CupHead"></li>
			</ul>
		</a>

		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Cuhpead</a></b>
				<em>11.00€</em>
			</div>

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div>
	</div>
</div>

<div class="grid__item rpg">
	<div class="producto">
		<ul class="bordes">
			<li><img src="/GZoneWeb/images/south2.jpg" alt="CupHead"></li>
		</ul>
	</a>

	<div class="barraBlanca">
		<div class="informacion_articulo">
			<b><a href="#0">South Park : The fractured ButtHole</a></b>
			<em>59.00€</em>
		</div>

		<button class="anadir action action--button action--buy">
			<em>anadir</em>
			<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
				<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
			</svg>
		</button>
	</div>
</div>
</div>

<div class="grid__item grid__item--size-a action">
	<div class="producto">
		<ul class="bordes">
			<li><img src="/GZoneWeb/images/accion.jpg" alt="Tekken"></li>
		</ul>
	</a>

	<div class="barraBlanca">
		<div class="informacion_articulo">
			<b><a href="#0">Tekken 7</a></b>
			<em>59.00€</em>
		</div>

		<button class="anadir action action--button action--buy">
			<em>anadir</em>
			<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
				<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
			</svg>
		</button>
	</div>
</div>
</div>

<div class="grid__item aventura">
	<div class="producto">
		<ul class="bordes">
			<li><img src="/GZoneWeb/images/thewitcher.jpg" alt="The witcher 3"></li>
		</ul>
	</a>

	<div class="barraBlanca">
		<div class="informacion_articulo">
			<b><a href="#0">The witcher 3 : Wild Hunt</a></b>
			<em>39.00€</em>
		</div>

		<button class="anadir action action--button action--buy">
			<em>anadir</em>
			<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
				<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
			</svg>
		</button>
	</div>
</div>
</div>

<div class="grid__item indie">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/dontstarve.jpg" alt="Preview image"></li>
			</ul>
		</a>

		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Dont Starve</a></b>
				<em>15.00€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item rpg">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/rpg.jpg" alt="South Park : The stick of truth"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">South Park : The stick of truth</a></b>
				<em>9.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item shooter">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/gta5.jpg" alt="Grand Thief Auto V"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Grand Thief Auto V</a></b>
				<em>49.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item rpg">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/final.jpg" alt="Final Fantasy XIV"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Final Fantasy XIV</a></b>
				<em>9.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item action">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/rise.jpg" alt="Rise of the Tomb Raider"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Rise of the Tomb Raider</a></b>
				<em>29.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item aventura">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/ark.jpg" alt="Ark: Evolution"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Ark: Evolution</a></b>
				<em>29.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item shooter">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/dyinglight.jpg" alt="Dying Light"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Dying Light</a></b>
				<em>39.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item aventura">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/skyrim.jpg" alt="The Elder Scrolls: Skyrim"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">The Elder Scrolls: Skyrim</a></b>
				<em>14.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item action">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/bioshock.jpg" alt="Bioshock: Infinite"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Bioshock: Infinite</a></b>
				<em>29.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item shooter">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/fallout.jpg" alt="Fallout 4"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Fallout 4</a></b>
				<em>59.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item aventura">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/portal.jpg" alt="Portal 2"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Portal 2</a></b>
				<em>9.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item grid__item--size-a rpg">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/Darksouls.jpg" alt="Dark Souls 3"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Dark Souls 3</a></b>
				<em>49.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item indie">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/indie.jpg" alt="The binding of Isaac"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">The binding of Isaac</a></b>
				<em>6.66€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item aventura">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/assassins.jpg" alt="Assassins Creed : Origins"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Assassins Creed : Origins</a></b>
				<em>59.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item rpg">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/diablo3.jpg" alt="Diablo 3"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Diablo 3</a></b>
				<em>19.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item action">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/wolfenstein.jpg" alt="Wolfenstein II"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Wolfenstein II</a></b>
				<em>59.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item shooter">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/mass.jpg" alt="Mass Effect"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Mass Effect</a></b>
				<em>9.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item grid__item--size-a rpg">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/monster.jpg" alt="Monster Hunter : World"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Monster Hunter : World</a></b>
				<em>59.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item aventura">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/resident.jpg" alt="Resident Evil "></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Resident Evil 7</a></b>
				<em>59.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item shooter">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/alien.jpg" alt="Alien Isolation"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Alien : Isolation</a></b>
				<em>17.00€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>

<div class="grid__item action">
	<div class="producto">
		<a href="#0">
			<ul class="bordes">
				<li class="selected"><img src="/GZoneWeb/images/life.jpg" alt="Life is Strange"></li>
			</ul>
		</a>
		<div class="barraBlanca">
			<div class="informacion_articulo">
				<b><a href="#0">Life is Strange</a></b>
				<em>4.99€</em>
			</div> <!-- informacion_articulo -->

			<button class="anadir action action--button action--buy">
				<em>anadir</em>
				<svg x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32">
					<path stroke-dasharray="19.79 19.79" stroke-dashoffset="19.79" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"/>
				</svg>
			</button>
		</div> <!-- .barraBlanca -->
	</div> <!-- .producto -->
</div>
</section>
<!-- /grid-->
</div>

<%@include file="/html/common/footer.jsp"%>
