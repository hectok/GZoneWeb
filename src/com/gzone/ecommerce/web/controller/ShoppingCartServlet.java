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

import com.gzone.ecommerce.web.model.ShoppingCart;


@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShoppingCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String productId = request.getParameter(.productId..)
		Producto p = findBuyId		
		
		ShoppingCartLine l = new ShoppingCartLine();
		l.setProducto(p);
		ShoppingCart c = (ShoppingCart) SessionManager.get(request, SessionAttributeNames.SHOPPING_CART);
		if (c==null) {
			c = new ShoppingCart();
			SessionManager.set(request, SessionAttributeNames.SHOPPING_CART, c);			
		}
		
		c.add(l);
		//forward("")
		 * 
		 */
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strAction = request.getParameter("action");

		if (strAction != null && !strAction.equals("")) {
			if (strAction.equals("add")) {
				addToCart(request);
			} else if (strAction.equals("Delete")) {
				deleteCart(request);
			}
		}
		response.sendRedirect("../ShoppingCart.jsp");
	}

	protected void deleteCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String strItemIndex = request.getParameter("itemIndex");
		ShoppingCart cartBean = null;

		Object objCartBean = session.getAttribute("cart");
		if (objCartBean != null) {
			cartBean = (ShoppingCart) objCartBean;
		} else {
			cartBean = new ShoppingCart();
		}
		cartBean.deleteProduct(strItemIndex);
	}


	protected void addToCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String strModelNo = request.getParameter("modelNo");
		String strDescription = request.getParameter("description");
		String strPrice = request.getParameter("price");
		String strQuantity = request.getParameter("quantity");

		ShoppingCart cartBean = null;

		Object objCartBean = session.getAttribute("cart");

		if (objCartBean != null) {
			cartBean = (ShoppingCart) objCartBean;
		} else {
			cartBean = new ShoppingCart();
			session.setAttribute("cart", cartBean);
		}

		cartBean.addCartItem(strModelNo, strDescription, strPrice, strQuantity);
	}

}