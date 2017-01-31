package com.bestqualified.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.bestqualified.entities.Article;
import com.bestqualified.entities.ArticleCategory;
import com.bestqualified.entities.AssessmentQuestion;
import com.bestqualified.entities.Award;
import com.bestqualified.entities.CandidateProfile;
import com.bestqualified.entities.CareerLevel;
import com.bestqualified.entities.Certification;
import com.bestqualified.entities.CoachRequest;
import com.bestqualified.entities.Comment;
import com.bestqualified.entities.Community;
import com.bestqualified.entities.Company;
import com.bestqualified.entities.Education;
import com.bestqualified.entities.EducationLevel;
import com.bestqualified.entities.Job;
import com.bestqualified.entities.JobAlert;
import com.bestqualified.entities.JobCategory;
import com.bestqualified.entities.JobRegion;
import com.bestqualified.entities.Project;
import com.bestqualified.entities.ProjectLog;
import com.bestqualified.entities.ReadingList;
import com.bestqualified.entities.Recruiter;
import com.bestqualified.entities.SavedSearch;
import com.bestqualified.entities.Topic;
import com.bestqualified.entities.User;
import com.bestqualified.entities.WorkExperience;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.EmbeddedEntity;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Link;
import com.google.appengine.api.datastore.Text;

public class EntityConverter {
	
	public static Entity CoachRequestToEntity(CoachRequest cr) {
		Entity e = new Entity(cr.getId());
		e.setIndexedProperty("date", cr.getDate());
		e.setIndexedProperty("email", cr.getEmail());
		e.setIndexedProperty("phone", cr.getPhone());
		e.setUnindexedProperty("body",cr.getBody());
		e.setIndexedProperty("type", cr.getType());
		e.setIndexedProperty("paid", cr.isPaid());
		e.setIndexedProperty("txnRef", cr.getTxnRef());
		e.setIndexedProperty("userKey", cr.getUserKey());
		e.setUnindexedProperty("firstName", cr.getFirstName());
		e.setUnindexedProperty("lastName", cr.getLastName());
		return e;
		
	}
	
	public static CoachRequest entityToCoachRequest(Entity e) {
		CoachRequest cr = new CoachRequest();
		cr.setUserKey((Key) e.getProperty("userKey"));
		cr.setTxnRef((String) e.getProperty("txnRef"));
		cr.setBody((Text) e.getProperty("body"));
		cr.setDate((Date) e.getProperty("date"));
		cr.setEmail((String) e.getProperty("email"));
		cr.setId(e.getKey());
		cr.setPaid((boolean) e.getProperty("paid"));
		cr.setPhone((String) e.getProperty("phone"));
		cr.setType((String) e.getProperty("type"));
		cr.setFirstName((String) e.getProperty("firstName"));
		cr.setLastName((String) e.getProperty("lastName"));
		return cr;
	}
	
	public static Entity SavedSearchToEntity(SavedSearch ss) {
		Entity e = new Entity(ss.getId());
		e.setIndexedProperty("dateCreated", ss.getDateCreated());
		e.setUnindexedProperty("name", ss.getName());
		e.setUnindexedProperty("searchString", ss.getSearchString());
		return e;
	}
	
	public static SavedSearch entityToSavedSearch(Entity e) {
		SavedSearch ss = new SavedSearch();
		ss.setId(e.getKey());
		ss.setDateCreated((Date) e.getProperty("dateCreated"));
		ss.setName((String) e.getProperty("name"));
		ss.setSearchString((String) e.getProperty("searchString"));
		return ss;
	}

	public static ProjectLog entityToProjectLog(Entity e) {
		ProjectLog p = new ProjectLog();
		p.setId(e.getKey());
		p.setActivity(ProjectLog.Activity.valueOf((String) e
				.getProperty("activity")));
		p.setComment((Text) e.getProperty("comment"));
		p.setDate((Date) e.getProperty("date"));
		return p;
	}

	public static Entity projectLogToEntity(ProjectLog p) {
		Entity e = new Entity(p.getId());
		e.setIndexedProperty("date", p.getDate());
		e.setUnindexedProperty("activity", p.getActivity().name());
		e.setUnindexedProperty("comment", p.getComment());
		return e;
	}

	public static ReadingList entityToReadingList(Entity e) {
		ReadingList rl = new ReadingList();
		rl.setId(e.getKey());
		rl.setDate((Date) e.getProperty("date"));
		rl.setBookTitle((String) e.getProperty("bookTitle"));
		rl.setPublisher((String) e.getProperty("publisher"));
		rl.setAuthor((String) e.getProperty("author"));
		rl.setDescription((Text) e.getProperty("description"));
		rl.setLink((String) e.getProperty("link"));
		rl.setImageKey((BlobKey) e.getProperty("imageKey"));
		return rl;

	}

