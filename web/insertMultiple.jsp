<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Form</title>
    </head>
    <body>


        <%!
            public class Form {

                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String password = "";

                Connection connection = null;
                PreparedStatement statement = null;
                PreparedStatement newStatement = null;
                ResultSet resultSet = null;

                public Form() {

                    try {

                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        statement = connection.prepareStatement(
                                "insert into eg (username,destination,shopping,historical,romantic,religious) " + "VALUES(?,?,?,?,?,?)");

//System.out.println(newStatement.toString());
                    } catch (SQLException e) {

                        e.printStackTrace();

                    }

                }

                public int setActors(String username, String destination, String shopping, String historical, String romantic, String religious) {
                    int result = 0;
                    try {

                        statement.setString(1, username);
                        statement.setString(2, destination);
                        statement.setString(3, shopping);
                        statement.setString(4, historical);
                        statement.setString(5, romantic);
                        statement.setString(6, religious);

                        result = statement.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                    return result;
                }

                public ResultSet getPlaces(String type[], String s) {
//ResultSet r = null;
                    String table = new String();
                    String n = "SELECT * FROM ";
                    String t[] = type;
                    for (int j = 0; j < type.length; j++) {
                        if (j + 1 == type.length) {
                            //table = type[j] + "_places";
                            n = n + type[j].toLowerCase() + "_places";
                            n = n + " Where ";
                            n = n + "state=";
                            n = n + "'" + s+ "'";
                        } else {
                            n = n + type[j].toLowerCase() + "_places";
                            n = n + " Where ";
                            n = n +  "state=";
                            n = n + "'" + s+ "'" + " UNION ";
                            n = n + "SELECT * FROM ";
                        }
                    }

                    System.out.println(n);
                    try {
                        newStatement = connection.prepareStatement(n);
                        resultSet = newStatement.executeQuery();
                        /*for (int i = 1; i <= type.length; i++) {
System.out.println(s);*/

                        //}
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
//ResultSet r = setPlaces(s);
                    
                    /*
newStatement.setString(3,s);
newStatement.setString(4,s);*/
//System.out.println(newStatement.toString());
                    //resultSet=newStatement.executeQuery();
/*
        }catch(SQLException e){
            e.printStackTrace();
                              }*/
                    return resultSet;
                }

            }


        %>
        <%
            int result = 0;

//String[] type=new String[]{""};
//String type[];
//String types="";
            String type[] = null;
            String username = new String();
            String destination = new String();
            String shopping = new String();
            String historical = new String();
            String romantic = new String();
            String religious = new String();
            shopping = null;
            historical = null;
            romantic = null;
            religious = null;
            if (request.getParameter("state") != null) {
                destination = request.getParameter("state");

            }
            if (request.getParameter("name") != null) {
                username = request.getParameter("name");
            }

            if (request.getParameterValues("places") != null) {

                type = request.getParameterValues("places");
                for (String val : type) {
                    out.print(val + "\n");
                }

                /*for(int i=0;i<type.length;i++){
      System.out.println(type[i]);
      if(type[i].equals("shopping")){
          shopping="shopping";
          //out.print(shopping+"\n");
  }
      if(type[i].equals("historical")){
                 
  historical="historical";
  //out.print(historical+"\n");
  }
          if(type[i].equals("romantic")){
            
  romantic="romantic";
  //out.print(romantic+"\n");
  }
            if(type[i].equals("religious")){
            
  religious="religious";
  //out.print(religious+"\n");
  }
    
}
                 */
            }

            Form form = new Form();
//result=form.setActors(username,destination,shopping,historical,romantic,religious);

            String place = new String();
            if (request.getParameter("destination") != null) {
                place = request.getParameter("destination");
                // place = place.toLowerCase();
            }
            Form get = new Form();

            ResultSet places = get.getPlaces(type, place);


        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>State</td>
                    <td>City</td>
                    <td>Place</td>
                </tr>
                <% while (places.next()) {%>
                <tr>
                    <td><%= places.getString("state")%></td>
                    <td><%= places.getString("city")%></td>
                    <td><%= places.getString("place")%></td>
                </tr>
                
                <% }%>
            </tbody>
        </table>


    </body>
</html>
