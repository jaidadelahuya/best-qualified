package com.bestqualified.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.Company;
import com.bestqualified.entities.Job;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Text;


public class InitRecruiterMajorInterest4 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5383025217128128798L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		BlobstoreService blobstoreService = BlobstoreServiceFactory
				.getBlobstoreService();
		Map<String, List<BlobKey>> blobFields = blobstoreService
				.getUploads(req);
		List<BlobKey> blobKeys = blobFields.get("company-logo");
		BlobKey blobKey = null;
		if (blobKeys != null && !blobKeys.isEmpty()) {
			// We're only expecting one, so take the first one.
			blobKey = blobKeys.get(0);
		}
		
		String companyName = req.getParameter("company-name");
		String website = req.getParameter("company-website");
		String description = req.getParameter("company-description");
		HttpSession session = req.getSession();
		Object o = null;
		Entity e = null;
		Company c = null;
		Job j = null;
		synchronized (session) {
			o = session.getAttribute("job");
		}
		if (o == null) {
			resp.sendError(HttpServletResponse.SC_EXPECTATION_FAILED,
					"Your session has expired. <a href='/sign-up'>Start again</a>");
			return;
		} else {
			j = (Job) o;
			e = EntityConverter.jobToEntity(j);
		}
		if(Util.notNull(companyName)) {
			c = new Company();
			c.setCompanyName(companyName);
			c.setCompanyWebsite(website);
			c.setDescription(new Text(description));
			c.setLogo(blobKey);
			j.setCompany(c.getId());
			Entity e1 = EntityConverter.companyToEntity(c);
			e = EntityConverter.jobToEntity(j);
			GeneralController.createWithCrossGroup(e,e1);
		}else {
			GeneralController.create(e);
		}
		Util.addToSearchIndex(j, c);
		RequestDispatcher rd = req.getRequestDispatcher("/bq/endpoint/recruit-professional-user");
		rd.forward(req, resp);
		
		
		
	}

}
