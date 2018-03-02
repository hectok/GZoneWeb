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

import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.service.ProductoCriteria;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;


/**
 * @author hector.ledo.doval
 *
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet{
	
	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());

	private ProductoService productoService = null;
	
	 public IndexServlet () {
	        super();
	        productoService = new ProductoServiceImpl();

	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String target = null;
			String idioma = SessionAttributeNames.ES;
			ProductoCriteria ofertas = null;
			
			try {
				//Ofertas
				ofertas  = new ProductoCriteria() ;
				ofertas.setOferta(true);
				//Todas
				
				List<Producto> oferta = productoService.findByCriteria(ofertas, 1, 12, idioma);	
				List<Producto> explore = productoService.findAll(1, 40, idioma);	
				
				if (oferta==null || explore==null) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.INDEX;
				} else {	
					target = ViewsPaths.INDEX;
					request.setAttribute(SessionAttributeNames.SALE, oferta);
					request.setAttribute(SessionAttributeNames.EXPLORE, explore);

				}
					request.getRequestDispatcher(target).forward(request, response);
			} catch (Exception e) {
				logger.error(e);
			}
			
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
}