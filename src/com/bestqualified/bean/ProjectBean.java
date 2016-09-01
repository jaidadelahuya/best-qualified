package com.bestqualified.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.bestqualified.entities.SavedSearch;

public class ProjectBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7574324814935282277L;

	private String webKey, name, description, 
			jobTitle, companyLogo, companyName, companyWebsite, companyDesc, hotListCategory;
	private int newApplicants, totalApplicants, inviteSent, shortListed,
			savedSearchNo;
	private List<ProView> hotList, shortlistedCandidates, applicants;
	private FullJobBean job;
	private List<SavedSearch> savedsearch;
	private Date dateCreated, expiryDate;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((webKey == null) ? 0 : webKey.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProjectBean other = (ProjectBean) obj;
		if (webKey == null) {
			if (other.webKey != null)
				return false;
		} else if (!webKey.equals(other.webKey))
			return false;
		return true;
	}
	
	

	public List<ProView> getApplicants() {
		return applicants;
	}

	public void setApplicants(List<ProView> applicants) {
		this.applicants = applicants;
	}

	public List<ProView> getShortlistedCandidates() {
		return shortlistedCandidates;
	}

	public void setShortlistedCandidates(List<ProView> shortlistedCandidates) {
		this.shortlistedCandidates = shortlistedCandidates;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyWebsite() {
		return companyWebsite;
	}

	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}

	public String getCompanyDesc() {
		return companyDesc;
	}

	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}

	public int getSavedSearchNo() {
		return savedSearchNo;
	}

	public void setSavedSearchNo(int savedSearchNo) {
		this.savedSearchNo = savedSearchNo;
	}

	public int getShortListed() {
		return shortListed;
	}

	public void setShortListed(int shortListed) {
		this.shortListed = shortListed;
	}



	public FullJobBean getJob() {
		return job;
	}

	public void setJob(FullJobBean job) {
		this.job = job;
	}

	public List<SavedSearch> getSavedsearch() {
		return savedsearch;
	}

	public void setSavedsearch(List<SavedSearch> savedsearch) {
		this.savedsearch = savedsearch;
	}

	public String getHotListCategory() {
		return hotListCategory;
	}

	public void setHotListCategory(String hotListCategory) {
		this.hotListCategory = hotListCategory;
	}

	public List<ProView> getHotList() {
		return hotList;
	}

	public void setHotList(List<ProView> hotList) {
		this.hotList = hotList;
	}

	public String getWebKey() {
		return webKey;
	}

	public void setWebKey(String webKey) {
		this.webKey = webKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getNewApplicants() {
		return newApplicants;
	}

	public void setNewApplicants(int newApplicants) {
		this.newApplicants = newApplicants;
	}

	public int getTotalApplicants() {
		return totalApplicants;
	}

	public void setTotalApplicants(int totalApplicants) {
		this.totalApplicants = totalApplicants;
	}

	public int getInviteSent() {
		return inviteSent;
	}

	public void setInviteSent(int inviteSent) {
		this.inviteSent = inviteSent;
	}

	

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getCompanyLogo() {
		return companyLogo;
	}

	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}

	@Override
	public String toString() {
		return "ProjectBean [webKey=" + webKey + ", name=" + name
				+ ", dateCreated=" + dateCreated + ", description="
				+ description + ", expiryDate=" + expiryDate + ", jobTitle="
				+ jobTitle + ", companyLogo=" + companyLogo
				+ ", newApplicants=" + newApplicants + ", totalApplicants="
				+ totalApplicants + ", inviteSent=" + inviteSent + "]";
	}

}
