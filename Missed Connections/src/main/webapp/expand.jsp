<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="util.Post" %>
<%@page import="util.User" %>
<%@page import="javax.servlet.http.Cookie" %>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="data.Database" %>
<!DOCTYPE html>

<html>
    <head>
        <title>
            MissedSC | Expanded Post
        </title>
        <script src="https://kit.fontawesome.com/51b017a2ee.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/overlay.css">
		<link rel="stylesheet" href="css/noPostOverlay.css">
		        <script src="https://apis.google.com/js/platform.js" async defer></script>
		<meta name="google-signin-client_id" content="424408738453-c9qt61qb2pfac1rk37s7mpda1gfksef4.apps.googleusercontent.com">
		  <script src="https://apis.google.com/js/api:client.js"></script>
		 <script>
		  var googleUser = {};
		  var startApp = function() {
		    gapi.load('auth2', function(){
		      // Retrieve the singleton for the GoogleAuth library and set up the client.
		      auth2 = gapi.auth2.init({
		        client_id: '424408738453-c9qt61qb2pfac1rk37s7mpda1gfksef4.apps.googleusercontent.com',
		        cookiepolicy: 'single_host_origin',
		      });
		      attachSignin(document.getElementById('signin'));
		    });
		  };
		
		  function attachSignin(element) {
		    auth2.attachClickHandler(element, {},
		        function(googleUser) {
		    	  var email = googleUser.getBasicProfile().getEmail();
		    	  var name = googleUser.getBasicProfile().getName().split(' ').join('=');
		    	  var url = email.substring(email.indexOf('@') + 1);
				  if(url != "usc.edu"){
					  alert("The account you used is not a USC email. Please sign in with your USC email.");
					  var auth2 = gapi.auth2.getAuthInstance();
					  auth2.disconnect();
				  }
				  else {
				  	   window.location.href = "GoogleDispatcher?name="+name+"&email="+email;
				  }
		        }, function(error) {
		        });
		  }
		  </script>
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
           #current-post {
               margin-bottom: 40px;
           }
           .left-bubble {
               margin-left: 2.6vw;
                margin-top: 0.7vw;
                margin-bottom: 1.5vw;
                display: inline-block;
                position: relative;
                width: 40.6vw;
                height: auto;
                border-radius: 25px;
                background-color: #D56262;
            }
            .right-bubble {
                margin-left: 2.6vw;
                margin-top: 0.7vw;
                margin-bottom: 1.5vw;
                display: inline-block;
                position: relative;
                width: 40.6vw;
                height: auto;
                border-radius: 25px;
                background-color: #FDBB63;
            }
            .talktext {
                color: white;
                padding: 1em;
                text-align: left;
                line-height: 1.5em;
            }
            .talktext p {
                /* Removes webkit p margins */
                -webkit-margin-before: 0em;
                -webkit-margin-after: 0em;
            }
            .tri-right.left-in:after{
                content: ' ';
                position: absolute;
                width: 0;
                height: 0;
                left: -1.5vw;
                right: auto;
                top: 1.3vw;
                bottom: auto;
                border: 1vw solid;
                border-color: #D56262 #D56262 transparent transparent;
            }
            .tri-right.right-in:after {
                content: ' ';
                position: absolute;
                width: 0;
                height: 0;
                left: auto;
                right: -1.5vw;
                top: 1.3vw;
                bottom: auto;
                border: 1vw solid;
                border-color: #FDBB63 transparent transparent #FDBB63;
            }
            .submit-button {
                float: right;
                font-size: 1.1em;
                padding: 10px;
                padding-right: 0px;
                width: 30px;
            }
            button {
                color: white;
                font-size: 1.1em;
                border: none;
                background-color: transparent;
                cursor: pointer;
                outline: none;
            }
            #submit-button {
                color: white;
                font-size: 1.1em;
                border: none;
                background-color: transparent;
                cursor: pointer;
                outline: none;
            }
            .like-button {
                color: #D56262;
               font-size: 1.1em;
               border: none;
               background-color: transparent;
               cursor: pointer;
               outline: none;
            }
            .comment-button {
                color: #D56262;
               font-size: 1.1em;
               border: none;
               background-color: transparent;
               cursor: pointer;
               outline: none;
            }
            .comment-box {
            	width: 45.3vw;
               height: 100%;
               margin-left: 23.5vw;
               padding: 0.5vw;
               padding-left: 2vw;
            }
            .stats {
                float: right;
                font-size: 1.1em;
                margin-top: -0.7vw;
                margin-right: 1.5vw;
                color: #D56262;
            }
            #comments-header {
               font-size: 1.3em;
               margin-left: 1.5vw;
               margin-bottom: 1vw;
            }
           #comment-content {
                width: 38vw;
               height: auto;
               border: none;
               outline: none;
               resize: none;
               background-color: transparent;
               font-family: 'Adagio Sans';
               font-size: 1em;
               color: white;
            }
           #comment-content::placeholder {
                color: white;
           }
           #search_field {
			    background: #D56262;
			    color: white;
			    font-family: 'Adagio Sans';
				border-radius: 25px;
				height: 5vh;
				width: 16vw;
			    margin-top: 6vh;
			    margin-left: 4.5vw;
				border: 0;
			    padding-left: 1.5vw;
			    border: none;
			    outline: none;
			}
        </style>
    </head>
    <body>
    <div id="submit_post" class="overlay">
				<a href="javascript:void(0)" class="closebtn" onclick="closeValidNav()"><i class="fa-solid fa-x fa-2x" style="color: #D56262; float: right; margin: 20px"></i></a>
				<div class="overlay-content">
					<div class="new_post_header">
						<h1>New Post</h1>
					</div>
					<form action="TBAServlet" method="GET">
						<div class="submit_post_row">
							<textarea id="post_comment" placeholder="Write" name="post_comment" required></textarea>
						</div>
						<div class="submit_post_row">
							<input type="text" id="hashtag_submit_post" name="hashtag" placeholder="#CSCI201 #SAL">
						</div>
						<div class="submit_post_row" style="text-align:right">
							<button type="submit" id="submit_post_button">Submit</button>
							<button type="reset" id="reset_post_button">Reset</button>
						</div>
					</form>
					<!-- ***********"POST SUBMITTED" APPEARS WHEN FORM SUBMITTED********** -->
		<%-- 			<%
						if (! get_post_comment(postId).equalsTo(null)) {
							out.println("<h3>Post Submitted!</h3>");
						}
					%> --%>
				</div>
			</div>
			
			<div id="noSubmitPost" class="overlay">
				<a href="javascript:void(0)" class="closebtn" onclick="closeInvalidNav()"><i class="fa-solid fa-x fa-2x" style="color: #D56262; float: right; margin: 20px"></i></a>
				<div class="noPost-overlay-content">
					<!-- <h1 style="padding-top:45px">Please log in to post.</h1> -->
					<h1 style="padding-top:30px">Please log in to post.</h1>
					<i class="fa-solid fa-face-frown fa-lg"></i>
				</div>
			</div>
			<!-- END OF OVERLAY --> 
		
    <% 
    int userid = -1;
	String username = "";
	String useremail = "";
	String usertype = "";
	if(request.getCookies() != null){
		Cookie[] cookies = request.getCookies();
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
	}
    
    
    %>
        <div id="leftSidebar">
            <script>startApp();</script>
            <a href="homepage.jsp"><img src = "images/logo.png"></a>
            <div class="link"><a href="homepage.jsp">Home</a></div>
            <% if (userid == -1) { %>
	            <div class="customGPlusSignIn" id="signin">Account Login</div>
	            <% } else if (userid != -1){ %>
	            <div class="link"><a href = "LogoutDispatcher">Log out</a></div>
	            <% } %>
            <div class="link"><a href="contact_form.jsp">Contact Us</a></div>
            <%
            	if(usertype.contentEquals("admin")) { %>
            		<div class="link"><a href="admin.jsp">Admin Review</a></div>
            	<% } %>
            <%
	            if (userid == -1) {
					// no user logged in
					out.println("<div class='submitPost' onclick='openInvalidNav()'>Submit Post</div>");
				}
				else { // user is logged in
					out.println("<div class='submitPost' onclick='openValidNav()'>Submit Post</div>");
				}
            %>
        </div>
        <%
       	 	int postId = Integer.parseInt(request.getParameter("postid"));
	    	Database db = new Database();
			Post post = db.get_post(postId, userid);
			
			String postcontent = post.postContent;
			int likes = post.likes;
			int comments = post.comments.size();
			ArrayList<String> mycomments = (ArrayList<String>)post.comments;
			boolean ifliked = post.likedByUser;
    	   %>
        <div id="main">
        		<%
	    		if (!(request.getParameter("error").equals("No error"))) {
	    			out.println("<div class='error_class' style='background-color: rgba(255, 0, 0, 0.3); padding: 25px 0 25px 0px; text-align: center; border-radius: 15px'>");
					out.println(request.getParameter("error"));
					out.println("</div>");
	    		}
	    	%> 
            <div id="header">
                <h1>Post #<%=postId%></h1>
            </div>
            
            <div id="current-post">
                <!-- Chat bubble credits to: https://codepen.io/Founts/pen/AJyVOr?editors=1100 -->
                <div class="left-bubble tri-right left-in">
                    <div class="talktext">
                        <p><%=postcontent%></p>
                    </div>
                </div>
                
                <form action="Like" method="POST">
                <input type="hidden" name="post_id" value="<%=postId%>" />
                <div class="stats">
                    <table>
                        <tr>
                            <td><%=likes %>
                            <% if(ifliked==true) { %>
                           		<i class="fa-solid fa-heart"></i>
                                <% } else { %>
                               <button type="submit" class="like-button"> <i class="fa-regular fa-heart"></i></button>
                                <% } %>
                                </td>
                            <td> </td>
                            <td><%=comments %><i class="fa-regular fa-comments"></i></td>
                        </tr>
                    </table>
                </div>
                </form>
           	</div>
           	
            <p id="comments-header">Comments</p>
            <form action="Comment" method="POST">
            <input type="hidden" name="post_id" value="<%=postId%>" />
	           <div class="right-bubble tri-right right-in">
	               <div class="talktext">
	                   <textarea id="comment-content" name="comment" placeholder="Type your comment here"></textarea>
	                   <div class="submit-button">
	                       <button name="comment_post_id" type="submit"><i class="fa-regular fa-paper-plane"></i></button>
	                   </div>
	               </div>
	           </div>
	        </form>
	     </div>
	        
	        <% for(int i=0; i<comments; ++i) {
	        	out.println("<div class='comment-box'>");
		            out.println("<div class='right-bubble tri-right right-in'>");
		                out.println("<div class='talktext'>");
		                  out.println("<p>" + mycomments.get(i) + "</p>");
			            out.println("</div>");
		            out.println("</div>");
	            out.println("</div>");
	        }
            %>
        
        <div id="rightSidebar">
            <form action="SearchServlet" method="GET">
            	<input type="text" id="search_field" placeholder="Search.."><button type="submit" id="search-button"><i class="fa fa-search"></i></button>
            </form>
            <div class = "staticText">Trending Posts</div>
            <div class = "trendingContainer">
                 <% 
	            	ArrayList<Post> trending = db.top_recent_posts(0);
	            %>
	            <% for(Post c: trending){
	            	out.println("<div class='trending'>");
	            	out.println("<div class='trendingtext'>" + c.getPostContent() + "</div>");
	            	out.println("</div>");
	            }
	            %>
            </div>
        </div>
        <script>
			function openValidNav() {
			  document.getElementById("submit_post").style.width = "100%";
			}
			function closeValidNav() {
			  document.getElementById("submit_post").style.width = "0%";
			}
			function openInvalidNav() {
				document.getElementById("noSubmitPost").style.width = "100%";
			}
			function closeInvalidNav() {
				document.getElementById("noSubmitPost").style.width = "0%";
			}
		</script>
    </body>
</html>