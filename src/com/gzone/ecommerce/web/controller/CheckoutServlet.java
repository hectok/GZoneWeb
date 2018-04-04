/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.gzone.ecommerce.model.Ticket;
import com.gzone.ecommerce.model.Usuario;
import com.gzone.ecommerce.service.TicketService;
import com.gzone.ecommerce.service.impl.TicketServiceImpl;
import com.gzone.ecommerce.web.model.ShoppingCart;
import com.gzone.ecommerce.web.model.ShoppingCartLine;
import com.gzone.ecommerce.web.util.ArrayUtils;
import com.gzone.ecommerce.web.util.SessionManager;

/**
 * @author Hector
 *
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet{
	
	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());
	Date localDate = new Date();
	
	private TicketService ticketService = null;
	
	 public CheckoutServlet () {
	        super();
	        ticketService = new TicketServiceImpl();
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	
			String target = null;
			String checkout = request.getParameter(SessionAttributeNames.CHECKOUT);	
			
			ShoppingCart carrito = null;
			Usuario usuario = null;		
			try {
				
				if (checkout.equals(SessionAttributeNames.CONFIRM)) {
					carrito= (ShoppingCart) SessionManager.get(request, SessionAttributeNames.SHOPPING_CART);
					usuario = (Usuario) SessionManager.get(request,SessionAttributeNames.USER);
					Ticket ticket = new Ticket();
					
					ticket.setCantidad(1L);
					ticket.setFechaTicket(localDate);
					ticket.setDirFacturacion("A mi casa");
					ticket.setId_usuario(usuario.getIdUsuario());
					
					ticket.setLineas(ArrayUtils.carritoToTicket(carrito.getLines()));
					
					//Creamos el ticket
					ticket = ticketService.create(ticket);
					if (ticket!=null) {
						List<ShoppingCartLine> vaciado = carrito.getLines();
						vaciado.clear();
						carrito.setLineas(vaciado);
						SessionManager.set(request, SessionAttributeNames.SHOPPING_CART, carrito);
						target=ViewsPaths.SERVLET;
					}
					request.getRequestDispatcher(target).forward(request, response);
				}else {
					target=ViewsPaths.SERVLET;
					response.sendRedirect(target);
				}
				
			}
			catch (Exception e) {
				logger.error(AttributeNames.ERROR + e);
			}
		}
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
