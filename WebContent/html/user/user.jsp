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
                  <icon class="fa fa-book"></icon> <fmt:message key="user.biblioteca" bundle="${messages}"/>
              </a>
          </li>
          <li>
              <a href="#ajustes" role="tab" data-toggle="tab">
                  <i class="fa fa-cog"></i> <fmt:message key="user.ajustes" bundle="${messages}"/>
              </a>
          </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane well fade active in " id="biblioteca">
            <legend><fmt:message key="user.panel_usuario" bundle="${messages}"/></legend>
            <p><fmt:message key="user.numero_juegos" bundle="${messages}"/> ${biblioteca.size()}</p>
            <div class="row">
            <c:choose>
            	<c:when test="${!biblioteca.isEmpty()}">
            		<c:forEach items="${biblioteca}" var="item">
            		<div class="col-md-3">
					    <figure class="juego">
					      <img src="/GZoneWeb/CMS/producto_${item.getIdProducto()}/preview${item.getIdProducto()}.jpg" alt="${item.getNombre()}" />
					      <figcaption>
					        <a href="/GZoneWeb/IndexServlet"><fmt:message key="user.descargar" bundle="${messages}"/></a>
					        <a href="/GZoneWeb/SearchServlet?action=${Actions.UNIQUE}&product=${item.getIdProducto()}" title="${item.getNombre()}"><fmt:message key="user.verProducto" bundle="${messages}"/></a>
					      </figcaption>
					    </figure>
					</div>
            		</c:forEach>     	
            	</c:when>
            	<c:otherwise>
            		<h3><fmt:message key="user.no_games" bundle="${messages}"/></h3>
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
                  <legend><fmt:message key="user.panel_usuario" bundle="${messages}"/></legend>
                  <!-- Perfil del usuario-->
                  <!-- Nombre-->
                  <div class="form-group">
                    <label class="col-md-4 control-label"><fmt:message key="user.tu_usuario" bundle="${messages}"/></label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input class="form-control" type="text" name="usuario" placeholder="${user.getUsuario()}" disabled>
                      </div>
                    </div>
                  </div>

                  <!-- Nombre-->
                  <div class="form-group">
                    <label class="col-md-4 control-label"><fmt:message key="user.tu_nombre" bundle="${messages}"/></label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input  name="first_name" placeholder="${user.getNombre()}" class="form-control"  type="text">
                      </div>
                    </div>
                  </div>

                  <!-- Apellidos-->
                  <div class="form-group">
                    <label class="col-md-4 control-label" ><fmt:message key="user.tus_apellidos" bundle="${messages}"/></label>
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
                    <label class="col-md-4 control-label"><fmt:message key="user.sobre_ti" bundle="${messages}"/></label>
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
                      <button type="submit" name="submit" value="update" class="btn btn-warning" ><fmt:message key="user.actualizar" bundle="${messages}"/><span class="glyphicon glyphicon-send"></span></button>
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
