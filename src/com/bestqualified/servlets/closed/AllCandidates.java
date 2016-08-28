package com.bestqualified.servlets.closed;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.CandidateSearchResult;
import com.bestqualified.bean.ProView;
import com.bestqualified.bean.RecruiterDashboardBean;
import com.bestqualified.util.Util;
import com.google.appengine.api.search.Cursor;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.Query;
import com.google.appengine.api.search.QueryOptions;
import com.google.appengine.api.search.Results;
import com.google.appengine.api.search.ScoredDocument;
import com.google.appengine.api.search.SearchServiceFactory;
import com.google.appengine.api.search.SortExpression;
import com.google.appengine.api.search.SortOptions;
import com.google.gson.Gson;

public class AllCandidates extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7661454506305719499L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String[] careerLevel = req.getParameterValues("careerLevel");
		String[] location = req.getParameterValues("location");
		String[] jobType = req.getParameterValues("jobType");
		String[] educationLevel = req.getParameterValues("educationLevel");
		String[] experience = req.getParameterValues("experience");
		String title = req.getParameter("title");
		String filter = req.getParameter("filter");
		
		String qStr = "";
		if (Util.notNull(title)) {
			qStr += title.trim() + " ";
		}
		if (Util.notNull(experience)) {
			qStr += "(";
			for (int i = 0; i < experience.length; i++) {
				qStr += "experience:" + experience[i];
				if (i < experience.length - 1) {
					qStr += " OR ";
				}
			}
			qStr += ") ";
		}

		if (Util.notNull(educationLevel)) {
			qStr += "(";
			for (int i = 0; i < educationLevel.length; i++) {
				qStr += "highestEducationLevel:" + educationLevel[i];
				if (i < educationLevel.length - 1) {
					qStr += " OR ";
				}
			}
			qStr += ") ";
		}

		if (Util.notNull(jobType)) {
			qStr += "(";
			for (int i = 0; i < jobType.length; i++) {
				qStr += "jobType:" + jobType[i];
				if (i < jobType.length - 1) {
					qStr += " OR ";
				}
			}
			qStr += ") ";
		}

		if (Util.notNull(location)) {
			qStr += "(";
			for (int i = 0; i < location.length; i++) {
				qStr += "currentState:" + location[i];
				if (i < location.length - 1) {
					qStr += " OR ";
				}
			}
			qStr += ") ";
		}

		if (Util.notNull(careerLevel)) {
			qStr += "(";
			for (int i = 0; i < careerLevel.length; i++) {
				qStr += "careerLevel:" + careerLevel[i];
				if (i < careerLevel.length - 1) {
					qStr += " OR ";
				}
			}
			qStr += ") ";
		}
		
		
		HttpSession session = req.getSession();
		Object o = null;
		synchronized (session) {
			o=session.getAttribute("recruiterDashboard");
		}
		if(o==null) {
			resp.sendRedirect("/sign-in");
			return;
		}else {
			RecruiterDashboardBean rdb = (RecruiterDashboardBean) o;
			String c = rdb.getCursor();
			Cursor cursor = null;
			if(filter != null) {
				rdb.setSearchString(qStr);
				cursor = Cursor.newBuilder().build();
			}else {
				if(c==null) {
					cursor = Cursor.newBuilder().build();
				} else {
					cursor = Cursor.newBuilder().build(c);
				}
			}
			
					
			SortOptions sortOptions = SortOptions
					.newBuilder()
					.addSortExpression(
							SortExpression
									.newBuilder()
									.setExpression("yearsOfExperience")
									.setDirection(
											SortExpression.SortDirection.DESCENDING))
					.build();
			QueryOptions options = QueryOptions
					.newBuilder().setLimit(10).setCursor(cursor).setSortOptions(sortOptions)
					.setFieldsToReturn("firstName", "lastName", "highestEducationLevel",
							"yearsOfExperience","pictureUrl").build();
			Query query = Query.newBuilder().setOptions(options).build(rdb.getSearchString());
			IndexSpec indexSpec = IndexSpec.newBuilder().setName("professionals").build();
			Index index = SearchServiceFactory.getSearchService().getIndex(
					indexSpec);
			Results<ScoredDocument> result = index.search(query);
			long totalMatches = result.getNumberFound();
			int numberOfDocsReturned = result.getNumberReturned();
			List<ProView> pvs = new ArrayList<>();
			for (ScoredDocument sd : result) { 
				ProView pv = new ProView();
				pv.setFirstName(sd.getOnlyField("firstName").getText());
				pv.setLastName(sd.getOnlyField("lastName").getText());
				pv.setPictureUrl(sd.getOnlyField("pictureUrl").getAtom());
				pv.setYearsOfExperience(sd.getOnlyField("yearsOfExperience").getAtom());
				pv.setHighestQualification(sd.getOnlyField("highestEducationLevel").getText());
				pv.setWebkey(sd.getId());
				pvs.add(pv);
			}
			rdb.setTotalCandidates(totalMatches);
			if(numberOfDocsReturned < 10){
				rdb.setMoreCandidates(false);
				
			}else{
				rdb.setMoreCandidates(true);
				
			}
			cursor = result.getCursor();
			if(cursor!= null) {
				rdb.setCursor(cursor.toWebSafeString());
			}else {
				rdb.setCursor(null);
			}
			rdb.setProspects(pvs);
			synchronized (session) {
				session.setAttribute("recruiterDashboard", rdb);
			}
			if(req.getRequestURI().equalsIgnoreCase("/bq/closed/find-candidates")) {
				resp.setContentType("application/json");
				String json = new Gson().toJson(rdb);
				resp.getWriter().write(json);
			}else if(req.getRequestURI().equalsIgnoreCase("/bq/closed/all-candidates")) {
				resp.sendRedirect(resp.encodeRedirectURL("/bq/closed/find-candidate"));
			}
			
		}
		
	}

}
