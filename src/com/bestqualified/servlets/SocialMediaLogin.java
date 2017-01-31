package com.bestqualified.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.SocialUser;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.User;
import com.bestqualified.util.Util;

public class SocialMediaLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 934479990285012354L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		SocialUser su = null;
		HttpSession session = req.getSession();

		synchronized (session) {
			Object o = session.getAttribute("socialUser");
			if (o != null) {
				su = (SocialUser) o;
			} else {
				resp.getWriter().write(
						"<h2>You cannot get access</h2><p>Login properly</p>");
				return;
			}
		}

		User u = GeneralController.findUserBySocialId(su);

		if (u == null) {
			String email = su.getEmail();
			if (Util.notNull(email)) {
				u = GeneralController.findSocialUser(email);
			}
			if (u != null) {
				if (Util.notNull(su.getPictureUrl())) {
					u.setPictureUrl(su.getPictureUrl());
				}
				u.setVerified(true);
				switch (su.getNetwork()) {
				case FACEBOOK:
					u.setFacebookID(su.getId());
					
					break;
				case LINKEDIN:
					u.setLinkedInID(su.getId());
					break;
				case TWITTER:
					u.setTwitterID(su.getId());
					break;
				case GOOGLE:
					u.setGoogleID(su.getId());
				}
			}else {
				u = Util.socialUserToUser(su);
				u.setVerified(true);
				
			}	
		}else {
			u.setVerified(true);
		}
		
		synchronized (session) {
			session.setAttribute("user", u);
		}
		
		if (u.getUserType() == null) {
			resp.sendRedirect(resp.encodeRedirectURL("/major-interest"));
			return;
		} else {
			Util.logUserIn(u, req, resp);
		}

	}
}
