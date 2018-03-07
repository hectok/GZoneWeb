<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<div id="soporte">
    <div id="cuadro_fondo">
      <a  href=""><img src="/GZoneWeb/images/logo.png" alt="Logo GZone" width=40px></a>
      <h1>Centro Soporte GZone</h1>
    </div>
	<div id="ancho">
	    <div class="container-fluid text-center">
	      <div class="row">
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="gamesupport@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/juegos.png" alt="Problemas con tus juegos" ></img>
	              <h4>Problemas con tus juegos</h4>
	              <p>¿Tienes algún problema a la hora de iniciar tus juegos?</p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="ticketsupport@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/pedidos.png" alt="Problemas con tus pedidos" ></img>
	              <h4>Pedidos y pagos</h4>
	              <p>¿Problemas con algún pago?</p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="accountsupport@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/cuenta.png" alt="Problemas con tu cuenta" ></img>
	              <h4>Cuenta y configuración</h4>
	              <p>¿Tienes problemas a la hora de acceder a tu cuenta o a la Web?</p>
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
	              <h4>Descargas</h4>
	              <p>¿Falla la descarga de alguno de tus juegos?</p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="community@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/comunidad.png" alt="Unete a nosotros" ></img>
	              <h4>Comunidad</h4>
	              <p>¿Quieres formar parte de GZone?</p>
	            </div>
	          </a>
	        </div>
	        <div class="col-sm-4">
	          <a href="#" data-toggle="modal" data-target="#supportModal" data-whatever="aboutus@gzonewebapp.com">
	            <div id="pulsador">
	              <img class="img-responsive" src="/GZoneWeb/images/soporte/informacion.png" alt="Informacion general" ></img>
	              <h4>Información general</h4>
	              <p>¿Quieres saber mas sobre GZone y lo que ofrecemos?</p>
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
					<h5 class="modal-title" id="supportModal">Nuevo mensaje</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group" >
							<label for="recipient-name" class="col-form-label">Destinatario:</label>
							<input type="text" class="form-control" id="recipient-name" readonly>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Cuentanos tu problema:</label>
							<textarea class="form-control" id="message-text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cerrar</button>
					<button type="button" class="btn btn-primary">Enviar
						mensaje</button>
				</div>
			</div>
		</div>
	</div>
	<script src="/GZoneWeb/js/support/support.js"></script>

</div>
<%@include file="/html/common/footer.jsp"%>
