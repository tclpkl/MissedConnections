# USC Missed Connections
By Eric Cheng, Raymond Kuan, Tim Lin, Cate Jung, Melanie Toh, and Ronak Pai

### USC Missed Connections Project
Students often meet people they find interesting but lack the courage to spark a longer conversation that might blossom into a genuine friendship. Our app aims to give students a chance to find connections they might have otherwise missed. Our anonymous message board allows students to post safely about people they wish they could connect to. There's comment systems, likes, and a daily recommended feed, all designed to maximize chances students have to connect.

## Technical Details
Project was built with Java and MySQL on the backend and a combination of Java Servlets, and pure HTML+CSS for the frontend. 
Skills applied involve database design, product thinking, and fullstack development for every contributor.

## Key Features
__Project has different permissions levels to control the level of access a user has.__  

Below is an example of a **regular user**. They have permission to view posts and create new posts.
![missedsc1](https://user-images.githubusercontent.com/24835511/185727592-26461f83-5d14-4832-87fd-85f1c5f4d205.png)

Below is an example of an **admin user**. They have permission to view and create posts, as well as manage posts.
![uscmissed2](https://user-images.githubusercontent.com/24835511/185727628-d6823fa8-effa-4f09-b2ce-38483dff1859.png)


__Project also involves asynchronous connections to the remote database so many users can simultaneously read and write data.__   
Here's a video demonstrating that functionality:
https://user-images.githubusercontent.com/24835511/185728473-9a1e9064-0353-4105-88f5-21e0e6ae87ab.mp4





# Deploying the project
We lacked the funds to host remotely, but the project can be viewed locally.

## Setup the Database locally:

Open MySQLWorkbench

Click Server -> Data Import.   
In Import from Disk tab,  
 - select import from Self-Contained File
 - find the file ServerSetup.sql
 - Select option at the bottom: Dump Structure Only
 - Click start import
 - Close the import tab on MySQLWorkbench

Click Server -> Data Import.   
In Import from Disk tab,  
 - select import from Self-Contained File
 - find file SampleDataPopulate.sql
 - Select option at the bottom: Dump Data Only
 - Select default target schema: uscmissed (NEED TO CLOSE TAB AND SELECT DATA IMPORT AGAIN)
 - Click start import



## Running the Webpage:
- After the setup of the database, the homepage can be accessed at http://localhost:8079/A2/homepage.jsp
- Apache Tomcat Servers must be attached prior to website execution. This project uses Apache Tomcat 9.0 
- Jar files must be attached (should be already attached when project is downloaded). Ensure both javax.servlets.jar and well as the mysql_connector.jar are both attached.
- Run the homepage via the Tomcat Server.


### Multithreading:
- Connection to remote mySql servlet is required.    
- To do so, go to the data package and the Database.java file. Replace lines 31 to 35 with the following
```java
public static String DRIVER = "com.mysql.cj.jdbc.Driver";
public static String ADDRESS = "jdbc:mysql://remotemysql.com:3306/iMErdiDE0y";
public static String USER = "iMErdiDE0y";
public static String PASSWORD = "kILr3e0bxa";
 ```
