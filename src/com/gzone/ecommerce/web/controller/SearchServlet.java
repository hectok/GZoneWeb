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

import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.service.ProductoCriteria;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;

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
			String target = null;
			String idioma = "ES";
			
			ProductoCriteria criteria = new ProductoCriteria() ;
			criteria.setNombre(search);
			
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