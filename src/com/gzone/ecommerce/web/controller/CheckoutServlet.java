/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.service.ProductoCriteria;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;
import com.gzone.ecommerce.web.util.ArrayUtils;

/**
 * @author Hector
 *
 */
public class CheckoutServlet extends HttpServlet{
	
	 public CheckoutServlet () {
	        super();
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String target = null;
		
			
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
}

