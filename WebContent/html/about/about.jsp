<%@include file="/html/common/header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<div id="acerca">
    <div id="cabecera">
      <div id="centro">
        <div id="texto">
          <h1><fmt:message key="acerca.gzone" bundle="${messages}"/></h1>
          <p><fmt:message key="acerca.descripcion" bundle="${messages}"/></p>

        </div>
        <img class="img-responsive" src="/GZoneWeb/images/acerca/cabecera.png" alt="Muestra juegos" ></img>
      </div>
    </div>
    <div id="cuerpo" class="row">
      <div id="cuadrado" class="col-6">
        <h2><fmt:message key="acerca.accede" bundle="${messages}"/></h2>
        <div id="parrafo">
          <p><fmt:message key="acerca.accede_descripcion" bundle="${messages}"/><p>
          <img class="img-responsive" src="/GZoneWeb/images/acerca/titulo1.png" alt="Descubre nuevos juegos" ></img>
        </div>
      </div>
      <div id="cuadrado" class="col-6">
        <h2><fmt:message key="acerca.unete" bundle="${messages}"/></h2>
        <div id="parrafo">
          <p><fmt:message key="acerca.unete_descripcion" bundle="${messages}"/><p>
          <img class="img-responsive" src="/GZoneWeb/images/acerca/titulo2.png" alt="Entra en nuestra comunidad" ></img>
        </div>
      </div>
      <div id="cuadrado" class="col-6">
        <h2><fmt:message key="acerca.drm" bundle="${messages}"/></h2>
        <div id="parrafo">
          <p><fmt:message key="acerca.drm_descripcion" bundle="${messages}"/><p>
          <img class="img-responsive" src="/GZoneWeb/images/acerca/titulo3.png" alt="DRM-FREE" ></img>
        </div>
      </div>
      <div id="cuadrado" class="col-6">
        <h2><fmt:message key="acerca.diviertete" bundle="${messages}"/></h2>
        <div id="parrafo">
          <p><fmt:message key="acerca.diviertete_descripcion" bundle="${messages}"/><p>
          <img class="img-responsive" src="/GZoneWeb/images/acerca/titulo4.png" alt="Divierte con GZone" ></img>
        </div>
      </div>
    </div>
    <div id="cabecera2">
      <div id="centro2">
        <div id="texto">
          <h1><fmt:message key="acerca.footer" bundle="${messages}"/></h1>
        </div>
      </div>
    </div>
 </div>
<c:import url="/html/common/footer.jsp"></c:import>
  