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

import com.gzone.ecommerce.model.Categoria;
import com.gzone.ecommerce.model.Idioma;
import com.gzone.ecommerce.model.NJugadores;
import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.service.CategoriaService;
import com.gzone.ecommerce.service.IdiomaService;
import com.gzone.ecommerce.service.NJugadoresService;
import com.gzone.ecommerce.service.ProductoCriteria;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.impl.CategoriaServiceImpl;
import com.gzone.ecommerce.service.impl.IdiomaServiceImpl;
import com.gzone.ecommerce.service.impl.NJugadoresServiceImpl;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;
import com.gzone.ecommerce.web.util.ArrayUtils;

/**
 * @author hector.ledo.doval
 *
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet{
	
	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());
	
	private ProductoService productoService = null;
	private CategoriaService categoriaService = null;
	private NJugadoresService njugadoresService = null;
//	private IdiomaService idiomaService = null;
	
	public SearchServlet () {
	        super();
	        productoService = new ProductoServiceImpl();
	        categoriaService = new CategoriaServiceImpl();
	        njugadoresService = new NJugadoresServiceImpl();
//	        idiomaService = new IdiomaServiceImpl();
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String target = null;
			String idioma = SessionAttributeNames.ES;
		 
			String search = request.getParameter(SessionAttributeNames.PRODUCT);	
			String type = request.getParameter(ParameterNames.SEARCH);	
			String [] categorias = request.getParameterValues(SessionAttributeNames.CATEGORY);
			String [] jugadores = request.getParameterValues(SessionAttributeNames.PLAYERS);
			String anio = request.getParameter(SessionAttributeNames.YEAR);
			String [] idiomad = request.getParameterValues(SessionAttributeNames.LANGUAGE);

			
			ProductoCriteria criteria = null;
			ArrayUtils arrayUtil = null;
						
			
			if (type.equals(ParameterNames.SIMPLE)) {
				criteria  = new ProductoCriteria() ;
				criteria.setNombre(search);
			}
			else {
				if (type.equals(ParameterNames.DETAILED))
				{
					criteria= new ProductoCriteria() ;
					arrayUtil = new ArrayUtils();

					criteria.setNombre(search);

					if (categorias!=null)
					{	
						criteria.setCategorias(arrayUtil.arrayToCategoria(categorias));
					}
					if (jugadores!=null)
					{
						criteria.setNjugadores(arrayUtil.arrayToNJugadores(jugadores));
					}
					if (anio!=null)
					{
						criteria.setAnio(Integer.valueOf(anio));
					}
					if (idiomad!=null)
					{
						criteria.setIdioma(arrayUtil.arrayToIdioma(idiomad));
					}
				}
			}		
			try {
				List<Categoria> todasCategorias = categoriaService.findAll(1, 30, SessionAttributeNames.ES);
				List<NJugadores> todosJugadores = njugadoresService.findAll(1, 10);
//				List<Idioma> todosIdiomas = idiomaService.findAll(1, 10);
				List<Producto> productos = productoService.findByCriteria(criteria, 1, 10, idioma);
				
				request.setAttribute(SessionAttributeNames.CATEGORY, todasCategorias);
				request.setAttribute(SessionAttributeNames.PLAYERS, todosJugadores);
//				request.setAttribute(SessionAttributeNames.LANGUAGE, todosIdiomas);
				
				if (productos==null ) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.SEARCH;
				} else {	
					target = ViewsPaths.SEARCH;
					request.setAttribute(SessionAttributeNames.PRODUCT, productos);
					
				}
					request.getRequestDispatcher(target).forward(request, response);
			} catch (Exception e) {
				logger.error(AttributeNames.ERROR);
			}
			
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
}