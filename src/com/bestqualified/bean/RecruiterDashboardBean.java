package com.bestqualified.bean;

import java.io.Serializable;
import java.util.List;

import com.bestqualified.entities.SavedSearch;

public class RecruiterDashboardBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8867290829150190112L;
	
	private String name,imageUrl,tagLine,email;
	private List<ProView> prospects, hotList;
	private List<ProjectBean> projects;
	private List<SavedSearch> savedSearch;
	private String cursor, searchString, hotListCategory;
	private boolean moreCandidates;
	private long totalCandidates;

	
	
	
	public List<ProView> getHotList() {
		return hotList;
	}



	public void setHotList(List<ProView> hotList) {
		this.hotList = hotList;
	}



	public String getHotListCategory() {
		return hotListCategory;
	}



	public void setHotListCategory(String hotListCategory) {
		this.hotListCategory = hotListCategory;
	}



	public long getTotalCandidates() {
		return totalCandidates;
	}



	public void setTotalCandidates(long totalCandidates) {
		this.totalCandidates = totalCandidates;
	}



	public boolean isMoreCandidates() {
		return moreCandidates;
	}



	public void setMoreCandidates(boolean moreCandidates) {
		this.moreCandidates = moreCandidates;
	}



	@Override
	public String toString() {
		return "RecruiterDashboardBean [name=" + name + ", imageUrl="
				+ imageUrl + ", tagLine=" + tagLine + ", email=" + email
				+ ", prospects=" + prospects + ", projects=" + projects
				+ ", savedSearch=" + savedSearch + ", cursor=" + cursor
				+ ", searchString=" + searchString + "]";
	}

	

	public String getCursor() {
		return cursor;
	}


	public void setCursor(String cursor) {
		this.cursor = cursor;
	}


	public String getSearchString() {
		return searchString;
	}


	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}


	public List<SavedSearch> getSavedSearch() {
		return savedSearch;
	}


	public void setSavedSearch(List<SavedSearch> savedSearch) {
		this.savedSearch = savedSearch;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getTagLine() {
		return tagLine;
	}
	public void setTagLine(String tagLine) {
		this.tagLine = tagLine;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public List<ProjectBean> getProjects() {
		return projects;
	}
	public void setProjects(List<ProjectBean> projects) {
		this.projects = projects;
	}
	public List<ProView> getProspects() {
		return prospects;
	}
	public void setProspects(List<ProView> prospects) {
		this.prospects = prospects;
	}
	
	

}
