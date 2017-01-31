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
import com.bestqualified.entities.User;
import com.bestqualified.entities.WorkExperience;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Text;
import com.google.gson.Gson;

public class UpdateWorkExperience extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7012278222731763785L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String organization = req.getParameter("organization");
		String position = req.getParameter("position");
		String startMonth = req.getParameter("start-month");
		String startYear = req.getParameter("start-year");
		String endYear = req.getParameter("end-year");
		String endMonth = req.getParameter("end-month");
		String jobResponsibility = req.getParameter("jobResponsibility");
		String toDate = req.getParameter("todate");

		if (!Util.notNull(organization)) {
			resp.sendError(1000);
			return;
		}
		if (!Util.notNull(position)) {
			resp.sendError(1001);
			return;
		}
		WorkExperience we = new WorkExperience();
		we.setCompany(organization);
		if (Util.notNull(toDate)) {
			we.setCurrentJob(true);
		}
		we.setEndMonth(endMonth);
		we.setEndYear(endYear);
		if (Util.notNull(jobResponsibility)) {
			we.setJobDuties(new Text(jobResponsibility));
		}
		we.setPosition(position);
		we.setStartMonth(startMonth);
		we.setStartYear(startYear);

		HttpSession session = req.getSession();
		User u = null;
		CandidateProfile cp = null;
		ProfessionalProfileBean ppb = null;
		synchronized (session) {
			u = (User) session.getAttribute("user");
			cp = (CandidateProfile) session.getAttribute("professionalProfile");
			ppb = (ProfessionalProfileBean) session.getAttribute("uppb");
		}

		if (cp != null && u != null && cp.getId().equals(u.getUserInfo())) {

			List<WorkExperience> wes = ppb.getWorkExperience();
			if (wes == null) {
				wes = new ArrayList<>();
			}
			wes.add(0, we);
			ppb.setWorkExperience(wes);
			List<Key> keys = cp.getWorkExperience();
			if (keys == null) {
				keys = new ArrayList<>();
			}
			keys.add(we.getId());
			cp.setWorkExperience(keys);
			synchronized (session) {
				session.setAttribute("professionalProfile", cp);
				session.setAttribute("uppb", ppb);
			}
			GeneralController.createWithCrossGroup(
					EntityConverter.candidateProfileToEntity(cp),
					EntityConverter.workExperienceToEntity(we));
			resp.getWriter().write(KeyFactory.keyToString(we.getId()));
		}

		String data = "<div class='col-sm-12'><h4 class='position' style='margin-top: 10px'>"
				+ position
				+ "</h4><h5 class='company-name' style='font-family: calibri'>"
				+ organization
				+ "</h5><h5 style='font-family: calibri'>From <span class='start-month'>"
				+ startMonth
				+ " "
				+ startYear
				+ "</span>To <span class='end-month'>"
				+ endMonth
				+ " "
				+ endYear + "</span></h5><a>Delete</a></div>";
		//resp.setContentType("application/json");
		//resp.getWriter().write(new Gson().toJson(data));

	}

}
