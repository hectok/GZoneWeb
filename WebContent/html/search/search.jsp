<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="resultado" value="${param.product}"></c:set>

<c:set var="productos" value="${requestScope.product}" />
<c:set var="categorias" value="${requestScope.categoria}" />
<c:set var="idioma" value="${requestScope.idiomas}" />
<c:set var="njugadores" value="${requestScope.jugadores}" />
<c:set var="anio" value="${requestScope.anio}" />

<div id="todo">
     <div id="panel" class="panel-group col-xs-2">
      <form  id="busqueda_detallada" role="form" action="GZoneWeb/SearchServlet?action=${Actions.DETAILED}" method="post">
	      <button type="submit" name="submit" class="btn btn-primary buscar-central"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	      <input type="text" id="cuadro" class="form-control" name="product" placeholder="<fmt:message key="search.nueva_busqueda" bundle="${messages}"/>" />

	      <div class="panel panel-default">
	        <div class="panel-heading"><fmt:message key="search.categorias" bundle="${messages}"/></div>
	        <div class="panel-body">
	          <input type="checkbox" class="read-more-state" id="categ" />
	          <div class="read-more-wrap form-group categoria ">
				<c:forEach var = "i" begin = "0" end ="${categorias.size()-1}">
					<c:choose> 
						<c:when test="${i<4}">
							<div class="checkbox ">
				                <label><input type="checkbox" name="categoria" value="${categorias.get(i).getIdCategoria()}">${categorias.get(i).getCategoria()}</label>
				            </div>
						</c:when>
						<c:otherwise>							
							<div class="checkbox read-more-target">
				                <label><input type="checkbox" name="categoria" value="${categorias.get(i).getIdCategoria()}">${categorias.get(i).getCategoria()}</label>
				            </div>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
	           </div>
	           <label for="categ" class="read-more-trigger"></label>
	        </div>
	      </div>
	      
	      <div class="panel panel-default">
	        <div class="panel-heading"><fmt:message key="search.numero_jugadores" bundle="${messages}"/></div>
	        <div class="panel-body">
	          <input type="checkbox" class="read-more-state" id="post-3" />
	          <div class="read-more-wrap form-group jugadores" >
				<c:forEach var = "i" begin = "0" end ="${jugadores.size()-1}">
					<c:choose> 
						<c:when test="${i<4}">
							<div class="checkbox ">
				                <label><input type="checkbox" name="jugadores" value="${jugadores.get(i).getIdNJugadores()}">${jugadores.get(i).getnJugadores()}</label>
				            </div>
						</c:when>
						<c:otherwise>							
							<div class="checkbox read-more-target">
				                <label><input type="checkbox" name="jugadores" value="${jugadores.get(i).getIdNJugadores()}">${jugadores.get(i).getnJugadores()}</label>
				            </div>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
	           </div>
	           <label for="post-3" class="read-more-trigger"></label>
	        </div>
	      </div>
	      
	      <div class="panel panel-default">
	        <div class="panel-heading"><fmt:message key="header.idioma" bundle="${messages}"/></div>
	        <div class="panel-body">
	          <input type="checkbox" class="read-more-state" id="post-4" />
	          <div class="read-more-wrap form-group idiomas ">
 			<c:forEach var = "i" begin = "0" end ="${idioma.size()-1}">
					<c:choose> 
						<c:when test="${i<4}">
							<div class="checkbox ">
				                <label><input type="checkbox" name="idiomas" value="<c:out value="'${idioma.get(i).getIdIdioma()}'"></c:out>">${idioma.get(i).getNombreIdioma()}</label>
				                
				            </div>
						</c:when>
						<c:otherwise>							
							<div class="checkbox read-more-target">
				                <label><input type="checkbox" name="idiomas"  value="<c:out value="'${idioma.get(i).getIdIdioma()}'"></c:out>">${idioma.get(i).getNombreIdioma()}</label>
				            </div>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
	           </div>
	           <label for="post-4" class="read-more-trigger"></label>
	        </div>
	      </div> 
	      
	      <div class="panel panel-default">
	       <div class="panel-heading"><fmt:message key="search.anio" bundle="${messages}"/></div>
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
  		<h1><fmt:message key="search.resultados_busqueda" bundle="${messages}"/></h1>
  		<h2 class="lead"><strong class="text-danger"><c:out value="${productos.size()}" default="0"/></strong> <fmt:message key="search.resultados_busqueda_cumplen" bundle="${messages}"/><strong class="text-danger">${resultado}</strong></h2>
  	</hgroup>
                      
      <section class="col-xs-10 col-sm-6 col-md-12">
		<c:choose>
			<c:when test="${!productos.isEmpty() || productos!=null}">
				<c:forEach items="${productos}" var="producto">
				<article class="search-result row" >
		  			<div class="col-xs-12 col-sm-12 col-md-3">
		  				<a href="/GZoneWeb/SearchServlet?action=<c:out value="${Actions.UNIQUE}"/>&product=${producto.getIdProducto()}" title="${producto.getNombre()}" class="thumbnail"><img src="/GZoneWeb/CMS/producto_${producto.getIdProducto()}/preview${producto.getIdProducto()}.jpg" alt="${producto.getNombre()}"></a>
		  			</div>
		  			<div class="col-xs-12 col-sm-12 col-md-2">
		  				<ul class="meta-search">
		  					<li><i class="fa fa-users"></i> <span>Multijugador</span></li>
		  					<li><i class="fa fa-credit-card"></i><span>${producto.getPrecio()}</span></li>
		  					<li><i class="fa fa-gamepad"></i><span>${producto.getAnio()}</span></li>
		  				</ul>
		  			</div>
		  			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
		  				<h3><a href="/GZoneWeb/SearchServlet?action=${Actions.UNIQUE}&product=${producto.getIdProducto()}" title="">${producto.getNombre()}</a></h3>
		  				<p>${producto.getDetalles_corto()}</p>
		  			</div>
		  			<span class="clearfix borda"></span>
		  		</article>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h3>No se han encontrado resultados</h3>
			</c:otherwise>
		</c:choose>	
  	 </section>

  </div>
 </div>
<c:import url="/html/common/footer.jsp"></c:import>
