package com.bestqualified.servlets.closed;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.FullJobBean;
import com.bestqualified.bean.ProjectBean;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.Company;
import com.bestqualified.entities.Job;
import com.bestqualified.entities.Project;
import com.bestqualified.entities.ProjectLog;
import com.bestqualified.entities.ProjectLog.Activity;
import com.bestqualified.entities.Recruiter;
import com.bestqualified.entities.User;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.SearchDocumentIndexService;
import com.bestqualified.util.Util;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Text;

public class SaveProject extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7589217221750956647L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String webkey = req.getParameter("project-key");
		String projectName = req.getParameter("project-name");
		String projectDescription = req.getParameter("project-description");
		String jobTitle = req.getParameter("job-title");
		String jobLocation = req.getParameter("job-location");
		String applicationUrl = req.getParameter("application-url");
		String applicationDeadline = req.getParameter("application-deadline");
		String jobRole = req.getParameter("job-role");
		String jobDesc = req.getParameter("job-description");
		String skills = req.getParameter("skills");
		String careerLevel = req.getParameter("career-level");
		String educationLevel = req.getParameter("education-level");
		String jobType = req.getParameter("job-type");
		String salary = req.getParameter("salary");
		String experience = req.getParameter("experience");
		String allowLinkedIn = req.getParameter("allow-LinkedIn");

		BlobstoreService bss = BlobstoreServiceFactory.getBlobstoreService();
		Map<String, List<BlobKey>> map = bss.getUploads(req);
		List<BlobKey> blobkeys = map.get("image");
		BlobKey imageKey = null;
		if (blobkeys != null && !blobkeys.isEmpty()) {
			imageKey = blobkeys.get(0);
		}

		String companyName = req.getParameter("company-name");
		String companyWebsite = req.getParameter("company-website");
		String companyDescription = req.getParameter("company-description");

		HttpSession session = req.getSession();

		if (!Util.notNull(projectName)) {
			session.setAttribute("updateProjectError",
					"Your project should have a name.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(jobTitle)) {
			session.setAttribute("updateProjectError",
					"Your job post should have a title.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(jobLocation)) {
			session.setAttribute("updateProjectError",
					"Add location to your job post.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(applicationUrl)) {
			session.setAttribute("updateProjectError",
					"Add an application URL or email to your job post.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(applicationDeadline)) {
			session.setAttribute("updateProjectError",
					"Add an application deadline to your job post");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		
		if (!Util.notNull(jobRole)) {
			session.setAttribute("updateProjectError",
					"Add a job roles to your job post.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(jobDesc)) {
			session.setAttribute("updateProjectError",
					"Add a job description to your job post.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(careerLevel)) {
			session.setAttribute("updateProjectError",
					"Add a career level to your job post.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(educationLevel)) {
			session.setAttribute("updateProjectError",
					"Add an education level to your job post.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}
		if (!Util.notNull(jobType)) {
			session.setAttribute("updateProjectError",
					"Add a job type to your job post.");
			resp.sendRedirect(resp.encodeRedirectURL(req.getRequestURI()));
			return;
		}

		Object o = null;
		synchronized (session) {
			o = session.getAttribute("projectBean");
		}

		if (Util.notNull(webkey) && o != null) {// we are updating

			Key key = KeyFactory.stringToKey(webkey);
			Project project = EntityConverter.entityToProject(GeneralController
					.findByKey(key));
			Key jobKey = project.getJobs();
			Job job = null;
			boolean projectChanged = false;
			if (jobKey == null) {
				job = new Job();
				job.setDatePosted(new Date());
				project.setJobs(job.getId());
				projectChanged = true;
				
			} else {
				job = EntityConverter.entityToJob(GeneralController
						.findByKey(project.getJobs()));
			}

			// projectBean
			
			ProjectBean pb = (ProjectBean) o;
			if (!pb.getName().equalsIgnoreCase(projectName)) {
				pb.setName(projectName);
				project.setName(projectName);
				projectChanged = true;
			}
			if (Util.notNull(projectDescription) && !projectDescription.equals(pb.getDescription())) {
				pb.setDescription(projectDescription);
				projectChanged = true;
			}

			// jobBean
			boolean jobChanged = false;
			FullJobBean fjb = pb.getJob();
			if (fjb == null) {
				fjb = new FullJobBean();
			}

			if (!jobTitle.equalsIgnoreCase(fjb.getTitle())) {
				fjb.setTitle(jobTitle);
				job.setJobTitle(jobTitle);
				jobChanged = true;
			}
			if (!jobLocation.equalsIgnoreCase(fjb.getLocation())) {
				fjb.setLocation(jobLocation);
				job.setLocation(jobLocation);
				jobChanged = true;
			}
			if (!applicationUrl.equalsIgnoreCase(fjb.getApplicationUrl())) {
				fjb.setApplicationUrl(applicationUrl);
				job.setApplicationUrl(applicationUrl);
				jobChanged = true;
			}
			if (!applicationDeadline.trim().equalsIgnoreCase(fjb
					.getApplicationDeadline())) {
				fjb.setApplicationDeadline(applicationDeadline);
				try {
					job.setClosingDate(new SimpleDateFormat("MM/dd/yyyy")
							.parse(applicationDeadline));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				jobChanged = true;
			}
			if (!jobDesc.equalsIgnoreCase(fjb.getJobDesc())) {
				fjb.setJobDesc(jobDesc);
				job.setDescription(new Text(jobDesc));
				jobChanged = true;
			}
			if (!careerLevel.equalsIgnoreCase(fjb.getCareerLevel())) {
				fjb.setCareerLevel(careerLevel);
				job.setCareerLevel(careerLevel);
				jobChanged = true;
			}
			if (!educationLevel.equalsIgnoreCase(fjb.getEducationLevel())) {
				fjb.setEducationLevel(educationLevel);
				job.setEducationLevel(educationLevel);
				jobChanged = true;
			}
			if (!jobType.equalsIgnoreCase(fjb.getJobType())) {
				fjb.setEducationLevel(educationLevel);
				job.setJobType(jobType);
				jobChanged = true;
			}

			if (Util.notNull(jobRole) && !jobRole.equals(fjb.getJobRole())) {
				fjb.setJobRole(jobRole);
				job.setJobRoles(new Text(jobRole));
				jobChanged = true;
			}

			if (Util.notNull(salary) && !salary.equals(fjb.getSalaryRange())) {
				fjb.setSalaryRange(salary);
				job.setSalaryRange(salary);
				jobChanged = true;
			}

			if (Util.notNull(experience)
					&& !experience.equals(fjb.getYearsOfExperience())) {
				fjb.setYearsOfExperience(experience);
				job.setExperience(experience);
				jobChanged = true;
			}

			if (Util.notNull(skills) && !skills.equals(fjb.getSkills())) {
				fjb.setSkills(skills);
				job.setSkills(Arrays.asList(skills.split(",")));
				jobChanged = true;
			}

			if (allowLinkedIn == null) {
				fjb.setApplyWithLinkedIn(false);
			} else {
				fjb.setApplyWithLinkedIn(true);
				jobChanged = true;
			}

			boolean companyChanged = false;
			Key comKey = job.getCompany();
			Company c = null;
			if(comKey == null) {
				c = new Company();
				job.setCompany(c.getId());
				jobChanged = true;
			}else {
				c = EntityConverter.entityToCompany(GeneralController
						.findByKey(comKey));
			}
			 
			if (Util.notNull(companyName)
					&& !companyName.equals(c.getCompanyName())) {
				c.setCompanyName(companyName);
				//pb.setCompanyName(companyName);
				companyChanged = true;
			}
			
			if (Util.notNull(companyWebsite)
					&& !companyWebsite.equals(c.getCompanyWebsite())) {
				c.setCompanyWebsite(companyWebsite);
				//pb.setCompanyWebsite(companyWebsite);
				companyChanged = true;
			}

			Text cd = c.getDescription();
			String cst = null;
			if(cd!=null) {
				cst = cd.getValue();
			}
			if (Util.notNull(companyDescription)
					&& !companyDescription.equals(cst)) {
				c.setDescription(new Text(companyDescription));
				pb.setCompanyDesc(companyDescription);
				companyChanged = true;
			}
			
			if(imageKey != null) {
				BlobKey bk = c.getLogo();
				if(bk != null) {
					BlobstoreService bs = BlobstoreServiceFactory.getBlobstoreService();
					bs.delete(bk);
				}
				c.setLogo(imageKey);
				pb.setCompanyLogo(Util.getPictureUrl(imageKey));
				companyChanged = true;
			}
			
			ProjectLog pl = new ProjectLog();
			pl.setActivity(Activity.UPDATE);
			pl.setDate(new Date());
			
			Entity e1 = null;
			Entity e2 = null;
			Entity e3 = null;
			Entity e4 = null;
			
			List<Entity> ents = new ArrayList<>();
			if(projectChanged) {
				e1  = EntityConverter.projectToEntity(project);
				ents.add(e1);
			}
			if(jobChanged) {
				Util.addToSearchIndex(job, c);
				e2 = EntityConverter.jobToEntity(job);
				ents.add(e2);
			}
			if(companyChanged) {
				e3 = EntityConverter.companyToEntity(c);
				ents.add(e3);
			}
			
			if(projectChanged | jobChanged | companyChanged) {
				e4 = EntityConverter.projectLogToEntity(pl);
				ents.add(e4);
			}
			
			if(ents.size()!=0) {
				GeneralController.createWithCrossGroup(ents);
			}
			
			resp.sendRedirect(resp
					.encodeRedirectURL("/bq/closed/recruiter/project?id="
							+ webkey));
			
			

		} else {
			Project p = new Project();
			p.setDateCreated(new Date());
			if (!Util.notNull(projectDescription)) {
				p.setDescription(new Text(projectDescription));
			}
			ProjectLog pl = new ProjectLog();
			pl.setActivity(Activity.CREATE);
			List<Key> keys = new ArrayList<>();
			keys.add(pl.getId());
			p.setLogs(keys);
			p.setName(projectName);

			Job j = new Job();
			p.setJobs(j.getId());

			j.setAllowLinkedInApplication((Util.notNull(projectDescription) ? true
					: false));
			j.setApplicationUrl(applicationUrl);
			j.setCareerLevel(careerLevel);
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			try {
				j.setClosingDate(sdf.parse(applicationDeadline));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			j.setDatePosted(new Date());
			j.setDescription(new Text(jobDesc));
			j.setEducationLevel(educationLevel);
			Object o1 = null;
			Object o2 = null;
			User u = null;
			Recruiter r = null;
			synchronized (session) {
				o1 = session.getAttribute("user");
				o2 = session.getAttribute("employerProfile");
			}

			if (o1 == null || o2 == null) {
				return;
			} else {
				u = (User) o1;
				r = (Recruiter) o2;
			}

			j.setEmployer(u.getUserKey());
			j.setExperience(experience);
			j.setJobRoles(new Text(jobRole));
			j.setJobTitle(jobTitle);
			j.setJobType(jobType);
			j.setLocation(jobLocation);
			j.setSalaryRange(salary);

			List<Key> pKeys = r.getProjects();
			if (pKeys == null) {
				pKeys = new ArrayList<>();
			}

			pKeys.add(p.getId());
			r.setProjects(pKeys);
			Company c = null;
			// company
			if (Util.notNull(companyName)) {
				c = new Company();
				j.setCompany(c.getId());
				c.setCompanyName(companyName);

				if (Util.notNull(companyDescription)) {
					c.setDescription(new Text(companyDescription));
				}

				c.setCompanyWebsite(companyWebsite);
				c.setLogo(imageKey);
			}
			synchronized (session) {
				session.setAttribute("employerProfile", r);
			}
			
			Util.addToSearchIndex(j, c);

			Entity e1 = EntityConverter.projectToEntity(p);
			Entity e2 = EntityConverter.projectLogToEntity(pl);
			Entity e3 = EntityConverter.jobToEntity(j);
			Entity e4 = null;
			Entity e5 = EntityConverter.recruiterToEntity(r);

			if (c != null) {
				e4 = EntityConverter.companyToEntity(c);
				GeneralController.createWithCrossGroup(e1, e2, e3, e4, e5);
			} else {
				GeneralController.createWithCrossGroup(e1, e2, e3, e5);
			}

			resp.sendRedirect(resp
					.encodeRedirectURL("/bq/closed/recruiter/project?id="
							+ p.getSafeKey()));

		}

	}

}
