package com.bestqualified.servlets.closed;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.User;
import com.bestqualified.util.EntityConverter;
import com.bestqualified.util.Util;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.FileInfo;

public class UploadProfilePicture extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1566826436171299667L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BlobstoreService bss = BlobstoreServiceFactory.getBlobstoreService();
		Map<String, List<FileInfo>> info = bss.getFileInfos(req);
		Map<String, List<BlobKey>> map = bss.getUploads(req);
		List<FileInfo> files = info.get("image");
		List<BlobKey> keys = map.get("image");
		HttpSession session = req.getSession();
		Object o = null;
		Object o1 = null;
		synchronized (session) {
			o = session.getAttribute("user");
			o1 = session.getAttribute("professionalProfile");
		
		}
		if(keys != null && !keys.isEmpty() && o != null && files !=null && !files.isEmpty() && o1 !=null) {
			BlobKey bk = keys.get(0);
			FileInfo fi  = files.get(0);
			String type = fi.getContentType();
			if(type.contains("image")) {
				User u = (User) o;
				CandidateProfile cp = (CandidateProfile) o1;
				u.setProfilePicture(bk);
				Util.addToSearchIndex(u, cp);
				GeneralController.create(EntityConverter.userToEntity(u));
				synchronized (session) {
					session.setAttribute("user", u);
				}
				
				String url =Util.getPictureUrl(bk);
				resp.getWriter().write(url);
			}
		}
	}

}
