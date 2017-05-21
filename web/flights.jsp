<%-- 
    Document   : flights
    Created on : Mar 27, 2017, 10:34:55 PM
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
        <script type="text/javascript" src="//api.skyscanner.net/api.ashx?key=hvgfgmnvugt6trfgujbvcredres5"></script>
<script type="text/javascript">
   skyscanner.load("snippets","2");
   function main(){
       var snippet = new skyscanner.snippets.SearchPanelControl();
       snippet.setShape("box300x250");
       snippet.setCulture("en-GB");
       snippet.setCurrency("INR");
       snippet.setMarket("IN");
       snippet.setColourScheme("steelgreylight");
       snippet.setProduct("flights","1");

       snippet.draw(document.getElementById("snippet_searchpanel"));
   }
   skyscanner.setOnLoadCallback(main);
</script>
<div id="snippet_searchpanel" style="width: auto; height:auto;"></div>
    </body>
</html>
