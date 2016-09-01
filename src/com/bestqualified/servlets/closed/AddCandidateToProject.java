package com.bestqualified.servlets.closed;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
import com.bestqualified.entities.ProjectLog;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Text;
import com.google.gson.Gson;

public class AddCandidateToProject extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7138467491015560587L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		resp.setContentType("application/json");
		String projectKey = req.getParameter("project-key");
		String[] candidateKeys = req.getParameterValues("candidate-key");
		if(Util.notNull(projectKey)) {
			Object o = null;
			synchronized (session) {
				o = session.getAttribute("recruiterDashboard");
			}
			if(o != null) {
				RecruiterDashboardBean rdb = (RecruiterDashboardBean) o;
				List<ProView> prospects = rdb.getProspects();
				List<ProView> prospectsShortList = new ArrayList<>();
				List<Key> keys = new ArrayList<>();
				for(String s: candidateKeys) {
					for(ProView pv : prospects) {
						if(s.equals(pv.getWebkey())) {
							prospectsShortList.add(pv);
							break;
						}
					}
					keys.add(KeyFactory.stringToKey(s));
				}
				List<ProjectBean> pbs = rdb.getProjects();
				for(ProjectBean pb : pbs) {
					if(pb.getWebKey().equals(projectKey)) {
						if(pb.getShortlistedCandidates() == null) {
							pb.setShortlistedCandidates(new ArrayList<ProView>());
						}
						for(ProView pv : prospectsShortList) {
							if(!pb.getShortlistedCandidates().contains(pv)) {
								pb.getShortlistedCandidates().add(pv);
							}
						}
						
					}
				}
				rdb.setProjects(pbs);
				synchronized (session) {
					session.setAttribute("recruiterDashboard", rdb);
				}
				//save to datastore
				Key pKey = KeyFactory.stringToKey(projectKey);
				Project p = EntityConverter.entityToProject(GeneralController.findByKey(pKey));
				List<Key> sl = p.getShortListedCandidates();
				if(sl==null) {
					sl = new ArrayList<>();
				}
				int i = 0;
				for(Key k : keys) {
					if(!sl.contains(k)) {
						sl.add(k);
						i++;
					}
				}
				p.setShortListedCandidates(sl);
				if(i > 0) {
					ProjectLog pl = new ProjectLog();
					pl.setActivity(ProjectLog.Activity.SHORT_LIST);
					pl.setComment(new Text("Short-listed "+keys.size()+ " candidates."));
					pl.setDate(new Date());
					List<Key> plKeys = p.getLogs();
					if(plKeys == null) {
						plKeys = new ArrayList<>();
					}
					plKeys.add(pl.getId());
					p.setLogs(plKeys);
					Entity e1 = EntityConverter.projectLogToEntity(pl);
					Entity e = EntityConverter.projectToEntity(p);
					GeneralController.createWithCrossGroup(e,e1);
				}else {
					Entity e = EntityConverter.projectToEntity(p);
					GeneralController.create(e);
				}
				resp.getWriter().write(new Gson().toJson("Candidate Added"));
				
				

			}else {
				resp.getWriter().write(new Gson().toJson("Could not add to project"));
			}
		}
		
	}

}
