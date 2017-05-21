<%-- 
    Document   : booknow
    Created on : Apr 26, 2017, 12:31:03 AM
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.json.Json"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Date" %>
<%@ page import="java.io.*"%>

<%@page import = "java.io.IOException"%>
<%@page import ="java.util.logging.Level"%>
<%@page import ="org.jsoup.nodes.Element"%>
<%@page import = "org.jsoup.select.Elements"%>
<%@page import ="java.util.logging.Logger" %>
<%@page import = "org.jsoup.Jsoup"%>
<%@page import = "org.jsoup.nodes.Document"%>
<%Class.forName("com.mysql.jdbc.Driver");%> 
<!DOCTYPE html>
<html lang="en" >
    
    <head>
        <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
       
          
         
        
        
        
        <title>Contact Form | CodyHouse</title>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
	
        
        

	<link rel="stylesheet" href="../book/css5/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="../book/css5/style.css"> <!-- Resource style -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="../book/js5/modernizr.js"></script> <!-- Modernizr -->
	
       
        
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
                        statement2 = connection.prepareStatement("SELECT name, price from booknow where userId = " + "(?)"+" and packageId="+"(?)");
                        //statement2 = connection.prepareStatement("SELECT * from trips where destination = " + "(?)");//callCrawler(url);

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet checkDes(String id3,String id2) {
                    try {
                        statement2.setString(1, id3);
                        statement2.setString(2, id2);
                        resultSet = statement2.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }

            }
        %>
        <%!
    public class insert {

        String jdbcUrl = "jdbc:mysql://localhost/concierge";
        String username = "root";
        String password = "";
        Connection connection = null;
        PreparedStatement statement = null;
        PreparedStatement statement1 = null;
        PreparedStatement statement2 = null;
        PreparedStatement statement3 = null;
        PreparedStatement statement4 = null;
        ResultSet s = null;
        ResultSet s1 = null;

        public insert() {
            try {
                connection = DriverManager.getConnection(jdbcUrl, username, password);
                statement4 = connection.prepareStatement("INSERT INTO booknow(name,price,userId,packageId)" + " VALUES(?,?,?,?)");

                //statement2 = connection.prepareStatement("SELECT * from trips where destination = " + "(?)");//callCrawler(url);
                statement2 = connection.prepareStatement("INSERT INTO book1(id,destinationName,destinationCode,connectingSegment,transportRef,"
                        + "accomodationRef,hotelName,hotelDesc,ratingImage,address,destinationDuration,hotelCheckInDay) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public int bookNow(String name, String price, String userid, String pack){
        int result = 0;
            try {
                statement4.setString(1, name);
                statement4.setString(2, price);
                statement4.setString(3, userid);
                statement4.setString(4,
                pack);
result = statement4.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return result;
        }

        

        public ResultSet getActors(String packageId) {
            String query = "SELECT startFromPrice FROM book WHERE packageId=" + "'" + packageId + "'";

            try {
                statement1 = connection.prepareStatement(query);
                s = statement1.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return s;
        }
    }
%>

<%
    String id1 = request.getParameter("id");

    String price = new String();

    insert n = new insert();

    HttpSession log = request.getSession();
    String userid = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
    System.out.println(id1);
    ResultSet details = n.getActors(id1);
    while (details.next()) {

        price = details.getString("startFromPrice");
    }

    int h = n.bookNow(name, price, userid, id1);

%>
        <%
            String id2= request.getParameter("id");
            HttpSession log2=request.getSession();
            String id3=(String)session.getAttribute("id");
            book i = new book();
            
            ResultSet r = i.checkDes(id3,id2);
        %>
        <form action="process.jsp" method="POST" class="cd-form floating-labels">
            <input type="hidden" name="packageId" value="<%= id2 %>">
		<fieldset>
			<legend>Account Info</legend>

			<div class="error-message">
				<p>Please enter a valid email address</p>
			</div>
                        <%while(r.next()){
                        System.out.println(r.getString("price"));    
                        %>
                        <div class="icon">
		    	<label class="cd-label" for="cd-email"></label>
				<!--<input class="email error" type="email" name="cd-email" id="cd-email" required>-->
                                <p>NAME:<%= r.getString("name")%></p>
		    </div>
			<div class="icon">
				<label class="cd-label" for="cd-name"></label>
				<!--<input class="user" type="text" name="cd-name" id="cd-name" required>-->
                                <p>PRICE:<%= r.getString("price")%></p>
		    </div> 
                    <% } %>
                    

		    <div class="icon">
		    	<label class="cd-label" for="cd-company"></label>
				<!--<input class="company" type="text" name="cd-company" id="cd-company">-->
                                <p>Date: <input type="text" name="datepicker" id="datepicker"></p>
		    </div> 

		    <div class="icon">
		    	<label class="cd-label" for="cd-email">Email</label>
				<input class="email error" type="email" name="email" id="cd-email" required>
		    </div>
                   
                    <div class="icon">
		    	<label class="cd-label" for="cd-email">PHONE</label>
				<input  type="text" name="phone" id="cd-email" required>
		    </div>
                    
                    <div class="icon">
		    	<label class="cd-label" for="cd-email">CITY</label>
				<input  type="text" name="city" id="cd-email" required>
		    </div>
                    <div class="icon">
		    	<label class="cd-label" for="cd-email">ADDRESS</label>
				<input  type="text" name="address" id="cd-email" required>
		    </div>
                    <div class="icon">
		    	<label class="cd-label" for="cd-email">PIN/ZIP</label>
				<input  type="text" name="pin" id="cd-email" required>
		    </div>
                    
		</fieldset>

		<fieldset>
			<legend>INFO</legend>

			<div>
				<h4>CITY</h4>

				<p class="cd-select icon">
					<select name="state" class="budget">
						<option value="">--------Select Your State--------</option>
                                                <option value="Delhi">Delhi</option>
                                                <option value="Mumbai">Mumbai</option>
                                                <option value="Chennai">Chennai</option>
                                                <option value="Karnataka">Karnataka</option>
                                                <option value="Kolkata">Kolkata</option>
                                                <option value="Punjab">Punjab</option>
                                                <option value="Kerala">Kerala</option>
					</select>
				</p>
			</div> 

			

			

			<div class="icon">
				<label class="cd-label" for="cd-textarea">ANY SPECEFIC REQUIREMENT</label>
      			<textarea class="message" name="description" id="cd-textarea" required></textarea>
			</div>

			<div>
		      	<input type="submit" name="boook" value="SUBMIT">
		    </div>
		</fieldset>
	</form>
        
        
        
			
                                

		                  

<script src="../book/js5/jquery-2.1.1.js"></script>
<script src="../book/js5/main.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
  
 <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script><!-- Resource jQuery -->
    </body>
</html>


