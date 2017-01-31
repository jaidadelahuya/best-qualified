package com.bestqualified.servlets.closed;

import java.io.IOException;
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
import com.bestqualified.entities.Certification;
import com.bestqualified.entities.Education;
import com.bestqualified.entities.WorkExperience;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class GeneralDelete extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4360486803462060930L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String safeKey = req.getParameter("id");
		String item = req.getParameter("item");
		Key key = null;
		if (Util.notNull(safeKey)) {
			key = KeyFactory.stringToKey(safeKey);
			GeneralController.delete(key);
		}

		HttpSession session = req.getSession();

		if (item != null) {
			ProfessionalProfileBean ppb = (ProfessionalProfileBean) session
					.getAttribute("uppb");
			CandidateProfile cp = (CandidateProfile) session
					.getAttribute("professionalProfile");
			switch (item) {
			case "work-experience":
				synchronized (session) {

					List<WorkExperience> l = ppb.getWorkExperience();
					for (WorkExperience we : l) {
						if (we.getId().equals(key)) {
							l.remove(we);
							cp.getWorkExperience().remove(we.getId());
							break;
						}
					}
					ppb.setWorkExperience(l);

				}
				break;
			case "education":
				synchronized (session) {

					List<Education> l = ppb.getEducation();
					for (Education e : l) {
						if (e.getId().equals(key)) {
							l.remove(e);
							cp.getEducation().remove(e.getId());
							break;
						}
					}
					ppb.setEducation(l);
				}
				break;
			case "award":
				synchronized (session) {

					List<Award> l = ppb.getAwards();
					for (Award e : l) {
						if (e!=null && e.getId().equals(key)) {
							l.remove(e);
							cp.getAwards().remove(e.getId());
							break;
						}
					}
					ppb.setAwards(l);
				}
				break;
				
			case "certification":
				synchronized (session) {

					List<Certification> cert = ppb.getCertifications();
					for (Certification e : cert) {
						if (e.getId().equals(key)) {
							cert.remove(e);
							cp.getCertifications().remove(e.getId());
							break;
						}
					}
					ppb.setCertifications(cert);
				}
			default:
				break;
			}
			session.setAttribute("uppb", ppb);
			session.setAttribute("professionalProfile", cp);
		}
	}

}