	public static Entity ReadingListToEntity(ReadingList rl) {
		Entity e = new Entity(rl.getId());
		e.setIndexedProperty("date", rl.getDate());
		e.setUnindexedProperty("bookTitle", rl.getBookTitle());
		e.setIndexedProperty("author", rl.getAuthor());
		e.setUnindexedProperty("description", rl.getDescription());
		e.setUnindexedProperty("imageKey", rl.getImageKey());
		e.setUnindexedProperty("publisher", rl.getPublisher());
		e.setUnindexedProperty("link", rl.getLink());
		return e;
	}

	public static Comment entityToComment(Entity e) {
		Comment c = new Comment();
		c.setKey(e.getKey());
		c.setAuthor((Key) e.getProperty("author"));
		c.setBody((Text) e.getProperty("body"));
		c.setDate((Date) e.getProperty("date"));
		c.setComments((List<Key>) e.getProperty("comment"));
		c.setParent((Key) e.getProperty("parent"));
		return c;
	}
	
	
	public static Topic entityToTopic(Entity e) {
		Topic t = new Topic();
		t.setId(e.getKey());
		t.setDateCreated((Date) e.getProperty("date"));
		t.setTitle((String) e.getProperty("title"));
		t.setPosts((List<Key>) e.getProperty("posts"));
		return t;
		
		
	}
	
	public static Entity topicToEntity(Topic t) {
		Entity e = new Entity(t.getId());
		e.setIndexedProperty("title", t.getTitle());
		e.setIndexedProperty("date", t.getDateCreated());
		e.setUnindexedProperty("posts", t.getPosts());
		return e;
	}
	public static Community entityToCommunity(Entity e) {
		Community comm = new Community();
		comm.setId(e.getKey());
		comm.setCommPublic((boolean) e.getProperty("commPublic"));
		comm.setDateCreated((Date) e.getProperty("date"));
		comm.setImage((BlobKey) e.getProperty("image"));
		comm.setLongDesc((Text) e.getProperty("longDesc"));
		comm.setShortDesc((Text) e.getProperty("shortDesc"));
		comm.setMembers((List<Key>) e.getProperty("members"));
		comm.setName((String) e.getProperty("name"));
		comm.setOwner((Key) e.getProperty("owner"));
		comm.setTopics((List<Key>) e.getProperty("topics"));
		comm.setWallpaper((BlobKey) e.getProperty("wallpaper"));
		comm.setPosts((List<Key>) e.getProperty("posts"));
		return comm;
		
	}
	
	public static Entity communityToEntity(Community c) {
		Entity e = new Entity(c.getId());
		e.setIndexedProperty("name", c.getName());
		e.setIndexedProperty("date", c.getDateCreated());
		e.setUnindexedProperty("image", c.getImage());
		e.setUnindexedProperty("longDesc", c.getLongDesc());
		e.setUnindexedProperty("members", c.getMembers());
		e.setUnindexedProperty("owner", c.getOwner());
		e.setUnindexedProperty("shortDesc", c.getShortDesc());
		e.setUnindexedProperty("topics", c.getTopics());
		e.setUnindexedProperty("wallpaper", c.getWallpaper());
		e.setUnindexedProperty("commPublic", c.isCommPublic());
		e.setUnindexedProperty("posts", c.getPosts());
		return e;
	}

	public static Article entityToArticle(Entity e) {
		Article a = new Article();
		a.setKey(e.getKey());
		a.setAuthor((Key) e.getProperty("author"));
		a.setBody((Text) e.getProperty("body"));
		a.setComments((List<Key>) e.getProperty("comments"));
		a.setDate((Date) e.getProperty("date"));
		a.setSubscribers((List<Key>) e.getProperty("subscribers"));
		a.setTag((List<String>) e.getProperty("tag"));
		a.setTitle((String) e.getProperty("title"));
		a.setViews((Long) e.getProperty("views"));
		a.setImageKey((BlobKey) e.getProperty("imageKey"));
		a.setLink((Link) e.getProperty("link"));
		a.setCategory(ArticleCategory.valueOf((String) e.getProperty("category")));
		a.setLikers((List<Key>) e.getProperty("likers"));
		Object o = e.getProperty("nComments");
	
		Object s = e.getProperty("shares");
		a.setCommunity((Key) e.getProperty("community"));

		if(o != null) {

			   a.setnComments((Long)e.getProperty("nComments"));
			  }

		return a;
	}

