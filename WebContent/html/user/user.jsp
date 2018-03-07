<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	Usuario usuario = (Usuario) request.getAttribute(SessionAttributeNames.PROFILE);
 	List<Producto> biblioteca = (List<Producto>) request.getAttribute(SessionAttributeNames.LIBRARY);
 
%>
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
            <p>Número de juegos : <%=biblioteca.size()%></p>
            <div class="juegos">
             <%
				if (biblioteca!=null & biblioteca.size()>0){
					for (Producto ticket: biblioteca) {
						%>
				<div class="col-md-4">
				    <figure class="juego navy col-md-4">
				      <img src="/GZoneWeb/CMS/producto_<%=ticket.getIdProducto()%>/preview<%=ticket.getIdProducto()%>.jpg" alt="<%=ticket.getNombre()%>" />
				      <figcaption>
				        <a href="/GZoneWeb/IndexServlet">Descargar</a>
				        <a href="/GZoneWeb/ProductServlet?product=<%=ticket.getIdProducto()%>" title=<%=ticket.getNombre()%>>Ver producto</a>
				      </figcaption>
				    </figure>
				</div>
				
 			<%
				}
					}
					else
					{
			%>
				<h3>Aún no tienes ningún juego en tu biblioteca!</h3>
			<%
				}
			%>
			</div> 
          </div>
          <!--Panel de ajustes del usuario -->
          <div class="tab-pane fade" id="ajustes">
            <div class="container">
              <form class="well form-horizontal" action=" " method="post"  id="contact_form">
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
                        <input class="form-control" type="text" placeholder=<%=usuario.getUsuario()%> disabled>
                      </div>
                    </div>
                  </div>

                  <!-- Nombre-->
                  <div class="form-group">
                    <label class="col-md-4 control-label">Tu nombre</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input  name="first_name" placeholder=<%=usuario.getNombre()%> class="form-control"  type="text">
                      </div>
                    </div>
                  </div>

                  <!-- Apellidos-->
                  <div class="form-group">
                    <label class="col-md-4 control-label" >Apellidos</label>
                    <div class="col-md-4 inputGroupContainer">
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="last_name" placeholder="<%=usuario.getApellido()%>" class="form-control"  type="text">
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
                          <option >Connecticut</option>
                          <option >Delaware</option>
                          <option >District of Columbia</option>
                          <option> Florida</option>
                          <option >Georgia</option>
                          <option >Hawaii</option>
                          <option >daho</option>
                          <option >Illinois</option>
                          <option >Indiana</option>
                          <option >Iowa</option>
                          <option> Kansas</option>
                          <option >Kentucky</option>
                          <option >Louisiana</option>
                          <option>Maine</option>
                          <option >Maryland</option>
                          <option> Mass</option>
                          <option >Michigan</option>
                          <option >Minnesota</option>
                          <option>Mississippi</option>
                          <option>Missouri</option>
                          <option>Montana</option>
                          <option>Nebraska</option>
                          <option>Nevada</option>
                          <option>New Hampshire</option>
                          <option>New Jersey</option>
                          <option>New Mexico</option>
                          <option>New York</option>
                          <option>North Carolina</option>
                          <option>North Dakota</option>
                          <option>Ohio</option>
                          <option>Oklahoma</option>
                          <option>Oregon</option>
                          <option>Pennsylvania</option>
                          <option>Rhode Island</option>
                          <option>South Carolina</option>
                          <option>South Dakota</option>
                          <option>Tennessee</option>
                          <option>Texas</option>
                          <option> Uttah</option>
                          <option>Vermont</option>
                          <option>Virginia</option>
                          <option >Washington</option>
                          <option >West Virginia</option>
                          <option>Wisconsin</option>
                          <option >Wyoming</option>
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
                        <input name="zip" placeholder="Codigo postal" class="form-control"  type="text">
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
                        <textarea class="form-control" name="comment" placeholder="<%=usuario.getDescripcion()%>"></textarea>
                      </div>
                    </div>
                  </div>
                  <hr />
              
                  <!-- Button -->
                  <div class="form-group">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-4">
                      <button type="submit" class="btn btn-warning" >Enviar <span class="glyphicon glyphicon-send"></span></button>
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

<%@include file="/html/common/footer.jsp"%>