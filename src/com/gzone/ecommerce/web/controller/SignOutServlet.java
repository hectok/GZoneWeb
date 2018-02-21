package com.gzone.ecommerce.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignOutServlet")
public class SignOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SignOutServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target = null;
		target = ViewsPaths.INDEX;
		request.getSession(true).setAttribute(ParameterNames.USER, null);
		response.sendRedirect(target);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
