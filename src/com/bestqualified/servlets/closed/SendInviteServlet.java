package com.bestqualified.servlets.closed;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
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
import com.bestqualified.entities.ProjectLog.Activity;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Text;

public class SendInviteServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -440794845500612853L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String projectWebKey = req.getParameter("project-webkey");
		String inviteTitle = req.getParameter("invite-title");
		String inviteText = req.getParameter("invite-text");
		String inviteeKey = req.getParameter("invitee-key");

		HttpSession session = req.getSession();
		Object o = null;
		synchronized (session) {
			o = session.getAttribute("recruiterDashboard");
		}
		if (o != null) {
			RecruiterDashboardBean rdb = (RecruiterDashboardBean) o;
			List<ProView> candidates = rdb.getProspects();
			ProView pv = null;
			for (ProView p : candidates) {
				if (inviteeKey != null && p.getWebkey().equals(inviteeKey)) {
					pv = p;
					break;
				}
			}
			String email = pv.getEmail();
			try {
				Util.sendEmail(Util.SERVICE_ACCOUNT, email, inviteTitle,
						inviteText);

				List<ProjectBean> pb = rdb.getProjects();
				Project project = null;

				project = EntityConverter.entityToProject(GeneralController
						.findByKey(KeyFactory.stringToKey(projectWebKey)));

				List<Key> list = project.getLogs();
				if (list == null) {
					list = new ArrayList<>();
				}

				ProjectLog pl = new ProjectLog();
				pl.setActivity(Activity.INVITE);
				pl.setComment(new Text("Invited " + pv.getFirstName() + " "
						+ pv.getLastName() + " for " + project.getName()));
				pl.setDate(new Date());
				Entity e = EntityConverter.projectLogToEntity(pl);
				list.add(pl.getId());
				project.setLogs(list);

				list = project.getInvitees();
				if (list == null) {
					list = new ArrayList<>();
				}
				if (!list.contains(KeyFactory.stringToKey(pv.getWebkey()))) {
					list.add(KeyFactory.stringToKey(pv.getWebkey()));
				}

				project.setInvitees(list);

				Entity e1 = EntityConverter.projectToEntity(project);

				GeneralController.createWithCrossGroup(e, e1);

			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
