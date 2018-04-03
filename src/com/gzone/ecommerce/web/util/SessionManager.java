package com.gzone.ecommerce.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.gzone.ecommerce.web.controller.SessionAttributeNames;
import com.gzone.ecommerce.web.model.ShoppingCart;

public class SessionManager {

	public static Object get(HttpServletRequest request, String attName) {
		return getSession(request).getAttribute(attName);
	}

	public static void set(HttpServletRequest request, String attName, Object attValue) {
		getSession(request).setAttribute(attName, attValue);
	}
	

	protected static HttpSession getSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session==null) {
			// Inicializo la sesion y todos los objetos obligatorios
			session = request.getSession(true);
			
			ShoppingCart c = new ShoppingCart(); 
			session.setAttribute(SessionAttributeNames.SHOPPING_CART, c);
			session.setAttribute(SessionAttributeNames.LANGUAGE, SessionAttributeNames.ES);
		}
		return session;
	}	
}
