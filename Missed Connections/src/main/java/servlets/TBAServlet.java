package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Database;
import util.*;

/**
 * Servlet implementation class TBAServlet
 */
@WebServlet("/TBAServlet")
public class TBAServlet extends HttpServlet {
	private static final long serialVersionUID = 7507777331673090255L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String post_comment = request.getParameter("newpost");
		String hashtag = request.getParameter("hashtag");
		
		System.out.println(post_comment);
		System.out.println(hashtag);
		
		Database db = new Database();
		int id = 0;
		ArrayList<String> none = new ArrayList<String>();
		int likes = 0;
		boolean likedbyuser = false;
		Post temp = new Post(id, post_comment, none, likes, likedbyuser);
		

		int userid = -1;
		String username = "";
		String useremail = "";
		String usertype = "";
		Cookie cookies[] = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("userid")) {
				userid = Integer.parseInt(c.getValue().trim());
			}
			if (c.getName().equals("username")) {
				username = c.getValue().trim();
			}
			if (c.getName().equals("useremail")) {
				useremail = c.getValue().trim();
			}
			if (c.getName().equals("usertype")) {
				usertype = c.getValue().trim();
			}
		}
		String error=null;
		if (userid == -1) {
			//no user logged in
			error="User is not logged in. Cannot post.";
			request.setAttribute("error", error);
		}
		else {
			db.addPost(temp, userid);
		}
		request.getRequestDispatcher("/homepage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
