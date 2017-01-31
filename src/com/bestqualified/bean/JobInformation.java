package com.bestqualified.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.bestqualified.util.Util;

public class JobInformation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -960578853660814642L;

	private String jobTitle, companyName, datePosted, jobDesc,  experience,
			pictureUrl, companyDesc, careerLevel, location,jobType, pageUrl,
			qualification, deadline, companyWebsite, applicationWebsite, applicationUrl, webKey, salaryRange, jobRole;
	private Date closeDate;
	private boolean saved;
	
	
	public String getJobRole() {
		return jobRole;
	}
	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}
	public Date getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}
	public boolean isSaved() {
		return saved;
	}
	public void setSaved(boolean saved) {
		this.saved = saved;
	}
	public String getPageUrl() {
		return pageUrl;
	}
	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}
	private List<InterestedJob> relatedJobs;
	
	
	public String getWebKey() {
		return webKey;
	}
	public void setWebKey(String webKey) {
		this.webKey = webKey;
	}
	public String getApplicationUrl() {
		return applicationUrl;
	}
	public void setApplicationUrl(String applicationUrl) {
		this.applicationUrl = applicationUrl;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = Util.getExperienceValue(experience);
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getDatePosted() {
		return datePosted;
	}
	public void setDatePosted(String datePosted) {
		this.datePosted = datePosted;
	}
	public String getJobDesc() {
		return jobDesc;
	}
	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}
	
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getCompanyDesc() {
		return companyDesc;
	}
	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}
	public String getCareerLevel() {
		return careerLevel;
	}
	public void setCareerLevel(String careerLevel) {
		this.careerLevel = Util.getCareerLevelValue(careerLevel);
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = Util.getJobTypeValue(jobType);
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = Util.getEducationLevelValue(qualification);
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getCompanyWebsite() {
		return companyWebsite;
	}
	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}
	public String getApplicationWebsite() {
		return applicationWebsite;
	}
	public void setApplicationWebsite(String applicationWebsite) {
		this.applicationWebsite = applicationWebsite;
	}
	public List<InterestedJob> getRelatedJobs() {
		return relatedJobs;
	}
	public void setRelatedJobs(List<InterestedJob> relatedJobs) {
		this.relatedJobs = relatedJobs;
	}
	public String getSalaryRange() {
		return salaryRange;
	}
	public void setSalaryRange(String salaryRange) {
		this.salaryRange = Util.getSalaryValue(salaryRange);
	}
	

}
