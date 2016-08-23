package com.bestqualified.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.FullJobBean;
import com.bestqualified.bean.InterestedJob;
import com.bestqualified.bean.JobInformation;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.Company;
import com.bestqualified.entities.Job;
import com.bestqualified.entities.User;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.MemcacheProvider;
import com.bestqualified.util.StringConstants;
import com.bestqualified.util.Util;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class JobServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4899765101035322998L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		Object o2 = null;
		Object o1 = null;
		synchronized (session) {
			o2 = session.getAttribute("user");
			o1 = session.getAttribute("professionalProfile");
		}
		CandidateProfile cp = null;
		if (o2 != null) {
			User u = (User) o2;
			if (o1 != null) {
				cp = (CandidateProfile) o1;
			} else {
				cp = EntityConverter.entityToCandidateProfile(
						GeneralController.findByKey(u.getUserInfo()),
						u.getUserKey());
			}
		}

		String webSafeKey = req.getParameter("job-key");
		Key key = KeyFactory.stringToKey(webSafeKey);
		Object o = MemcacheProvider.JOBS.get(key);
		Job job = null;
		if (o == null) {
			job = EntityConverter.entityToJob(GeneralController.findByKey(key));
			MemcacheProvider.JOBS.put(key, job);
		} else {
			job = (Job) o;
		}

		Company com = null;
		JobInformation ji = new JobInformation();
		if (job.getCompany() != null) {
			com = EntityConverter.entityToCompany(GeneralController
					.findByKey(job.getCompany()));
			ji.setCompanyName(com.getCompanyName());
			
			if (com.getLogo() == null) {
				ji.setPictureUrl(StringConstants.DEFAULT_COMPANY_LOGO);
			} else {
				ji.setPictureUrl(Util.getPictureUrl(com.getLogo()));
			}
			if(com.getDescription()!=null) {
				ji.setCompanyDesc(com.getDescription().getValue());
			}
			
		} else {
			ji.setCompanyName("Confidential");
			ji.setPictureUrl(StringConstants.DEFAULT_COMPANY_LOGO);
		}
		
		

		ji.setPageUrl(resp.encodeURL("/bq/open/job?job-key=" + webSafeKey));
		ji.setWebKey(webSafeKey);
		ji.setJobTitle(job.getJobTitle());
		ji.setCloseDate(job.getClosingDate());
		if(job.getJobRoles()!= null) {
			ji.setJobRole(job.getJobRoles().getValue());
		}
		ji.setDatePosted(Util.getPostedTime(job.getDatePosted()));
		ji.setJobDesc(job.getDescription().getValue());
		ji.setExperience(job.getExperience());
		ji.setCareerLevel(job.getCareerLevel());
		ji.setLocation(job.getLocation());
		ji.setJobType(job.getJobType());
		ji.setApplicationUrl(job.getApplicationUrl());
		ji.setApplicationWebsite(job.getEducationLevel());
		ji.setDeadline(new SimpleDateFormat("dd-MMM-YYYY").format(job
				.getClosingDate()));
		ji.setSalaryRange(job.getSalaryRange());
		ji.setQualification(job.getEducationLevel());

		List<InterestedJob> ijs = Util.getRelatedJobs(job);
		ji.setRelatedJobs(ijs);
		if(o2 != null) {
			if(cp.getSavedJobs() != null && cp.getSavedJobs().contains(key)) {
				ji.setSaved(true);
			}else {
				ji.setSaved(false);
			}
		}
		
		synchronized (session) {
			session.setAttribute("jobInformation", ji);

		}
		req.getRequestDispatcher("/bq/open/job-information").include(req, resp);
	}

}