	public static Entity ArticleToEntity(Article a) {
		Entity e = new Entity(a.getKey());
		e.setIndexedProperty("title", a.getTitle());
		e.setIndexedProperty("date", a.getDate());
		e.setUnindexedProperty("views", a.getViews());
		e.setUnindexedProperty("body", a.getBody());
		e.setIndexedProperty("author", a.getAuthor());
		e.setIndexedProperty("category", a.getCategory().name());
		e.setUnindexedProperty("comments", a.getComments());
		e.setUnindexedProperty("subscribers", a.getSubscribers());
		e.setUnindexedProperty("tags", a.getTag());
		e.setUnindexedProperty("imageKey", a.getImageKey());
		e.setUnindexedProperty("link", a.getLink());
		e.setIndexedProperty("nComment", a.getnComments());
		e.setIndexedProperty("likers", a.getLikers());
		e.setIndexedProperty("shares", a.getShares());
		e.setIndexedProperty("community", a.getCommunity());
		return e;
	}

	public static Entity commentToEntity(Comment c) {
		Entity e = new Entity(c.getKey());
		e.setUnindexedProperty("author", c.getAuthor());
		e.setIndexedProperty("date", c.getDate());
		e.setUnindexedProperty("comments", c.getComments());
		e.setUnindexedProperty("body", c.getBody());
		e.setIndexedProperty("parent", c.getParent());
		return e;
	}

	public static Entity JobAlertToEntity(JobAlert ja) {
		Entity e = new Entity(ja.getId());
		e.setIndexedProperty("careerLevel", ja.getCareerLevel());
		e.setIndexedProperty("jobType", ja.getJobType());
		e.setIndexedProperty("location", ja.getLocation());
		e.setIndexedProperty("salary", ja.getSalary());
		e.setUnindexedProperty("email", ja.getEmail());
		return e;
	}

	public static JobAlert entityToJobAlert(Entity e) {
		JobAlert ja = new JobAlert();
		ja.setId(e.getKey());
		ja.setCareerLevel((String) e.getProperty("careerLevel"));
		ja.setEmail((String) e.getProperty("email"));
		ja.setJobType((String) e.getProperty("jobType"));
		ja.setLocation((String) e.getProperty("location"));
		ja.setSalary((String) e.getProperty("salary"));
		return ja;
	}

	public static Entity awardToEntity(Award a) {
		Entity ent = new Entity(a.getId());
		ent.setUnindexedProperty("month", a.getMonth());
		ent.setUnindexedProperty("year", a.getYear());
		ent.setUnindexedProperty(StringConstants.DESCRIPTION,
				a.getDescription());
		ent.setUnindexedProperty(StringConstants.NAME, a.getName());
		return ent;
	}

	public static Award entityToAward(Entity e) {
		if(e==null){
			return null;
		}
		else{
		Award a = new Award();
		a.setMonth((String) e.getProperty("month"));
		a.setYear((String) e.getProperty("year"));
		a.setDescription((String) e.getProperty(StringConstants.DESCRIPTION));
		a.setId(e.getKey());
		a.setName((String) e.getProperty(StringConstants.NAME));
		return a;
		}
	}

	public static Entity careerLevelToEntity(CareerLevel cl) {
		Entity e = new Entity(CareerLevel.class.getSimpleName());
		e.setUnindexedProperty(StringConstants.NAME, cl.getName());
		return e;

	}

	public static CareerLevel entityToCareerLevel(Entity e) {
		CareerLevel cl = new CareerLevel();
		cl.setId(e.getKey());
		cl.setName((String) e.getProperty(StringConstants.NAME));
		return cl;
	}

	public static Entity certificationToEntity(Certification c) {
		//Entity e = new Entity(Certification.class.getSimpleName());
		Entity e = new Entity(c.getId());
		e.setUnindexedProperty(StringConstants.NAME, c.getName());
		e.setUnindexedProperty("month", c.getMonth());
		e.setUnindexedProperty("year", c.getYear());
	
		return e;
	}

	public static Certification entityToCertification(Entity e) {
		Certification c = new Certification();
		c.setId(e.getKey());
		c.setMonth((String) e.getProperty("month"));
		c.setYear((String) e.getProperty("year"));
		
		c.setName((String) e.getProperty(StringConstants.NAME));
		return c;

	}

