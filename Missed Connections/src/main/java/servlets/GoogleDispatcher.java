package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import data.*;


/**
 * Servlet implementation class GoogleDispatcher
 */
@WebServlet("/GoogleDispatcher")
public class GoogleDispatcher extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String name = (String)request.getParameter("name");
        name = name.replaceAll("=", " ");
        String email =(String) request.getParameter("email");
        //String password = (String) request.getParameter("type");
        
        String db = Database.ADDRESS;
    	String sql = "SELECT * FROM user WHERE email = '" + email + "';";
    	String isql = "INSERT INTO user (Name, email, type) VALUES (?, ?, ?)"; 
    	try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    	try (Connection conn = DriverManager.getConnection(db, Database.USER, Database.PASSWORD);
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql); 
        		PreparedStatement ps = conn.prepareStatement(isql);
        		) {
    		if(rs.next()) {
    			//user already exists in db
    			//need to grab id
    		} else {
    			ps.setString(1,name);
        		ps.setString(2, email);
        		ps.setString(3, "user");
        		ps.executeUpdate();
        		//need to grab id
    		}
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	int userid = -1;
    	String type = "user";
    	
    	try (Connection conn = DriverManager.getConnection(db, Database.USER, Database.PASSWORD);
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql); ) {
    		rs.next();
    		userid = rs.getInt("user_id");
    		type = rs.getString("type");
    		
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	if (userid == -1) {
    		//MAJOR ERROR
    		System.out.println("USER ID NOT WORKING");
    	}
    	
        Cookie cookie = new Cookie("username", name.replaceAll(" ", "="));
        cookie.setMaxAge(60*60);
        response.addCookie(cookie);
        
        Cookie cookie2 = new Cookie("useremail", email.trim());
        cookie.setMaxAge(60*60);
        response.addCookie(cookie2);
        
        Cookie cookie3 = new Cookie("userid", Integer.toString(userid));
        cookie.setMaxAge(60*60);
        response.addCookie(cookie3);
        
        Cookie cookie4 = new Cookie("usertype", type.trim());
        cookie.setMaxAge(60*60);
        response.addCookie(cookie4);
        
        
        
        
        
        //request.getRequestDispatcher("index.jsp").forward(request, response);
        //this doesn't work bc u have to refresh page before cookies show up
        response.sendRedirect("homepage.jsp");
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
