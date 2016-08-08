<<<<<<< HEAD
<<<<<<< HEAD
package com.bestqualified.servlets.closed;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.ProfessionalProfileBean;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.User;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class GetProfessionalProfile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6579774778625158557L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		String webKey = req.getParameter("web-key");

		Key key = KeyFactory.stringToKey(webKey);

		User u = Util.getUserFromCache(key);
		CandidateProfile cp = Util.getProfessionalFromCache(u, u.getUserInfo());
		ProfessionalProfileBean ppb = Util.createProfessionalProfileBean(u, cp);

		synchronized (session) {
			session.setAttribute("professionalProfileBean", ppb);
		}

		RequestDispatcher rd = req
				.getRequestDispatcher("/WEB-INF/bq/close/get-professional-profile.jsp");
		rd.include(req, resp);
	}

}
=======
package com.bestqualified.servlets.closed;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.ProfessionalProfileBean;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.User;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class GetProfessionalProfile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6579774778625158557L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		String webKey = req.getParameter("web-key");

		Key key = KeyFactory.stringToKey(webKey);

		User u = Util.getUserFromCache(key);
		CandidateProfile cp = Util.getProfessionalFromCache(u, u.getUserInfo());
		ProfessionalProfileBean ppb = Util.createProfessionalProfileBean(u, cp);

		synchronized (session) {
			session.setAttribute("professionalProfileBean", ppb);
		}

		RequestDispatcher rd = req
				.getRequestDispatcher("/WEB-INF/bq/close/get-professional-profile.jsp");
		rd.include(req, resp);
	}

}
>>>>>>> fd589e06629de2bc5dadcff601d13a435136deee
=======
package com.bestqualified.servlets.closed;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.ProfessionalProfileBean;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.User;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class GetProfessionalProfile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6579774778625158557L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		String webKey = req.getParameter("web-key");

		Key key = KeyFactory.stringToKey(webKey);

		User u = Util.getUserFromCache(key);
		CandidateProfile cp = Util.getProfessionalFromCache(u, u.getUserInfo());
		ProfessionalProfileBean ppb = Util.createProfessionalProfileBean(u, cp);

		synchronized (session) {
			session.setAttribute("professionalProfileBean", ppb);
		}

		RequestDispatcher rd = req
				.getRequestDispatcher("/WEB-INF/bq/close/get-professional-profile.jsp");
		rd.include(req, resp);
	}

}
>>>>>>> fd589e06629de2bc5dadcff601d13a435136deee
