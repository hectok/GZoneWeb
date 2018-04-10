<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>
    <footer id="piePagina">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h5><fmt:message key="footer.empecemos" bundle="${messages}"/></h5>
                    <ul>
                        <li><a href="/GZoneWeb/html/index.jsp">Inicio</a></li>
                        <li><a href="#" data-toggle="modal"	data-target="#iniciar"><fmt:message key="header.iniciar_sesion" bundle="${messages}"/></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#registro"><fmt:message key="header.registro" bundle="${messages}"/></a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h5><fmt:message key="header.acerca" bundle="${messages}"/></h5>
                    <ul>
                        <li><a href="/GZoneWeb/html/about/about.jsp">GZone</a></li>
                        <li><a href="#"><fmt:message key="footer.contacta" bundle="${messages}"/></a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h5><fmt:message key="header.soporte" bundle="${messages}"/></h5>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="/GZoneWeb/html/support/support.jsp"><fmt:message key="footer.ayuda" bundle="${messages}"/></a></li>
                        <li><a href="#">Foros</a></li>
                    </ul>
                </div>
                <div class="col-sm-3 info">
                    <h5><fmt:message key="footer.informacion" bundle="${messages}"/></h5>
                    <p> <fmt:message key="header.bienvenida" bundle="${messages}"/></p>
                </div>
            </div>
        </div>
        <div class="second-bar">
           <div class="container">
                <h2 class="logo"><a href="/GZoneWeb/IndexServlet"><img src="/GZoneWeb/images/logo.png" alt="Logo GZone" width=40px></a></h2>
                <div class="social-icons">
                    <a href="https://twitter.com/GZoneWebApp" target="_blank" class="twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="facebook" target="_blank"><i class="fa fa-facebook"></i></a>
                    <a href="https://plus.google.com/u/0/114559509461059024383" target="_blank" class="google"><i class="fa fa-google-plus"></i></a>
                </div>
            </div>
        </div>
    </footer>
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script>
	if( !window.jQuery ) document.write('<script src="js/jquery-3.0.0.min.js"><\/script>');
</script>
	<script src="/GZoneWeb/js/index/cart.js"></script> <!-- Resource jQuery -->
    <script src="/GZoneWeb/js/banner/banner.js"></script>
	<script src="/GZoneWeb/js/index/isotope.pkgd.min.js"></script>
	<script src="/GZoneWeb/js/index/flickity.pkgd.min.js"></script>
	<script src="/GZoneWeb/js/index/main.js"></script>
	<script src="/GZoneWeb/js/index/tick.js"></script>
    
</body>

</html>