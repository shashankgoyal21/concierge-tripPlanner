<%-- 
    Document   : process.jsp
    Created on : Apr 27, 2017, 6:32:43 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                statement4 = connection.prepareStatement("INSERT INTO bookingdetails(username,userid,packageid,price,title,email,date,phone,state,city,address,pin,spreq)" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public int bookNow(String username,String userid,String packageid,String price,String title,String email,String date,String phone,String state,String city,String address,String pin,String spreq){
        int result = 0;
            try {
                statement4.setString(1, username);
                statement4.setString(2, userid);
                statement4.setString(3, packageid);
                statement4.setString(4,price);
statement4.setString(5,title);
statement4.setString(6,email);
statement4.setString(7,date);
statement4.setString(8,phone);
statement4.setString(9,state);
statement4.setString(10,city);
statement4.setString(11,address);
statement4.setString(12,pin);
statement4.setString(13,spreq);
result = statement4.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return result;
        }

        

        public ResultSet getActors(String packageId) {
            String query = "SELECT startFromPrice , packageTitle FROM book WHERE packageId=" + "'" + packageId + "'";

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
    if(request.getParameter("boook")!=null){
    String price = new String();
    String title=new String();
    
    String id = request.getParameter("packageId");
    HttpSession log = request.getSession();
    String userid = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
    
    String mail= new String();
    String date= new String();
    String phone= new String();
    String state= new String();
    String city= new String();
    String address= new String();
    String pin= new String();
    String spreq= new String();
    
    mail=request.getParameter("email");
    date=request.getParameter("datepicker");
    phone=request.getParameter("phone");
    state=request.getParameter("state");
    city=request.getParameter("city");
    address=request.getParameter("address");
    pin=request.getParameter("pin");
    spreq=request.getParameter("description");

    

    insert n = new insert();

    
    
    
    ResultSet details = n.getActors(id);
    while (details.next()) {

        price = details.getString("startFromPrice");
        title=details.getString("packageTitle");
    }

   int j= n.bookNow(name,userid,id,price,title,mail,date,phone,state,city,address,pin,spreq);
    }
%>
    </body>
</html>
