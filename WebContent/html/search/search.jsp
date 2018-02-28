<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String product = request.getParameter(SessionAttributeNames.PRODUCT);
	if (product==null) {product ="";}
%>

<%
	List<Producto> productos = (List <Producto>) request.getAttribute(SessionAttributeNames.PRODUCT);
%>

<div id="todo">
     <div id="panel" class="panel-group">
      <form  id="busqueda_detallada" role="form" action="/GZoneWeb/SearchServlet" method="post">
	      <button type="submit" name="submit" value="detailed" class="btn btn-primary buscar-central"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	      <input type="text" id="cuadro" class="form-control" name="product" placeholder="Hacer una nueva búsqueda" />

	      <div class="panel panel-default">
	        <div class="panel-heading">Categorias</div>
	        <div class="panel-body">
	          <input type="checkbox" class="read-more-state" id="categ" />
	          <div class="read-more-wrap form-group categoria ">
	              <div class="checkbox ">
	                <label><input type="checkbox" name="categoria" value="1">Accion</label>
	              </div>
	              <div class="checkbox">
	                <label><input type="checkbox" name="categoria" value="2">Option 2</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="categoria" value="3" >Option 3</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="categoria" value="4" >Option 4</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="categoria" value="5" >Option 5</label>
	              </div>
	           </div>
	           <label for="categ" class="read-more-trigger"></label>
	        </div>
	      </div>
	      
	      <div class="panel panel-default">
	        <div class="panel-heading">NJugadores</div>
	        <div class="panel-body">
	          <input type="checkbox" class="read-more-state" id="post-3" />
	          <div class="read-more-wrap form-group categoria" >
	              <div class="checkbox ">
	                <label><input type="checkbox" name="jugadores" value="1">Un jugador</label>
	              </div>
	              <div class="checkbox">
	                <label><input type="checkbox" name="jugadores" value="2">Multijugador</label>
	              </div>
	              <div class="checkbox ">
	                <label><input type="checkbox" name="jugadores" value="3">Multijugador en línea</label>
	              </div>
	              <div class="checkbox read-more-target ">
	                <label><input type="checkbox" name="jugadores" value="4">Multijugador local</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="jugadores" value="5">Pantalla dividida</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="jugadores" value="6" >Multijugador masivo</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="jugadores" value="7" >Cooperativo en linea</label>
	              </div>
	           </div>
	           <label for="post-3" class="read-more-trigger"></label>
	        </div>
	      </div>
	      
	      <div class="panel panel-default">
	        <div class="panel-heading">Idioma</div>
	        <div class="panel-body">
	          <input type="checkbox" class="read-more-state" id="post-4" />
	          <div class="read-more-wrap form-group categoria ">
	              <div class="checkbox ">
	                <label><input type="checkbox" name="idioma" value="'ES'">Español</label>
	              </div>
	              <div class="checkbox">
	                <label><input type="checkbox" name="idioma" value="'EN'">Inglés</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="idioma" value="'FR'" >Francés</label>
	              </div>
	              <div class="checkbox read-more-target">
	                <label><input type="checkbox" name="idioma" value="'GR'" >Alemán</label>
	              </div>
	           </div>
	           <label for="post-4" class="read-more-trigger"></label>
	        </div>
	      </div>
	      
	      <div class="panel panel-default">
	       <div class="panel-heading">Año</div>
	        <div class="panel-body">
	       <div class="form-group">
			  <label for="Anio">Select list:</label>
			  <select class="form-control " name="anio" id="años">
			 	<option value="" selected disabled >Choose...</option>
			    <option value="1981">1981</option>
                <option value="1982">1982</option>
                <option value="1983">1983</option>
                <option value="1984">1984</option>
                <option value="1985">1985</option>
                <option value="1986">1986</option>
                <option value="1987">1987</option>
                <option value="1988">1988</option>
                <option value="1989">1989</option>
                <option value="1990">1990</option>
                <option value="1991">1991</option>
                <option value="1992">1992</option>
                <option value="1993">1993</option>
                <option value="1994">1994</option>
                <option value="1995">1995</option>
                <option value="1996">1996</option>
                <option value="1997">1997</option>
                <option value="1998">1998</option>
                <option value="1999">1999</option>
                <option value="2000">2000</option>
                <option value="2001">2001</option>
                <option value="2002">2002</option>
                <option value="2003">2003</option>
                <option value="2004">2004</option>
                <option value="2005">2005</option>
                <option value="2006">2006</option>
                <option value="2007">2007</option>
                <option value="2008">2008</option>
                <option value="2009">2009</option>
                <option value="2010">2010</option>
                <option value="2011">2011</option>
                <option value="2012">2012</option>
                <option value="2013">2013</option>
                <option value="2014">2014</option>
                <option value="2015">2015</option>
                <option value="2016">2016</option>
                <option value="2017">2017</option>
				<option value="2018">2018</option>
			  </select>
			</div>
		</div> 
		</div>
	</form>
    </div>
     <div class="container">
    
    <hgroup>
  		<h1>Resultados de búsqueda</h1>
  		<h2 class="lead"><strong class="text-danger"><%=productos.size()%></strong> resultados cumplen con la búsqueda de : <strong class="text-danger"><%=product%></strong></h2>
  	</hgroup>
                      
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
