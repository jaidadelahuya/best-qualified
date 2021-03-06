package com.bestqualified.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Article implements Serializable, Comparable<Article> {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = -7886491805459375745L;
	private String pictureUrl,title,author,snippet, webkey, authorImage, remainingSnippet;
	
	
	private String body;
	private String postDate;
	private String link;
	private long likes;
	private long shares;
	private List<commentBean> comments;
	private boolean liked;
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((webkey == null) ? 0 : webkey.hashCode());
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
		Article other = (Article) obj;
		if (webkey == null) {
			if (other.webkey != null)
				return false;
		} else if (!webkey.equals(other.webkey))
			return false;
		return true;
	}
	
	public String getRemainingSnippet() {
		return remainingSnippet;
	}
	public void setRemainingSnippet(String remainingSnippet) {
		this.remainingSnippet = remainingSnippet;
	}
	public boolean isLiked() {
		return liked;
	}
	public void setLiked(boolean liked) {
		this.liked = liked;
	}
	public String getAuthorImage() {
		return authorImage;
	}
	public void setAuthorImage(String authorImage) {
		this.authorImage = authorImage;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	@Override
	public int compareTo(Article o) {
		// TODO Auto-generated method stub
		return o.getPostDate().compareTo(this.postDate);
	}
	public String getWebkey() {
		return webkey;
	}
	public void setWebkey(String webkey) {
		this.webkey = webkey;
	}
	public String getSnippet() {
		return snippet;
	}
	public void setSnippet(String snippet) {
		this.snippet = snippet;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public long getLikes() {
		return likes;
	}
	public void setLikes(long likes) {
		this.likes = likes;
	}
	public long getShares() {
		return shares;
	}
	public void setShares(long shares) {
		this.shares = shares;
	}
	
	public List<commentBean> getComments() {
		return comments;
	}
	public void setComments(List<commentBean> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "Article [pictureUrl=" + pictureUrl + ", title=" + title + ", author=" + author + ", snippet=" + snippet
				+ ", webkey=" + webkey + ", body=" + body + ", postDate=" + postDate + ", link=" + link + ", likes="
				+ likes + ", shares=" + shares + ", nComments=" +  "]";
	}
	

}
