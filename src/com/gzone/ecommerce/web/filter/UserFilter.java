/**
 * 
 */
package com.gzone.ecommerce.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.gzone.ecommerce.web.controller.AttributeNames;
import com.gzone.ecommerce.web.controller.SessionAttributeNames;
import com.gzone.ecommerce.web.controller.ViewsPaths;

/**
 * @author hector.ledo.doval
 *
 */
public class UserFilter implements Filter {
	private static Logger logger = LogManager.getLogger(InitSessionFilter.class.getName());
	  
    public UserFilter() {       
    }

	public void init(FilterConfig cfg) throws ServletException {
		// Habitualmente se configuran en el web.xml´
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = ((HttpServletRequest) request);
		HttpSession session = httpRequest.getSession(false);
		
		String target = null;

        boolean loggedIn = session != null && session.getAttribute(SessionAttributeNames.USER) != null;
        System.out.println(loggedIn);
        
        if (loggedIn) {
            chain.doFilter(request, response);
        } else {
        	target = ViewsPaths.SERVLET;
        	request.setAttribute(AttributeNames.SIGN_IN_FIRST, AttributeNames.SIGN_IN_FIRST);		
        	request.getRequestDispatcher(target).forward(request, response);
        }
    }

}
