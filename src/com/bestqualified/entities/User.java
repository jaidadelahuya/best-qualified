package com.bestqualified.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bestqualified.controllers.GeneralController;
import com.bestqualified.util.Util;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class User implements Serializable {

	public enum UserType {
		PROFESSIONAL, RECRUITER, SUPER_ADMIN,AUTHOR, ADMIN, COACH;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 9151470313661979608L;
	private String firstName, lastName, email, phone, password, userType,
			facebookID, linkedInID, googleID, twitterID, gender, tagline,
			pictureUrl, professionalLevel;
	private Date joinedDate, birthDate;
	private boolean verified, authenticated;
	private Key userInfo;
	private Key userKey;
	private BlobKey profilePicture;
	private List<String> emails;
	private List<Key> coachRequest;
	private double rating;
	private List<Key> communities;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userKey == null) ? 0 : userKey.hashCode());
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
		User other = (User) obj;
		if (userKey == null) {
			if (other.userKey != null)
				return false;
		} else if (!userKey.equals(other.userKey))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName
				+ ", email=" + email + ", phone=" + phone + ", password="
				+ password + ", userType=" + userType + ", facebookID="
				+ facebookID + ", linkedInID=" + linkedInID + ", googleID="
				+ googleID + ", twitterID=" + twitterID + ", gender=" + gender
				+ ", joinedDate=" + joinedDate + ", birthDate=" + birthDate
				+ ", verified=" + verified + ", userInfo=" + userInfo
				+ ", userKey=" + userKey + ", emails=" + emails + "]";
	}
	
	
	

	public List<Key> getCommunities() {
		return communities;
	}

	public void setCommunities(List<Key> communities) {
		this.communities = communities;
	}

	public String getProfessionalLevel() {
		return professionalLevel;
	}

	public void setProfessionalLevel(String professionalLevel) {
		this.professionalLevel = professionalLevel;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getTagline() {
		return tagline;
	}

	public void setTagline(String tagline) {
		this.tagline = tagline;
	}

	public String getFacebookID() {
		return facebookID;
	}

	public boolean isAuthenticated() {
		return authenticated;
	}

	public void setAuthenticated(boolean authenticated) {
		this.authenticated = authenticated;
	}

	public void setFacebookID(String facebookID) {
		this.facebookID = facebookID;
	}

	public String getLinkedInID() {
		return linkedInID;
	}

	public void setLinkedInID(String linkedInID) {
		this.linkedInID = linkedInID;
	}

	public String getGoogleID() {
		return googleID;
	}

	public void setGoogleID(String googleID) {
		this.googleID = googleID;
	}

	public String getTwitterID() {
		return twitterID;
	}

	public void setTwitterID(String twitterID) {
		this.twitterID = twitterID;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public List<String> getEmails() {
		return emails;
	}

	public void setEmails(List<String> emails) {
		this.emails = emails;
	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}

	public Key getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(Key userInfo) {
		this.userInfo = userInfo;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getJoinedDate() {
		return joinedDate;
	}

	public void setJoinedDate(Date joinedDate) {
		this.joinedDate = joinedDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Key getUserKey() {
		return userKey;
	}

	public void setUserKey(Key userKey) {
		this.userKey = userKey;
	}

	public User(String firstName, String lastName) {
		String sid = getID(firstName, lastName);
		while (GeneralController.userIdExist(sid)) {
			sid = getID(firstName, lastName).toUpperCase();
		}
		userKey = KeyFactory.createKey(User.class.getSimpleName(), sid);
		this.emails = new ArrayList<>();
		this.setFirstName(firstName);
		this.setLastName(lastName);
	}

	private String getID(String firstName, String lastName) {
		return firstName.substring(0, 2) + lastName.substring(0, 2)
				+ Util.generateRandomCode(111111111, 999999999).toUpperCase();
	}

	public BlobKey getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(BlobKey profilePicture) {
		this.profilePicture = profilePicture;
		this.setPictureUrl(Util.getPictureUrl(profilePicture));

	}

	public List<Key> getCoachRequest() {
		return coachRequest;
	}

	public void setCoachRequest(List<Key> coachRequest) {
		this.coachRequest = coachRequest;
	}

}
