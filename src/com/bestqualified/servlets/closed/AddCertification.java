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
import com.bestqualified.entities.Certification;
import com.bestqualified.entities.User;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;

public class AddCertification extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8198793608466812452L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("certification");
		String month = req.getParameter("cert-month");
		String year = req.getParameter("cert-year");

		if (Util.notNull(name, month, year)) {
			Certification cert = new Certification();

			cert.setMonth(month);
			cert.setYear(year);
			cert.setName(name);

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

				List<Certification> certList = ppb.getCertifications();
				if (certList == null) {
					certList = new ArrayList<>();
				}
				certList.add(0, cert);
				ppb.setCertifications(certList);
				List<Key> keys = cp.getCertifications();
				if (keys == null) {
					keys = new ArrayList<>();
				}
				keys.add(cert.getId());
				cp.setCertifications(keys);
				synchronized (session) {
					session.setAttribute("professionalProfile", cp);
					session.setAttribute("uppb", ppb);
				}
				GeneralController.createWithCrossGroup(
						EntityConverter.candidateProfileToEntity(cp),
						EntityConverter.certificationToEntity(cert));
			}
		}

	}

}
