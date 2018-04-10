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
import javax.servlet.http.HttpSession;

import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.web.model.ShoppingCart;


@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShoppingCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strAction = request.getParameter(SessionAttributeNames.SHOPPING_CART);
		String target = request.getHeader(ViewsPaths.REFERER);
		if (strAction != null && !strAction.equals("")) {
			if (strAction.equals(SessionAttributeNames.ANADIR)) {
				addToCart(request);
			} else if (strAction.equals(SessionAttributeNames.ELIMINAR)) {
				deleteCart(request);
			}
		}	
		response.sendRedirect(target);
	}

	protected void deleteCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long idProducto = Long.valueOf(request.getParameter(SessionAttributeNames.IDPRODUCT));
		ShoppingCart cartBean = null;

		Object objCartBean = session.getAttribute(SessionAttributeNames.SHOPPING_CART);
		if (objCartBean != null) {
			cartBean = (ShoppingCart) objCartBean;
		} else {
			cartBean = new ShoppingCart();
		}
		cartBean.deleteProduct(idProducto);
	}


	protected void addToCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long idProducto = Long.valueOf(request.getParameter(SessionAttributeNames.IDPRODUCT));
		Double precioProducto = Double.valueOf(request.getParameter(SessionAttributeNames.PRECIO));
		String nombreProducto = request.getParameter(SessionAttributeNames.NOMBREPRODUCT);

		boolean checkDuplicated ;
		
		Producto anadir = new Producto();
		anadir.setIdProducto(idProducto);
		anadir.setPrecio(precioProducto);
		anadir.setNombre(nombreProducto);
		
		ShoppingCart cartBean = null;

		Object objCartBean = session.getAttribute(SessionAttributeNames.SHOPPING_CART);

		if (objCartBean != null) {
			cartBean = (ShoppingCart) objCartBean;
		} else {
			cartBean = new ShoppingCart();
			session.setAttribute(SessionAttributeNames.SHOPPING_CART, cartBean);
		}
		checkDuplicated=cartBean.addCartItem(anadir);
		if (checkDuplicated) {
			request.setAttribute(ParameterNames.CART_DUPLICATED,AttributeNames.ALREADY_ON_CART);
			
		}
	}

}