<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<div id="busqueda">
 <div class="container">
    <hgroup>
  		<h1>Resultados de búsqueda</h1>
  		<h2 class="lead"><strong class="text-danger">3</strong> resultados cumplen con la búsqueda de : <strong class="text-danger">witcher</strong></h2>
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
  		<article class="search-result row">
  			<div class="col-xs-12 col-sm-12 col-md-3">
  				<a href="/GZoneWeb/html/product/product.jsp" title="The witcher 3" class="thumbnail"><img src="/GZoneWeb/images/thewitcher.jpg" alt="The Witcher 3 "></a>
  			</div>
  			<div class="col-xs-12 col-sm-12 col-md-2">
  				<ul class="meta-search">
  					<li><i class="fa fa-users"></i> <span>Multijugador</span></li>
  					<li><i class="fa fa-credit-card"></i><span>59.99€</span></li>
  					<li><i class="fa fa-gamepad"></i><span>Aventura</span></li>
  				</ul>
  			</div>
  			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
  				<h3><a href="articulo.html" title="">The witcher 3 : Wild Hunt</a></h3>
  				<p>Métete en la piel de un cazarrecompensas marginado que busca a la protagonista de una profecía en un mundo fantástico abierto, turbulento y de moralidad tibia. </p>
  			</div>
  			<span class="clearfix borda"></span>
  		</article>

        <article class="search-result row">
    			<div class="col-xs-12 col-sm-12 col-md-3">
    				<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/GZoneWeb/images/alien.jpg" alt="The Witcher 3 "></a>
    			</div>
    			<div class="col-xs-12 col-sm-12 col-md-2">
    				<ul class="meta-search">
    					<li><i class="fa fa-user"></i><span>Un jugador</span></li>
    					<li><i class="fa fa-credit-card"></i><span>17.00€</span></li>
    					<li><i class="fa fa-gamepad"></i><span>Shooter</span></li>
    				</ul>
    			</div>
    			<div class="col-xs-12 col-sm-12 col-md-7">
    				<h3><a href="#" title="">Alien : Isolation</a></h3>
    				<p>Descubre el verdadero significado del terror en Alien: Isolation, un juego de horror y supervivencia que transcurre en un ambiente de constante tensión y peligro. </p>
    			</div>
    			<span class="clearfix borda"></span>
  		</article>

  		<article class="search-result row">
  			<div class="col-xs-12 col-sm-12 col-md-3">
  				<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/GZoneWeb/images/cuphead.jpg" alt="The Witcher 3 "></a>
  			</div>
  			<div class="col-xs-12 col-sm-12 col-md-2">
  				<ul class="meta-search">
  					<li><i class="fa fa-user"></i><span>Un jugador</span></li>
  					<li><i class="fa fa-credit-card"></i><span>11.00€</span></li>
  					<li><i class="fa fa-gamepad"></i><span>Indie</span></li>
  				</ul>
  			</div>
  			<div class="col-xs-12 col-sm-12 col-md-7">
  				<h3><a href="#" title="">CupHead</a></h3>
  				<p>Cuphead es un juego de acción clásico estilo "dispara y corre" que se centra en combates contra el jefe. Inspirado en los dibujos animados de los años 30, los aspectos visual y sonoro están diseñados con esmero empleando las mismas técnicas de la época, es decir, animación tradicional </p>
  			</div>
  			<span class="clearfix border"></span>
  		</article>
  	 </section>
  </div>
 </div>
 <%@include file="/html/common/footer.jsp"%>
  