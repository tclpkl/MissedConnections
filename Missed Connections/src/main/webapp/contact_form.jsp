<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MissedSC | Contact Form</title>
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
			background-color: #FFF7F0;
			font-family: 'Adagio Sans';
		}
		#page_body {
			display: flex;
			width: 100%;
		}
		#main_col {
			margin-left: 27%;
			margin-right: 6%;
			width: 80%;
			float: right;
			display: inline-block;
		}
		#contact_us {
			margin: auto;
			margin-top: 60px;
			background-color: #D56262;
			width: 200px;
			color: white;
			text-align: center;
			border-radius: 300px;
		}
		.row {
			display: flex;
			margin-bottom: 5px;
			width: 100%;
		}
		.selection {
			/*text-align: center;*/
			width: 100%;
			padding: 5px;
		}
		.centered {
			text-align: center;
		}
		input[type="text"], input[type="email"], textarea {
			border: 1px solid #D56262;
			width: 100%;
			border-radius: 300px;
			padding: 5px;
			padding-left: 15px; /*making sure that text doesn't bleed out bc/ of border-radius*/
			background-color: #FFF7F0;
			resize: none;
			color: #D56262;
			font-family: 'Adagio Sans';
		}
		input[type="text"]:focus, input[type="email"]:focus, textarea:focus {
			outline:  none !important;
			border: 1px solid #D56262;
			font-family: 'Adagio Sans';
		}
		button {
			border: 1px solid #D56262;
			width: 85px;
			background-color: #FFF7F0;
			border-radius: 300px;
			padding: 3px;
		}
		input[type="radio"] {
	      height: 9px;
	      width: 9px;
	      background-color: #E8E8E8;
	      position: relative;
	      outline: none;
	      transform: rotate(45deg);
	      -webkit-appearance: none;
	    }
	    input[type="radio"]:before {
	      position: absolute;
	      content: "";
	      background-color: #E8E8E8;
	      height: 60%;
	      width:  100%;
	      top: -59%;
	      border-radius: 75px 75px 0 0 ;
	    }
	    input[type="radio"]:after {
	      position: absolute;
	      content: "";
	      background-color: #E8E8E8;
	      height: 60%;
	      width: 100%;
	      transform: rotate(-90deg);
	      border-radius: 75px 75px 0 0;
	      top: 20%;
	      right: 79%;
	    }
	    input[type="radio"]:checked, input:checked[type="radio"]:before, 
	    input:checked[type="radio"]:after {
	      background-color: #D56262;
	    }
	    ::placeholder {
			color: white;
			font-family: 'Adagio Sans';
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

	<div id="page_body">
		<div id="leftSidebar">
			<!-- <div class="column"> -->
			<script>startApp();</script>
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
	            
	             <%
            	if(usertype.contentEquals("admin")) { %>
            		<div class="link"><a href="admin.jsp">Admin Review</a></div>
            	<% } %>
	            
		        <div class="link-current"><a href="contact_form.jsp">Contact Us</a></div>
		        <%
/* 		        	int userid = -1; 
			        Cookie cookies[] = request.getCookies();
					for (Cookie c : cookies) {
						if (c.getName().equals("userid")) {
							userid = Integer.parseInt(c.getValue().trim());
						}
					} */
					if (userid == -1) {
						// no user logged in
						out.println("<div class='submitPost' onclick='openInvalidNav()'>Submit Post</div>");
					}
					else { // user is logged in
						out.println("<div class='submitPost' onclick='openValidNav()'>Submit Post</div>");
					}
		        %>
		       
		        
		    <!-- </div> -->
		</div>
		<!-- different div for left column/sidebar -->
		
		<div id="main_col">
			<!-- <div class="column" style="float:right; width: 100%"> -->
				<p>
					<% 
						if (request.getAttribute("submitted") != null) {
								out.println("<div class='submit_response' style='background-color: #ffdab9; padding: 20px; margin-top: 15px; border-radius: 200px; text-align: center'>");
								out.println(request.getAttribute("submitted"));
								out.println("</div>");
						}
					%>
				</p>
				<div id="contact_us" style="margin-top: 50px; line-height: 50px">
					<h1>
						Contact Us
					</h1>
				</div>
				<form action="ContactServlet" method="GET">
					<div class="row">
						<label for="name">Name:</label>
					</div>
					<div class="row" style="margin-bottom: 15px">
						<input type="text" name="name" required>
					</div>
					<div class="row">
						<label for="email">Email:</label>
					</div>
					<div class="row" style="margin-bottom: 15px">
						<input type="email" name="email" required>
					</div>
					<div class="row">
						<label>Reason for contacting:</label>
					</div>
					<div class="row" style="margin-bottom: 15px">
						<div class="selection">
							<input type="radio" value="bug" name="reason" required>
							<!-- <span class="pink fa fa-regular fa-heart"></span> -->
							<!-- <span class="icon"></span> -->
							<label for="bug">Bug fix</label>

						</div>
						<div class="selection">
							<input type="radio" value="inappropriate" name="reason">
							<!-- <span class="pink fa fa-regular fa-heart"></span> -->
							<label for="inappropriate">Inappropriate post</label>
						</div>
						<div class="selection">
							<input type="radio" value="suggestions" name="reason">
							<!-- <span class="pink fa fa-regular fa-heart"></span> -->
							<label for="suggestions"> Suggestions </label>
						</div>
						<div class="selection">
							<input type="radio" value="other" name="reason">
							<label for="other">
								Other
							</label>
						</div>
					</div>

					<div class="row">
						<label for="comment">Message:</label>
					</div>
					<div class="row">
						<textarea id="comment" name="comment" style="padding-bottom: 80px; border-radius: 30px; padding-left:20px; padding-right:20px; padding-top: 10px; margin-bottom: 10px"></textarea>
					</div>
					<div class="centered" >
						<button type="submit" style="color: #D56262">Submit</button>
					</div>
				</form>
			<!-- </div> -->
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