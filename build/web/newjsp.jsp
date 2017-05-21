<%-- 
    Document   : newjsp
    Created on : Feb 22, 2017, 2:47:29 AM
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            int i = 1;
            int j = 2;
            int k = i + j;
        %>
        <%=k%>
    </body>
</html>
