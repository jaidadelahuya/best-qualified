package com.bestqualified.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InitPasswordChange extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1062156672698079864L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		synchronized (session) {
			session.removeAttribute("changePasswordError");
		}
		resp.sendRedirect("/endpoint/change-password-page");
	}

}
