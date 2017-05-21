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
                    statement2 = connection.prepareStatement("SELECT name, price from booknow where name = " + "(?)");
                    //statement2 = connection.prepareStatement("SELECT * from trips where destination = " + "(?)");//callCrawler(url);
                   
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

           

             public ResultSet checkDes(String des) {
                    try {
                        statement2.setString(1, des);
                         resultSet= statement2.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }

           

           

           
        }
            %>
            <%
                book i = new book();
                    String name=(String)session.getAttribute("name");
                    ResultSet r=i.checkDes(name);
            %>
        
        <div class="col-md-12 text-center mb20">
<h1>Online Payment</h1>
</div>
<div class="col-md-12 ptb20">
<form action="process.jsp" method="POST" name="dataform" >
    
    <p align="CENTER"> <input name="gluser_id" value="17458" type="HIDDEN"><input name="modid" value="WSITE" type="HIDDEN">
      <input name="Travel Plan required" value="S_name,S_email,S_phone,S_country,Description" type="HIDDEN">
      <input name="sort" value="order:Travel Plan Required,Description,Expected Arrival Date,Duration,No of Adults,No. of Kids,Budget,Air / Rail Ticketing,Hotel Reservation,Car / Coach Rental" type="HIDDEN">
      <input name="self_url" type="HIDDEN"><input name="referer" type="HIDDEN"></p>
<!-- End of Customization-->

    
    <div align="CENTER">
    <table cellspacing="0" cellpadding="0" border="0" width="60%">
      <!--<tbody><tr>
        <td width="18" background="gifs/footer-line.gif"><img src="gifs/top-img-footer.gif" height="24" width="18"></td>
        <td align="RIGHT" background="gifs/top-line.gif"><img src="gifs/top-line.gif" height="24" width="26"></td>
        <td align="RIGHT" background="gifs/top-line.gif"><img src="gifs/query1.gif" height="24" width="18"></td>
      </tr>
      <tr>
        <td width="18" background="gifs/footer-line.gif"><img src="gifs/footer-line.gif" height="12" width="18"></td>-->
        <td valign="TOP" width="100%">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
          <tbody><tr>
            <td valign="TOP" width="100%" background="gifs/query-bg.gif">
            <div class="footer-head" align="CENTER">ONLINE PAYMENT FORM<br>
            </div>
            <div class="footer-link" align="CENTER"><b><font color="#FF0000">*</font></b>(represents
            Compulsory Fields) </div></td>
          </tr>
        </tbody></table><br>
        <table cellspacing="1" cellpadding="3" align="CENTER" border="0" width="100%">
	  <tbody><tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>Amount (In
                  INR). :</td>
            <td colspan="2" bgcolor="#FBC224"><input name="amount" maxlength="48" size="30" class="inputform200" style="width:230px; "></td>
          </tr>
          <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>Your
            Name :</td>
            <td colspan="2" bgcolor="#FBC224"><input name="name" maxlength="48" size="30" class="inputform200" style="width:230px; "></td>
          </tr>
          <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>Your
            E-Mail : </td>
            <td colspan="2" bgcolor="#FBC224"><input name="email" maxlength="48" size="30" class="inputform200" style="width:230px; "></td>
          </tr>
          <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>Phone
            :</td>
            <td colspan="2" bgcolor="#FBC224"><input name="phone" maxlength="48" size="30" class="inputform200" style="width:230px; "></td>
          </tr>
  	  <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>State
            :</td>
            
                <td colspan="2" bgcolor="#FBC224"><select name="state" class="inputform200" style="width:230px;border:1px solid #aed2f3;height:21px;font-family:arial;font-size:12px;">
                <option value="">--------Select Your State--------</option>
                <option value="Australia">Australia</option>
                <option value="Austria">Austria</option>
                <option value="Belgium">Belgium</option>
                <option value="Canada">Canada</option>
                <option value="Denmark">Denmark</option>
                <option value="Czech Republic">Czech Republic</option>
                <option value="Germany">Germany</option>
         
                <option value="Zambia">Zambia</option>
                <option value="Zimbabwe">Zimbabwe</option></select>

		</td>
          </tr>
	 <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>City : </td>
            <td colspan="2" bgcolor="#FBC224"><input name="city" value="" size="30" class="inputform200" style="width:230px; " type="TEXT"></td>
          </tr>
	 
          <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>Address : </td>
            <td colspan="2" bgcolor="#FBC224"><textarea name="address" rows="3" cols="26" style="width:230px; "></textarea></td>
          </tr>
          <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>Zip/Pin Code :</td>
            <td colspan="2" bgcolor="#FBC224"><input name="pin" size="30" maxlength="6" class="inputform200" style="width:230px; "></td>
          </tr>
          <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224"><font color="#FF0000">*</font>Any Specific Requirements : </td>
            <td colspan="2" bgcolor="#FBC224"><textarea name="description" rows="6" cols="26" class="inputformtextarea" style="width:230px; "></textarea></td>
          </tr>
          <tr>
            <td colspan="2" class="text4" bgcolor="#FBC224">&nbsp;</td>
            <td colspan="2" bgcolor="#FBC224" align="LEFT"></td>
          </tr>
          
          <tr>
            <td colspan="4" bgcolor="#FBC224">
            <center><input  style="background : #FFCC00;" value="Pay Now" class="text3" type="SUBMIT"></center></td>
          </tr>
        </tbody></table></td>
        <td valign="TOP" background="gifs/right-bg-query.gif"><img src="gifs/right-bg-query.gif" height="12" width="18"></td>
      </tr>
      
    </tbody></table></div></form>
    </body>
</html>