/**
 * 
 */
package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

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
import com.gzone.ecommerce.service.MailService;
import com.gzone.ecommerce.service.UsuarioService;
import com.gzone.ecommerce.service.impl.MailServiceImpl;
import com.gzone.ecommerce.service.impl.UsuarioServiceImpl;
import com.gzone.ecommerce.util.PasswordEncryptionUtil;
import com.gzone.ecommerce.web.util.CookieManager;
import com.gzone.ecommerce.web.util.LocaleManager;
import com.gzone.ecommerce.web.util.SessionManager;
import com.gzone.ecommerce.web.util.TrimmerUtil;
import com.gzone.ecommerce.web.util.WebConstants;

/**
 * @author hector.ledo.doval
 *
 */

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {    

	private static Logger logger = LogManager.getLogger(SignInServlet.class.getName());
	private MailService mailService = null;
	private UsuarioService userService = null;
	
    public SignInServlet() {
        super();
        userService = new UsuarioServiceImpl();
        mailService = new MailServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter(ParameterNames.ACTION);	
		String target = null;
		boolean redirect = false;
		
		//Iniciar sesion
		if (Actions.SIGN_IN.equalsIgnoreCase(action)) {
			String userName = TrimmerUtil.cleaner(request.getParameter(ParameterNames.USER));
			String password = TrimmerUtil.cleaner(request.getParameter(ParameterNames.PASSWORD));
			String remember = request.getParameter(ParameterNames.CHECKED);	
			try {
				Usuario user = userService.findByNombre(userName);	
				if (user==null) {
					request.setAttribute(AttributeNames.SIGN_IN_ERROR, AttributeNames.USER_NOT_FOUND_ERROR);
					target = ViewsPaths.INDEX_SERVLET;
				} else {				
					if (!PasswordEncryptionUtil.checkPassword(password,user.getContrasena())) {
						request.setAttribute(AttributeNames.SIGN_IN_ERROR, AttributeNames.WRONG_PASSWORD_ERROR);			
						target = ViewsPaths.INDEX_SERVLET;
					} else {
						SessionManager.set(request, SessionAttributeNames.USER, user);
						target = request.getHeader(ViewsPaths.REFERER);
						redirect = true;
						try {
							if (remember.equals("ON")) {
								CookieManager.addCookie(response, ParameterNames.LOGIN, user.getUsuario(), "/",7*60*60);
							}
							
						}catch(NullPointerException cookienull) {
							logger.info("El usuario no ha marcado la opción de recordar " + cookienull);
						}
					}
				}
				if (redirect) {
					response.sendRedirect(target);
				} else {
					request.getRequestDispatcher(target).forward(request, response);
				}
				
			} catch (DataException e) {
				logger.error(e);
				request.setAttribute(AttributeNames.SIGN_UP_ERROR, AttributeNames.GENERIC_ERROR);
				target = ViewsPaths.INDEX_SERVLET;
				request.getRequestDispatcher(target).forward(request,response);
			}
		//Cerrar sesión
		}else if (Actions.SIGN_OUT.equalsIgnoreCase(action)) {
			target = ViewsPaths.INDEX_SERVLET;
			request.getSession(true).setAttribute(ParameterNames.USER, null);
			response.sendRedirect(target);
			CookieManager.removeCookie(response, ParameterNames.LOGIN, "/");
		//Crear usuario	
    	}else if (Actions.SIGN_UP.equalsIgnoreCase(action)) {
    		target = null;
    		redirect = false;
    		
    		String userName = TrimmerUtil.cleaner(request.getParameter(ParameterNames.USER));
    		String email = TrimmerUtil.cleaner(request.getParameter(ParameterNames.EMAIL));
    		String password = TrimmerUtil.cleaner(request.getParameter(ParameterNames.PASSWORD));
    		
    		Usuario creation = new Usuario();
    		creation.setUsuario(userName);
    		creation.setCorreo(email);
    		creation.setContrasena(password);

    		
    		try {
    			
    			Usuario user = userService.create(creation);
    			if (user==null) {
    				request.setAttribute(AttributeNames.SIGN_UP_ERROR, AttributeNames.DUPLICATED_USER);
    				target = ViewsPaths.INDEX_SERVLET;
    			} else {	
    				mailService.sendMail(Email.SUBJECT, Email.BODY, email);

    				SessionManager.set(request, SessionAttributeNames.USER, user);
    				target = request.getHeader(ViewsPaths.INDEX_SERVLET);
    				redirect = true;			
    			}
    			if (redirect) {
    				response.sendRedirect(target);
    			} else {
    				request.getRequestDispatcher(target).forward(request, response);
    			}
    			
    		} catch (DuplicateInstanceException e) {
    			logger.error(e);
    			request.setAttribute(AttributeNames.SIGN_UP_ERROR, AttributeNames.DUPLICATED_USER);
    			target = ViewsPaths.INDEX_SERVLET;
    			request.getRequestDispatcher(target).forward(request,response);
    		}
    		catch (DataException o)
    		{
    			logger.error(o);
    			request.setAttribute(AttributeNames.SIGN_UP_ERROR, AttributeNames.DUPLICATED_USER);
    			target = ViewsPaths.INDEX_SERVLET;
    			request.getRequestDispatcher(target).forward(request,response);

    		} catch (MailException e) {
    			logger.error("Error al mandar el correo" + e);
    		}
    		
    	}else if (Actions.CHANGE_LOCALE.equalsIgnoreCase(action)) {
    		String localeName = request.getParameter(ParameterNames.LOCALE);
    		List<Locale> results = LocaleManager.getMatchedLocales(localeName);
    		Locale newLocale = null;
    		if (results.size()>0) {
    			newLocale = results.get(0);
    		} else {
    			logger.warn("Request locale not supported: "+localeName);
    			newLocale = LocaleManager.getDefault();
    		}
    		
			SessionManager.set(request, WebConstants.USER_LOCALE, newLocale);			
			CookieManager.addCookie(response, WebConstants.USER_LOCALE, newLocale.toString(), "/", 365*24*60*60);
			
			if (logger.isDebugEnabled()) {
				logger.debug("Locale changed to "+newLocale);
			}
			
			target = ViewsPaths.INDEX_SERVLET;
			redirect = true;
			response.sendRedirect(target);
    	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
