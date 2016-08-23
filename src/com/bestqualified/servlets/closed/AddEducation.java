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
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.Education;
import com.bestqualified.entities.User;
import com.bestqualified.entities.WorkExperience;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;

public class AddEducation extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8447736093183523631L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String institution = req.getParameter("institution");
		String course = req.getParameter("course");
		String certificate = req.getParameter("certificate");
		String classification = req.getParameter("extra");
		String startMonth = req.getParameter("start-month");
		String startYear = req.getParameter("start-year");
		String endMonth = req.getParameter("end-month");
		String endYear = req.getParameter("end-year");

		if (Util.notNull(institution, certificate, startMonth,
				endMonth, endYear)) {
			
			Education e = new Education();
			e.setClassification(classification);
			e.setCourse(course);
			e.setEndMonth(endMonth);
			e.setEndYear(endYear);
			e.setInstitution(institution);
			e.setQualification(certificate);
			e.setStartMonth(startMonth);
			e.setStartYear(startYear);

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

				List<Education> wes = ppb.getEducation();
				if (wes == null) {
					wes = new ArrayList<>();
				}
				wes.add(0, e);
				ppb.setEducation(wes);
				List<Key> keys = cp.getEducation();
				if (keys == null) {
					keys = new ArrayList<>();
				}
				keys.add(e.getId());
				cp.setEducation(keys);
				synchronized (session) {
					session.setAttribute("professionalProfile", cp);
					session.setAttribute("uppb", ppb);
				}
				GeneralController.createWithCrossGroup(
						EntityConverter.candidateProfileToEntity(cp),
						EntityConverter.educationToEntity(e));
			}
		}

	}

}
