<%-- 
    Document   : user
    Created on : Apr 29, 2017, 2:30:26 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.io.IOException"%>
<%@page import ="java.util.logging.Level"%>
<%@page import ="java.util.logging.Logger" %>
<%@page import = "org.jsoup.Jsoup"%>
<%@page import = "org.jsoup.nodes.Document"%>
<%@page import ="org.jsoup.nodes.Element"%>
<%@page import = "org.jsoup.select.Elements"%>
<%@page import = "java.util.Properties"%>
<%@page import = "java.util.logging.Level"%>
<%@page import = "java.util.logging.Logger"%>
<%@page import = "javax.mail.Authenticator"%>
<%@page import = "javax.mail.Message.RecipientType"%>
<%@page import = "javax.mail.MessagingException"%>
<%@page import = "javax.mail.Session"%>
<%@page import = "javax.mail.Transport"%>
<%@page import = "javax.mail.internet.InternetAddress"%>
<%@page import = "javax.mail.internet.MimeMessage"%>
<%@page import = "java.util.Random"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Concierge</title>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width,initial-scale=1.0">

        <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>

        <!-- Gem style -->
        <link rel="stylesheet" href="css4/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css4/style.css"> <!-- Resource style -->
	 <!-- Modernizr -->
         <script type="text/javascript" src="js4/modernizr.js"></script>
         <script type="text/javascript" src="js4/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="js4/jquery.mobile.custom.min.js"></script>
        
           <!-- Resource jQuery -->  
         
        
    </head>
    <body>
         <%!
            public class book {

                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String password = "";
                Connection connection = null;

                PreparedStatement statement2 = null;

                ResultSet resultSet = null;

                public book() {
                    try {
                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        statement2 = connection.prepareStatement("SELECT username, price, title from bookingdetails where username = " + "(?)");
                        //statement2 = connection.prepareStatement("SELECT * from trips where destination = " + "(?)");//callCrawler(url);

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet checkDes(String uname) {
                    try {
                        statement2.setString(1,uname);
                        
                        resultSet = statement2.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }

            }
        %>
         <%
            
            HttpSession log2=request.getSession();
            String name1=(String)log2.getAttribute("name");
            book i = new book();
            
            ResultSet r = i.checkDes(name1);
        %>
        
<div class="cd-intro-block">
		<div class="content-wrapper">
			<h1><%= name1%></h1>
			<a href="#0" class='cd-btn' data-action="show-projects">Show packages</a>
                        <a href="index.jsp"  class='cd-btn'  onclick="<% log2.invalidate(); %>">Log out</a>
		</div>
	</div>
                
            
	<div class="cd-projects-wrapper">
		<ul class="cd-slider">
			
                    <%while(r.next()){%>
                    <li class="current">
				<a href="#0">
					<img src="img4/img.png" alt="project image">
					<div class="project-info">
                                            <h2><%= r.getString("title") %></h2><% System.out.println(r.getString("title"));%>
                                            <p><%= r.getString("price") %></p><% System.out.println(r.getString("price"));%>
					</div>
				</a>
			</li>

			<% } %>
			

			
		</ul>

		<ul class="cd-slider-navigation cd-img-replace">
			<li><a href="#0" class="prev inactive">Prev</a></li>
			<li><a href="#0" class="next">Next</a></li>
		</ul> 
	</div>
<script src="js4/main.js"></script>   
	

       
       
                
        
    </body>
    
</html>
