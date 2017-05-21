<%-- 
    Document   : newForm
    Created on : Mar 6, 2017, 6:52:39 PM
    Author     : sag14
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
    </head>
    <body>
        
        
        
        
        
            <form action="insertMultiple.jsp" method="post">
            <strong>Select a attribute </strong><br>
          
            
            ENTER DESTINATION:<input type="text" name="state" id="state" list="state_list"><br>
            <datalist id="state_list">
                
                <option >Delhi</option>
                <option >Mumbai</option>
                <option >Manali</option>
                <option >Jaipur</option>
                <option >Jodhpur</option>
                <option >Calicut</option>
                <option >Goa</option>
                <option >Pune</option>
                <option >Dalhousie</option>
                
            </datalist>
            ENTER USER NAME:<input type="text" name="name"><br>
            shopping<input type="checkbox" name="places" value="shopping"><br>
            religious<input type="checkbox" name="places" value="religious"><br>
            historical<input type="checkbox" name="places" value="historical"><br>
            romantic<input type="checkbox" name="places" value="romantic"><br>
            <input type="submit" value="submit"/>
        </form>
        
    </body>
</html>
