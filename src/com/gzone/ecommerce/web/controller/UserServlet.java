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

import com.gzone.ecommerce.model.Usuario;
import com.gzone.ecommerce.service.UsuarioService;
import com.gzone.ecommerce.service.impl.UsuarioServiceImpl;

/**
 * @author hector.ledo.doval
 *
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	
	private UsuarioService usuarioService = null;
	
	 public UserServlet () {
	        super();
	        usuarioService = new UsuarioServiceImpl();
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Long profile = Long.parseLong(request.getParameter(SessionAttributeNames.PROFILE)) ;	
			String target = null;
			
			Usuario usuarioDetail = new Usuario();
			try {
				usuarioDetail = usuarioService.findById(profile);
				if (usuarioDetail==null ) {
					request.setAttribute(AttributeNames.ERROR, AttributeNames.NOT_FOUND);
					target = ViewsPaths.INDEX;
				} else {	
					target = ViewsPaths.PROFILE;
					request.setAttribute(SessionAttributeNames.PROFILE, usuarioDetail);
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