package com.bestqualified.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InitSignIn extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2520745088876621737L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		synchronized (session) {
			session.removeAttribute("signinError");
		}
		
		req.getRequestDispatcher("/WEB-INF/pages/sign-in.jsp").include(req, resp);
	}

}