	public static Entity companyToEntity(Company c) {
		Entity e = null;
		if (c.getId() == null) {
			e = new Entity(Company.class.getSimpleName());
		} else {
			e = new Entity(c.getId());
		}
		e.setUnindexedProperty("companyName", c.getCompanyName());
		e.setIndexedProperty("companyWebsite", c.getCompanyWebsite());
		e.setUnindexedProperty(StringConstants.INDUSTRIES, c.getIndustries());
		e.setUnindexedProperty(StringConstants.LOCATION, c.getLocation());
		e.setUnindexedProperty(StringConstants.ADDRESS, c.getAddress());
		e.setUnindexedProperty(StringConstants.LINKEDIN_PAGE, c.getLinkedIn());
		e.setUnindexedProperty(StringConstants.FACEBOOK_PAGE, c.getFacebook());
		e.setUnindexedProperty(StringConstants.TWITTER_PAGE, c.getTwitter());
		e.setUnindexedProperty(StringConstants.GOOGLE_PAGE, c.getGooglePlus());
		e.setUnindexedProperty(StringConstants.DESCRIPTION, c.getDescription());
		e.setUnindexedProperty(StringConstants.TAGLINE, c.getTagline());
		e.setUnindexedProperty(StringConstants.RECRUITERS, c.getRecruiter());
		e.setUnindexedProperty("logo", c.getLogo());
		return e;
	}

	public static Company entityToCompany(Entity e) {

		if (e == null) {
			return null;
		}
		Company c = new Company();
		c.setId(e.getKey());
		c.setAddress((String) e.getProperty(StringConstants.ADDRESS));
		c.setCompanyName((String) e.getProperty("companyName"));
		c.setCompanyWebsite((String) e
				.getProperty(StringConstants.COMPANY_WEBSITE));
		c.setDescription((Text) e.getProperty(StringConstants.DESCRIPTION));
		c.setFacebook((String) e.getProperty(StringConstants.FACEBOOK_PAGE));
		c.setGooglePlus((String) e.getProperty(StringConstants.GOOGLE_PAGE));
		c.setIndustries((List<Key>) e.getProperty(StringConstants.INDUSTRIES));
		c.setLinkedIn((String) e.getProperty(StringConstants.LINKEDIN_PAGE));
		c.setLocation((String) e.getProperty(StringConstants.LOCATION));
		c.setRecruiter((List<Key>) e.getProperty(StringConstants.RECRUITERS));
		c.setTagline((String) e.getProperty(StringConstants.TAGLINE));
		c.setTwitter((String) e.getProperty(StringConstants.TWITTER_PAGE));
		c.setLogo((BlobKey) e.getProperty("logo"));
		return c;
	}

	public static Entity educationToEntity(Education edu) {
		Entity e = new Entity(edu.getId());
		e.setUnindexedProperty(StringConstants.INSTITUITION,
				edu.getInstitution());
		e.setUnindexedProperty(StringConstants.COURSE, edu.getCourse());
		e.setUnindexedProperty("startMonth", edu.getStartMonth());
		e.setUnindexedProperty("startYear", edu.getStartYear());
		e.setUnindexedProperty("endMonth", edu.getEndMonth());
		e.setUnindexedProperty("endYear", edu.getEndYear());
		e.setUnindexedProperty(StringConstants.COUNTRY, edu.getCountry());
		e.setUnindexedProperty(StringConstants.QUALIFICATION,
				edu.getQualification());
		e.setUnindexedProperty(StringConstants.CLASSIFICATION,
				edu.getClassification());
		return e;
	}

	public static Education entityToEducation(Entity e) {
		Education edu = new Education();
		if (e == null) {
			return edu;
		}
		edu.setId(e.getKey());
		edu.setClassification((String) e
				.getProperty(StringConstants.CLASSIFICATION));
		edu.setCourse((String) e.getProperty(StringConstants.COURSE));
		edu.setInstitution((String) e.getProperty(StringConstants.INSTITUITION));
		edu.setQualification((String) e
				.getProperty(StringConstants.QUALIFICATION));
		edu.setEndMonth((String) e.getProperty("endMonth"));
		edu.setEndYear((String) e.getProperty("endYear"));
		edu.setStartMonth((String) e.getProperty("startMonth"));
		edu.setStartYear((String) e.getProperty("startYear"));
		return edu;
	}

	public static EducationLevel entityToEducationLevel(Entity e) {
		EducationLevel el = new EducationLevel();
		el.setId(e.getKey());
		el.setAbbr((String) e.getProperty(StringConstants.ABBR));
		el.setName((String) e.getProperty(StringConstants.NAME));
		return el;
	}

	public static Entity educationLevelToEntity(EducationLevel el) {
		Entity e = new Entity(EducationLevel.class.getSimpleName());
		e.setUnindexedProperty(StringConstants.NAME, el.getName());
		e.setUnindexedProperty(StringConstants.ABBR, el.getAbbr());
		return e;
	}

