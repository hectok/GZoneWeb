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
        <input type="text" class="form-control" placeholder="Hacer una nueva búsqueda detallada" />
        <div class="input-group-btn">
            <div class="btn-group" role="group">
                <div class="dropdown dropdown-lg">
                    <button type="submit" name="detallada" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                    <div class="dropdown-menu dropdown-menu-right" role="menu">
                        <form class="form-horizontal" role="form" action="/GZoneWeb/SearchServlet" method="post">
                          <!-- Div superior !-->
                            <div class="busqueda-arriba">
                              <!-- Busqueda por categorias !-->
                              <div class="form-group categoria ">
                                <label for="contain">Categorias</label>
                                    <select multiple class="form-control" id="categorias" name="categoria">
								      <option value="1">1</option>
								      <option value="2">2</option>
								      <option value="3">3</option>
								      <option value="4">4</option>
								      <option value="5">5</option>
								    </select>
                              </div>
                            <!-- Busqueda por jugadores !-->
							  <div class="form-group jugadores ">
                                <label for="contain">Nº de jugadores</label>
                                    <select multiple class="form-control" id="jugador" name="jugadores">
								      <option value="1">Un jugador</option>
								      <option value="2">Multijugador</option>
								      <option value="3">Multijugador en línea</option>
								      <option value="4">Multijugador local</option>
								      <option value="5">Pantalla dividida</option>
								      <option value="6">Multijugador masivo</option>
								      <option value="7" >Cooperativo en linea</option>  
								    </select>
                              </div>
                            </div>
                            <!-- Div inferior !-->
                            <div class="busqueda-abajo">
                              <!-- Busqueda por SO !-->
                              <div class="form-group so" >
                                <label for="filter">Idioma</label>
                                <select class="form-control" name="idioma">
                                    <option value="0" selected>Elegir uno:</option>
                                    <option value="1">Español</option>
                                    <option value="2">Inglés</option>
                                    <option value="3">Francés</option>
                                    <option value="4">Cualquiera...</option>
                                </select>
                              </div>

                              <!-- Busqueda por año !-->
                              <div class="form-group anio" name="anio">
                                <label for="filter">Año</label>
                                <select class="form-control">
                                    <option value="0" selected>Elige un año:</option>
                                    <option value="1">1981</option>
                                    <option value="2">1982</option>
                                    <option value="3">1983</option>
                                    <option value="4">1984</option>
                                    <option value="5">1985</option>
                                    <option value="6">1986</option>
                                    <option value="7">1987</option>
                                    <option value="8">1988</option>
                                    <option value="9">1989</option>
                                    <option value="10">1990</option>
                                    <option value="11">1991</option>
                                    <option value="12">1992</option>
                                    <option value="13">1993</option>
                                    <option value="14">1994</option>
                                    <option value="15">1995</option>
                                    <option value="16">1996</option>
                                    <option value="17">1997</option>
                                    <option value="18">1998</option>
                                    <option value="19">1999</option>
                                    <option value="20">2000</option>
                                    <option value="21">2001</option>
                                    <option value="22">2002</option>
                                    <option value="23">2003</option>
                                    <option value="24">2004</option>
                                    <option value="25">2005</option>
                                    <option value="26">2006</option>
                                    <option value="27">2007</option>
                                    <option value="28">2008</option>
                                    <option value="29">2009</option>
                                    <option value="30">2010</option>
                                    <option value="31">2011</option>
                                    <option value="32">2012</option>
                                    <option value="33">2013</option>
                                    <option value="34">2014</option>
                                    <option value="35">2015</option>
                                    <option value="36">2016</option>
                                    <option value="37">2017</option>
                                    <option value="38">2018</option>

                                    
                                </select>
                              </div>
                            </div>

                          <button type="submit" name="submit" value="detail" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                        </form>
                    </div>
                </div>
                <button type="submit" name="submit" value="detail" class="btn btn-primary buscar-central"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </div>
        </div>
      </div>


      <section class="col-xs-12 col-sm-6 col-md-12">
      <%
		if (product!=null & product!=""){
			for (Producto producto: productos) {
				%>
				<article class="search-result row" >
		  			<div class="col-xs-12 col-sm-12 col-md-3">
		  				<a href="/GZoneWeb/ProductServlet?product=<%=producto.getIdProducto()%>" title=<%=producto.getNombre()%> class="thumbnail"><img src="/GZoneWeb/CMS/producto_<%=producto.getIdProducto()%>/preview<%=producto.getIdProducto()%>.jpg" alt="<%=producto.getNombre()%>"></a>
		  			</div>
		  			<div class="col-xs-12 col-sm-12 col-md-2">
		  				<ul class="meta-search">
		  					<li><i class="fa fa-users"></i> <span>Multijugador</span></li>
		  					<li><i class="fa fa-credit-card"></i><span><%=producto.getPrecio()%></span></li>
		  					<li><i class="fa fa-gamepad"></i><span>Accion</span></li>
		  				</ul>
		  			</div>
		  			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
		  				<h3><a href="/GZoneWeb/ProductServlet?product=<%=producto.getIdProducto()%>" title=""><%=producto.getNombre()%></a></h3>
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
