package util;
public class User {

	//Data fields
	public Integer user_id;
	public String name; 
	public String email;
	public String status;
	
	//Constructor 
	public User(Integer user_id, String name, String email, String status) {
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.status = status;
	}
	
	//Getters
	public Integer getUserID() {
		return this.user_id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getStatus() {
		return this.status;
	}
	
}
