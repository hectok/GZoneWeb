<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	String product = request.getParameter(SessionAttributeNames.PRODUCT);
	if (product==null) {product ="";}
%>

<%
	List<Producto> productos = (List <Producto>) request.getAttribute(SessionAttributeNames.PRODUCT);		
%>
	
<div id="busqueda">
 <div class="container">
    <hgroup>
  		<h1>Resultados de búsqueda</h1>
  		<h2 class="lead"><strong class="text-danger"><%=productos.size()%></strong> resultados cumplen con la búsqueda de : <strong class="text-danger"><%=product%></strong></h2>
  	</hgroup>
      <div class="input-group" id="adv-search">
        <input type="text" class="form-control" placeholder="Hacer una nueva búsqueda" />
        <div class="input-group-btn">
            <div class="btn-group" role="group">
                <div class="dropdown dropdown-lg">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                    <div class="dropdown-menu dropdown-menu-right" role="menu">
                        <form class="form-horizontal" role="form">
                          <!-- Div superior !-->
                            <div class="busqueda-arriba">
                              <!-- Busqueda por categorias !-->
                              <div class="form-group categoria">
                                <label for="contain">Categorias</label>
                                <div class="checkbox">
                                  <label><input type="checkbox" value="">Indie</label>
                                </div>
                                <div class="checkbox">
                                  <label><input type="checkbox" value="">Aventura</label>
                                </div>
                                <div class="checkbox">
                                  <label><input type="checkbox" value="">RPG</label>
                                </div>
                              </div>
                            <!-- Busqueda por jugadores !-->
                              <div class="form-group jugadores">
                                <label for="contain">Nº Jugadores</label>
                                <div class="checkbox">
                                  <label><input type="checkbox" value="">Un jugador</label>
                                </div>
                                <div class="checkbox">
                                  <label><input type="checkbox" value="">Multijugador</label>
                                </div>
                                <div class="checkbox">
                                  <label><input type="checkbox" value="">Multijugador en línea</label>
                                </div>
                              </div>
                            </div>
                            <!-- Div inferior !-->
                            <div class="busqueda-abajo">
                              <!-- Busqueda por SO !-->
                              <div class="form-group so">
                                <label for="filter">Sistema Operativo</label>
                                <select class="form-control">
                                    <option value="0" selected>Elegir uno:</option>
                                    <option value="1">Windows</option>
                                    <option value="2">Linux</option>
                                    <option value="3">Mac OS</option>
                                    <option value="4">Cualquiera...</option>
                                </select>
                              </div>

                              <!-- Busqueda por año !-->
                              <div class="form-group anio">
                                <label for="filter">Año</label>
                                <select class="form-control">
                                    <option value="0" selected>Elige un año:</option>
                                    <option value="1">1980</option>
                                    <option value="2">1981</option>
                                    <option value="3">1982</option>
                                    <option value="4">1983</option>
                                </select>
                              </div>
                            </div>

                          <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                        </form>
                    </div>
                </div>
                <button type="button" class="btn btn-primary buscar-central"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </div>
        </div>
      </div>

	
      <section class="col-xs-12 col-sm-6 col-md-12">
      <%
		if (product!=null & product!=""){
			for (Producto producto: productos) {
				%>
				<article class="search-result row">
		  			<div class="col-xs-12 col-sm-12 col-md-3">
		  				<a href="/GZoneWeb/html/product/product.jsp?id=<%=producto.getIdProducto()%>" title=<%=producto.getNombre()%> class="thumbnail"><img src="/GZoneWeb/CMS/producto_<%=producto.getIdProducto()%>/preview<%=producto.getIdProducto()%>.jpg" alt="<%=producto.getNombre()%>"></a>
		  			</div>
		  			<div class="col-xs-12 col-sm-12 col-md-2">
		  				<ul class="meta-search">
		  					<li><i class="fa fa-users"></i> <span>Multijugador</span></li>
		  					<li><i class="fa fa-credit-card"></i><span><%=producto.getPrecio()%></span></li>
		  					<li><i class="fa fa-gamepad"></i><span>Accion</span></li>
		  				</ul>
		  			</div>
		  			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
		  				<h3><a href="/GZoneWeb/html/product/product.jsp?id=<%=producto.getIdProducto()%>" title=""><%=producto.getNombre()%></a></h3>
		  				<p><%=producto.getDetalles_corto()%></p>
		  			</div>
		  			<span class="clearfix borda"></span>
		  		</article>
				<%
			}
		}
		else
		{
			%>
			<h3>No se han encontrado resultados</h3>
	<% 		
		}			
	%>      
  	 </section>
  </div>
 </div>
 <%@include file="/html/common/footer.jsp"%>
  