package com.bestqualified.servlets.closed;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.ProView;
import com.bestqualified.bean.ProjectBean;
import com.bestqualified.bean.RecruiterDashboardBean;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.Project;
import com.bestqualified.entities.Recruiter;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class GetProfessionalView extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8558227859900097872L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String projectId = req.getParameter("pid");
		String category = req.getParameter("category");
		
		if(Util.notNull(projectId,category)) {
			Object o = null;
			Object o1 = null;
			
			HttpSession session = req.getSession();
			
			synchronized (session) {
				o = session.getAttribute("employerProfile");
				o1 = session.getAttribute("recruiterDashboard");
			}
			
			if(o!=null && o1!=null) {
				Recruiter r = (Recruiter) o;
				List<Key> keys = r.getProjects();
				Project p = null;
				for(Key k : keys) {
					if(k.equals(KeyFactory.stringToKey(projectId))) {
						p = EntityConverter.entityToProject(GeneralController.findByKey(k));
						break;
					}
				}
				List<Key> hotList = null;
				String hotListCategory = null;
				switch(category) {
				case "short-list" :
					hotList = p.getShortListedCandidates();
					hotListCategory= "Short Listed";
					break;
				case "invitees" :
					hotList = p.getInvitees();
					hotListCategory = "Invitees";
				}
				if(hotList != null) {
					List<ProView> pvs = new ArrayList<>();
					for(Key k : hotList) {
						pvs.add(Util.toProView(k));
					}
					
					RecruiterDashboardBean rdb = (RecruiterDashboardBean) o1;
					rdb.setHotList(pvs);
					rdb.setHotListCategory(hotListCategory);
					synchronized (session) {
						session.setAttribute("recruiterDashboard", rdb);
					}
					req.getRequestDispatcher("/WEB-INF/bq/close/professional-view.jsp").include(req, resp);
				}
				
			}
		}
	}

}
