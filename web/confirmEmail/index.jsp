<%-- 
    Document   : index
    Created on : Mar 10, 2017, 12:01:13 AM
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm EMail</title>
    </head>
    <body>
        <%!
            public class confirm {

                String password = "";
                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String loginPassword = "quantummechanics@007";
                Connection connection = null;
                PreparedStatement statement = null;
                PreparedStatement verify = null;
                ResultSet resultSet = null;

                public confirm() {
                    try {
                        
                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        statement = connection.prepareStatement("SELECT confirmNumber FROM users WHERE email=" + "(?)");
                        //callCrawler(url);
                        verify = connection.prepareStatement("Update users set verified = " + "(?)" + ",confirmNumber = " + "(?)" + "Where email = " + "(?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet setActors(String email) {

                    try {
                        statement.setString(1, email);
                        resultSet = statement.executeQuery();
                        
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }

                public int verified(String email) {
                    int result = 0;
                    try {
                        verify.setInt(1, 1);
                        verify.setInt(2,0);
                        verify.setString(3, email);
                        result = verify.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }
            }
        %>
        <%
            confirm c = new confirm();
            ResultSet r = c.setActors(request.getParameter("email"));
            while (r.next()) {
                System.out.println("fadfafad");
                if (request.getParameter("confirm").equals(r.getString("confirmNumber"))) {
                    int r1 = c.verified(request.getParameter("email"));
                }
            }

        %>
    </body>
</html>
