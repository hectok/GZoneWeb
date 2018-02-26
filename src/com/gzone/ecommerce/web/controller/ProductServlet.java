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
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet{
	
	private ProductoService productoService = null;
	
	 public ProductServlet () {
	        super();
	        productoService = new ProductoServiceImpl();

	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Long search = Long.parseLong(request.getParameter(SessionAttributeNames.PRODUCT)) ;	
			String target = null;
			String idioma = "ES";
			
			Producto productoDetail = new Producto();
			try {
				productoDetail = productoService.findById(search, idioma);	
				if (productoDetail==null ) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.INDEX;
				} else {	
					target = ViewsPaths.PRODUCT_DETAIL;
					request.setAttribute(SessionAttributeNames.PRODUCT, productoDetail);
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