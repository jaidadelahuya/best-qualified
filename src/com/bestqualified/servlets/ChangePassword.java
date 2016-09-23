package com.bestqualified.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.User;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;

public class ChangePassword extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7662043353792072341L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pass1 = req.getParameter("pass1");
		String pass2 = req.getParameter("pass2");
		HttpSession session = req.getSession();
		User u = null;
		Object o = null;
		synchronized (session) {
			o = session.getAttribute("user");
		}
		if (o == null) {
			resp.sendRedirect(resp.encodeRedirectURL("/sign-in"));
		} else {
			u = (User) o;
		}
		if (!Util.notNull(pass1)) {
			synchronized (session) {
				session.setAttribute("changePasswordError",
						"Enter a new password.");
				session.setAttribute("password", pass1);

			}
			resp.sendRedirect("/endpoint/change-password-page");
			return;

		}
		if (!Util.notNull(pass2)) {
			synchronized (session) {
				session.setAttribute("changePasswordError",
						"Retype your password.");

			}
			resp.sendRedirect("/endpoint/change-password-page");
			return;

		}

		if (!Util.containsPattern(pass1, Util.PASSWORD_PATTERN)) {
			synchronized (session) {
				session.setAttribute(
						"changePasswordError",
						"Your password should contain at least one lower case and upper case alphabet, one digit, one special symbol out of '@ # $ %', and must have a minmum of 6and maximum of 20 characters");

			}
			resp.sendRedirect("/endpoint/change-password-page");
			return;

		}
		if (!pass1.equals(pass2)) {
			synchronized (session) {
				session.setAttribute("changePasswordError",
						"The passwords do not match.");

			}
			resp.sendRedirect("/endpoint/change-password-page");
			return;

		}

		u.setPassword(Util.toSHA512(pass1));

		synchronized (session) {
			session.setAttribute("user", u);
			session.removeAttribute("password");
			session.setAttribute("passwordChangeSuccess",
					"Your password has been changed. You can now sign in.");
		}

		GeneralController.create(EntityConverter.userToEntity(u));

		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		resp.sendRedirect(resp.encodeRedirectURL("/sign-in"));

	}

}
