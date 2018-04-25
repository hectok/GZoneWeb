/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.gzone.ecommerce.exceptions.DataException;
import com.gzone.ecommerce.model.Categoria;
import com.gzone.ecommerce.model.Hotel;
import com.gzone.ecommerce.model.Idioma;
import com.gzone.ecommerce.model.NJugadores;
import com.gzone.ecommerce.model.Oferta;
import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.service.CategoriaService;
import com.gzone.ecommerce.service.IdiomaService;
import com.gzone.ecommerce.service.NJugadoresService;
import com.gzone.ecommerce.service.OfertaService;
import com.gzone.ecommerce.service.ProductoCriteria;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.XMLService;
import com.gzone.ecommerce.service.impl.CategoriaServiceImpl;
import com.gzone.ecommerce.service.impl.IdiomaServiceImpl;
import com.gzone.ecommerce.service.impl.NJugadoresServiceImpl;
import com.gzone.ecommerce.service.impl.OfertaServiceImpl;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;
import com.gzone.ecommerce.service.impl.XMLServiceImpl;
import com.gzone.ecommerce.web.util.ArrayUtils;
import com.gzone.ecommerce.web.util.SessionManager;
import com.gzone.ecommerce.web.util.TrimmerUtil;
import com.gzone.ecommerce.web.util.WebConstants;

/**
 * @author hector.ledo.doval
 *
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());

	private ProductoService productoService = null;
	private CategoriaService categoriaService = null;
	private NJugadoresService njugadoresService = null;
	private IdiomaService idiomaService = null;
	private XMLService xmlservice = null;
	private OfertaService ofertaService = null;

	public SearchServlet() {
		super();
		productoService = new ProductoServiceImpl();
		categoriaService = new CategoriaServiceImpl();
		njugadoresService = new NJugadoresServiceImpl();
		idiomaService = new IdiomaServiceImpl();
        ofertaService = new OfertaServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = null;
		String idioma = SessionManager.get(request,WebConstants.USER_LOCALE).toString().substring(0,2).toUpperCase();
		String action = request.getParameter(ParameterNames.ACTION);

		
		//Busqueda de un solo producto(Vista detallada)
		if (Actions.UNIQUE.equalsIgnoreCase(action)) {
			Long idProducto = Long.parseLong(request.getParameter(SessionAttributeNames.PRODUCT)) ;	
			Producto productoDetail = new Producto();
			
			try {
			//Lista todas las ofertas
			List<Oferta> ofertasService = ofertaService.findAll(1, 10);
			
			if (idProducto==6) {
				//Cargamos el servicio de recuperacion del XML de Hotusa solo si entra en el videojuego de tomb raider
				xmlservice = new XMLServiceImpl();
				List<Hotel> xml_request = xmlservice.XMLRequest();
				request.setAttribute(AttributeNames.HOTUSA, xml_request);
			}
			productoDetail = productoService.findById(idProducto, idioma);	
			if (productoDetail==null ) {
				request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
				target = ViewsPaths.INDEX_SERVLET;
			} else {	
				target = ViewsPaths.PRODUCT_DETAIL;
				request.setAttribute(SessionAttributeNames.PRODUCT, productoDetail);
				request.setAttribute(ParameterNames.SALES_LIST, ofertasService);
			}
				request.getRequestDispatcher(target).forward(request, response);
			} catch (DataException e) {
				request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
				target = ViewsPaths.INDEX_SERVLET;
			}
		} else {

			String search = TrimmerUtil.cleaner(request.getParameter(SessionAttributeNames.PRODUCT));

			String[] categorias = request.getParameterValues(SessionAttributeNames.CATEGORY);
			String[] jugadores = request.getParameterValues(SessionAttributeNames.PLAYERS);
			String anio = request.getParameter(SessionAttributeNames.YEAR);
			String[] idiomas = request.getParameterValues(SessionAttributeNames.LANGUAGE);

			ProductoCriteria criteria = null;
			ArrayUtils arrayUtil = null;
			
			//Busqueda simple por el nombre
			if (Actions.SIMPLE.equalsIgnoreCase(action)) {
				criteria = new ProductoCriteria();
				criteria.setNombre(search);
			} else {
				//Busqueda detalla por varios parámetros
				if (Actions.DETAILED.equalsIgnoreCase(action)) {
					//Creamos nuestro objecto criteria en el que encapsularemos todos los parámetros de búsqueda
					criteria = new ProductoCriteria();
					arrayUtil = new ArrayUtils();
					//Introducimos el string de búsqueda pasado previamente por un trimmer
					criteria.setNombre(search);
					//En caso de que algunos de los parámetros no sea nulo lo introducimos dentro del objecto de búsqueda, pasandolo previamente por el arrayUtil
					if (categorias != null) {
						criteria.setCategorias(arrayUtil.arrayToCategoria(categorias));
					}
					if (jugadores != null) {
						criteria.setNjugadores(arrayUtil.arrayToNJugadores(jugadores));

					}
					if (anio != null) {
						criteria.setAnio(Integer.valueOf(anio));

					}
					if (idiomas != null) {
						criteria.setIdioma(arrayUtil.arrayToIdioma(idiomas));
					}
				}
			}

			try {

				List<Categoria> todasCategorias = categoriaService.findAll(1, 30, idioma);
				List<NJugadores> todosJugadores = njugadoresService.findAll(1, 10);
				List<Idioma> todosIdiomas = idiomaService.findAll(1, 10);
				//Llamamos a la capa de negocio pasándole el objecto criteria ya con los parámetros introducidos y el resultado lo guardamos en una lista de productos.
				List<Producto> productos = productoService.findByCriteria(criteria, 1, 10, idioma);

				request.setAttribute(SessionAttributeNames.CATEGORY, todasCategorias);
				request.setAttribute(SessionAttributeNames.PLAYERS, todosJugadores);
				request.setAttribute(SessionAttributeNames.LANGUAGE, todosIdiomas);

				if (productos.isEmpty()) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.SEARCH;
				} else {
					target = ViewsPaths.SEARCH;
					request.setAttribute(AttributeNames.PRODUCT, productos);

				}
				request.getRequestDispatcher(target).forward(request, response);
			} catch (DataException e) {
				logger.info(AttributeNames.NOT_FOUND + e.getMessage());
				request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
				target = ViewsPaths.INDEX_SERVLET;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}