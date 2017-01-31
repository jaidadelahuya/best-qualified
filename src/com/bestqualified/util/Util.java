package com.bestqualified.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bestqualified.bean.Article;
import com.bestqualified.bean.AssessmentQuestionBean;
import com.bestqualified.bean.CommunityBean;
import com.bestqualified.bean.CorrectionBean;
import com.bestqualified.bean.FacebookAccessTokenResponse;
import com.bestqualified.bean.FullJobBean;
import com.bestqualified.bean.InterestedJob;
import com.bestqualified.bean.LinkedInAccessTokenResponse;
import com.bestqualified.bean.ManageProjectBean;
import com.bestqualified.bean.MyJobs;
import com.bestqualified.bean.ProView;
import com.bestqualified.bean.ProfessionalDashboard;
import com.bestqualified.bean.ProfessionalProfileBean;
import com.bestqualified.bean.ProjectBean;
import com.bestqualified.bean.RecruiterDashboardBean;
import com.bestqualified.bean.SignUpBean;
import com.bestqualified.bean.SocialUser;
import com.bestqualified.bean.SocialUser.SocialNetwork;
import com.bestqualified.bean.commentBean;
import com.bestqualified.controllers.GeneralController;
import com.bestqualified.entities.AssessmentQuestion;
import com.bestqualified.entities.Award;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.Certification;
import com.bestqualified.entities.Comment;
import com.bestqualified.entities.Community;
import com.bestqualified.entities.Company;
import com.bestqualified.entities.Education;
import com.bestqualified.entities.Job;
import com.bestqualified.entities.JobAlert;
import com.bestqualified.entities.Project;
import com.bestqualified.entities.Recruiter;
import com.bestqualified.entities.User;
import com.bestqualified.entities.WorkExperience;
import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.EmbeddedEntity;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.QueryResultList;
import com.google.appengine.api.datastore.Text;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.search.Document;
import com.google.appengine.api.search.Field;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.Query;
import com.google.appengine.api.search.QueryOptions;
import com.google.appengine.api.search.Results;
import com.google.appengine.api.search.ScoredDocument;
import com.google.appengine.api.search.SearchServiceFactory;
import com.google.appengine.api.search.SortExpression;
import com.google.appengine.api.search.SortOptions;
import com.google.appengine.api.urlfetch.HTTPResponse;
import com.google.appengine.api.urlfetch.URLFetchServiceFactory;
import com.google.appengine.labs.repackaged.org.json.JSONException;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.appengine.labs.repackaged.org.json.JSONTokener;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

public class Util {
	private static final String INTERSWITCH_MAC = "D3D1D05AFE42AD50818167EAC73C109168A0F108F32645C8B59E897FA930DA44F9230910DAC9E20641823799A107A02068F7BC0F4CC41D2952E249552255710F";

	public static final String INTERSWITCH_PRODUCT_ID = "6205";

	private static final String INTERSWITCH_PAY_ITEM_ID = "101";
	public static final String SERVICE_ACCOUNT = "bestqualified.profiliant@gmail.com";
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	public static final String PASSWORD_PATTERN =
            "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";

	public synchronized static String getTransactionRef(String fName,
			String lName) {
		// TODO Auto-generated method stub
		Date d = new Date();
		Long l = d.getTime();
		String code = fName.substring(0, 2) + l + lName.substring(0, 2);
		return code.toUpperCase();
	}

	public static boolean containsPattern(String testString, String pattern) {
		Pattern p = Pattern.compile(pattern);
		Matcher matcher = p.matcher(testString);
		return matcher.matches();
	}

	public static boolean notNull(String... args) {
		if (args == null) {
			return false;
		}
		for (String s : args) {
			if (s == null || s.isEmpty()) {
				return false;
			}
		}
		return true;
	}

	public static boolean isEmail(String email) {
		Pattern pattern = Pattern.compile(EMAIL_PATTERN);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}

	public static String generateRandomCode(int minVal, int maxVal) {
		Random ran = new Random();
		return new Integer(minVal + ran.nextInt(maxVal)).toString();
	}

