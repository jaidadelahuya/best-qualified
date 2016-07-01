package com.bestqualified.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.Article;
import com.bestqualified.bean.CommunityBean;
import com.bestqualified.bean.InterestedJob;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.ArticleCategory;
import com.bestqualified.entities.Job;
import com.bestqualified.entities.ReadingList;
import com.bestqualified.util.Util;

public class InitCommunityBean extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 878894312761874221L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String date = new SimpleDateFormat("MMMM dd yyyy")
				.format(new Date());
		List<ReadingList> readingList = GeneralController
				.getNReadingListByDate(3);
		List<Job> jobs = GeneralController.getNJobs(5);
		List<InterestedJob> ijs = Util.toInterestedJobs(jobs);
		List<com.bestqualified.entities.Article> mainPost = GeneralController
				.getNArticlesByDate(10);
		List<Article> mps = Util.toArticleBeans(mainPost);
		List<com.bestqualified.entities.Article> discussion = GeneralController
				.getNDiscussions(10);
		List<Article> dis = Util.toArticleBeans(discussion);
		List<com.bestqualified.entities.Article> sales = GeneralController
				.getLatestArticles(ArticleCategory.SALES.name(), 1);
		List<com.bestqualified.entities.Article> advertising = GeneralController
				.getLatestArticles(ArticleCategory.ADVERTISING.name(), 1);
		List<com.bestqualified.entities.Article> marketing = GeneralController
				.getLatestArticles(ArticleCategory.MARKETING.name(), 1);
		List<com.bestqualified.entities.Article> pr = GeneralController
				.getLatestArticles(ArticleCategory.PUBLIC_RELATIONS.name(), 1);
		List<com.bestqualified.entities.Article> creatives = GeneralController
				.getLatestArticles(ArticleCategory.CREATIVES.name(), 1);
		List<com.bestqualified.entities.Article> latestArticles = new ArrayList<>();
		latestArticles.addAll(creatives);
		latestArticles.addAll(sales);
		latestArticles.addAll(advertising);
		latestArticles.addAll(marketing);
		latestArticles.addAll(pr);
		List<Article> la = Util.toArticleBeans(latestArticles);
		
		CommunityBean cb = new CommunityBean();
		cb.setCurrentDate(date);
		cb.setDiscussions(dis);
		cb.setJobs(ijs);
		cb.setLatestArticles(la);
		cb.setMainPosts(mps);
		cb.setReadingList(readingList);
		
		HttpSession session = req.getSession();
		synchronized (session) {
			session.setAttribute("communityBean", cb);
		}

		resp.sendRedirect(resp.encodeRedirectURL("/bq/community"));

	}

}
