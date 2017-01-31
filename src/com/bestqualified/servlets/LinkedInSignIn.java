package com.bestqualified.servlets;

import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.util.Util;



public class LinkedInSignIn extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7075469924539564597L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String clientId = getServletContext().getInitParameter(
				"LinkedInClientId");
		
		String state = Util.generateRandomCode(1000000, 9999999);
		HttpSession session = req.getSession();
		synchronized (session) {
			session.setAttribute("linkedInState", state);
		}
		String redirect = resp
				.encodeRedirectURL("http://best-qualified.appspot.com/bq/open/linkedin/callback");

		URL url = new URL(
				"https://www.linkedin.com/uas/oauth2/authorization?response_type=code&"
						+ "client_id=" + clientId + "&redirect_uri=" + redirect
						+ "&state=" + state);
		resp.sendRedirect(url.toString());
	}

}