	public static Entity jobToEntity(Job j) {
		Entity e = new Entity(j.getId());

		e.setIndexedProperty(StringConstants.CLOSING_DATE, j.getClosingDate());
		e.setIndexedProperty(StringConstants.CAREER_LEVEL, j.getCareerLevel());
		e.setIndexedProperty(StringConstants.LOCATION, j.getLocation());
		e.setIndexedProperty(StringConstants.EDUCATION_LEVEL,
				j.getEducationLevel());
		e.setIndexedProperty(StringConstants.JOB_TYPE, j.getJobType());
		e.setIndexedProperty(StringConstants.EMPLOYER, j.getEmployer());
		e.setIndexedProperty(StringConstants.JOB_TITLE, j.getJobTitle());
		e.setUnindexedProperty(StringConstants.SALARY_CURRENCY,
				j.getSalaryCurrency());
		e.setUnindexedProperty(StringConstants.ALLOW_LINKEDIN_APPLICATION,
				j.isAllowLinkedInApplication());
		e.setUnindexedProperty(StringConstants.ALLOW_FACEBOOK_APPLICATION,
				j.isAllowFacebookApplication());
		e.setUnindexedProperty(StringConstants.POSITION_FILLED,
				j.isPositionFilled());
		e.setIndexedProperty(StringConstants.JOB_CATEGORY, j.getJobCategory());
		e.setUnindexedProperty(StringConstants.APPLICANTS, j.getApplicants());
		e.setIndexedProperty(StringConstants.DATE_POSTED, j.getDatePosted());
		e.setUnindexedProperty(StringConstants.DESCRIPTION, j.getDescription());
		e.setUnindexedProperty("jobRoles", j.getJobRoles());
		e.setUnindexedProperty("skills", j.getSkills());
		e.setUnindexedProperty(StringConstants.CUSTOM_ATTRIBUTES,
				j.getCustomAttributes());
		e.setProperty(StringConstants.SALARY_RANGE, j.getSalaryRange());
		e.setProperty(StringConstants.EXPERIENCE, j.getExperience());
		e.setUnindexedProperty(StringConstants.APPLICATION_URL,
				j.getApplicationUrl());
		e.setUnindexedProperty(StringConstants.COMPANY, j.getCompany());
		e.setProperty("viewers", j.getViewers());
		e.setUnindexedProperty("newApplicants", j.getNewApplicants());
		return e;

	}

	@SuppressWarnings("unchecked")
	public static Job entityToJob(Entity e) {
		Job j = new Job();
		j.setId(e.getKey());
		j.setViewers((List<Key>) e.getProperty("viewers"));
		j.setClosingDate((Date) e.getProperty(StringConstants.CLOSING_DATE));
		j.setCareerLevel((String) e.getProperty(StringConstants.CAREER_LEVEL));
		j.setLocation((String) e.getProperty(StringConstants.LOCATION));
		j.setEducationLevel((String) e
				.getProperty(StringConstants.EDUCATION_LEVEL));
		j.setJobType((String) e.getProperty(StringConstants.JOB_TYPE));
		j.setEmployer((Key) e.getProperty(StringConstants.EMPLOYER));
		j.setJobTitle((String) e.getProperty(StringConstants.JOB_TITLE));
		j.setSalaryCurrency((String) e
				.getProperty(StringConstants.SALARY_CURRENCY));
		j.setAllowFacebookApplication((boolean) e
				.getProperty(StringConstants.ALLOW_FACEBOOK_APPLICATION));
		j.setAllowLinkedInApplication((boolean) e
				.getProperty(StringConstants.ALLOW_LINKEDIN_APPLICATION));
		j.setPositionFilled((boolean) e
				.getProperty(StringConstants.POSITION_FILLED));
		//j.setJobCategory((String) e.getProperty(StringConstants.JOB_CATEGORY));
		j.setApplicants((List<Key>) e.getProperty(StringConstants.APPLICANTS));
		j.setDatePosted((Date) e.getProperty(StringConstants.DATE_POSTED));
		j.setDescription((Text) e.getProperty(StringConstants.DESCRIPTION));
		j.setJobRoles((Text) e.getProperty("jobRoles"));
		j.setSkills((List<String>) e.getProperty("skills"));
		j.setCustomAttributes((Text) e
				.getProperty(StringConstants.CUSTOM_ATTRIBUTES));
		j.setExperience((String) e.getProperty(StringConstants.EXPERIENCE));
		j.setApplicationUrl((String) e
				.getProperty(StringConstants.APPLICATION_URL));
		j.setCompany((Key) e.getProperty(StringConstants.COMPANY));
		j.setNewApplicants((List<Key>) e.getProperty("newApplicants"));
		j.setSalaryRange((String) e.getProperty("salaryRange"));
		return j;
	}

