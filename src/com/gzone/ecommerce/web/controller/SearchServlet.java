/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gzone.ecommerce.model.Categoria;
import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.service.ProductoCriteria;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;
import com.gzone.ecommerce.web.util.ArrayUtils;
import com.mysql.fabric.xmlrpc.base.Param;

/**
 * @author hector.ledo.doval
 *
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet{
	
	private ProductoService productoService = null;
	
	 public SearchServlet () {
	        super();
	        productoService = new ProductoServiceImpl();

	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String search = request.getParameter(SessionAttributeNames.PRODUCT);	
			String type = request.getParameter(ParameterNames.SEARCH);	
			String [] categorias = request.getParameterValues(SessionAttributeNames.CATEGORY);
			String [] jugadores = request.getParameterValues(SessionAttributeNames.PLAYERS);
			String anio = request.getParameter(SessionAttributeNames.YEAR);
			String [] idiomad = request.getParameterValues(SessionAttributeNames.LANGUAGE);
			String target = null;
			String idioma = SessionAttributeNames.ES;
			
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
				List<Producto> productos = productoService.findByCriteria(criteria, 1, 10, idioma);	
				if (productos==null ) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.SEARCH;
				} else {	
					target = ViewsPaths.SEARCH;
					request.setAttribute(SessionAttributeNames.PRODUCT, productos);
				}
					request.getRequestDispatcher(target).forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
}