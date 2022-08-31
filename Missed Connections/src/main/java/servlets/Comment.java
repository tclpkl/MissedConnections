package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Post;
import util.User;
import data.Database;

@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 7507777331673090255L;


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Database db = new Database();

		int user_id = -1;
		Cookie cookies[] = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("userid")) {
//				user_id = db.get_user_data(Integer.parseInt(c.getValue()));
				user_id = Integer.parseInt(c.getValue().trim());
			}
		}
		
		String error="No error";
		int id = Integer.parseInt(request.getParameter("post_id"));
		request.setAttribute("postid", id);
		
		if (user_id == -1) {
			//no user logged in
			error="User is not logged in. Cannot comment.";
			request.setAttribute("error", error);
		}
		else {			
			//Getting current post; 	
			Post post = db.get_post(id, user_id);
			
			//Getting comment
			String comment = request.getParameter("comment");
			
			//Adding comment to database
			db.addComment(id, user_id, comment);
			
			//Updating post in request
			request.setAttribute("post", db.get_post(post.post_id, user_id));
		}
				
		//Redirect to ViewPost servlet
		response.sendRedirect("expand.jsp" + "?postid=" + id + "&error=" + error);
//		request.getRequestDispatcher("expand.jsp").forward(request, response);
	}
}

