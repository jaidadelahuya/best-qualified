package com.bestqualified.servlets.closed;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.ProfessionalProfileBean;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.User;
import com.bestqualified.util.Util;

public class InitProfessionalProfile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4737209875855721668L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String userKey = req.getParameter("user-key");
		HttpSession session = req.getSession();
		Object o = null;
		Object o1 = null;
		synchronized (session) {
			o = session.getAttribute("user");
			o1 = session.getAttribute("professionalProfile");
		}
		if(o != null && o1 != null) {
			User u = (User) o;
			CandidateProfile cp = (CandidateProfile) o1;
			ProfessionalProfileBean ppb = Util.createProfessionalProfileBean(u,cp);
			synchronized (session) {
				session.setAttribute("uppb", ppb);
				session.removeAttribute("noCV");
				session.removeAttribute("cvSent");
			}
			resp.sendRedirect(resp
					.encodeRedirectURL("/bq/close/professional-profile"));
		} else {
			resp.getWriter().write("An error has occured");
		}
		//nothing to say
		
		
	}

}
