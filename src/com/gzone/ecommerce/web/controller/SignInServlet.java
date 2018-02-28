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

import com.gzone.ecommerce.model.Usuario;
import com.gzone.ecommerce.service.UsuarioService;
import com.gzone.ecommerce.service.impl.UsuarioServiceImpl;
import com.gzone.ecommerce.util.PasswordEncryptionUtil;
import com.gzone.ecommerce.web.util.CookieManager;
import com.gzone.ecommerce.web.util.SessionManager;

/**
 * @author hector.ledo.doval
 *
 */

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {    

	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());

	private UsuarioService userService = null;
	
    public SignInServlet() {
        super();
        userService = new UsuarioServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter(ParameterNames.USER);
		String password = request.getParameter(ParameterNames.PASSWORD);
		String remember = request.getParameter(ParameterNames.CHECKED);			
		String target = null;
		boolean redirect = false;
		try {
			Usuario user = userService.findByNombre(userName);	
			if (user==null) {
				request.setAttribute(AttributeNames.ERROR, AttributeNames.USER_NOT_FOUND_ERROR);
				target = ViewsPaths.INDEX_SERVLET;
			} else {				
				if (!PasswordEncryptionUtil.checkPassword(password,user.getContrasena())) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.WRONG_PASSWORD_ERROR);			
					target = ViewsPaths.INDEX_SERVLET;
				} else {
					SessionManager.set(request, SessionAttributeNames.USER, user);
					target = ViewsPaths.INDEX_SERVLET;
					redirect = true;
					if (remember=="ON") {
						CookieManager.addCookie(response, ParameterNames.LOGIN, user.getUsuario(), "/", "<1";
					}
				}
			}
			if (redirect) {
				response.sendRedirect(target);
			} else {
				request.getRequestDispatcher(target).forward(request, response);
			}
			
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
