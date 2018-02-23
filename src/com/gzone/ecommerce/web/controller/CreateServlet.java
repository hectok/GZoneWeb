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

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.gzone.ecommerce.exceptions.DataException;
import com.gzone.ecommerce.exceptions.DuplicateInstanceException;
import com.gzone.ecommerce.exceptions.MailException;
import com.gzone.ecommerce.model.Usuario;
import com.gzone.ecommerce.service.UsuarioService;
import com.gzone.ecommerce.service.impl.UsuarioServiceImpl;
import com.gzone.ecommerce.web.util.SessionManager;
import com.gzone.ecommerce.service.impl.MailServiceImpl;
import com.gzone.ecommerce.service.MailService;

/**
 * @author hector.ledo.doval
 *
 */

@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {    

	private static Logger logger = LogManager.getLogger(CreateServlet.class.getName());

	private UsuarioService userService = null;
	private MailService mailService = null;
	
    public CreateServlet() {
        super();
        userService = new UsuarioServiceImpl();
        mailService = new MailServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter(ParameterNames.USER);
		String email = request.getParameter(ParameterNames.EMAIL);
		String password = request.getParameter(ParameterNames.PASSWORD);
		
		Usuario creation = new Usuario();
		creation.setUsuario(userName);
		creation.setCorreo(email);
		creation.setContrasena(password);
		
		String target = null;
		boolean redirect = false;
		try {
			
			Usuario user = userService.create(creation);
			if (user==null) {
				request.setAttribute(AttributeNames.ERROR, AttributeNames.DUPLICATED_USER);
				target = ViewsPaths.INDEX;
			} else {	
				mailService.sendMail(Email.SUBJECT, Email.BODY, email);

				SessionManager.set(request, SessionAttributeNames.USER, user);
				target = ViewsPaths.INDEX;
				redirect = true;			
			}
			if (redirect) {
				response.sendRedirect(target);
			} else {
				request.getRequestDispatcher(target).forward(request, response);
			}
			
		} catch (DuplicateInstanceException e) {
			logger.error(e);
			request.setAttribute(AttributeNames.ERROR, AttributeNames.DUPLICATED_USER);
			request.getRequestDispatcher(target).forward(request,response);
		}
		catch (DataException o)
		{
			logger.error(o);

		} catch (MailException e) {
			logger.error(e);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
