package com.bestqualified.servlets;

import java.io.IOException;
import java.io.Serializable;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.SignUpBean;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.Recruiter;
import com.bestqualified.entities.User;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Entity;

public class SignInServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7948408060782550137L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();
		if (!Util.notNull(email)) {
			synchronized (session) {
				session.setAttribute("signinError",
						"You have to enter your email.");
			}
			resp.sendRedirect(resp.encodeRedirectURL("/sign-in"));
			return;
		}
		synchronized (session) {
			session.setAttribute("sinEmail", email);
		}
		if (!Util.notNull(password)) {
			synchronized (session) {
				session.setAttribute("signinError",
						"You have to enter your password.");
			}
			resp.sendRedirect(resp.encodeRedirectURL("/sign-in"));
			return;
		}
		User u = GeneralController.getUserByCredentials(email, password);
		if (u == null) {
			synchronized (session) {
				session.removeAttribute("sinEmail");
				session.setAttribute("signinError",
						"Username/Password do not match");
			}
			resp.sendRedirect(resp.encodeRedirectURL("/sign-in"));
			return;
		} else {
			synchronized (session) {
				session.setAttribute("user", u);
			}
			if (u.isVerified()) {
				if (!Util.notNull(u.getUserType())) {
					resp.sendRedirect(resp.encodeRedirectURL("/major-interest"));
					return;
				} else {
					u.setAuthenticated(true);
					Entity e = GeneralController.findByKey(u.getUserInfo());
					CandidateProfile cp = null;
					if (u.getUserType().equalsIgnoreCase(
							User.UserType.PROFESSIONAL.name())) {
						cp = EntityConverter.entityToCandidateProfile(e,
								u.getUserKey());
						synchronized (session) {
							session.setAttribute("professionalProfile", cp);
						}
					} else if (u.getUserType().equalsIgnoreCase(
							User.UserType.RECRUITER.name())) {
						Recruiter r = EntityConverter.entityToRecruiter(e);
						synchronized (session) {
							session.setAttribute("employerProfile", r);
						}
					}

					Object o1 = null;
					Object o2 = null;
					synchronized (session) {
						o1 = session.getAttribute("requestUri");
						o2 = session.getAttribute("queryString");
						session.removeAttribute("passwordChangeSuccess");
					}
					if (o1 == null) {
						RequestDispatcher rd = req
								.getRequestDispatcher("/bq/closed/init-dashboard");
						rd.forward(req, resp);
					} else {
						String method = req.getMethod();
						String requestUri = (String) o1;

						String qStr = null;
						if (o2 != null) {
							qStr = (String) o2;
							requestUri += "?" + qStr;

							resp.sendRedirect(resp
									.encodeRedirectURL(requestUri));
						}

					}

					return;
				}

			} else {
				SignUpBean sub = Util.userToSignUpBean(u);
				synchronized (session) {
					session.setAttribute("sub", sub);
					session.removeAttribute("signupError");
					session.setMaxInactiveInterval(86400);
				}
				String body = Util.getConfirmationCodeEmailBody(
						sub.getVerificationCode(), sub.getFirstName());
				try {
					Util.sendConfirmationCodeEmail(sub.getEmail(), body);
				} catch (AddressException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (MessagingException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				System.out.println(sub.getVerificationCode());
				resp.sendRedirect(resp.encodeRedirectURL("/email-verification"));
				return;
			}
		}
	}

}
