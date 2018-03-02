/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.gzone.ecommerce.exceptions.DataException;
import com.gzone.ecommerce.exceptions.InstanceNotFoundException;
import com.gzone.ecommerce.model.LineaTicket;
import com.gzone.ecommerce.model.Producto;
import com.gzone.ecommerce.model.Ticket;
import com.gzone.ecommerce.model.Usuario;
import com.gzone.ecommerce.service.ProductoService;
import com.gzone.ecommerce.service.TicketCriteria;
import com.gzone.ecommerce.service.TicketService;
import com.gzone.ecommerce.service.UsuarioService;
import com.gzone.ecommerce.service.impl.ProductoServiceImpl;
import com.gzone.ecommerce.service.impl.TicketServiceImpl;
import com.gzone.ecommerce.service.impl.UsuarioServiceImpl;

/**
 * @author hector.ledo.doval
 *
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	
	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());
	
	private UsuarioService usuarioService = null;
	private TicketService ticketService = null;
	private ProductoService productoService = null;
	
	 public UserServlet () {
	        super();
	        usuarioService = new UsuarioServiceImpl();
	        ticketService = new TicketServiceImpl();
	        productoService = new ProductoServiceImpl();
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Long profile = Long.parseLong(request.getParameter(SessionAttributeNames.PROFILE)) ;	
			String target = null;
			
			String idioma = SessionAttributeNames.ES;		
			TicketCriteria ticketById = null;
			List<Ticket> biblioteca = new ArrayList<Ticket>();
			List<Long> listaProductosId = new ArrayList<Long>();
			List<LineaTicket> a = null;
			List<Producto> productos = null;
						
			Usuario usuarioDetail = new Usuario();
			
			try {

				ticketById= new TicketCriteria();
				ticketById.setId_usuario(profile);

				//Extraemos todos los id de los productos que haya comprado un usuario
				biblioteca = ticketService.findByCriteria(ticketById, 1, 40);

				if (biblioteca!=null) {
					for (Ticket iterator: biblioteca) {
						a = iterator.getLineas();
						for (LineaTicket linea: a) {
							listaProductosId.add(linea.getIdProducto());
						}
					}
				}
				else {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.PROFILE;
				}

				//Recuperamos información de los productos que haya comprado el usuario
				productos = new ArrayList<Producto>();
				for (Long p : listaProductosId) {
					productos.add(productoService.findById(p, idioma));
				}
				
				//Recuperamos la información del usuario
				usuarioDetail = usuarioService.findById(profile);
				if (usuarioDetail==null ) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.INDEX;
				} else {	
					target = ViewsPaths.PROFILE;
					request.setAttribute(SessionAttributeNames.PROFILE, usuarioDetail);
					request.setAttribute(SessionAttributeNames.LIBRARY, productos);
				}
					request.getRequestDispatcher(target).forward(request, response);
			} catch (NullPointerException e) {
				logger.error("Null pointer excepction "+e);
			} catch (InstanceNotFoundException e) {
				// TODO Auto-generated catch block
				logger.error("Instance not found "+e);

			} catch (DataException e) {
				// TODO Auto-generated catch block
				logger.error("Data excepcion "+e);
			}
			
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
}