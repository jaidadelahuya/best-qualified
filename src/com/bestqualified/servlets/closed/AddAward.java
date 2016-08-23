package com.bestqualified.servlets.closed;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.ProfessionalProfileBean;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.Award;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.Education;
import com.bestqualified.entities.User;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;

public class AddAward extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8198793608466812452L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("award");
		String description = req.getParameter("extra");
		String startMonth = req.getParameter("start-month");
		String startYear = req.getParameter("start-year");

		if (Util.notNull(name, startMonth, startYear)) {
	
			Award a = new Award();
			a.setDescription(description);
			a.setMonth(startMonth);
			a.setName(name);
			a.setYear(startYear);

			HttpSession session = req.getSession();
			User u = null;
			CandidateProfile cp = null;
			ProfessionalProfileBean ppb = null;
			synchronized (session) {
				u = (User) session.getAttribute("user");
				cp = (CandidateProfile) session
						.getAttribute("professionalProfile");
				ppb = (ProfessionalProfileBean) session.getAttribute("uppb");
			}

			if (cp != null && u != null && cp.getId().equals(u.getUserInfo())) {

				List<Award> aw = ppb.getAwards();
				if (aw == null) {
					aw = new ArrayList<>();
				}
				aw.add(0, a);
				ppb.setAwards(aw);
				List<Key> keys = cp.getAwards();
				if (keys == null) {
					keys = new ArrayList<>();
				}
				keys.add(a.getId());
				cp.setAwards(keys);
				synchronized (session) {
					session.setAttribute("professionalProfile", cp);
					session.setAttribute("uppb", ppb);
				}
				GeneralController.createWithCrossGroup(
						EntityConverter.candidateProfileToEntity(cp),
						EntityConverter.awardToEntity(a));
			}
		}

	}

}
