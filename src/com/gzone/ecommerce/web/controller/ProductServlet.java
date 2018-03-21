/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;
import com.gzone.ecommerce.web.util.XMLRequest;

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
			
			Producto productoDetail = new Producto();
			try {
				if (search==6) {
					Document xml_request = XMLRequest.get_response();
					
					NodeList nombre_hotel = xml_request.getElementsByTagName("nombre_h");
					NodeList descripcion_hotel = xml_request.getElementsByTagName("desc_hotel");
					NodeList fotos = xml_request.getElementsByTagName("foto");
					NodeList website = xml_request.getElementsByTagName("web");
					
					request.setAttribute("nombre_hotel", nombre_hotel);
					request.setAttribute("descripcion_hotel", descripcion_hotel);
					request.setAttribute("fotos", fotos);
					request.setAttribute("website", website);

				}
				productoDetail = productoService.findById(search, SessionAttributeNames.ES);	
				if (productoDetail==null ) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.INDEX_SERVLET;
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