function onSignIn(googleUser) {
  // Prevent auto sign in
  gapi.auth2.getAuthInstance().disconnect();

  // Create dynamic form
  var form = document.createElement("form");
  form.action = "auth";
  form.method = "POST";

  // Add user name to form
  var profile = googleUser.getBasicProfile();
  var nameElement = document.createElement("input");
  nameElement.type = "hidden";
  nameElement.name = "google-name";
  nameElement.value = profile.getGivenName();
  form.appendChild(nameElement);

  // Add user email to form
  var emailElement = document.createElement("input");
  emailElement.type = "hidden";
  emailElement.name = "google-email";
  emailElement.value = profile.getEmail();
  form.appendChild(emailElement);

  // Submit form to servlet
  googleUser.disconnect();
  document.body.appendChild(form);
  form.submit();
}