	public static Entity JobCategoryToEntity(JobCategory jc) {
		Entity e = new Entity(JobCategory.class.getSimpleName());
		e.setUnindexedProperty(StringConstants.NAME, jc.getName());
		return e;
	}

	public static JobCategory entityToJobCategory(Entity e) {
		JobCategory jc = new JobCategory();
		jc.setId(e.getKey());
		jc.setName((String) e.getProperty(StringConstants.NAME));
		return jc;
	}

	public static JobRegion entityToJobRegion(Entity e) {
		JobRegion jr = new JobRegion();
		jr.setCountry((String) e.getProperty(StringConstants.COUNTRY));
		jr.setId(e.getKey());
		jr.setState((String) e.getProperty(StringConstants.STATE));
		return jr;
	}

	public static Entity jobRegionToEntity(JobRegion jr) {
		Entity e = new Entity(JobRegion.class.getSimpleName());
		e.setUnindexedProperty(StringConstants.STATE, jr.getState());
		e.setUnindexedProperty(StringConstants.COUNTRY, jr.getCountry());
		return e;
	}

	public static Entity recruiterToEntity(Recruiter r) {
		Entity e = new Entity(r.getId());

		e.setIndexedProperty("userKey", r.getUserKey());
		e.setUnindexedProperty(StringConstants.COMPANY, r.getCompany());
		e.setUnindexedProperty(StringConstants.JOBS,
				new ArrayList<Key>(r.getJobs()));
		e.setUnindexedProperty("projects", r.getProjects());
		e.setUnindexedProperty("connections", r.getConnections());
		return e;
	}

	public static Recruiter entityToRecruiter(Entity e) {
		Recruiter r = new Recruiter();
		r.setId(e.getKey());
		r.setUserKey((Key) e.getProperty("userKey"));
		r.setCompany((Key) e.getProperty(StringConstants.COMPANY));
		r.setProjects((List<Key>) e.getProperty("projects"));
		r.setConnections((List<Key>) e.getProperty("connections"));
		return r;
	}

	public static Entity candidateProfileToEntity(CandidateProfile cp) {
		Entity e = new Entity(cp.getId());
		e.setIndexedProperty("candidateID", cp.getCandidateId());
		e.setIndexedProperty("careerLevel", cp.getCareerLevel());
		e.setIndexedProperty("currentCountry", cp.getCurrentCountry());
		e.setIndexedProperty("currentState", cp.getCurrentState());
		e.setUnindexedProperty("profileViewers", cp.getProfileViewers());
		e.setUnindexedProperty("jobsApplied", cp.getJobsApplied());
		e.setUnindexedProperty("currentEmployer", cp.getCurrentEmployer());
		e.setUnindexedProperty("cvDownloaders", cp.getCvDownloaders());
		e.setUnindexedProperty("workExperience", cp.getWorkExperience());
		e.setUnindexedProperty("education", cp.getEducation());
		e.setUnindexedProperty("awards", cp.getAwards());
		e.setUnindexedProperty("certifications", cp.getCertifications());
		e.setUnindexedProperty("yearsOfExperience", cp.getYearsOfExperience());
		e.setUnindexedProperty("highestEducationLevel",
				cp.getHighestEducationLevel());
		e.setUnindexedProperty("jobType", cp.getJobType());
		e.setUnindexedProperty("profileDescription", cp.getProfileDescription());
		e.setUnindexedProperty("nationality", cp.getNationality());
		e.setUnindexedProperty("lga", cp.getLga());
		e.setUnindexedProperty("stateOfOrigin", cp.getStateOfOrigin());
		e.setUnindexedProperty("pictures", cp.getPictures());
		e.setUnindexedProperty("connections", cp.getConnections());
		e.setUnindexedProperty("cv", cp.getCv());
		e.setUnindexedProperty("jobAlerts", cp.getJobAlerts());
		e.setUnindexedProperty("savedJobs", cp.getSavedJobs());
		e.setUnindexedProperty("articles", cp.getArticles());
		e.setUnindexedProperty("salaryRange", cp.getSalaryRange());
		return e;
	}

