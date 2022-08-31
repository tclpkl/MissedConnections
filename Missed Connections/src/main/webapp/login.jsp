<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="495237889739-2mldgjdf5b7sp4j35hoq3r8nbjdoctds.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://kit.fontawesome.com/4b6d728af0.js"></script>
    <script type="text/javascript" src="js/google-login.js"></script>
    <link rel="stylesheet" href="css/style.css">
    
	<%
	    if (null != request.getAttribute("loginError")) {
	    	String Error= "Invalid email or password. Or, bad Google login. Please try again.";
	    	out.println("<div class=\"A\"><div class=\"B\"style=\"background-color:#bb0000;background-size:cover; padding-top:10px; padding-bottom:40px;\"><div class=\"C\"><div class=\"D\"><div id=\"learning-automated-div\" style=\"text-align: center; font-size: 48px; line-height: 20px; padding-top:10px\"></div><div style=\"text-align: center; font-size: 18px; line-height: 22px; padding: 0 5px 5px 5px;\"><span style=\"color:#FFFFFF;\">"+Error+"</span></div></div></div></div></div>");
	    } else {
	    }
	%>

 	<title>SalEats</title>
  </head>
  <body>
  	<header>
  		<nav>
  			<a href="home.jsp" class="no-style" id="logo">SalEats!</a>
  			<span id="buttons">
	  			<a href="home.jsp" class="no-style" id="home">Home</a>
	  			<a href="login.jsp" class="no-style">Login / Register</a>
	  			<%
	  				if (null != request.getSession().getAttribute("name")) {
	  					response.sendRedirect("home.jsp");
			   		}
			  	%>
  			</span>
  		</nav>
  	</header>
  	<main>
  		<div class="login-form-container">
  			<div>
	  			<form class="login-form" action="Auth" method="POST">
	  				<div>
		  				<h1 class="form-header">Login</h1>
		  			</div>
	  				<label>Email</label>
	  				<input type="email" class="textbox" name="email" required>
	  				<label>Password</label>
	  				<input type="password" class="textbox" name="password" autoComplete="current-password" required pattern="\S(.*\S)?">
	  				<button type="submit" name="login" class="login-button"><i class="fas fa-sign-in-alt"></i>Sign In</button>
	  			</form>
	  			<div class="g-signin2" onclick="ClickLogin()" data-onsuccess="onSignIn" data-width="425" data-height="40" data-longtitle=true data-theme="dark">Google</div>

	  			<script>
	  			var clicked=false;//Global Variable
	  			
	  			function ClickLogin()
	  			{
	  			    clicked=true;
	  			}
	  			
	  			function onSignIn(googleUser) {
	  				if (clicked){
	  					 var profile = googleUser.getBasicProfile();
		  		         console.log('ID: ' + profile.getId());
		  		         console.log('Name: ' + profile.getName());
		  		         console.log('Image URL: ' + profile.getImageUrl());
		  		         console.log('Email: ' + profile.getEmail());
		  		         console.log('id_token: ' + googleUser.getAuthResponse().id_token);

		  		         //do not post all above info to the server because that is not secure.
		  		         //just send the id_token

		  		         var redirectUrl = 'Auth';

		  		         //using jquery to post data dynamically
		  		         var form = $('<form action="' + redirectUrl + '" method="post">' +
		  		                          '<input type="text" name="id_token" value="' +
		  		                        	profile.getName() + '" />' +
		  		                                                                '</form>');
		  		         $('body').append(form);
		  		         form.submit();
		  		         clicked = false;
			  		     var auth2 = gapi.auth2.getAuthInstance();
			  		     auth2.disconnect();
		  				} 
	  		        
	  		      }
			   </script>
  			
  			
  			</div>
  			<form class="login-form" action="Auth" method="POST">
	  				<div>
		  				<h1 class="form-header">Register</h1>
			  			<%
						    if (null != request.getAttribute("registerError")) {
						    	out.println(request.getAttribute("registerError"));
						    } else {
						    	out.println("<p class=\"error-message\" style=\"visibility: hidden;\">invisible</p>");
						    }
						%>
		  			</div>
  				<label>Email</label>
  				<input type="text" class="textbox" name="email" required>
  				<label>Name</label>
  				<input type="text" class="textbox" name="name" required pattern="\S(.*\S)?">
  				<label>Password</label>
  				<input type="password" class="textbox" name="password" autoComplete="new-password" required pattern="\S(.*\S)?">
  				<label>Confirm Password</label>
  				<input type="password" class="textbox" name="confirm_pass" autoComplete="new-password" required pattern="\S(.*\S)?">
  				<div>
	  				<label class="terms">
	  					<input type="checkbox" name="terms" class="terms" required>
	  					I have read and agree to all terms and conditions of SalEats.
	  				</label>
  				</div>
  				<button type="submit" name="register" class="login-button"><i class="fas fa-user-plus"></i>Create Account</button>
  			</form>
  		</div>
  	</main>
  </body>
</html>