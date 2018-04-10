<%@include file="/html/common/header.jsp"%>

<%@ page contentType="text/html; charset=UTF-8" %>

<div id="soporte">
    <div id="cuadro_fondo">
      <a  href=""><img src="/GZoneWeb/images/logo.png" alt="Logo GZone" width=40px></a>
      <h1><fmt:message key="support.centro_soporte" bundle="${messages}"/></h1>
    </div>
	<div id="ancho">
	    <div class="container-fluid text-center">
	      <div class="row">
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="gamesupport@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/juegos.png" alt="Problemas con tus juegos" ></img>
	              <h4><fmt:message key="support.problemas_juegos" bundle="${messages}"/></h4>
	              <p><fmt:message key="support.problemas_juegos_desc" bundle="${messages}"/></p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="ticketsupport@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/pedidos.png" alt="Problemas con tus pedidos" ></img>
	              <h4><fmt:message key="support.pedidos_pagos" bundle="${messages}"/></h4>
	              <p><fmt:message key="support.centro_soporte" bundle="${messages}"/></p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="accountsupport@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/cuenta.png" alt="Problemas con tu cuenta" ></img>
	              <h4><fmt:message key="support.cuenta_configuracion" bundle="${messages}"/></h4>
	              <p><fmt:message key="support.problema_inicio" bundle="${messages}"/></p>
	            </div>
	          </a>
	        </div>
	      </div>
	      <br><br>
	      <div class="row">
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="downloadsupport@gzonewebapp.com">
	            <div id="pulsador" >
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/descargas.png" alt="Problemas con alguna descarga" ></img>
	              <h4><fmt:message key="support.descargas" bundle="${messages}"/></h4>
	              <p><fmt:message key="support.descarga_fallida" bundle="${messages}"/></p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="community@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/comunidad.png" alt="Unete a nosotros" ></img>
	              <h4><fmt:message key="support.comunidad" bundle="${messages}"/></h4>
	              <p><fmt:message key="support.formar_parte" bundle="${messages}"/></p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="aboutus@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/informacion.png" alt="Informacion general" ></img>
	              <h4><fmt:message key="support.informacion_general" bundle="${messages}"/></h4>
	              <p><fmt:message key="support.saber_mas" bundle="${messages}"/></p>
	            </div>
	          </a>
	        </div>
	      </div>
	    </div>
  </div>

	<div class="modal fade" id="supportModal" tabindex="-1" role="dialog"
		aria-labelledby="supportModal" aria-hidden="true">
		<div id="modalSoporte" class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="supportModal"><fmt:message key="support.nuevo_mensaje" bundle="${messages}"/></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group" >
							<label for="recipient-name" class="col-form-label"><fmt:message key="support.destinatario" bundle="${messages}"/></label>
							<input type="text" class="form-control" id="recipient-name" readonly>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label"><fmt:message key="support.cuentanos" bundle="${messages}"/></label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"><fmt:message key="support.cerrar" bundle="${messages}"/></button>
					<button type="button" class="btn btn-primary"><fmt:message key="support.enviar" bundle="${messages}"/></button>
				</div>
			</div>
		</div>
	</div>
	<script src="/GZoneWeb/js/support/support.js"></script>

</div>
<c:import url="/html/common/footer.jsp"></c:import>
