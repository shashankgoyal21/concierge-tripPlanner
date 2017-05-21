<%-- 
    Document   : search
    Created on : Apr 23, 2017, 2:22:45 PM
    Author     : Shashank
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.json.Json"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Date" %>
<%@page import="org.json.simple.JSONObject"%><%@ page import="java.io.*"%>
<%@ page import="org.json.simple.JSONValue"%>
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

            String jdbcUrl = "jdbc:mysql://localhost/test";
            String username = "root";
            String password = "";
            Connection connection = null;
            PreparedStatement statement = null;
            PreparedStatement statement2 = null;
            ResultSet s = null;

            public insert() {
                try {
                    connection = DriverManager.getConnection(jdbcUrl, username, password);
                    statement = connection.prepareStatement("INSERT INTO book(packageId,customizable,packageType,travelBy,"
                            + "overview,durationNight,durationDays,holdAndPayValue,isHoldAndPayEnabled,startFromPrice,strikeOffPrice,"
                            + "inclusions,exclusions,cancelPolicy,paymentPolicy,images,themes,inclusionTypes,meals,transfers,sightseeing,"
                            + "iTitle,iDescription,dcName,dcCode,dcIsSelected,departureCityName,departureCityCode,defaultDeparture)"
                            + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    statement2 = connection.prepareStatement("SELECT * from disease where disease = " + "(?)");//callCrawler(url);

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            public ResultSet setActors(String disease) {
                int r = 0;
                try {
                    statement2.setString(1, disease);
                    
                    
                    s = statement2.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return s;
            }

            /*public ResultSet getActors(String packageId, String departureCityCode) {
                String query = "SELECT * FROM book WHERE packageId=" + "'" + packageId + "' and departureCityCode=" + "'" + departureCityCode + "'";
                if (departureCityCode.equals("null")) {
                    query = "SELECT * FROM book WHERE packageId=" + "'" + packageId + "' and defaultDeparture=" + "'1'";
                }

                try {
                    statement1 = connection.prepareStatement(query);
                    s = statement1.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return s;
            }*/
        }
        %>
        <form action="search.jsp"><input name="d" type="text"/><input type="submit" name="submit"/></form>
        <%
            if(request.getParameter("submit")!=null)
    {
        insert i = new insert();
        ResultSet s = i.setActors(request.getParameter("d"));
        while(s.next()){
            out.println(s.getString("prevention"));
            out.println(s.getString("cures"));
        }
}        %>
    </body>
</html>
