<%-- 
    Document   : index
    Created on : Apr 19, 2017, 1:39:30 AM
    Author     : Shashank
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import = "java.io.IOException"%>
<%@page import ="java.util.logging.Level"%>
<%@page import ="java.util.logging.Logger" %>
<%@page import = "org.jsoup.Jsoup"%>
<%@page import = "org.jsoup.nodes.Document"%>
<%@page import ="org.jsoup.nodes.Element"%>
<%@page import = "org.jsoup.select.Elements"%>
<%@page import = "java.util.Properties"%>
<%@page import = "java.util.logging.Level"%>
<%@page import = "java.util.logging.Logger"%>
<%@page import = "javax.mail.Authenticator"%>
<%@page import = "javax.mail.Message.RecipientType"%>
<%@page import = "javax.mail.MessagingException"%>
<%@page import = "javax.mail.Session"%>
<%@page import = "javax.mail.Transport"%>
<%@page import = "javax.mail.internet.InternetAddress"%>
<%@page import = "javax.mail.internet.MimeMessage"%>
<%@page import = "java.util.Random"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">

        <meta name="description" content="Responsive tabbed layout component built with some CSS3 and JavaScript">
        <link rel="stylesheet" href="../font-awesome.css">
        <link rel="stylesheet" href="../style.min.css">
        <link rel="apple-touch-icon" href="/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="/favicon.png">
        <link rel="icon" href="images/favicon.ico">
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="../css/skeleton1.css">
        <link rel="stylesheet" href="../css/skeleton2.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.js" type="text/javascript"></script>
        <script src="//www.google-analytics.com/analytics.js"></script>
        <script src="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.min.js"></script>
        <script src="../js/jquery.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <link rel="stylesheet" href="../css/camera.css">
        <link rel="stylesheet" href="../css/owl.carousel.css">
        <link rel="stylesheet" href="../css/navcss.css" >
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../booking/css/booking.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/jquery-migrate-1.2.1.js"></script>
        <script src="../js/script.js"></script>
        <script src="../js/superfish.js"></script>
        <script src="../js/jquery.ui.totop.js"></script>
        <script src="../js/jquery.equalheights.js"></script>
        <script src="../js/jquery.mobilemenu.js"></script>
        <script src="../js/jquery.easing.1.3.js"></script>
        <script src="../js/owl.carousel.js"></script>
        <script src="../js/camera.js"></script>
        <script src="../js/jquery.mobile.customized.min.js"></script>
        <script src="../booking/js/booking.js"></script>
        <title>TOURS</title>
    </head>
    <body class="page1" id="top" ><%!
        public class insert {

            String jdbcUrl = "jdbc:mysql://localhost/concierge";
            String username = "root";
            String password = "";
            Connection connection = null;
            PreparedStatement statement = null;
            PreparedStatement statement1 = null;
            ResultSet s = null;

            public insert() {
                try {
                    connection = DriverManager.getConnection(jdbcUrl, username, password);
                    statement = connection.prepareStatement("INSERT INTO deals(name,image,theme)" + " VALUES(?,?,?)");
                    //statement2 = connection.prepareStatement("SELECT * from trips where destination = " + "(?)");//callCrawler(url);

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            public int setActors(crawlTours c) {
                int r = 0;
                try {
                    for (int i = 0; i < c.city.length; i++) {
                        statement.setString(1, c.city[i]);
                        statement.setString(2, c.images[i]);
                        statement.setString(3, c.theme);
                        r = statement.executeUpdate();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return r;
            }

            public ResultSet getActors(String theme) {
                String query = "SELECT * FROM deals WHERE theme=" + "'" + theme + "'";
                try {
                    statement1 = connection.prepareStatement(query);
                    s = statement1.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return s;
            }
        }

        public class crawlTours {

            String url = "http://www.yatra.com/india-tour-packages/";
            String theme;
            String[] city;
            String[] images;
            int i = 0;

            public crawlTours(String theme) {
                Document doc;
                this.theme = theme;
                try {
                    if (!"no".equals(theme)) {
                        url = "http://www.yatra.com/india-tour-packages/" + theme.replace(" ", "-").toLowerCase() + "-holidays";
                    }
                    doc = Jsoup.connect(url).timeout(60000).get();
                    Elements places = doc.select("div");
                    Elements images1 = doc.select("figure");
                    city = new String[places.size()];
                    for (Element place : places) {
                        if ("caption".equals(place.attr("class"))) {
                            city[i] = place.child(0).ownText();
                            i++;
                        }
                    }
                    i = 0;
                    images = new String[images1.size()];
                    for (Element image : images1) {
                        if ("res-image".equals(image.attr("class"))) {
                            images[i] = image.child(0).attr("data-src");
                            i++;
                        }
                    }
                } catch (IOException ex) {
                    Logger.getLogger(crawlTours.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        %>
        <%
            String theme = new String();
            if (request.getParameter("theme") != null) {
                theme = request.getParameter("theme");
            } else {
                theme = "no";
            }
            insert in = new insert();
            ResultSet result = in.getActors(theme);
            if (!result.last()) {
                crawlTours c = new crawlTours(theme);
                int r = in.setActors(c);
                if(r==1){response.setIntHeader("Refresh", 1);}
            } else {
                result = in.getActors(theme);

        %>
        <header>
            <div class="container_12">
                <div class="grid_12">
                    <div class="menu_block">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">
                                <li><a href="../index.jsp">HOME</a></li>
                                <li class="current"><a href="../tours/index.jsp">HOT TOURS</a></li>
                                <li><a href="index-2.html">SPECIAL OFFERS</a></li>
                                <li><a href="../blog/index.jsp">BLOG</a></li>
                                    <%                                        HttpSession login = request.getSession();
                                        if (login.getAttribute("name") == null) {
                                    %>
                                <li><a href="#" onclick="display();">
                                        Login/Signup</a></li><%} else {
                                        %>
                                <li>
                                    <a href="#"><%=login.getAttribute("name")%></a>
                                </li>
                                <%}%>

                            </ul>
                            <!--
                            <button class="noBorder" id="signUp" onclick="display();">Sign Up HERE!</button>-->
                        </nav>
                        <div class="clear"></div>
                    </div>
                </div><!--
                <div class="grid_12">
                    <h1>
                        <a href="../index.jsp">
                            <img src="../images/logo1.png" alt="Your Happy Family">
                        </a>
                    </h1>
                </div>-->
            </div>
        </header>

        <div id="pop">
            <div id="signup">
                <div class="">
                    <button class="noBorder" id="title" onclick="signup();">Login</button><span>Sign up</span>
                    <button class="noBorder" id="close" onclick="document.getElementById('pop').style.display = 'none'" onmouseover="red();" onmouseout="black();">X</button><br><br>
                </div>



                <form id="bookingForm1" method="post" action="../index.jsp">
                    <div class="fl1">
                        <div class="controlHolder"><div class="tmInput">
                                <input name="name" placeholder="Name:" type="text" data-constraints="@NotEmpty @Required @AlphaSpecial" id="regula-generated-721589">
                            </div></div>
                        <div class="controlHolder"><div class="tmInput">
                                <input type="password" required name="password" placeholder="Password" data-constraints="@NotEmpty @Required" id="regula-generated-656615">
                            </div></div>
                    </div>
                    <div class="fl1">
                        <div class="controlHolder"><div class="tmInput">
                                <input type="email" name="email" required placeholder="Email" data-constraints="@NotEmpty @Required @Email" id="regula-generated-909958">
                            </div></div>
                        <div class="controlHolder"><div class="tmInput mr0">
                                <input type="password" required name="confirmPassword" placeholder="Confirm Password" data-constraints="@NotEmpty @Required" id="regula-generated-356380">
                            </div></div>
                    </div>


                    <button class="btnSignup btn1" name="signup" onmouseover="red();">Sign up</button>
                </form>
            </div>
            <div id="login">
                <div class="">
                    <button class="noBorder" id="title" onclick="login();">Sign up</button><span>Login</span>
                    <button class="noBorder" id="close" onclick="document.getElementById('pop').style.display = 'none'" onmouseover="red();" onmouseout="black();">X</button><br><br>
                </div>

                <form id="bookingForm2" method="post" action="../index.jsp">
                    <div class="fl1">
                        <div class="controlHolder"><div class="tmInput">
                                <input type="email" name="email" required placeholder="Email" data-constraints="@NotEmpty @Required @Email" id="regula-generated-909958">
                            </div></div>

                    </div>
                    <div class="fl1">
                        <div class="controlHolder"><div class="tmInput">
                                <input type="password" required name="password" placeholder="Password" data-constraints="@NotEmpty @Required" id="regula-generated-656615">
                            </div></div>

                    </div>                                                                                                                                                                                                 
                    <button class="btnSignup btn1" onmouseover="red();" >Login</button>      


                </form>

            </div>

        </div>

        <br><br><br>
        <div class="content" >
            <div class="container_13"style="background-color: #FFF;">    
                <div class="grid_12">
                    <h3 class="head1">Latest Deals</h3><br>
                </div>
                <%
                    int check = 0;
                    while (result.next()) {%>
                <div class="grid_4">
                    <div class="banner">
                        <img src="<% out.println(result.getString("image"));%>" style="height: 364px; width: 300px;"alt="">
                        <div class="label">
                            <div class='title'><%= result.getString("name")%></div>
                            <a href="../packages/index.jsp?destination=<%= result.getString("name")%>&submit=1">LEARN MORE</a>
                        </div>
                    </div>
                    <br>
                </div>
                <%
                        }

                    }
                %>
            </div></div>
        <div class="content"><div class="container_14" style="background-color: #FFF;">
                <div class="grid_1 prefix_1" >
                    <ul class="list">
                        <li><a href="index.jsp?theme=sightseeing">Sightseeing</a></li>
                        <li><a href="index.jsp?theme=Bestseller">Bestseller</a></li>
                        <li><a href="index.jsp?theme=Beach">Beach</a></li>
                        <li><a href="index.jsp?theme=Hill-Station">Hill Station</a></li>
                        <li><a href="index.jsp?theme=Family">Family</a></li>
                        <li><a href="index.jsp?theme=Trekking">Trekking</a></li>
                        <li><a href="index.jsp?theme=Adventure">Adventure</a></li>
                        <li><a href="index.jsp?theme=Paragliding">Paragliding</a></li>
                        <li><a href="index.jsp?theme=romantic">Romantic</a></li>
                        <li><a href="index.jsp?theme=nature-walks">Nature Walks</a></li>
                        <li><a href="index.jsp?theme=Winter">Winter</a></li>
                        <li><a href="index.jsp?theme=Affordable">Affordable</a></li>
                        <li><a href="index.jsp?theme=Sporting-Events">Sporting Events</a></li>
                        <li><a href="index.jsp?theme=Backwaters">Backwaters</a></li>
                        <li><a href="index.jsp?theme=Wildlife">Wildlife</a></li>
                        <li><a href="index.jsp?theme=Water Sports">Water Sports</a></li>
                        <li><a href="index.jsp?theme=Lakes">Lakes</a></li>
                        <li><a href="index.jsp?theme=Exotic">Exotic</a></li>
                        <li><a href="index.jsp?theme=Birdwatching">Birdwatching</a></li>
                        <li><a href="index.jsp?theme=Honeymoon">Honeymoon</a></li>
                        <li><a href="index.jsp?theme=Luxury">Luxury</a></li>
                        <li><a href="index.jsp?theme=Mountain-Climbing">Mountain Climbing</a></li>
                        <li><a href="index.jsp?theme=Shopping">Shopping</a></li>
                        <li><a href="index.jsp?theme=Camping">Camping</a></li>
                        <li><a href="index.jsp?theme=Fort-Palaces">Fort Palaces</a></li>
                        <li><a href="index.jsp?theme=Summer">Summer</a></li>
                        <li><a href="index.jsp?theme=Festive">Festive</a></li>
                        <li><a href="index.jsp?theme=River-Rafting">River Rafting</a></li>
                        <li><a href="index.jsp?theme=Fly-and-Stay">Fly and Stay</a></li>
                        <li><a href="index.jsp?theme=Road-Trip">Road Trip</a></li>
                        <li><a href="index.jsp?theme=Spritual-Retreat">Spritual Retreat</a></li>
                    </ul></div></div></div>   
        <script type="text/javascript">

            function signup() {
                document.getElementById("signup").style.display = "none";
                document.getElementById("login").style.display = "block";
            }
            function login() {
                document.getElementById("signup").style.display = "block";
                document.getElementById("login").style.display = "none";
            }
            function display() {
                document.getElementById('pop').style.display = 'block';
                document.getElementById('close').style.display = 'block';
            }
            function close() {
                document.getElementById('pop').style.display = 'none';
            }
            function red() {
                document.getElementById('close').style.color = '#e00b15';
            }
            function black() {
                document.getElementById('close').style.color = '#000';
            }

        </script>
    </body>
</html>