	public static CandidateProfile entityToCandidateProfile(Entity e,
			Key userKey) {
		CandidateProfile cp = new CandidateProfile(userKey);
		cp.setAwards((List<Key>) e.getProperty("awards"));
		cp.setCareerLevel((String) e.getProperty("careerLevel"));
		cp.setYearsOfExperience((String) e.getProperty("yearsOfExperience"));
		cp.setHighestEducationLevel((String) e
				.getProperty("highestEducationLevel"));
		cp.setJobType((String) e.getProperty("jobType"));
		cp.setCertifications((List<Key>) e.getProperty("certifications"));
		cp.setCurrentEmployer((String) e.getProperty("currentEmployer"));
		cp.setCurrentCountry((String) e.getProperty("currentCountry"));
		cp.setCurrentState((String) e.getProperty("currentState"));
		cp.setCvDownloaders((Set<Key>) e.getProperty("cvDownloaders"));
		cp.setEducation((List<Key>) e.getProperty("education"));
		cp.setId(e.getKey());
		List<Key> l = (List<Key>) e.getProperty("jobsApplied");
		Set<Key> s1 = new HashSet<Key>();
		if (l != null) {
			s1.addAll(l);
		}
		cp.setJobsApplied(s1);
		cp.setLga((String) e.getProperty("lga"));
		cp.setNationality((String) e.getProperty("nationality"));
		cp.setPictures((List<BlobKey>) e.getProperty("pictures"));
		cp.setProfileDescription((Text) e.getProperty("profileDescription"));
		cp.setStateOfOrigin((String) e.getProperty("stateOfOrigin"));
		cp.setWorkExperience((List<Key>) e.getProperty("workExperience"));
		cp.setConnections((List<Key>) e.getProperty("connections"));
		cp.setCv((BlobKey) e.getProperty("cv"));
		cp.setSavedJobs((List<Key>) e.getProperty("savedJobs"));
		cp.setJobAlerts((List<Key>) e.getProperty("jobAlerts"));
		cp.setArticles((List<Key>) e.getProperty("articles"));
		cp.setSalaryRange((String) e.getProperty("salaryRange"));
		return cp;
	}

	public static Entity userToEntity(User user) {
		Entity e = new Entity(user.getUserKey());
		e.setUnindexedProperty("coachRequest", user.getCoachRequest());
		e.setIndexedProperty("email", user.getEmail());
		e.setIndexedProperty("phone", user.getPhone());
		e.setIndexedProperty("password", user.getPassword());
		e.setUnindexedProperty("firstName", user.getFirstName());
		e.setUnindexedProperty("lastName", user.getLastName());
		e.setIndexedProperty("userType", user.getUserType());
		e.setUnindexedProperty("joinedDate", user.getJoinedDate());
		e.setUnindexedProperty("verified", user.isVerified());
		e.setUnindexedProperty("userInfo", user.getUserInfo());
		e.setIndexedProperty("birthDate", user.getBirthDate());
		e.setIndexedProperty("emails", user.getEmails());
		e.setIndexedProperty("facebookID", user.getFacebookID());
		e.setIndexedProperty("googleID", user.getGoogleID());
		e.setIndexedProperty("linkedInID", user.getLinkedInID());
		e.setIndexedProperty("twitterID", user.getTwitterID());
		e.setUnindexedProperty("gender", user.getGender());
		e.setUnindexedProperty("profilePicture", user.getProfilePicture());
		e.setUnindexedProperty("tagline", user.getTagline());
		e.setIndexedProperty("professionalLevel", user.getProfessionalLevel());
		e.setIndexedProperty("rating", user.getRating());
		e.setUnindexedProperty("communities", user.getCommunities());
		return e;
	}

	public static User entityToUser(Entity e) {
		User u = new User((String) (e.getProperty(StringConstants.FIRST_NAME)),
				(String) e.getProperty(StringConstants.LAST_NAME));
		u.setBirthDate((Date) e.getProperty("birthDate"));
		u.setCommunities((List<Key>) e.getProperty("communities"));
		u.setEmail((String) e.getProperty(StringConstants.EMAIL));
		u.setEmails((List<String>) e.getProperty(StringConstants.EMAILS));
		u.setFacebookID((String) e.getProperty(StringConstants.FACEBOOK_ID));
		u.setFirstName((String) e.getProperty(StringConstants.FIRST_NAME));
		u.setGender((String) e.getProperty(StringConstants.GENDER));
		u.setGoogleID((String) e.getProperty(StringConstants.GOOGLE_ID));
		u.setJoinedDate((Date) e.getProperty("joinedDate"));
		u.setLastName((String) e.getProperty(StringConstants.LAST_NAME));
		u.setLinkedInID((String) e.getProperty(StringConstants.LINKEDIN_ID));
		u.setPassword((String) e.getProperty(StringConstants.PASSWORD));
		u.setPhone((String) e.getProperty(StringConstants.PHONE));
		u.setProfilePicture((BlobKey) e
				.getProperty(StringConstants.PROFILE_PICTURE));
		u.setTwitterID((String) e.getProperty(StringConstants.TWITTER_ID));
		u.setUserInfo((Key) e.getProperty("userInfo"));
		u.setUserKey(e.getKey());
		u.setUserType((String) e.getProperty("userType"));
		u.setVerified((boolean) e.getProperty("verified"));
		u.setTagline((String) e.getProperty("tagline"));
		u.setProfessionalLevel((String) e.getProperty("professionalLevel"));
		u.setRating((Double) e.getProperty("rating"));
		u.setCoachRequest((List<Key>) e.getProperty("coachRequest"));
		return u;
	}

