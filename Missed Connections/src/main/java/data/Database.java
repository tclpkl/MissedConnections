package data;



import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;


import util.User;
import util.Post;
import util.TBA;


public class Database {
	
	public static String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static String ADDRESS = "jdbc:mysql://localhost:3306/uscmissed?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	public static String USER = "root";
	public static String PASSWORD = "root";
	
	//Account Validation Database Functions
	
	//takes user object and add the new user to the users database
	public void registerUser(User user){
		String REGISTER_USER = "INSERT INTO user (email, name, type) VALUES (?, ?, ?)";
		try {
			Class.forName(DRIVER);
			System.out.println("Database: Creating User");
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(REGISTER_USER);
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getName());
			statement.setString(3, user.getStatus()); //(status -> type) for (backend -> db) mapping
			statement.executeUpdate();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//takes in user_id and returns the name of the user as a String
	public String get_user_name(int user_id) {
		String GET_USER_NAME = "SELECT Name FROM user WHERE user_id = ?";
		String result = null;
		try {
			// Connect to database
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			
			// Grab queried name
			PreparedStatement statement = conn.prepareStatement(GET_USER_NAME);
			statement.setInt(1, user_id);
			ResultSet rs = statement.executeQuery();
			rs.next();
			result = rs.getString("name");
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//takes in user_id and returns the email of the user as a String
	public String get_user_email(int user_id) {
		String GET_USER_EMAIL = "SELECT email FROM user WHERE user_id = ?";
		String result = null;
		try {
			// Connect to database
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			
			// Grab queried name
			PreparedStatement statement = conn.prepareStatement(GET_USER_EMAIL);
			statement.setInt(1, user_id);
			ResultSet rs = statement.executeQuery();
			rs.next();
			result = rs.getString("email");
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//takes in user_id and returns the status of the user (admin vs user) as a String
	public String get_user_status(int user_id) {
		String GET_USER_STATUS = "SELECT type FROM user WHERE user_id = ?";
		String result = null;
		try {
			// Connect to database
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			
			// Grab queried name
			PreparedStatement statement = conn.prepareStatement(GET_USER_STATUS);
			statement.setInt(1, user_id);
			ResultSet rs = statement.executeQuery();
			rs.next();
			result = rs.getString("type");
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//takes in user_id, returns a User object associated with the passed user_id
	public User get_user_data(int user_id) {
		String name = get_user_name(user_id);
		String email = get_user_email(user_id);
		String status = get_user_status(user_id);	
		User res = new User(user_id, name, email, status);
		return res;
	}
	
	
	//Posts Database Functions
	
	//takes post_id and returns the associated content (user's post) as a string
	public String get_post_content(int post_id) {
		String GET_POST_CONTENT = "SELECT content FROM posts WHERE post_id = ?";
		String result = null;
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(GET_POST_CONTENT);
			statement.setInt(1, post_id);
			ResultSet rs = statement.executeQuery();
			rs.next();
			result = rs.getString("content");
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//takes post_id and returns all the comments as an Arraylist<String>
	public ArrayList<String> get_post_comment(int post_id) {
		String GET_POST_COMMENT = "SELECT distinct(Comment) FROM comment WHERE post_id = ?";
		ArrayList<String> result = new ArrayList<String>();
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(GET_POST_COMMENT);
			statement.setInt(1, post_id);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				result.add(rs.getString("Comment"));
			}
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//takes post_id and returns the number of likes on that post as a int
	public int get_post_likes(int post_id) {
		String GET_POST_LIKES = "SELECT count(post_id) AS data FROM likes WHERE post_id = ?";
		int result = 0;
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(GET_POST_LIKES);
			statement.setInt(1, post_id);
			ResultSet rs = statement.executeQuery();
			rs.next();
			result = (rs.getInt("data"));
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	//takes post_id, user_id and determines if the given user has liked the post (0 = NO, 1 = YES)
	public int if_user_liked(int post_id, int user_id) {
		String IF_USER_LIKED = "SELECT count(post_id) AS data FROM likes WHERE post_id = ? and user_id = ?";
		int result = 0;
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(IF_USER_LIKED);
			statement.setInt(1, post_id);
			statement.setInt(2, user_id);
			ResultSet rs = statement.executeQuery();
			rs.next();
			result = (rs.getInt("data"));
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//given post_id and user_id, will return a Post object associated with the passed post_id
	public Post get_post(int post_id, int user_id) {
		int id = post_id;
		String content = get_post_content(post_id);
		ArrayList<String> comments = get_post_comment(post_id);
		int likes = get_post_likes(post_id);
		boolean likedByUser;
		if (if_user_liked(post_id, user_id) == 0) {
			likedByUser = false;
		}
		else {
			likedByUser = true;
		}
		Post post = new Post(id, content, comments, likes, likedByUser);
		return post;
	}
	
	//given a Post object and user_id, add the post to the "to be approved" database
	public void addPost(Post post, int user_id){
		String ADD_POST = "INSERT INTO toBeApproved (user_id, content) VALUES (?, ?)";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(ADD_POST);
			statement.setInt(1, user_id);
			statement.setString(2, post.getPostContent());
			statement.executeUpdate();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	//Feed Database Functions
	
	//returns the most recent 100 post to show on the feed as Arraylist<Post>
	public ArrayList<Post> most_recent_posts(int user_id) {
		System.out.println("A");
		String MOST_RECENT = "SELECT post_id FROM posts ORDER BY post_id DESC LIMIT 100";
		ArrayList<Post> result = new ArrayList<Post>();
		ArrayList<Integer> most_recent_post_id = new ArrayList<Integer>();
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(MOST_RECENT);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				System.out.println("Active");
				most_recent_post_id.add(rs.getInt("post_id"));
				
			}
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		for (int post_id : most_recent_post_id) {
			Post temp = get_post(post_id, user_id);
			result.add(temp);
			System.out.println("HERE");
		}
		System.out.println("RETURNED");
		return result;
	}
	
	public ArrayList<Post> top_recent_posts(int user_id) {
		ArrayList<Post> result = new ArrayList<Post>();
		ArrayList<Integer> most_recent_post_id = new ArrayList<Integer>();
		String sql = "SELECT posts.*, COUNT(likes.post_id) AS post_count FROM posts LEFT JOIN likes ON posts.post_id = likes.post_id GROUP BY posts.post_id ORDER BY post_count DESC LIMIT 5;";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				most_recent_post_id.add(rs.getInt("post_id"));
				
			}
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		for (int post_id : most_recent_post_id) {
			Post temp = get_post(post_id, user_id);
			result.add(temp);
		}
		
		return result;
	}
	
	//takes in user_id, post_id and increments like counter for associated post (user likes a post)
	public void user_liked_post(int post_id, int user_id) {
		int user_liked = if_user_liked(post_id, user_id); 
		if (user_liked == 0) {
			String MOST_RECENT = "INSERT INTO likes (user_id, post_id) VALUES (?, ?)";
			try {
				Class.forName(DRIVER);
				Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
				PreparedStatement statement = conn.prepareStatement(MOST_RECENT);
				statement.setInt(1, user_id);
				statement.setInt(2, post_id);
				statement.executeUpdate();
				conn.close();
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}
	
	//takes in a hashtag (type String), user_id (type int) and returns the associated posts as Arraylist<Post>
	public ArrayList<Post> search_hashtag(String search_param, int user_id) {
		String SEARCH_HASHTAG = "SELECT post_id FROM posts WHERE content LIKE ?";
		ArrayList<Post> result = new ArrayList<Post>();
		ArrayList<Integer> post_id_with_hashtag = new ArrayList<Integer>();
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(SEARCH_HASHTAG);
			statement.setString(1, "%"+search_param+"%");
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				post_id_with_hashtag.add(rs.getInt("post_id"));
			}
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		for (int post_id : post_id_with_hashtag) {
			Post temp = get_post(post_id, user_id);
			result.add(temp);
		}
		return result;
	}
	
	//Commenting Database Functions
	
	//takes post_id, user_id, and string and adds them as an entry to the comment database
	public void addComment(int post_id, int user_id, String comment){
		String ADD_COMMENT = "INSERT INTO comment (user_id, post_id, Comment) VALUES (?, ?, ?)";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(ADD_COMMENT);
			statement.setInt(1, user_id);
			statement.setInt(2, post_id);
			statement.setString(3, comment);
			int rs = statement.executeUpdate();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//Feedback Database Functions
	
	//takes category (String), feedback data (String), and email (String) and adds to feedback database
	public void addFeedback(String category, String feedback_data, String email){
		String ADD_FEEDBACK = "INSERT INTO feedback (category, feedback_data, email) VALUES (?, ?, ?)";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(ADD_FEEDBACK);
			statement.setString(1, category);
			statement.setString(2, feedback_data);
			statement.setString(3, email);
			int rs = statement.executeUpdate();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//Admin Approval Database Functions
	
	//TO BE IMPLEMENTED: approve function
	public void approve_post(int approve_id) {
		String QUERY = "SELECT * FROM toBeApproved WHERE approve_id = ?";
		int user_id = 0;
		String content = "";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(QUERY);
			statement.setInt(1, approve_id);
			System.out.println(statement);
			ResultSet rs = statement.executeQuery();
			rs.next();
			user_id = rs.getInt("user_id");
			content = rs.getString("content");
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println(content);
		
		String DELETE_ENTRY = "DELETE FROM toBeApproved WHERE approve_id = ?";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(DELETE_ENTRY);
			statement.setInt(1, approve_id);
			int rs = statement.executeUpdate();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Date date = new Date();

		
		String INSERT_INTO_POST = "INSERT INTO posts (user_id, content) VALUES (?, ?)";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(INSERT_INTO_POST);
			statement.setInt(1, user_id);
			statement.setString(2, content);
			System.out.println(statement);
			int rs = statement.executeUpdate();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	//TO BE IMPLEMENTED: reject function
	public void reject_post(int approve_id) {
		String DELETE_ENTRY = "DELETE FROM toBeApproved WHERE approve_id = ?";
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(DELETE_ENTRY);
			statement.setInt(1, approve_id);
			int rs = statement.executeUpdate();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	//return all to_be_approved posts as ArrayList<TBA>
	public ArrayList<TBA> to_be_approved_posts() {
		String TO_BE_APPROVED = "SELECT * FROM toBeApproved";
		ArrayList<TBA> result = new ArrayList<TBA>();
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(ADDRESS, USER, PASSWORD);
			PreparedStatement statement = conn.prepareStatement(TO_BE_APPROVED);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				int approve_id = rs.getInt("approve_id");
				int user_id = rs.getInt("user_id");
				String content = rs.getString("content");
				TBA temp = new TBA(approve_id, user_id, content);	
				result.add(temp);
			}
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	
	
}
	
