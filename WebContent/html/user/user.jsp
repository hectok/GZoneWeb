<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="biblioteca" value="${requestScope.library}" />
<c:set var="user" value="${requestScope.profile}" />


<div id="perfil">
    <div id="centrar">
      <!-- Opciones del panel -->
      <div class="container">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-justified  barra" role="tablist">
          <li class="active">
              <a href="#biblioteca" role="tab" data-toggle="tab">
                  <icon class="fa fa-book"></icon> Biblioteca
              </a>
          </li>
          <li>
              <a href="#ajustes" role="tab" data-toggle="tab">
                  <i class="fa fa-cog"></i> Ajustes
              </a>
          </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane well fade active in " id="biblioteca">
            <legend>Tu panel de usuario</legend>
            <p>Número de juegos : ${biblioteca.size()}</p>
            <div class="juegos">
            <c:choose>
            	<c:when test="${!biblioteca.isEmpty()}">
            		<c:forEach items="${biblioteca}" var="item">
            		<div class="col-md-4">
					    <figure class="juego navy col-md-4">
					      <img src="/GZoneWeb/CMS/producto_${item.getIdProducto()}/preview${item.getIdProducto()}.jpg" alt="${item.getNombre()}" />
					      <figcaption>
					        <a href="/GZoneWeb/IndexServlet">Descargar</a>
					        <a href="/GZoneWeb/ProductServlet?product=${item.getIdProducto()}" title="${item.getNombre()}">Ver producto</a>
					      </figcaption>
					    </figure>
					</div>
            		</c:forEach>     	
            	</c:when>
            	<c:otherwise>
            		<h3>Aún no tienes ningún juego en tu biblioteca!</h3>
            	</c:otherwise>
            </c:choose>

			</div> 
          </div>
          <!--Panel de ajustes del usuario -->
          <div class="tab-pane fade" id="ajustes">
            <div class="container">
              <form class="well form-horizontal" action="/GZoneWeb/UserServlet?profile=${user.getIdUsuario()}&action=update" method="post"  id="contact_form">
                <fieldset>
                  <!-- Formulario -->
                  <legend>Tu panel de usuario</legend>
                  <!-- Perfil del usuario-->
                  <!-- Nombre-->
                  <div class="form-group">
                    <label class="col-md-4 control-label">Tu usuario</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input class="form-control" type="text" name="usuario" placeholder="${user.getUsuario()}" disabled>
                      </div>
                    </div>
                  </div>

                  <!-- Nombre-->
                  <div class="form-group">
                    <label class="col-md-4 control-label">Tu nombre</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input  name="first_name" placeholder="${user.getNombre()}" class="form-control"  type="text">
                      </div>
                    </div>
                  </div>

                  <!-- Apellidos-->
                  <div class="form-group">
                    <label class="col-md-4 control-label" >Apellidos</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="last_name" placeholder="${user.getApellido()}" class="form-control"  type="text">
                      </div>
                    </div>
                  </div>
                  <hr />
                  <!-- Text input-->
                  <div class="form-group">
                    <label class="col-md-4 control-label">Direccion</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input name="address" placeholder="Tu direccion" class="form-control" type="text">
                      </div>
                    </div>
                  </div>

                  <!-- Text input-->
                  <div class="form-group">
                    <label class="col-md-4 control-label">Ciudad</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input name="city" placeholder="Ciudad" class="form-control"  type="text">
                      </div>
                    </div>
                  </div>

                  <!-- Select Basic -->
                  <div class="form-group">
                    <label class="col-md-4 control-label">Provincia</label>
                    <div class="col-md-4 selectContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <select name="state" class="form-control selectpicker" >
                          <option value=" " >Seleccione su provincia</option>
                          <option>Alabama</option>
                          <option>Alaska</option>
                          <option >Arizona</option>
                          <option >Arkansas</option>
                          <option >California</option>
                          <option >Colorado</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <!-- Text input-->

                  <div class="form-group">
                    <label class="col-md-4 control-label">Código postal</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input name="codigoPostal" placeholder="Codigo postal" class="form-control"  type="text">
                      </div>
                    </div>
                  </div>

                  <!-- Text area -->
                  <hr />
                  <div class="form-group">
                    <label class="col-md-4 control-label">Sobre ti</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                        <textarea class="form-control" name="comentario" placeholder="${user.getDescripcion()}"></textarea>
                      </div>
                    </div>
                  </div>
                  <hr />
              
                  <!-- Button -->
                  <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-4">
                      <button type="submit" name="submit" value="update" class="btn btn-warning" >Actualizar <span class="glyphicon glyphicon-send"></span></button>
                    </div>
                  </div>
                </fieldset>
              </form>
            </div>
          </div><!-- /.container -->
          </div>
        </div>

      </div>
    </div>
  <script src="../js/flip/flip.js"></script>

<c:import url="/html/common/footer.jsp"></c:import>
