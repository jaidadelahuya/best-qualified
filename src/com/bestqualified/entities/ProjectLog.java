package com.bestqualified.entities;

import java.io.Serializable;
import java.util.Date;

import com.bestqualified.controllers.GeneralController;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Text;

public class ProjectLog implements Serializable {

	public enum Activity {
			CREATE,CLOSE,INVITE,SAVE_SEARH,SHORT_LIST,UPDATE
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = -9116903305339750934L;
	
	private Date date;
	private Activity activity;
	private Text comment;
	private Key id;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public Text getComment() {
		return comment;
	}
	public void setComment(Text comment) {
		this.comment = comment;
	}
	public Key getId() {
		return id;
	}
	public void setId(Key id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ProjectLog [date=" + date + ", activity=" + activity
				+ ", comment=" + comment + ", id=" + id + "]";
	}
	public ProjectLog() {
		id = GeneralController.ds.allocateIds(ProjectLog.class.getSimpleName(), 1).getStart();
	}
	
	
	
	

}
