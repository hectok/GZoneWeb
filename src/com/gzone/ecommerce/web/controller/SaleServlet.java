/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.Arrays;
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

/**
 * @author hector.ledo.doval
 *
 */
@WebServlet("/SalesServlet")
public class SaleServlet extends HttpServlet{
	
	private ProductoService productoService = null;
	
	 public SaleServlet () {
	        super();
	        productoService = new ProductoServiceImpl();

	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String target = null;
			String idioma = SessionAttributeNames.ES;
			ProductoCriteria criteria = null;
	
			try {
				criteria  = new ProductoCriteria() ;
				criteria.setOferta(null);
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