	public static String toSHA512(String str) {

		StringBuffer sb = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.update(str.getBytes());

			byte byteData[] = md.digest();

			// convert the byte to hex format method 1

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16)
						.substring(1));
			}

		} catch (NoSuchAlgorithmException e) { // TODO Auto-generated catch
												// block
			e.printStackTrace();
		}
		return sb.toString();
	}

	public static boolean sendEmail(String from, String to, String title,
			String body) throws AddressException, MessagingException {

		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(Util.SERVICE_ACCOUNT,
					"Best Qualified Admin", "UTF-8"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(title);
			msg.setText(body);
			msg.setContent(body, "text/html");
			Transport.send(msg);

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();

		}
		return true;

	}

	public static User signUpBeanToUser(SignUpBean sub) {
		User u = new User(sub.getFirstName(), sub.getLastName());
		u.setEmail(sub.getEmail());
		u.setFirstName(sub.getFirstName());
		u.setJoinedDate(new Date());
		u.setPassword(sub.getPassword());
		u.setLastName(sub.getLastName());
		if (sub.getUserType() != null) {
			u.setUserType(sub.getUserType().name());
		}

		return u;
	}

	public static void sendConfirmationCodeEmail(String email, String body)
			throws AddressException, MessagingException {
		String title = "Best Qualified Confirmation Code";
		String to = email.toLowerCase();
		Util.sendEmail(Util.SERVICE_ACCOUNT, to, title, body);
		// Util.sendEmailNotification( to, title, body);
	}

	public static String getConfirmationCodeEmailBody(String code, String name) {
		if (name == null) {
			name = "";
		}
		return "<body><div style='width: 40%; margin: 0 auto'>"
				+ "<img alt='Best Qualified' src='http://best-qualified.appspot.com/images/bq-logo.png'/>"
				+ "</div><div><h4 style='padding-bottom: 3%;'>Hello "
				+ name
				+ ",</h4>"
				+ "<h3 style='color:#d9534f'>Best Qualified Verification Code</h3><p>Your new account is almost ready.</p>"
				+ "<p>Before you can login you have to verfiy your email by entering this code: <strong style='color:#d9534f'>"
				+ code
				+ "</strong></p><p>This code is valid for the next 24hrs.</p>"
				+ "<p>Regards,</p><p>Best Qualified Team</p></div></body>";
	}

	public static String getAccountCreatedMsg(String firstName) {

		return "<body><div style='width: 40%; margin: 0 auto'>"
				+ "<img alt='Best Qualified' src='http://best-qualified.appspot.com/images/bq-logo.png'/>"
				+ "</div><div><h4 style='padding-bottom: 3%;'>Hello "
				+ firstName
				+ ",</h4>"
				+ "<h3 style='color:#d9534f'>Best Qualified Account Created Successfully</h3><p>Your new account is ready.</p>"
				+ "<p>Regards,</p><p>Best Qualified Team</p></div></body>";
	}

	public static User mergeUsers(User u, User u1) {
		u.setBirthDate(u1.getBirthDate());
		u.setEmails(u1.getEmails());
		u.setFacebookID(u1.getFacebookID());
		u.setGender(u.getGender());
		u.setGoogleID(u1.getGoogleID());
		u.setJoinedDate(u1.getJoinedDate());
		u.setLinkedInID(u1.getLinkedInID());
		u.setPhone(u1.getPhone());
		u.setProfilePicture(u1.getProfilePicture());
		u.setTwitterID(u1.getTwitterID());
		u.setUserInfo(u1.getUserInfo());
		u.setUserType(u1.getUserType());
		u.setVerified(u1.isVerified());
		return u;
	}

	public static SignUpBean userToSignUpBean(User u) {
		SignUpBean sub = new SignUpBean();
		sub.setEmail(u.getEmail());
		sub.setFirstName(u.getFirstName());
		sub.setLastName(u.getLastName());
		sub.setPassword(u.getPassword());
		return sub;
	}

	public static List<InterestedJob> getJobs(String careerLevel,
			List<Key> education) {
		List<InterestedJob> l = null;
		if (careerLevel != null & education != null) {

		} else {
			Iterator<Entity> it = GeneralController.findAll(
					Job.class.getSimpleName(), 3);
			List<Job> jobs = new ArrayList<>();
			while (it.hasNext()) {
				jobs.add(EntityConverter.entityToJob(it.next()));
			}
			l = Util.toInterestedJobs(jobs);

		}
		return l;
	}

	public static List<InterestedJob> toInterestedJobs(List<Job> jobs) {
		List<InterestedJob> l = new ArrayList<>();
		List<Key> cKeys = new ArrayList<>();
		for (Job jb : jobs) {
			if (jb.getCompany() != null) {
				cKeys.add(jb.getCompany());
			}

		}
		Map<Key, Entity> cEnts = GeneralController.findByKeys(cKeys);
		for (Job j : jobs) {
			InterestedJob ij = new InterestedJob();
			if (j.getCompany() == null) {
				ij.setCompanyName("Confidential");
				ij.setPictureUrl(StringConstants.DEFAULT_COMPANY_LOGO);
			} else {
				Company c = EntityConverter.entityToCompany(cEnts.get(j
						.getCompany()));
				ij.setCompanyName(c.getCompanyName());
				ij.setCompanyKey(KeyFactory.keyToString(c.getId()));
				if (c.getLogo() == null) {
					ij.setPictureUrl(StringConstants.DEFAULT_COMPANY_LOGO);
				} else {
					ij.setPictureUrl(Util.getPictureUrl(c.getLogo()));
				}
			}
			ij.setJobKey(KeyFactory.keyToString(j.getId()));
			ij.setJobTitle(j.getJobTitle());

			ij.setPostedTime(getPostedTime(j.getDatePosted()));
			l.add(ij);
		}
		return l;
	}

	public static String getPostedTime(Date datePosted) {

		Date today = new Date();
		long difference = today.getTime() - datePosted.getTime();

		// to seconds
		difference = TimeUnit.MILLISECONDS.toSeconds(difference);
		if (difference < 60) {
			return difference + " seconds ago";
		}

		// to minutes
		difference = TimeUnit.SECONDS.toMinutes(difference);
		if (difference < 60) {
			if (difference <= 1) {
				return 1 + " minute ago";
			} else {
				return difference + " minutes ago";
			}
		}

		// to hours
		difference = TimeUnit.MINUTES.toHours(difference);
		if (difference < 24) {
			if (difference <= 1) {
				return 1 + " hour ago";
			} else {
				return difference + " hours ago";
			}
		} else if (difference < 48) {
			return "yesterday";
		}

		// to days
		difference = TimeUnit.HOURS.toDays(difference);
		if (difference < 7) {
			if (difference <= 1) {
				return 1 + " day ago";
			} else {
				return difference + " days ago";
			}
		}

		// to Weeks
		difference = Math.round(difference / 7);
		if (difference < 5) {
			if (difference <= 1) {
				return 1 + " week ago";
			} else {
				return difference + " weeks ago";
			}
		}

		// to months
		difference = Math.round(difference / 4);
		if (difference < 12) {
			if (difference <= 1) {
				return 1 + " month ago";
			} else {
				return difference + " months ago";
			}
		}

		// to years
		difference = Math.round(difference / 12);

		if (difference <= 1) {
			return 1 + " year ago";
		} else {
			return difference + " years ago";
		}

	}

	public static String getPictureUrl(BlobKey key) {
		if (key == null) {
			return "/images/unknown-user.jpg";
		} else {
			ServingUrlOptions suo = ServingUrlOptions.Builder.withBlobKey(key);
			ImagesService is = ImagesServiceFactory.getImagesService();
			return is.getServingUrl(suo);
		}
	}

	public static long calculateProfileStrength(User u, CandidateProfile cp) {
		long strength = 0;
		if (u.getFirstName() != null) {
			strength += 8;
		}
		if (u.getLastName() != null) {
			strength += 8;
		}
		if (u.getEmail() != null) {
			strength += 8;
		}
		if (u.getPhone() != null) {
			strength += 8;
		}
		if (cp.getCurrentState() != null) {
			strength += 8;
		}
		if (cp.getCv() != null) {
			strength += 8;
		}
		if (cp.getCurrentEmployer() != null) {
			strength += 6;
		}
		if (cp.getWorkExperience() != null && cp.getWorkExperience().size() > 1) {
			strength += 6;
		}
		if (cp.getProfileDescription() != null) {
			strength += 6;
		}
		if (cp.getEducation() != null && cp.getEducation().size() > 1) {
			strength += 6;
		}

		if (cp.getAwards() != null && cp.getAwards().size() > 1) {
			strength += 6;
		}

		if (cp.getCertifications() != null && cp.getCertifications().size() > 1) {
			strength += 6;
		}
		if (u.getTagline() != null) {
			strength += 2;
		}
		if (u.getProfilePicture() != null) {
			strength += 2;
		}
		if (u.getBirthDate() != null) {
			strength += 2;
		}
		if (cp.getNationality() != null) {
			strength += 2;
		}
		if (cp.getStateOfOrigin() != null) {
			strength += 2;
		}
		if (cp.getLga() != null) {
			strength += 2;
		}
		return strength;
	}

	public static ProfessionalDashboard initProfessionalDashboardBean(User u,
			CandidateProfile cp) {
		ProfessionalDashboard pd = new ProfessionalDashboard();
		pd.setArticles(Util.toArticleBeans(
				GeneralController.getNArticlesByDate(3), null));
		pd.setProfessionalLevel(u.getProfessionalLevel());
		pd.setCurrentEmployer(cp.getCurrentEmployer());
		pd.setiJobs(Util.getJobs(cp.getCareerLevel(), cp.getEducation()));
		List<Key> sjs = cp.getSavedJobs();
		if (sjs != null) {
			Map<Key, Entity> map = GeneralController.findByKeys(sjs);
			List<Job> jobs = new ArrayList<>();
			for (Key k : map.keySet()) {
				jobs.add(EntityConverter.entityToJob(map.get(k)));
			}
			List<InterestedJob> isjs = Util.toInterestedJobs(jobs);
			pd.setSavedJobs(isjs);
		} else {
			pd.setSavedJobs(new ArrayList<InterestedJob>());
		}

		List<Key> jals = cp.getJobAlerts();
		if (jals != null) {
			Map<Key, Entity> map = GeneralController.findByKeys(jals);
			List<JobAlert> jobAlerts = new ArrayList<>();
			for (Key k : map.keySet()) {
				jobAlerts.add(EntityConverter.entityToJobAlert(map.get(k)));
			}
			pd.setJobAlerts(jobAlerts);
		} else {
			pd.setJobAlerts(new ArrayList<JobAlert>());
		}

		if (cp.getJobsApplied() != null) {
			List<Key> jbsa = new ArrayList<>();
			jbsa.addAll(cp.getJobsApplied());

			Map<Key, Entity> map = GeneralController.findByKeys(jbsa);
			List<Job> jobs = new ArrayList<>();
			for (Key k : map.keySet()) {
				jobs.add(EntityConverter.entityToJob(map.get(k)));
			}
			List<InterestedJob> isjs = Util.toInterestedJobs(jobs);
			pd.setAppliedJobs(isjs);

		}

		pd.setName(u.getFirstName() + " " + u.getLastName());
		pd.setNoOfConnections(String.valueOf((cp.getConnections() == null) ? 0
				: cp.getConnections().size()));
		pd.setNoOfProfileViewers(String
				.valueOf((cp.getProfileViewers() == null) ? 0 : cp
						.getProfileViewers().size()));
		if (u.getPictureUrl() == null) {
			pd.setPictureUrl((u.getProfilePicture() == null) ? StringConstants.UNKNOWN_USER
					: Util.getPictureUrl(u.getProfilePicture()));
		} else {
			pd.setPictureUrl(u.getPictureUrl());
		}
		pd.setProfileStrength(Util.calculateProfileStrength(u, cp));
		pd.setProfileLevel(Util.getprofileLevel(pd.getProfileStrength()));
		pd.setProfileColor(Util.getProfileColor(pd.getProfileStrength()));

		if (Util.notNull(u.getTagline(), cp.getCurrentEmployer())) {
			pd.setTagline(u.getTagline() + " at " + cp.getCurrentEmployer());
		} else if (Util.notNull(u.getTagline())) {
			pd.setTagline(u.getTagline());
		} else if (Util.notNull(cp.getCurrentEmployer())) {
			pd.setTagline("Works at " + cp.getCurrentEmployer());
		}

		return pd;
	}

	private static String getProfileColor(long profileStrength) {
		if (profileStrength < 50) {
			return "red";
		} else if (profileStrength < 70) {
			return "orange";
		} else if (profileStrength < 85) {
			return "olive";
		} else if (profileStrength < 96) {
			return "green";
		} else {
			return "blue";
		}
	}

	private static String getprofileLevel(long profileStrength) {
		if (profileStrength < 50) {
			return "Beginner";
		} else if (profileStrength < 70) {
			return "Intermediate";
		} else if (profileStrength < 85) {
			return "Intermediate";
		} else if (profileStrength < 96) {
			return "Intermediate";
		} else {
			return "Best Qualified Star";
		}
	}

	public static FacebookAccessTokenResponse toFacebookAccessTokenResponse(
			String respString) {
		respString = respString.replace("{", "").replace("}", "")
				.replace("\"", "");
		String[] str = respString.split(",");
		FacebookAccessTokenResponse fatr = new FacebookAccessTokenResponse();
		for (String s : str) {
			String[] ss = s.split(":");
			if (ss[0].equalsIgnoreCase("access_token")) {
				if (ss.length > 1) {
					fatr.setAccessToken(ss[1]);
				}

			} else if (ss[0].equalsIgnoreCase("expires_in")) {
				if (ss.length > 1) {
					fatr.setExpires(ss[1]);
				}

			} else if (ss[0].equalsIgnoreCase("token_type")) {
				if (ss.length > 1) {
					fatr.setTokenType(ss[1]);
				}

			}

		}
		return fatr;
	}

	public static SocialUser toFaceBookSocialUser(String respString) {
		SocialUser su = new SocialUser();
		su.setNetwork(SocialNetwork.FACEBOOK);
		JSONTokener jt = new JSONTokener(respString);
		JSONObject jo;
		try {
			jo = new JSONObject(jt);
			if (respString.contains("email")) {
				su.setEmail(jo.getString("email"));
			}
			if (respString.contains("first_name")) {
				su.setFirstName(jo.getString("first_name"));
			}
			if (respString.contains("gender")) {
				su.setGender(jo.getString("gender"));
			}
			if (respString.contains("id")) {
				su.setId(jo.getString("id"));
			}
			if (respString.contains("last_name")) {
				su.setLastName(jo.getString("last_name"));
			}
			su.setPictureUrl(jo.getJSONObject("picture").getJSONObject("data")
					.getString("url"));
			su.setVerified(jo.getBoolean("verified"));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return su;
	}

	public static void logUserIn(User u, HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		u.setAuthenticated(true);
		Entity e = GeneralController.findByKey(u.getUserInfo());
		CandidateProfile cp = null;
		if (u.getUserType().equalsIgnoreCase(User.UserType.PROFESSIONAL.name())) {
			cp = EntityConverter.entityToCandidateProfile(e, u.getUserKey());
			synchronized (session) {
				session.setAttribute("professionalProfile", cp);
			}
		} else if (u.getUserType().equalsIgnoreCase(
				User.UserType.RECRUITER.name())) {
			Recruiter r = EntityConverter.entityToRecruiter(e);
		}

		RequestDispatcher rd = req
				.getRequestDispatcher("/bq/closed/init-dashboard");
		rd.forward(req, resp);

	}

	public static User socialUserToUser(SocialUser su) {
		User u = new User(su.getFirstName(), su.getLastName());
		u.setGender(su.getGender());
		u.setTagline(su.getHeadline());
		u.setPictureUrl(su.getPictureUrl());
		u.setJoinedDate(new Date());
		if (!u.getEmails().contains(su.getEmail())) {
			u.getEmails().add(su.getEmail());
		}
		switch (su.getNetwork()) {
		case FACEBOOK:
			u.setFacebookID(su.getId());
			break;
		case LINKEDIN:
			u.setLinkedInID(su.getId());
			break;
		case TWITTER:
			u.setTwitterID(su.getId());
			break;
		case GOOGLE:
			u.setGoogleID(su.getId());
		}
		return u;
	}

	public static MyJobs getMyJobs(Map<String, Object> map, CandidateProfile cp) {
		MyJobs mjs = new MyJobs();
		if (cp.getJobsApplied() == null) {
			mjs.setApplications(0);
		} else {
			mjs.setApplications(cp.getJobsApplied().size());
		}

		if (cp.getJobAlerts() == null) {
			mjs.setJobAlerts(0);
		} else {
			mjs.setJobAlerts(cp.getJobAlerts().size());
		}

		mjs.setJobsCursor((String) map.get("cursor"));
		if (cp.getSavedJobs() == null) {
			mjs.setSavedJobs(0);
		} else {
			mjs.setSavedJobs(cp.getSavedJobs().size());
		}

		List<Job> jobs = new ArrayList<>();
		QueryResultList<Entity> qrl = (QueryResultList<Entity>) map
				.get("entities");
		for (Entity e : qrl) {
			jobs.add(EntityConverter.entityToJob(e));
		}
		mjs.setiJobs(Util.toInterestedJobs(jobs));
		return mjs;
	}

	public static MyJobs updateMyJobs(MyJobs mjs, Map<String, Object> map,
			CandidateProfile cp) {
		if (cp.getJobsApplied() == null) {
			mjs.setApplications(0);
		} else {
			mjs.setApplications(cp.getJobsApplied().size());
		}

		if (cp.getJobAlerts() == null) {
			mjs.setJobAlerts(0);
		} else {
			mjs.setJobAlerts(cp.getJobAlerts().size());
		}

		mjs.setJobsCursor((String) map.get("cursor"));
		if (cp.getSavedJobs() == null) {
			mjs.setSavedJobs(0);
		} else {
			mjs.setSavedJobs(cp.getSavedJobs().size());
		}
		List<Job> jobs = new ArrayList<>();
		QueryResultList<Entity> qrl = (QueryResultList<Entity>) map
				.get("entities");
		for (Entity e : qrl) {
			jobs.add(EntityConverter.entityToJob(e));
		}
		mjs.setiJobs(Util.toInterestedJobs(jobs));
		return mjs;

	}

	public static void addToSearchIndex(User u, CandidateProfile cp) {

		String experience = Util.getExperience(cp.getYearsOfExperience());
		Document.Builder db = Document.newBuilder();
		db = db.setId(KeyFactory.keyToString(u.getUserKey()))
				.addField(
						Field.newBuilder().setName("firstName")
								.setText(u.getFirstName()))
				.addField(
						Field.newBuilder().setName("lastName")
								.setText(u.getLastName()))
				.addField(
						Field.newBuilder().setName("email")
								.setAtom(u.getEmail()))
				.addField(
						Field.newBuilder().setName("phone")
								.setAtom(u.getPhone()))
				.addField(
						Field.newBuilder().setName("gender")
								.setAtom(u.getGender()))
				.addField(
						Field.newBuilder().setName("tagline")
								.setText(u.getTagline()))
				.addField(
						Field.newBuilder().setName("careerLevel")
								.setAtom(cp.getCareerLevel()))
				.addField(
						Field.newBuilder().setName("currentState")
								.setAtom(cp.getCurrentState()))
				.addField(
						Field.newBuilder().setName("currentCountry")
								.setAtom(cp.getCurrentCountry()))
				.addField(
						Field.newBuilder().setName("jobType")
								.setAtom(cp.getJobType()))
				.addField(
						Field.newBuilder().setName("highestEducationLevel")
								.setText(cp.getHighestEducationLevel()))
				.addField(
						Field.newBuilder().setName("currentEmployer")
								.setText(cp.getCurrentEmployer()))
				.addField(
						Field.newBuilder().setName("experience")
								.setAtom(experience))
				.addField(
						Field.newBuilder().setName("pictureUrl")
								.setAtom(u.getPictureUrl()))
				.addField(
						Field.newBuilder().setName("yearsOfExperience")
								.setAtom(cp.getYearsOfExperience()));

		SearchDocumentIndexService.indexDocument("professionals", db.build());

	}

	private static String getExperience(String yearsOfExperience) {
		if (yearsOfExperience != null) {
			int i = Integer.parseInt(yearsOfExperience);
			if (i >= 0 && i <= 1) {
				return "401";
			} else if (i >= 0 && i <= 2) {
				return "402";
			} else if (i >= 1 && i <= 3) {
				return "403";
			} else if (i >= 2 && i <= 5) {
				return "404";
			} else if (i >= 3 && i <= 5) {
				return "405";
			} else if (i >= 5 && i <= 10) {
				return "406";
			} else if (i >= 7 && i <= 10) {
				return "407";
			} else {
				return "408";
			}
		} else {
			return null;
		}

	}

	public static void addToSearchIndex(Job job, Company c) {
		String companyName = null;
		if (c == null) {
			companyName = "Confidential";
		} else {
			companyName = c.getCompanyName();
		}
		Document.Builder db = Document.newBuilder();
		db = db.setId(KeyFactory.keyToString(job.getId()))
				.addField(
						Field.newBuilder().setName("jobTitle")
								.setAtom(job.getJobTitle()))
				.addField(
						Field.newBuilder().setName("jobTitle")
								.setText(job.getJobTitle()))
				.addField(
						Field.newBuilder().setName("location")
								.setAtom(job.getLocation()))
				.addField(
						Field.newBuilder().setName("salaryRange")
								.setAtom(job.getSalaryRange()))
				.addField(
						Field.newBuilder().setName("careerLevel")
								.setAtom(job.getCareerLevel()))
				.addField(
						Field.newBuilder().setName("jobType")
								.setAtom(job.getJobType()))
				.addField(
						Field.newBuilder().setName("experience")
								.setAtom(job.getExperience()))
				.addField(
						Field.newBuilder().setName("jobCategory")
								.setAtom(job.getJobCategory()))
				.addField(
						Field.newBuilder().setName("datePosted")
								.setDate(job.getDatePosted()))
				.addField(
						Field.newBuilder().setName("companyName")
								.setText(companyName));

		SearchDocumentIndexService.indexDocument("jobs", db.build());
	}

	public static ProfessionalProfileBean createProfessionalProfileBean(User u,
			CandidateProfile cp) {
		ProfessionalProfileBean ppb = new ProfessionalProfileBean();
		ppb.setFirstName(u.getFirstName());
		ppb.setLastName(u.getLastName());
		ppb.setEmail(u.getEmail());
		ppb.setPhone(u.getPhone());
		ppb.setGender(u.getGender());
		ppb.setTagline(u.getTagline());
		ppb.setProfessionalLevel(u.getProfessionalLevel());
		ppb.setProfilePicture(u.getPictureUrl());
		if (u.getBirthDate() != null) {
			ppb.setBirthdate(new SimpleDateFormat("MMMM-dd-yyyy").format(u
					.getBirthDate()));
		}
		ppb.setCurrentState(cp.getCurrentState());
		ppb.setCurrentCountry(cp.getCurrentCountry());
		ppb.setCareerLevel(cp.getCareerLevel());
		ppb.setYearOfExperience(cp.getYearsOfExperience());
		ppb.setNationality(cp.getNationality());
		ppb.setLga(cp.getLga());
		ppb.setStateOfOrigin(cp.getStateOfOrigin());
		ppb.setWebKey(KeyFactory.keyToString(u.getUserKey()));

		if (cp.getArticles() != null) {
			ppb.setNoOfArticles(String.valueOf(cp.getArticles().size()));
		}

		// award
		List<Award> awards = new ArrayList<>();
		if (cp.getAwards() != null) {
			for (Key k : cp.getAwards()) {
				Entity e = GeneralController.findByKey(k);
				if (e != null) {
					awards.add(EntityConverter.entityToAward(e));
				}

			}
		} else {
			cp.setAwards(new ArrayList<Key>());
		}
		ppb.setAwards(awards);
		// certifications
		List<Certification> certifications = new ArrayList<>();
		if (cp.getCertifications() != null) {

			for (Key k : cp.getCertifications()) {
				Entity e = GeneralController.findByKey(k);
				if (e != null) {
					certifications
							.add(EntityConverter.entityToCertification(e));
				}

			}
		} else {
			cp.setCertifications(new ArrayList<Key>());
		}
		ppb.setCertifications(certifications);

		// education
		List<Education> education = new ArrayList<>();
		if (cp.getEducation() != null) {
			for (Key k : cp.getEducation()) {
				Entity e = GeneralController.findByKey(k);
				if (e != null) {
					education.add(EntityConverter.entityToEducation(e));
				}
			}
		} else {
			cp.setEducation(new ArrayList<Key>());
		}

		// work experience
		List<WorkExperience> workExperience = new ArrayList<>();
		if (cp.getWorkExperience() != null) {
			for (Key k : cp.getWorkExperience()) {
				Entity e = GeneralController.findByKey(k);
				if (e != null) {
					workExperience.add(EntityConverter
							.entityToWorkExperience(e));
				}

			}
		} else {
			cp.setWorkExperience(new ArrayList<Key>());
		}

		if (cp.getCv() != null) {
			ppb.setCvSafeString(cp.getCv().getKeyString());
		}
		ppb.setCv(Util.getBlobFileName(cp.getCv()));

		ppb.setWorkExperience(workExperience);
		ppb.setEducation(education);
		ppb.setCurrentEmployer(cp.getCurrentEmployer());

		if (cp.getProfileDescription() != null) {
			ppb.setProfileSummary(cp.getProfileDescription().getValue());
		}

		return ppb;
	}

	private static String getBlobFileName(BlobKey blobKey) {
		if (blobKey == null) {
			return "";
		}
		BlobInfoFactory bif = new BlobInfoFactory();
		BlobInfo bi = bif.loadBlobInfo(blobKey);
		return bi.getFilename();
	}

	public static RecruiterDashboardBean initRecruiterDashboardBean(User u,
			Recruiter r) {
		RecruiterDashboardBean rdb = new RecruiterDashboardBean();
		rdb.setName(u.getFirstName() + " " + u.getLastName());
		if (u.getPictureUrl() == null) {
			rdb.setImageUrl("/images/unknown-user.jpg");
		} else {
			rdb.setImageUrl(u.getPictureUrl());
		}

		if (r.getCompany() != null) {
			Entity e = GeneralController.findByKey(r.getCompany());
			Company c = EntityConverter.entityToCompany(e);
			if (Util.notNull(u.getTagline(), c.getCompanyName())) {
				rdb.setTagLine(u.getTagline() + " at " + c.getCompanyName());
			} else if (Util.notNull(u.getTagline())) {
				rdb.setTagLine(u.getTagline());
			} else if (Util.notNull(c.getCompanyName())) {
				rdb.setTagLine("Works at " + c.getCompanyName());
			}
		}

		rdb.setEmail(u.getEmail());

		List<Key> projectKeys = r.getProjects();
		Map<Key, Entity> projectEntities = GeneralController
				.findByKeys(projectKeys);
		rdb.setProjects(Util.getProjectBeans(projectEntities));
		rdb = (Util.setProspects(projectEntities, rdb));

		// rdb.setSavedSearch(Util.getSavedSearch(r.));

		return rdb;
	}

	private static RecruiterDashboardBean setProspects(
			Map<Key, Entity> projectEntities, RecruiterDashboardBean rdb) {
		List<Key> jobKeys = new ArrayList<>();
		Set<Key> keys = projectEntities.keySet();
		for (Key k : keys) {
			Entity e = projectEntities.get(k);
			Object o = e.getProperty("job");
			if (o != null) {
				Key kk = (Key) o;
				jobKeys.add(kk);
			}
		}
		List<Job> jobs = new ArrayList<>();
		Map<Key, Entity> map = GeneralController.findByKeys(jobKeys);
		for (Key k : jobKeys) {
			jobs.add(EntityConverter.entityToJob(map.get(k)));
		}
		Set<String> experience = new HashSet<>();
		Set<String> education = new HashSet<>();
		for (Job j : jobs) {
			if (j.getExperience() != null) {
				experience.add(j.getExperience());
			}
			if (j.getEducationLevel() != null) {
				education.add(j.getEducationLevel());
			}
		}
		return initProview(experience, education, rdb);
	}

	private static RecruiterDashboardBean initProview(Set<String> experience,
			Set<String> education, RecruiterDashboardBean rdb) {
		List<String> exp = new ArrayList<>();
		exp.addAll(experience);
		List<String> edu = new ArrayList<>();
		edu.addAll(education);
		String q = "";
		String end = null;
		for (int i = 0; i < exp.size(); i++) {
			if (i == exp.size() - 1) {
				end = ")";
			} else {
				end = ") OR";
			}
			q += " (experience:" + exp.get(i) + end;
		}

		if (!edu.isEmpty()) {
			q += " OR ";
		}
		for (int i = 0; i < edu.size(); i++) {
			if (i == edu.size() - 1) {
				end = ")";
			} else {
				end = ") OR";
			}
			q += " (highestEducationLevel:" + edu.get(i) + end;
		}

		rdb.setSearchString(q);

		QueryOptions options = QueryOptions
				.newBuilder()
				.setLimit(4)
				.setFieldsToReturn("firstName", "lastName",
						"highestEducationLevel", "yearsOfExperience",
						"pictureUrl", "email").build();
		Query query = Query.newBuilder().setOptions(options).build(q);
		IndexSpec indexSpec = IndexSpec.newBuilder().setName("professionals")
				.build();
		Index index = SearchServiceFactory.getSearchService().getIndex(
				indexSpec);
		Results<ScoredDocument> result = index.search(query);
		List<ProView> pvs = new ArrayList<>();
		for (ScoredDocument sd : result) {
			ProView pv = new ProView();
			pv.setEmail(sd.getOnlyField("email").getAtom());
			pv.setFirstName(sd.getOnlyField("firstName").getText());
			pv.setLastName(sd.getOnlyField("lastName").getText());
			pv.setPictureUrl(sd.getOnlyField("pictureUrl").getAtom());
			pv.setYearsOfExperience(sd.getOnlyField("yearsOfExperience")
					.getAtom());
			pv.setHighestQualification(sd.getOnlyField("highestEducationLevel")
					.getText());

			pv.setWebkey(sd.getId());

			pvs.add(pv);
		}
		rdb.setProspects(pvs);
		return rdb;
	}

	private static List<Key> getApplicantsList(Map<String, Set<Key>> map) {
		List<Key> applicants = new ArrayList<>();
		Set<String> s = map.keySet();
		for (String st : s) {
			applicants.addAll(map.get(st));
		}
		return applicants;
	}

	private static Map<String, Set<Key>> getApplicants(List<Key> projects) {
		Map<String, Set<Key>> mp = new HashMap<String, Set<Key>>();
		if (projects == null) {
			return mp;
		} else {
			Map<Key, Entity> ents = GeneralController.findByKeys(projects);
			for (Key k : projects) {
				Set<Key> set = new HashSet<>();
				Project p = EntityConverter.entityToProject(ents.get(k));
				if (p.getJobs() != null) {
					Job j = EntityConverter.entityToJob(GeneralController
							.findByKey(p.getJobs()));
					List<Key> applicants = j.getNewApplicants();
					if (applicants != null) {
						set.addAll(applicants);
					}

					mp.put(p.getName(), set);
				}
			}
			return mp;
		}

	}

	public static List<ProjectBean> getProjectBeans(Map<Key, Entity> ents) {
		if (ents != null) {
			List<ProjectBean> ps = new ArrayList<>();
			Set<Key> projects = ents.keySet();
			for (Key k : projects) {
				ps.add(Util.toProjectBean(EntityConverter.entityToProject(ents
						.get(k))));
			}
			return ps;

		} else {
			return new ArrayList<ProjectBean>();
		}
	}

	public static ProjectBean toProjectBean(Project project) {
		ProjectBean pb = new ProjectBean();
		pb.setName(project.getName());
		pb.setDateCreated(project.getDateCreated());
		if (project.getDescription() != null) {
			pb.setDescription(project.getDescription().getValue());
		}
		if (project.getInvitees() != null) {
			pb.setInviteSent(project.getInvitees().size());
		}
		if (project.getNewApplicants() != null) {
			pb.setNewApplicants(project.getNewApplicants().size());
		}
		if (project.getApplicants() != null) {
			pb.setTotalApplicants(project.getApplicants().size());
		}
		
		if(project.getShortListedCandidates() != null) {
			pb.setShortListed(project.getShortListedCandidates().size());
		}
		
		if(project.getSavedSearch() != null) {
			pb.setSavedSearchNo(project.getSavedSearch().size());
		}

		pb.setWebKey(project.getSafeKey());
		if (project.getJobs() != null) {
			Job j = EntityConverter.entityToJob(GeneralController
					.findByKey(project.getJobs()));
			pb.setJobTitle(j.getJobTitle());
			pb.setExpiryDate(j.getClosingDate());
			if (j.getCompany() != null) {
				Company c = EntityConverter.entityToCompany(GeneralController
						.findByKey(j.getCompany()));
				if (c.getLogo() == null) {
					pb.setCompanyLogo(StringConstants.DEFAULT_COMPANY_LOGO);
				} else {
					pb.setCompanyLogo(Util.getPictureUrl(c.getLogo()));
				}
			}
		}
		return pb;
	}

	public static void sendApplicationEmails(User u, CandidateProfile cp,
			Job job, String applicationEmail, HttpServletRequest req)
			throws IOException {
		String partUrl = req.getScheme() + "://" + req.getServerName() + ":"
				+ req.getServerPort();
		try {
			sendRecruiterEmail(u, cp, job, applicationEmail, partUrl);
			sendApplicantsEmail(u, job);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static void sendRecruiterEmail(User u, CandidateProfile cp,
			Job job, String applicationEmail, String partUrl)
			throws IOException {
		String cvPath = partUrl + "/bq/open/get-cv?safe-key="
				+ cp.getCv().getKeyString();
		String body = "<body><div style='width: 40%; margin: 0 auto'>"
				+ "<img alt='Best Qualified' src='http://best-qualified.appspot.com/images/bq-logo.png'/>"
				+ "</div><div><h4 style='padding-bottom: 3%;'>Hello,</h4>"
				+ "<p>" + u.getFirstName() + " " + u.getLastName()
				+ "has shown interest in your job post titled "
				+ job.getJobTitle() + "has been sent.</p>"
				+ "<p>Download the attached CV <a target='_blank' href='"
				+ cvPath + "'>here</a>.</p>"
				+ "<p>Regards,</p><p>Best Qualified Admin</p></div></body>";
		try {
			sendEmail(Util.SERVICE_ACCOUNT, u.getEmail(), "Application for "
					+ job.getJobTitle(), body);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void sendRecruiterEmail1(User u, CandidateProfile cp,
			Job job, String applicationEmail, String partUrl)
			throws IOException {
		String body = "<body><div style='width: 40%; margin: 0 auto'>"
				+ "<img alt='Best Qualified' src='http://best-qualified.appspot.com/images/bq-logo.png'/>"
				+ "</div><div><h4 style='padding-bottom: 3%;'>Hello,</h4>"
				+ "<p>" + u.getFirstName() + " " + u.getLastName()
				+ "has shown interest in your job post titled "
				+ job.getJobTitle() + "has been sent.</p>"
				+ "<p>Kindly find attached the submited CV.</p>"
				+ "<p>Regards,</p><p>Best Qualified Admin</p></div></body>";
		URL url = new URL(partUrl + "/bq/close/serve-blob");
		HTTPResponse resp = URLFetchServiceFactory.getURLFetchService().fetch(
				url);
		byte[] content = resp.getContent();
		String fileName = u.getFirstName() + " " + u.getLastName();
		sendMailWithAttachment(Util.SERVICE_ACCOUNT, applicationEmail,
				"Application for " + job.getJobTitle(), body, content, fileName);
	}

	private static void sendMailWithAttachment(String from, String to,
			String title, String body, byte[] attachmentData, String fileName) {

		Multipart mp = new MimeMultipart();
		MimeBodyPart htmlPart = new MimeBodyPart();
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);
		try {
			htmlPart.setContent(body, "text/html");
			mp.addBodyPart(htmlPart);
			MimeBodyPart attachment = new MimeBodyPart();
			InputStream attachmentDataStream = new ByteArrayInputStream(
					attachmentData);
			attachment.setFileName(fileName);
			attachment.setContent(attachmentDataStream, "application/msword");
			mp.addBodyPart(attachment);

			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(Util.SERVICE_ACCOUNT,
					"Best Qualified Admin", "UTF-8"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(title);
			msg.setContent(mp);
			Transport.send(msg);
		} catch (MessagingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();

		}

	}

	private static void sendApplicantsEmail(User u, Job job)
			throws AddressException, MessagingException {
		String body = "<body><div style='width: 40%; margin: 0 auto'>"
				+ "<img alt='Best Qualified' src='http://best-qualified.appspot.com/images/bq-logo.png'/>"
				+ "</div><div><h4 style='padding-bottom: 3%;'>Hello "
				+ u.getFirstName() + ",</h4>"
				+ "<p>Your application for the job titled " + job.getJobTitle()
				+ "has been sent.</p>"
				+ "<p>You will be contacted by the recruiter shortly.</p>"
				+ "<p>Regards,</p><p>Best Qualified Admin</p></div></body>";
		sendEmail(Util.SERVICE_ACCOUNT, u.getEmail(),
				"Your Applicatio has been sent", body);

	}

	public static List<ProjectBean> toProjectBean1(List<Project> l1) {
		List<ProjectBean> pb1 = new ArrayList<>();
		for (Project p : l1) {
			ProjectBean pb = new ProjectBean();
			pb.setDateCreated(p.getDateCreated());
			pb.setDescription(p.getDescription().getValue());
			pb.setName(p.getName());
			if (p.getProfiles() == null) {
				// pb.setSavedProfile(0);
			} else {
				// pb.setSavedProfile(p.getProfiles().size());
			}
			if (p.getSavedSearch() == null) {
				// pb.setSavedSearch(0);
				;
			} else {
				// pb.setSavedSearch(p.getSavedSearch().size());
			}

			pb.setWebKey(p.getSafeKey());
			if (p.getJobs() != null) {
				Job j = Util.getJobFromCache(p.getJobs());

				if (j.getNewApplicants() == null) {
					pb.setNewApplicants(0);
					pb.setTotalApplicants(0);
				} else {
					pb.setNewApplicants(j.getNewApplicants().size());
					if (j.getApplicants() == null) {
						pb.setTotalApplicants(j.getNewApplicants().size() + 0);
					} else {
						pb.setTotalApplicants(j.getNewApplicants().size()
								+ j.getApplicants().size());
					}
				}
			}
			pb1.add(pb);
		}
		return pb1;
	}

	public static Job getJobFromCache(Key key) {

		Object o = MemcacheProvider.JOBS.get(key);
		Job job = null;
		if (o == null) {
			job = EntityConverter.entityToJob(GeneralController.findByKey(key));
			MemcacheProvider.JOBS.put(key, job);
		} else {
			job = (Job) o;
		}
		return job;
	}

	public static User getUserFromCache(Key key) {
		Object o = MemcacheProvider.USER.get(key);
		User u = null;
		if (o == null) {
			u = EntityConverter.entityToUser(GeneralController.findByKey(key));
			MemcacheProvider.JOBS.put(key, u);
		} else {
			u = (User) o;
		}
		return u;
	}

	public static CandidateProfile getProfessionalFromCache(User u, Key key) {
		Object o = MemcacheProvider.PROFESSIONAL.get(key);
		CandidateProfile cp = null;
		if (o == null) {
			cp = EntityConverter.entityToCandidateProfile(
					GeneralController.findByKey(key), u.getUserKey());
			MemcacheProvider.JOBS.put(key, u);
		} else {
			cp = (CandidateProfile) o;
		}
		return cp;
	}

	public static List<Community> getCommunityFromCache(List<Key> keys) {

		Map<Key, Object> map = MemcacheProvider.COMMUNITIES.getAll(keys);

		List<Community> obj = new ArrayList<>();
		List<Key> ki = new ArrayList<>();

		for (Key k : keys) {
			Object o = map.get(k);
			if (o != null) {
				obj.add((Community) o);
			} else {
				ki.add(k);
			}

		}

		if (!ki.isEmpty()) {
			Map<Key, Entity> entm = GeneralController.findByKeys(ki);
			for (Key key : ki) {
				Community c = EntityConverter.entityToCommunity(entm.get(key));
				obj.add(c);
				MemcacheProvider.COMMUNITIES.put(c.getId(), c);
			}
		}

		return obj;
	}

	public static List<com.bestqualified.entities.Article> getPostsFromCache(
			List<Key> keys) {

		Map<Key, Object> map = MemcacheProvider.ARTICLES.getAll(keys);

		List<com.bestqualified.entities.Article> obj = new ArrayList<>();
		List<Key> ki = new ArrayList<>();

		for (Key k : keys) {
			Object o = map.get(k);
			if (o != null) {
				obj.add((com.bestqualified.entities.Article) o);
			} else {
				ki.add(k);
			}

		}

		if (!ki.isEmpty()) {
			Map<Key, Entity> entm = GeneralController.findByKeys(ki);
			for (Key key : ki) {
				com.bestqualified.entities.Article c = EntityConverter
						.entityToArticle(entm.get(key));
				obj.add(c);
				MemcacheProvider.ARTICLES.put(c.getKey(), c);
			}
		}

		return obj;

	}

	public static ManageProjectBean getManageProjectBean(List<ProjectBean> l2) {
		ManageProjectBean mpb = new ManageProjectBean();
		for (ProjectBean pb1 : l2) {
			mpb.setNewApplicants(mpb.getNewApplicants()
					+ pb1.getNewApplicants());
			/*
			 * mpb.setSavedProfiles(mpb.getSavedProfiles() +
			 * pb1.getSavedProfile());
			 * mpb.setTotalApplicants(mpb.getTotalApplicants() +
			 * pb1.getTotalApplicants());
			 * mpb.setSavedSearch(mpb.getSavedSearch() + pb1.getSavedSearch());
			 */
		}
		mpb.setPb1(l2);
		return mpb;
	}

	public static List<AssessmentQuestion> getAssessmentQuestions(String level) {
		List<AssessmentQuestion> qs = new ArrayList<>();

		AssessmentQuestion a1 = new AssessmentQuestion();
		List<EmbeddedEntity> alts = new ArrayList<>();
		EmbeddedEntity ee1 = new EmbeddedEntity();
		ee1.setUnindexedProperty("correct", true);
		ee1.setUnindexedProperty("text", "Alhaji, Muhammed Buhari");
		EmbeddedEntity ee2 = new EmbeddedEntity();
		ee2.setUnindexedProperty("correct", false);
		ee2.setUnindexedProperty("text", "Gen. Sani Abacha");
		EmbeddedEntity ee3 = new EmbeddedEntity();
		ee3.setUnindexedProperty("correct", false);
		ee3.setUnindexedProperty("text", "Gen. Olusegun Obasanjo");
		EmbeddedEntity ee4 = new EmbeddedEntity();
		ee4.setUnindexedProperty("correct", false);
		ee4.setUnindexedProperty("text", "Alhaji Sheu Yarádua");
		EmbeddedEntity ee5 = new EmbeddedEntity();
		ee5.setUnindexedProperty("correct", false);
		ee5.setUnindexedProperty("text", "Bola Ahmed Tinibu (Jagaban)");
		alts.add(ee5);
		alts.add(ee4);
		alts.add(ee3);
		alts.add(ee2);
		alts.add(ee1);
		a1.setAlternatives(alts);
		a1.setBody(new Text("Who is the Current President of Nigeria?"));
		a1.setCategory(level);
		qs.add(a1);

		AssessmentQuestion a2 = new AssessmentQuestion();
		List<EmbeddedEntity> alts2 = new ArrayList<>();
		EmbeddedEntity ee11 = new EmbeddedEntity();
		ee11.setUnindexedProperty("correct", false);
		ee11.setUnindexedProperty("text", "Alhaji Tafawa Balewa");
		EmbeddedEntity ee21 = new EmbeddedEntity();
		ee21.setUnindexedProperty("correct", false);
		ee21.setUnindexedProperty("text", "Goodluck Johnathan");
		EmbeddedEntity ee31 = new EmbeddedEntity();
		ee31.setUnindexedProperty("correct", false);
		ee31.setUnindexedProperty("text", "Gen. Ibrahim Babangida");
		EmbeddedEntity ee41 = new EmbeddedEntity();
		ee41.setUnindexedProperty("correct", true);
		ee41.setUnindexedProperty("text", "Dr. Nnamdi Azikwe");
		EmbeddedEntity ee51 = new EmbeddedEntity();
		ee51.setUnindexedProperty("correct", false);
		ee51.setUnindexedProperty("text", "Bola Ahmed Tinubu (Jagaban)");
		alts2.add(ee51);
		alts2.add(ee41);
		alts2.add(ee31);
		alts2.add(ee21);
		alts2.add(ee11);
		a2.setAlternatives(alts2);
		a2.setBody(new Text("Who was the first president of Nigeria?"));
		a2.setCategory(level);
		qs.add(a2);

		AssessmentQuestion a3 = new AssessmentQuestion();
		List<EmbeddedEntity> alts3 = new ArrayList<>();
		EmbeddedEntity ee12 = new EmbeddedEntity();
		ee12.setUnindexedProperty("correct", false);
		ee12.setUnindexedProperty("text", "Moshood Abiola");
		EmbeddedEntity ee22 = new EmbeddedEntity();
		ee22.setUnindexedProperty("correct", true);
		ee22.setUnindexedProperty("text", "Gen. Ibrahim Gbadamosi Babangida");
		EmbeddedEntity ee32 = new EmbeddedEntity();
		ee32.setUnindexedProperty("correct", false);
		ee32.setUnindexedProperty("text", "Mr. Fela Anikulapo Kuti");
		EmbeddedEntity ee42 = new EmbeddedEntity();
		ee42.setUnindexedProperty("correct", false);
		ee42.setUnindexedProperty("text", "Gen. Olusegun Obasanjo");
		EmbeddedEntity ee52 = new EmbeddedEntity();
		ee52.setUnindexedProperty("correct", false);
		ee52.setUnindexedProperty("text", "Bola Ahmed Tinubu (Jagaban)");
		alts3.add(ee52);
		alts3.add(ee42);
		alts3.add(ee32);
		alts3.add(ee22);
		alts3.add(ee12);
		a3.setAlternatives(alts3);
		a3.setBody(new Text(
				"Who moved the Federal Capital of Nigeria from Lagos to Abuja?"));
		a3.setCategory(level);
		qs.add(a3);

		return qs;
		/*
		 * List<Entity> ents =
		 * GeneralController.getAssessmentQuestionsBylevel(level);
		 * List<AssessmentQuestion> qs = new ArrayList<>(); for(Entity e : ents)
		 * { qs.add(EntityConverter.entityToAssessmentQuestion(e)); } return qs;
		 */
	}

	public static Map<String, Object> toAssessmentQuestionBean(
	// ninth commit
			List<AssessmentQuestion> qs) {
		Map<String, Object> m = new HashMap<>();
		List<AssessmentQuestionBean> l = new ArrayList<>();
		List<CorrectionBean> l1 = new ArrayList<>();
		for (AssessmentQuestion aq : qs) {
			CorrectionBean cb = new CorrectionBean();
			AssessmentQuestionBean aqb = new AssessmentQuestionBean();
			aqb.setQuestion(aq.getBody().getValue());
			aqb.setWebkey(aq.getWebKey());
			cb.setWebkey(aq.getWebKey());
			// cb.setExplanation(aq.getExplanation().getValue());
			List<EmbeddedEntity> ees = aq.getAlternatives();
			Map<String, String> map = new HashMap<>();
			int i = 0;
			for (EmbeddedEntity ee : ees) {
				map.put(String.valueOf(i), (String) ee.getProperty("text"));

				Boolean b = (Boolean) ee.getProperty("correct");
				if (b) {
					cb.setAnswer(String.valueOf(i));
				}

				i++;

			}
			aqb.setCorrectAnswer("");
			aqb.setChoices(map);
			l.add(aqb);
			l1.add(cb);

		}
		m.put("q", l);
		m.put("c", l1);
		return m;
	}

	public static List<CorrectionBean> toCorrectionBean(String answers) {
		JsonParser jsonParser = new JsonParser();

		JsonArray jsonArr = (JsonArray) jsonParser.parse(answers);
		;
		Gson googleJson = new Gson();
		Type listType = new TypeToken<List<AssessmentQuestionBean>>() {
		}.getType();
		ArrayList<AssessmentQuestionBean> jsonObjList = googleJson.fromJson(
				jsonArr, listType);
		return assessmentQuestionToCorrectionBean(jsonObjList);
	}

	private static List<CorrectionBean> assessmentQuestionToCorrectionBean(
			ArrayList<AssessmentQuestionBean> jsonObjList) {
		List<CorrectionBean> cbs = new ArrayList<>();
		for (AssessmentQuestionBean aqb : jsonObjList) {
			CorrectionBean cb = new CorrectionBean();
			cb.setWebkey(aqb.getWebkey());
			cb.setAnswer(aqb.getCorrectAnswer());
			cbs.add(cb);
		}
		return cbs;
	}

	public static int markAssessment(List<CorrectionBean> cb,
			List<CorrectionBean> userAns) {
		int score = 0;
		for (CorrectionBean ctb : cb) {
			String key = ctb.getWebkey();
			for (CorrectionBean ctb2 : userAns) {
				if (ctb2.getWebkey().equalsIgnoreCase(key)
						&& ctb2.getAnswer().equalsIgnoreCase(ctb.getAnswer())) {
					score++;
					break;
				}
			}
		}
		return score;
	}

	public static double getRating(int score, int total) {
		return Math.round(score * 5 / total);
	}

	public static List<InterestedJob> getRelatedJobs(Job job) {
		String jobType = job.getJobType();
		String salaryRange = job.getSalaryRange();
		String jobCategory = job.getJobCategory();
		String careerLevel = job.getCareerLevel();
		String experience = job.getExperience();
		String location = job.getLocation();

		String qStr = "";
		if (Util.notNull(location)) {
			// qStr += " OR";
			qStr += "location:" + location;
		}
		/*
		 * if (Util.notNull(jobType)) { qStr += "jobType:" + jobType; }
		 * 
		 * if (Util.notNull(salaryRange)) {
		 * 
		 * qStr += " salaryRange:" + salaryRange; }
		 * 
		 * if (Util.notNull(jobCategory)) {
		 * 
		 * qStr += " jobCategory:" + jobCategory; }
		 * 
		 * if (Util.notNull(careerLevel)) {
		 * 
		 * qStr += " careerLevel:" + careerLevel; }
		 * 
		 * if (Util.notNull(experience)) {
		 * 
		 * qStr += " experience:" + experience; }
		 */

		SortOptions sortOptions = SortOptions
				.newBuilder()
				.addSortExpression(
						SortExpression
								.newBuilder()
								.setExpression("datePosted")
								.setDirection(
										SortExpression.SortDirection.DESCENDING))
				.build();
		QueryOptions options = QueryOptions
				.newBuilder()
				.setLimit(5)
				.setFieldsToReturn("jobTitle", "companyName", "location",
						"datePosted").setSortOptions(sortOptions).build();
		Query query = Query.newBuilder().setOptions(options).build(qStr);
		IndexSpec indexSpec = IndexSpec.newBuilder().setName("jobs").build();
		Index index = SearchServiceFactory.getSearchService().getIndex(
				indexSpec);
		Results<ScoredDocument> result = index.search(query);
		List<InterestedJob> ijs = new ArrayList<>();
		for (ScoredDocument sd : result) {
			if (KeyFactory.keyToString(job.getId()).equals(sd.getId())) {
				continue;
			}
			InterestedJob ij = new InterestedJob();
			ij.setCompanyName(sd.getOnlyField("companyName").getText());
			ij.setJobKey(sd.getId());
			Iterable<Field> itr = sd.getFields("jobTitle");
			for (Field f : itr) {
				ij.setJobTitle(f.getAtom());
				break;
			}

			ij.setPictureUrl(StringConstants.DEFAULT_COMPANY_LOGO);
			ij.setPostedTime(Util.getPostedTime(sd.getOnlyField("datePosted")
					.getDate()));
			ij.setLocation(sd.getOnlyField("location").getAtom());
			ijs.add(ij);
		}

		return ijs;
	}

	public static String getJobTypeValue(String code) {
		String value = "";
		switch (code) {
		case "301":
			value = StringConstants.JOBTYPE_301;
			break;
		case "302":
			value = StringConstants.JOBTYPE_302;
			break;
		case "303":
			value = StringConstants.JOBTYPE_303;
			break;
		case "304":
			value = StringConstants.JOBTYPE_304;
			break;
		case "305":
			value = StringConstants.JOBTYPE_305;
			break;
		case "306":
			value = StringConstants.JOBTYPE_306;
			break;
		}
		return value;
	}

	public static String getCareerLevelValue(String code) {
		String value = "";
		switch (code) {
		case "101":
			value = StringConstants.CAREER_LEVEL_101;
			break;
		case "102":
			value = StringConstants.CAREER_LEVEL_102;
			break;
		case "103":
			value = StringConstants.CAREER_LEVEL_103;
			break;
		case "104":
			value = StringConstants.CAREER_LEVEL_104;
			break;
		case "105":
			value = StringConstants.CAREER_LEVEL_105;
			break;
		case "106":
			value = StringConstants.CAREER_LEVEL_106;
			break;
		}
		return value;
	}

	public static String getEducationLevelValue(String code) {
		String value = "";
		switch (code) {
		case "501":
			value = StringConstants.EDUCATION_LEVEL_501;
			break;
		case "502":
			value = StringConstants.EDUCATION_LEVEL_502;
			break;
		case "503":
			value = StringConstants.EDUCATION_LEVEL_503;
			break;
		case "504":
			value = StringConstants.EDUCATION_LEVEL_504;
			break;
		case "505":
			value = StringConstants.EDUCATION_LEVEL_505;
			break;
		case "506":
			value = StringConstants.EDUCATION_LEVEL_506;
			break;
		}
		return value;
	}

	public static String getExperienceValue(String code) {
		String value = "";
		switch (code) {
		case "401":
			value = StringConstants.EXPERIENCE_401;
			break;
		case "402":
			value = StringConstants.EXPERIENCE_402;
			break;
		case "403":
			value = StringConstants.EXPERIENCE_403;
			break;
		case "404":
			value = StringConstants.EXPERIENCE_404;
			break;
		case "405":
			value = StringConstants.EXPERIENCE_405;
			break;
		case "406":
			value = StringConstants.EXPERIENCE_406;
			break;
		case "407":
			value = StringConstants.EXPERIENCE_407;
			break;
		case "408":
			value = StringConstants.EXPERIENCE_408;
			break;
		}
		return value;
	}

	public static String getSalaryValue(String code) {
		String value = "";
		switch (code) {
		case "201":
			value = StringConstants.SALARY_201;
			break;
		case "202":
			value = StringConstants.SALARY_202;
			break;
		case "203":
			value = StringConstants.SALARY_203;
			break;
		case "204":
			value = StringConstants.SALARY_204;
			break;
		case "205":
			value = StringConstants.SALARY_205;
			break;
		}
		return value;
	}

	public static String getJobCategoryValue(String code) {
		String value = "";
		switch (code) {
		case "85":
			value = StringConstants.JOB_CATEGORY_85;
			break;
		case "84":
			value = StringConstants.JOB_CATEGORY_84;
			break;
		case "54":
			value = StringConstants.JOB_CATEGORY_54;
			break;
		case "83":
			value = StringConstants.JOB_CATEGORY_83;
			break;
		case "53":
			value = StringConstants.JOB_CATEGORY_53;
			break;
		case "107":
			value = StringConstants.JOB_CATEGORY_107;
			break;
		case "72":
			value = StringConstants.JOB_CATEGORY_72;
			break;
		case "50":
			value = StringConstants.JOB_CATEGORY_50;
			break;
		case "82":
			value = StringConstants.JOB_CATEGORY_82;
			break;
		case "76":
			value = StringConstants.JOB_CATEGORY_76;
			break;
		case "56":
			value = StringConstants.JOB_CATEGORY_56;
			break;
		case "79":
			value = StringConstants.JOB_CATEGORY_79;
			break;
		case "66":
			value = StringConstants.JOB_CATEGORY_66;
			break;
		case "59":
			value = StringConstants.JOB_CATEGORY_59;
			break;
		case "60":
			value = StringConstants.JOB_CATEGORY_60;
			break;
		case "61":
			value = StringConstants.JOB_CATEGORY_61;
			break;
		case "67":
			value = StringConstants.JOB_CATEGORY_67;
			break;
		case "101":
			value = StringConstants.JOB_CATEGORY_76;
			break;
		case "58":
			value = StringConstants.JOB_CATEGORY_58;
			break;
		case "51":
			value = StringConstants.JOB_CATEGORY_51;
			break;
		case "81":
			value = StringConstants.JOB_CATEGORY_81;
			break;
		case "68":
			value = StringConstants.JOB_CATEGORY_68;
			break;
		case "74":
			value = StringConstants.JOB_CATEGORY_74;
			break;
		case "105":
			value = StringConstants.JOB_CATEGORY_105;
			break;
		case "70":
			value = StringConstants.JOB_CATEGORY_70;
			break;
		case "103":
			value = StringConstants.JOB_CATEGORY_103;
			break;
		case "71":
			value = StringConstants.JOB_CATEGORY_71;
			break;
		case "106":
			value = StringConstants.JOB_CATEGORY_106;
			break;
		case "77":
			value = StringConstants.JOB_CATEGORY_77;
			break;
		case "104":
			value = StringConstants.JOB_CATEGORY_104;
			break;

		}
		return value;
	}

	public static LinkedInAccessTokenResponse toLinkedInAccessToken(
			String respString) {
		respString = respString.replace("{", "").replace("}", "")
				.replace("\"", "");
		String[] str = respString.split(",");
		LinkedInAccessTokenResponse latr = new LinkedInAccessTokenResponse();
		for (String s : str) {
			String[] ss = s.split(":");
			if (ss[0].equalsIgnoreCase("access_token")) {
				if (ss.length > 1) {
					latr.setAccessToken(ss[1]);
				}

			} else if (ss[0].equalsIgnoreCase("expires_in")) {
				if (ss.length > 1) {
					latr.setExpires(ss[1]);
				}

			}

		}
		return latr;
	}

	public static SocialUser toLinkedInSocialUser(String respString) {
		SocialUser su = new SocialUser();
		su.setNetwork(SocialNetwork.LINKEDIN);
		respString = respString.replace("{", "").replace("}", "")
				.replace("\"", "");
		String[] str = respString.split(",");
		for (String s : str) {
			String[] ss = s.split(":");
			if (ss[0].trim().equalsIgnoreCase("emailAddress")) {
				if (ss.length > 1) {
					su.setEmail(ss[1].trim());
				}

			} else if (ss[0].trim().equalsIgnoreCase("firstName")) {
				if (ss.length > 1) {
					su.setFirstName(ss[1]);
				}

			} else if (ss[0].trim().equalsIgnoreCase("headline")) {
				if (ss.length > 1) {
					su.setHeadline(ss[1]);
				}

			} else if (ss[0].trim().equalsIgnoreCase("id")) {
				if (ss.length > 1) {
					su.setId(ss[1].trim());
				}

			} else if (ss[0].trim().equalsIgnoreCase("lastName")) {
				if (ss.length > 1) {
					su.setLastName(ss[1]);
				}

			} else if (ss[0].trim().equalsIgnoreCase("pictureUrl")) {
				if (ss.length > 1) {
					su.setPictureUrl(ss[1] + ":" + ss[2]);
				}

			}

		}
		return su;
	}

	public static List<Article> toArticleBeans(
			List<com.bestqualified.entities.Article> articles, Object o1) {
		User user = null;
		if (o1 != null && o1 instanceof User) {
			user = (User) o1;
		}
		List<Article> aas = new ArrayList<>();
		for (com.bestqualified.entities.Article art : articles) {
			Article a = new Article();
			User u = EntityConverter.entityToUser(GeneralController
					.findByKey(art.getAuthor()));

			a.setAuthor(u.getFirstName() + " " + u.getLastName());
			a.setTitle(art.getTitle());
			if (art.getBody() != null
					&& art.getBody().getValue().length() > 401) {
				String str = art.getBody().getValue();
				int end = str.indexOf(" ", 300);
				a.setSnippet(str.substring(0, end));
				a.setRemainingSnippet(str.substring(end));

			} else {
				a.setSnippet(art.getBody().getValue());
			}

			a.setBody(art.getBody().getValue());
			if (art.getLikers() != null) {
				a.setLikes(art.getLikers().size());
			}
			List<Key> cKeys = art.getComments();
			List<commentBean> commBeans = new ArrayList<>();

			if (cKeys != null) {
				Map<Key, Entity> map = GeneralController.findByKeys(cKeys);
				commentBean cb = null;
				for (Map.Entry<Key, Entity> entry : map.entrySet()) {
					cb = Util.toCommentBean(entry.getValue());
					commBeans.add(cb);
				}
			}

			a.setComments(commBeans);

			a.setShares(art.getShares());
			if (art.getImageKey() != null) {
				ImagesService imagesService = ImagesServiceFactory
						.getImagesService();
				ServingUrlOptions options = ServingUrlOptions.Builder
						.withBlobKey(art.getImageKey()).imageSize(500);
				String servingUrl = imagesService.getServingUrl(options);
				a.setPictureUrl(servingUrl);

			}
			a.setPostDate(new SimpleDateFormat("dd MMMM yyyy").format(art
					.getDate()));
			a.setWebkey(KeyFactory.keyToString(art.getKey()));
			if (user != null) {
				List<Key> keys = art.getLikers();

				if (keys != null && keys.contains(user.getUserKey())) {
					a.setLiked(true);
				}
			}
			aas.add(a);
		}

		return aas;
	}

	private static commentBean toCommentBean(Entity entity) {
		Comment c = EntityConverter.entityToComment(entity);
		Key author = c.getAuthor();
		Entity e = GeneralController.findByKey(author);
		if (e != null) {
			User u = EntityConverter.entityToUser(e);
			commentBean cb = new commentBean();
			cb.setAuthorImg(u.getPictureUrl());
			cb.setAuthorName(u.getFirstName() + " " + u.getLastName());
			cb.setComment(c.getBody().getValue());
			cb.setTime(new SimpleDateFormat("dd MMMM yyyy").format(c.getDate()));
			return cb;
		}

		return null;
	}

	public static List<CommunityBean> toCommunityBeans(
			List<Community> community, User u) {
		List<CommunityBean> cobean = new ArrayList<>();
		for (Community com : community) {
			CommunityBean cb = new CommunityBean();
			if (u != null && com.getMembers() != null
					&& com.getMembers().contains(u.getUserKey())) {
				cb.setMember(true);
			}
			cb.setName(com.getName());
			cb.setShortDesc(com.getShortDesc().getValue());
			cb.setLongDesc(com.getLongDesc().getValue());
			cb.setCurrentDate(new SimpleDateFormat("dd MMMM yyyy").format(com
					.getDateCreated()));
			if (com.getMembers() != null) {
				cb.setMembers(com.getMembers().size());
			}

			ImagesService imagesService = ImagesServiceFactory
					.getImagesService();
			ServingUrlOptions options = ServingUrlOptions.Builder
					.withBlobKey(com.getImage());
			ServingUrlOptions options1 = ServingUrlOptions.Builder
					.withBlobKey(com.getWallpaper());
			String servingUrl = imagesService.getServingUrl(options);
			String servingUrlWall = imagesService.getServingUrl(options1);
			cb.setWallpaper(servingUrlWall);
			cb.setImage(servingUrl);
			cb.setWebSafeKey(KeyFactory.keyToString(com.getId()));
			cobean.add(cb);
		}

		return cobean;
	}

	public static Recruiter mergeRecruiters(Recruiter r, Recruiter orr) {
		if (r.getCompany() != null) {
			orr.setCompany(r.getCompany());
		}
		if (r.getJobs() != null) {
			if (orr.getJobs() == null) {
				orr.setJobs(new ArrayList<Key>());
			}
			orr.getJobs().addAll(r.getJobs());
		}
		if (r.getProjects() != null) {
			if (orr.getProjects() == null) {
				orr.setProjects(new ArrayList<Key>());
			}
			orr.getProjects().addAll(r.getProjects());
		}
		return orr;
	}

	public static String getBookCategory(String nodeId) {
		String s = null;
		switch (nodeId) {
		case "2698":
			s = "All Categories";
			break;
		case "2699":
			s = "Advertising";
			break;
		case "2700":
			s = "Consumer Behavoir";
			break;
		case "2653":
			s = "Customer Service";
			break;
		case "2702":
			s = "Marketing";
			break;
		case "2711":
			s = "Public Relation";
			break;
		case "2712":
			s = "Sales & Selling";
			break;
		case "6133991011":
			s = "Search Engine Optimization";

		}

		return s;

	}

	public static String computeWebpayHash(String txnRef, String redirectUrl,
			long price) {
		String str = txnRef + INTERSWITCH_PRODUCT_ID + INTERSWITCH_PAY_ITEM_ID
				+ price + redirectUrl + INTERSWITCH_MAC;
		return toSHA512(str).toUpperCase();
	}

	public static String getInterswitchHash(String txnRef) {
		String str = INTERSWITCH_PRODUCT_ID + txnRef + INTERSWITCH_MAC;
		return Util.toSHA512(str).toUpperCase();
	}

	public static Map<String, String> getCommunityMap(List<Community> comm) {
		// TODO Auto-generated method stub

		Map<String, String> map = new HashMap<>();

		for (Community community : comm) {

			String key = KeyFactory.keyToString(community.getId());
			String name = community.getName();
			map.put(key, name);

		}

		return map;

	}

	public static ProjectBean toFullProjectBean(Project project) {
		ProjectBean pb = new ProjectBean();
		pb.setName(project.getName());
		pb.setDateCreated(project.getDateCreated());
		if (project.getDescription() != null) {
			pb.setDescription(project.getDescription().getValue());
		}

		if (project.getInvitees() != null) {
			pb.setInviteSent(project.getInvitees().size());
		}
		if (project.getNewApplicants() != null) {
			pb.setNewApplicants(project.getNewApplicants().size());
		}
		if (project.getApplicants() != null) {
			pb.setTotalApplicants(project.getApplicants().size());
		}

		if (project.getShortListedCandidates() != null) {
			pb.setShortListed(project.getShortListedCandidates().size());
		}
		pb.setWebKey(project.getSafeKey());
		if (project.getJobs() != null) {
			Job j = EntityConverter.entityToJob(GeneralController
					.findByKey(project.getJobs()));
			FullJobBean fjb = toFullJobBean(j);
			pb.setExpiryDate(j.getClosingDate());
			pb.setJob(fjb);
			if (j.getCompany() != null) {
				Company c = EntityConverter.entityToCompany(GeneralController
						.findByKey(j.getCompany()));
				if (c.getLogo() == null) {
					pb.setCompanyLogo(StringConstants.DEFAULT_COMPANY_LOGO);
				} else {
					pb.setCompanyLogo(Util.getPictureUrl(c.getLogo()));
				}

				pb.setCompanyDesc((c.getDescription() != null) ? c
						.getDescription().getValue() : "");

				pb.setCompanyName(c.getCompanyName());
				pb.setCompanyWebsite(c.getCompanyWebsite());

			}
		}
		return pb;

	}

	public static FullJobBean toFullJobBean(Job j) {
		FullJobBean fjb = new FullJobBean();
		fjb.setApplicationDeadline(new SimpleDateFormat("MM/dd/YYYY").format(j
				.getClosingDate()));

		fjb.setApplyWithLinkedIn(j.isAllowLinkedInApplication());
		fjb.setCareerLevel(Util.getCareerLevelValue(j.getCareerLevel()));
		fjb.setEducationLevel(Util.getEducationLevelValue(j.getEducationLevel()));
		fjb.setJobDesc(j.getDescription().getValue());
		fjb.setJobRole(j.getJobRoles().getValue());
		fjb.setJobType(getJobTypeValue(j.getJobType()));
		fjb.setLocation(j.getLocation());
		fjb.setSalaryRange(getSalaryValue(j.getSalaryRange()));
		fjb.setSkills("");
		fjb.setApplicationUrl(j.getApplicationUrl());
		fjb.setTitle(j.getJobTitle());
		fjb.setYearsOfExperience(Util.getExperienceValue(j.getExperience()));

		return fjb;
	}

	public static ProView toProView(Key k) {
		Entity e = GeneralController.findByKey(k);
		ProView pv = null;
		if(e!=null) {
			User u = EntityConverter.entityToUser(e);
			pv = new ProView();
			pv.setEmail(u.getEmail());
			pv.setFirstName(u.getFirstName());
			pv.setLastName(u.getLastName());
			pv.setPictureUrl(u.getPictureUrl());
			pv.setWebkey(KeyFactory.keyToString(u.getUserKey()));
			CandidateProfile cp = EntityConverter.entityToCandidateProfile(GeneralController.findByKey(u.getUserKey()), u.getUserKey());
			pv.setHighestQualification(cp.getHighestEducationLevel());
			pv.setYearsOfExperience(cp.getYearsOfExperience());
		}
		return pv;
	}

}
