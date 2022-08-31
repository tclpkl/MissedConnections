package servlets;

import util.Post;
import util.User;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Database;

@WebServlet("/Feed")
public class Feed extends HttpServlet {
	private static final long serialVersionUID = 7507777331673090255L;
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Database db = new Database();
		
		//Getting current user
		User user = null;
		Cookie cookies[] = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("user_id")) {
				user = db.get_user_data(Integer.parseInt(c.getValue()));
			}
		}
		
		//Getting ArrayList of posts
		ArrayList<Post> posts = db.most_recent_posts(user.user_id);
		
		//Making this arraylist accessible for feed.jsp
		request.setAttribute("posts", posts);
		
		response.sendRedirect("homepage.jsp");
	}

}
