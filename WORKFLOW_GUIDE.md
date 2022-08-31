FIRST TIME SETUP
Create database setup with ServerSetupGuide.md
Using Eclipse, open workspace named 
	uscmissed
Import General -> Existing Workspace from root directory: uscmissed
Then follow General Workflow guide below

GENERAL WORKFLOW GUIDE
First, run 
	git pull
Create a new branch with 
	git checkout -b "<branchname>"
Create Apache Server - ONLY DO THIS IF YOU DO NOT HAVE A SERVER IN ECLIPSE AFTER BRANCHING
	Right click package explorer -> New -> Other -> Server
	Select Server Type -> Apache/Tomcat 9.0 
		Click download and install if it says apache-tomcat-9.0.55
		Finish
		If it prompts parent directory, use uscmissed as the parent directory
	Right click Missed Connections -> Configure build path
	In class path, delete apache tomcat server library if it exists
	Click Classpath -> Add Library -> Server Runtime -> Apache-tomcat-9 -> Finish -> Apply and CLose
	
In data/Database.java, change the username and password to your respective username and password for MySQL
	private static String USER = "root";
	private static String PASSWORD = "password";
Commit to this branch and push any changes
When you are finished with your chunk of work, go to https://github.com/Eric-Chng/uscmissed
	and submit a pull request. You can merge your pull request.
		IMPORTANT: When merging, don't override any files EXCEPT the ones you've changed. Overriding Database.java is okay if all you did was change username and password.

WARNINGS:
Be careful about working on the same file. You will have to make sure you don't override each other's code.
Remember to pull before working.
