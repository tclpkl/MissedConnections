<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="util.Post" %>
<%@page import="data.Database" %>
<%@page import="util.User" %>
<%@page import="util.TBA" %>
<!DOCTYPE html>

<html>
    <head>
        <title>
            MissedSC | Admin Review
        </title>
        <script src="https://kit.fontawesome.com/51b017a2ee.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/sidebar.css">
        <style>
            @font-face {
                font-family: 'Adagio Sans';
                src: url('Adagio_Sans-Regular.eot');
                src: local('Adagio Sans'), local('Adagio_Sans-Regular'),
                    url('Adagio_Sans-Regular.eot?#iefix') format('embedded-opentype'),
                    url('Adagio_Sans-Regular.woff2') format('woff2'),
                    url('Adagio_Sans-Regular.woff') format('woff'),
                    url('Adagio_Sans-Regular.ttf') format('truetype');
                font-weight: normal;
                font-style: normal;
            }
            /* @font-face {
                font-family: 'Adagio Sans';
                src: url('Adagio_Sans-SemiBold.eot');
                src: local('Adagio Sans SemiBold'), local('Adagio_Sans-SemiBold'),
                    url('Adagio_Sans-SemiBold.eot?#iefix') format('embedded-opentype'),
                    url('Adagio_Sans-SemiBold.woff2') format('woff2'),
                    url('Adagio_Sans-SemiBold.woff') format('woff'),
                    url('Adagio_Sans-SemiBold.ttf') format('truetype');
                font-weight: 600;
                font-style: normal;
            } */
            body {
               margin: 0px;
               background-color: #FFF7F0;
               color: #D56262;
               font-family: 'Adagio Sans';
           }
           #header {
               padding-left: 1.5vw;
               padding-right: 1.5vw;
               line-height: 2em;
               margin: auto;
               color: #D56262;
               /* text-shadow:
                0 0 7px #ebadad,
                0 0 10px #EE8B8B,
                0 0 21px #fff; */
           }
           #main {
               width: 45.3vw;
               margin-left: 23.3vw;
               margin-right: 10px;
               height: 100%;
               padding: 2vw;
           }
           .post-box {
               padding: 0.7vw;
               padding-left: 1.5vw;
               padding-right: 1.5vw;
           }
           .post-id {
               font-family: 'Adagio Sans';
               font-size: 1.2em;
               margin-left: 0;
               margin-bottom: 1vh;
           }
           .post-content {
               display: block;
               margin: auto;
               padding-left: 1vw;
               padding-right: 1vw;
               border-color: #D56262;
               border-style: solid;
               border-radius: 25px;
           }
           .buttons {
               float: right;
               width: 14vw;
               font-size: 1.1em;
           }
           button {
               color: #D56262;
               font-size: 1.1em;
               border: none;
               background-color: transparent;
               cursor: pointer;
               outline: none;
           }
        </style>
    </head>
    <body>
        <div id="leftSidebar">
        	<a href="homepage.jsp"><img src = "images/logo.png"></a>
            <div class="link"><a href="homepage.jsp">Home</a></div>
       		<% int userid = -1;
		         String usertype = "";
		         if(request.getCookies() != null){
					Cookie[] cookies = request.getCookies();
					for (Cookie c : cookies) {
						if (c.getName().equals("userid")) {
							userid = Integer.parseInt(c.getValue().trim());
						}
						if (c.getName().equals("usertype")) {
							usertype = c.getValue().trim();
						}
					}
		         }
		         System.out.println(usertype);
	   		%>
            <% if (userid == -1) { %>
           	 <div class="customGPlusSignIn" id="signin">Account Login</div>
            <% } else if (userid != -1){ %>
            	<div class="link"><a href = "LogoutDispatcher">Log out</a></div>
            <% } %>
            <div class="link-current"><a href="admin.jsp">Admin Review</a></div>
            <div class="link"><a href="contact_form.jsp">Contact Us</a></div>
            <%-- <%
            if(user.status=="admin") { %> --%>
            	<!-- <div class="link-current"><a href="admin.jsp">Admin Review</a></div> -->
            <%-- <% } %> --%>
            <div class = "submitPost">Submit Post</div>
        </div>
        <div id="main">
            <div id="header">
                <h1>Admin Review</h1>
            </div>
            
            <% Database db = new Database();
            
            ArrayList<TBA> to_be_approved = db.to_be_approved_posts();
            if (to_be_approved.isEmpty() == true) { 
            	out.println("<p>No posts to approve!</p>"); 
            } 
            else {
            	for (TBA post : to_be_approved) {
                    
    	            out.println("<div class='post-box'>");
    	                out.println("<p class='post-id'>To be Approved:</p>");
    	                out.println("<div class='post-content'>");
    	                    out.println("<p>" + post.content + "</p>");
    	                out.println("</div>");
    	                out.println("<div class='buttons'>");
    	                    out.println("<table>");
    	                        out.println("<tr>");
    	                            out.println("<td>");
    	                            	out.println("<form action=\"ApproveServlet\" method = \"GET\">");
    	                                	out.println("<button type='submit' name='approve_id' value='" + post.approve_id + "'><i class='fa-regular fa-heart'></i></button>");
    	                                out.println("</form>");
    	                            out.println("</td>");
    	                            out.println("<td>");
    	                                out.println("<p>Approve</p>");
    	                            out.println("</td>");
    	                            out.println("<td>");
    	                           		out.println("<form action=\"RejectServlet\" method = \"GET\">");
    	                                	out.println("<button type='submit' name='approve_id' value='" + post.approve_id + "'><i class='fa-solid fa-x'></i></button>");
    	                                out.println("</form>");
    	                            out.println("</td>");
    	                            out.println("<td>");
    	                                out.println("<p>Reject</p>");
    	                            out.println("</td>");
    	                        out.println("</tr>");
    	                    out.println("</table>");
    	                out.println("</div>");
    	            out.println("</div>");
    	            
            	}
            }   
            %>

        </div>
    </body>
</html>
