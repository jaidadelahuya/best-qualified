package com.bestqualified.servlets.closed;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.UploadOptions;
import com.google.gson.Gson;

public class GetUploadUrl extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -236669492751354771L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getParameter("url");
		
		BlobstoreService bss = BlobstoreServiceFactory.getBlobstoreService();
		url = bss.createUploadUrl(url, UploadOptions.Builder.withMaxUploadSizeBytes(1*1024*1024));
		
		resp.setContentType("application/json");
		resp.getWriter().write(new Gson().toJson(url));
	}

}
