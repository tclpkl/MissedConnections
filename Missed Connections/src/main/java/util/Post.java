package util;
import java.util.ArrayList;

public class Post {

	//Data fields
	public Integer post_id;
	public String postContent; 
	public ArrayList<String> comments;
	public Integer likes;
	public Boolean likedByUser;
	
	//Constructor 
	public Post(Integer post_id, String postContent, ArrayList<String> comments, Integer likes, Boolean likedByUser) {
		this.post_id = post_id;
		this.postContent = postContent;
		this.comments = comments;
		this.likes = likes;
		this.likedByUser = likedByUser;
	}

	//Getters
	public Integer getPostID() {
		return post_id;
	}

	public String getPostContent() {
		return postContent;
	}

	public ArrayList<String> getComments() {
		return comments;
	}

	public Integer getLikes() {
		return likes;
	}

	public Boolean getLikedByUser() {
		return likedByUser;
	}
	
}
