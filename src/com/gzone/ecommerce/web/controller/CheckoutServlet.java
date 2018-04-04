/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.gzone.ecommerce.model.Ticket;
import com.gzone.ecommerce.service.TicketService;
import com.gzone.ecommerce.service.impl.TicketServiceImpl;
import com.gzone.ecommerce.web.model.ShoppingCart;
import com.gzone.ecommerce.web.util.SessionManager;

/**
 * @author Hector
 *
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet{
	
	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());
	Date date = Calendar.getInstance().getTime();
	
	private TicketService ticketService = null;
	
	 public CheckoutServlet () {
	        super();
	        ticketService = new TicketServiceImpl();
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
			String target = null;
			String checkout = request.getParameter(SessionAttributeNames.CHECKOUT);	
			
			ShoppingCart carrito = null;
					
			try {
				if (checkout==SessionAttributeNames.PAGAR) {
					carrito= (ShoppingCart) SessionManager.get(request, SessionAttributeNames.SHOPPING_CART);
					Ticket ticket = new Ticket();
					ticket.setFechaTicket(date);
					ticket.setCantidad(1L);
					
				}
				
			}
			catch (Exception e) {
				
			}
		}
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