	public static WorkExperience entityToWorkExperience(Entity e) {
		WorkExperience we = new WorkExperience();
		if (e == null) {
			return we;
		}
		we.setId(e.getKey());
		we.setEndMonth((String) e.getProperty("endMonth"));
		we.setEndYear((String) e.getProperty("endYear"));
		we.setCompany((String) e.getProperty("company"));
		we.setPosition((String) e.getProperty("position"));
		we.setStartMonth((String) e.getProperty("startMonth"));
		we.setStartYear((String) e.getProperty("startYear"));
		return we;
	}

	public static Entity workExperienceToEntity(WorkExperience we) {
		Entity e = new Entity(we.getId());
		e.setUnindexedProperty("company", we.getCompany());
		e.setUnindexedProperty("endMonth", we.getEndMonth());
		e.setUnindexedProperty("endYear", we.getEndYear());
		e.setUnindexedProperty("jobDuties", we.getJobDuties());
		e.setUnindexedProperty("position", we.getPosition());
		e.setUnindexedProperty("startMonth", we.getStartMonth());
		e.setUnindexedProperty("startYear", we.getStartYear());
		return e;
	}

	public static Project entityToProject(Entity entity) {
		Project p = new Project();
		p.setId(entity.getKey());
		p.setDateCreated((Date) entity.getProperty("dateCreated"));
		p.setJobs((Key) entity.getProperty("job"));
		p.setName((String) entity.getProperty("name"));
		p.setProfiles((List<Key>) entity.getProperty("profile"));
		p.setSavedSearch((List<Key>) entity.getProperty("savedSearch"));
		if (entity.getProperty("description") != null) {
			p.setDescription((Text) entity.getProperty("description"));
		}
		p.setApplicants((List<Key>) entity.getProperty("applicants"));
		p.setSearchConditions((List<EmbeddedEntity>) entity
				.getProperty("searchConditions"));
		p.setShortListedCandidates((List<Key>) entity
				.getProperty("shortListedCandidates"));
		p.setInvitees((List<Key>) entity.getProperty("invitees"));
		p.setLogs((List<Key>) entity.getProperty("logs"));
		p.setInterviewDate((Date) entity.getProperty("interviewDate"));
		p.setNewApplicants((List<Key>) entity.getProperty("newApplicants"));

		return p;
	}

	public static Entity projectToEntity(Project p) {
		Entity e = new Entity(p.getId());
		e.setUnindexedProperty("job", p.getJobs());
		e.setUnindexedProperty("name", p.getName());
		e.setUnindexedProperty("profile", p.getProfiles());
		e.setUnindexedProperty("savedSearch", p.getSavedSearch());
		e.setUnindexedProperty("description", p.getDescription());
		e.setIndexedProperty("dateCreated", p.getDateCreated());
		e.setUnindexedProperty("shortListedCandidates",
				p.getShortListedCandidates());
		e.setUnindexedProperty("searchConditions", p.getSearchConditions());
		e.setUnindexedProperty("interviewDate", p.getInterviewDate());
		e.setUnindexedProperty("invitees", p.getInvitees());
		e.setUnindexedProperty("logs", p.getLogs());
		e.setUnindexedProperty("applicants", p.getApplicants());
		e.setUnindexedProperty("newApplicants", p.getApplicants());
		return e;
	}

	public static AssessmentQuestion entityToAssessmentQuestion(Entity e) {
		AssessmentQuestion aq = new AssessmentQuestion();
		aq.setId(e.getKey());
		aq.setAlternatives((List<EmbeddedEntity>) e.getProperty("alternatives"));
		aq.setBody((Text) e.getProperty("body"));
		aq.setCategory((String) e.getProperty("category"));
		aq.setExplanation((Text) e.getProperty("explanation"));
		return aq;
	}

	public static Entity AssessmentQuestionToEntity(AssessmentQuestion aq) {
		Entity e = new Entity(aq.getId());
		e.setIndexedProperty("category", aq.getCategory());
		e.setUnindexedProperty("alternatives", aq.getAlternatives());
		e.setUnindexedProperty("explanation", aq.getExplanation());
		e.setUnindexedProperty("body", aq.getBody());
		return e;
	}

}
