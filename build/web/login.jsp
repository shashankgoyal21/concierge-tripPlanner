<%-- 
    Document   : login
    Created on : Mar 5, 2017, 9:28:40 PM
    Author     : sag14
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting to database </title>
    </head>
    <body>
        <h1>Insert Data</h1>
        <%!
        public class Form {
         String jdbcUrl="jdbc:mysql://localhost/test";
         String username="root";
          String password="";
Connection connection = null;
PreparedStatement statement=null;
ResultSet resultSet = null;
public Form(){

try{
connection = DriverManager.getConnection(jdbcUrl,username,password);
statement=connection.prepareStatement(
"insert into actor (first,last) "+"VALUES(?,?)");
}catch(SQLException e){

e.printStackTrace();

}

}
public int setActors(String first,String last){
int result=0;
try{
statement.setString(1,first);
statement.setString(2,last);
result=statement.executeUpdate();
}catch (SQLException e){
e.printStackTrace();
}


return result;
}



}
        %>
        <%
        int result=0;
        
String firstName= new String ();
String lastName= new String ();

if(request.getParameter("first")!=null){
    firstName=request.getParameter("first");
}
if(request.getParameter("last")!=null){
    lastName=request.getParameter("last");
}

Form form = new Form();
result=form.setActors(firstName,lastName);
        %>
        
        <form action="login.jsp" method="post">
            Firstname:<input type="text" name="first"><br>
            Lastname:<input type="text" name="last"><br>
            <input type="submit" name="submit">
            
        </form>
    </body>
</html>
