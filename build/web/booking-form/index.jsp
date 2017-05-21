<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
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
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no" />

        <meta name="viewport" content="width=device-width,initial-scale=1.0">

        <meta name="description" content="Responsive tabbed layout component built with some CSS3 and JavaScript">
        <link rel="stylesheet" href="../style.min.css">
        <link rel="stylesheet" href="../font-awesome.min.css">
        <link rel="apple-touch-icon" href="/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="/favicon.png">
        <link rel="icon" href="images/favicon.ico">
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="https://css.yatracdn.com/content/holidays/responsive/details_page/resources/css/packages-details-responsive.min.css?v=13.04.2017"	/>
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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="../js1/main.js"></script>
        <script src="../js/jquery.js"></script>
        <script src="../js/jquery-migrate-1.2.1.js"></script>
        <script src="../js/script.js"></script>
        <script src="../js/superfish.js"></script>
        <link rel="stylesheet" href="../css/listBlock.css">
        <script src="../js/jquery.ui.totop.js"></script>
        <script src="../js/jquery.equalheights.js"></script>
        <script src="../js/jquery.mobilemenu.js"></script>
        <script src="../js/jquery.easing.1.3.js"></script>
        <script src="../js/owl.carousel.js"></script>
        <script src="../js/camera.js"></script>
        <!--[if (gt IE 9)|!(IE)]><!-->
        <script src="../js/jquery.mobile.customized.min.js"></script>
        <!--<![endif]-->
        <script src="../booking/js/booking.js"></script>
        <link rel="stylesheet" href="../css1/reset.css"> <!-- CSS reset -->
        <link rel="stylesheet" href="../css1/style.css">
        <title>Booking Form</title>
        <script>
            $(document).ready(function () {
                jQuery('#camera_wrap').camera({
                    loader: false,
                    pagination: false,
                    minHeight: '444',
                    thumbnails: false,
                    height: '48.375%',
                    caption: true,
                    navigation: true,
                    fx: 'mosaic'
                });
                /*carousel*/
                var owl = $("#owl");
                owl.owlCarousel({
                    items: 2, //10 items above 1000px browser width
                    itemsDesktop: [995, 2], //5 items between 1000px and 901px
                    itemsDesktopSmall: [767, 2], // betweem 900px and 601px
                    itemsTablet: [700, 2], //2 items between 600 and 0
                    itemsMobile: [479, 1], // itemsMobile disabled - inherit from itemsTablet option
                    navigation: true,
                    pagination: false
                });
                $().UItoTop({easingType: 'easeOutQuart'});
            });
        </script>
    </head>
    <body class="page1" id="top">


        <%!
            public class fillData {

                String password = "";
                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String loginPassword = "quantummechanics@007";
                Connection connection = null;
                ResultSet r = null;
                PreparedStatement statement = null;
                PreparedStatement statement3 = null;
                PreparedStatement statement4 = null;
                PreparedStatement getState = null;

                public fillData() {
                    try {
                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        //statement = connection.prepareStatement("INSERT INTO (?)_places(state,city,place,description) " + "VALUES(?,?,?,?)");
                        getState = connection.prepareStatement("SELECT State FROM india_states_cities WHERE 1 group by State");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet states() {
                    try {
                        r = getState.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return r;
                }

                public int alter(String type) {
                    int result = 0;
                    String query = "ALTER TABLE " + type + "_places ADD COLUMN comfort varchar(11)";
                    String query2 = "ALTER TABLE " + type + "_places ADD COLUMN child varchar(11)";
                    try {
                        statement3 = connection.prepareStatement(query);
                        statement4 = connection.prepareStatement(query2);
                        result = statement3.executeUpdate();
                        result = statement4.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }

                public int fill(String type, String state, String city, String place, String description, String comfort, String child) {
                    int r1 = 0;
                    try {
                        city = city.replace("'", "''");
                        place = place.replace("'", "''");
                        description = description.replace("'", "''");
                        String query = "INSERT INTO " + type + "_places(state,city,place,description,comfort,child) VALUES(" + "'" + state + "'," + "'" + city + "'," + "'" + place + "'," + "'" + description + "'," + "'" + comfort + "'," + "'" + child + "')";
                        /*statement.setString(1, type);
                        statement.setString(2, state);
                        statement.setString(3, city);
                        statement.setString(4, place);
                        statement.setString(5, description);*/
                        statement = connection.prepareStatement(query);
                        System.out.println(statement.toString());
                        r1 = statement.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return r1;
                }
            }

            public class crawlPlaces {

                public String[] cPlace, cCity, cDes;
                public int c = 0;

                public crawlPlaces(String url) {
                    int i = 0, j = 0;
                    Document doc;
                    try {
                        doc = Jsoup.connect(url).get();
                        Elements anchor3 = doc.select("figcaption");
                        Elements anchors1 = doc.select("figcaption a");
                        Elements anchors = doc.select("figcaption p");
                        Elements anchors2 = doc.select("section ");

                        for (Element anchor31 : anchors2) {
                            if ("t-count".equals(anchor31.attr("class"))) {
                                //System.out.println(anchor2.text());
                                String page = anchor31.text();
                                c = Integer.parseInt(page.replaceAll("[\\D]", ""));
                                //System.out.println(c + "");
                            }
                        }
                        cCity = new String[anchors1.size()];
                        for (Element anchor1 : anchors1) {
                            if (!"".equals(anchor1.attr("title"))) {

                                cCity[i] = anchor1.attr("title");
                                //System.out.println(name[i]);
                                i++;
                            }
                        }
                        i = 0;
                        cPlace = new String[anchors.size()];
                        for (Element anc : anchor3) {
                            Elements a = anc.getElementsByTag("section");
                            for (Element an : a) {
                                if ("".equals(an.attr("class"))) {
                                    if (an.text() != null) {
                                        cPlace[i] = an.text();
                                        i++;
                                        break;//System.out.println(an.text());
//break;
                                    }//cPlace[i] = an.text();i++;break;
                                } else {
                                    if (an.text() != null) {
                                        cPlace[i] = cCity[i];
                                        i++;//System.out.println("city");
                                        break;
                                    }
//cPlace[i] = "city";i++;
                                }
//System.out.println(an.text());}
                            }
                        }

                        i = 0;
                        cDes = new String[anchors.size()];

                        for (Element anchor : anchors) {
                            //if ("price".equals(anchor.attr("class").trim())) {

                            cDes[i] = anchor.text();
                            //System.out.println(anchor.text());
                            i++;
                            //} 
                        }
                    } catch (IOException ex) {
                        Logger.getLogger(crawlPlaces.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }

            public class Form {

                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String password = "";

                Connection connection = null;
                PreparedStatement statement = null;
                PreparedStatement newStatement = null;
                PreparedStatement ns = null;
                PreparedStatement ns1 = null;
                PreparedStatement ns2 = null;
                PreparedStatement ns3 = null;
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

                public int updatetable(String type[]) {
                    String q = new String();
                    String q1 = new String();
                    String q2 = new String();
                    String q3 = new String();
                    int result = 0;
                    for (int i = 0; i < type.length; i++) {
                        q = "Update " + type[i].replace(" ", "_").toLowerCase() + "_places SET comfort='1' WHERE id%3=1 \n";
                        q1 = "Update " + type[i].replace(" ", "_").toLowerCase() + "_places SET comfort='2' WHERE id%3=0; \n";
                        q2 = "Update " + type[i].replace(" ", "_").toLowerCase() + "_places SET comfort='3' WHERE id%3=2; \n";
                        q3 = "UPDATE " + type[i].replace(" ", "_").toLowerCase() + "_places SET child = 1 WHERE 1; \n";

                        System.out.println(q);
                        try {
                            ns = connection.prepareStatement(q);
                            ns1 = connection.prepareStatement(q1);
                            ns2 = connection.prepareStatement(q2);
                            ns3 = connection.prepareStatement(q3);
                            result = ns.executeUpdate();
                            result = ns1.executeUpdate();
                            result = ns2.executeUpdate();
                            result = ns3.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    return result;
                }

                public ResultSet getPlaces(String type[], String comfort, String adult, String children, String s, int len) {
//ResultSet r = null;
                    String table = new String();
                    String n = "SELECT * FROM ";
                    String t[] = type;
                    for (int j = 0; j < len; j++) {
                        if (j + 1 == len) {
                            String place = type[j].replace(" ", "_");
                            n = n + place.toLowerCase() + "_places";
                            n = n + " Where ";
                            n = n + "comfort=";
                            n = n + "'" + comfort + "' ORDER by state";
                        } else {
                            String place = type[j].replace(" ", "_");
                            n = n + place.toLowerCase() + "_places";
                            n = n + " Where ";
                            n = n + "comfort=";
                            n = n + "'" + comfort + "' UNION ";
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
            String comfort = new String();
            String username = new String();
            String destination = new String();
            String shopping = new String();
            String historical = new String();
            String romantic = new String();
            String religious = new String();
            String adult = new String();
            String children = new String();
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
                    //out.print(val + "\n");
                }
                if (request.getParameter("Comfort") != null) {
                    comfort = request.getParameter("Comfort");

                    //out.print(comfort);
                }
                if (request.getParameter("Adults") != null) {
                    adult = request.getParameter("Adults");
                }
                if (request.getParameter("Children") != null) {
                    children = request.getParameter("Children");
                }

            }

            Form form = new Form();
//result=form.setActors(username,destination,shopping,historical,romantic,religious);

            String place = new String();
            if (request.getParameter("destination") != null) {
                place = request.getParameter("destination");
                // place = place.toLowerCase();
            }
            Form get = new Form();
            int len = type.length;
            //int k = get.updatetable(type);
            ResultSet places = get.getPlaces(type, comfort, adult, children, place, len);
            len--;
            if (places == null) {

            }
            /*int u = 0;
            fillData f = new fillData();
            String state = new String();
            for (int j = 0; j < type.length; j++) {
                String theme = type[j].replace(" ", "-").toLowerCase();
                String column = type[j].replace(" ", "_").toLowerCase();
                ResultSet states = f.states();
                // f.alter(column);
                while (states.next()) {
                    //System.out.println(j +  " " +  states.getString("State") + " " +type[j]);
                    //state = "himachal-pradesh";
                    state = states.getString("State");
                    String s = state.toLowerCase();
                    s = state.replace(" ", "-");

                    String url = "http://www.india.com/travel/discover/state-" + s + "/theme-" + theme + "/";
                    crawlPlaces c = new crawlPlaces(url);

                    for (int i = 0; i < c.cCity.length; i++) {
                        Random random = new Random(System.nanoTime() % 100000);
                        int randomInt = random.nextInt(10) % 3;
                        //System.out.println(randomInt+"");
                        String city = new String();
                        String places1 = new String();
                        String des = new String();
                        city = c.cCity[i];
                        places1 = c.cPlace[i];
                        des = c.cDes[i];
                        String child = "1";
                        String rnt = new String();
                        rnt = randomInt + "";
                        if (state.equals("Goa")) {
                            child = "0";
                        }
                        u = f.fill(column, state, city, places1, des, rnt, child);

                    }
                    c.c -= 10;
                    if (c.c > 0) {
                        String url2 = "http://www.india.com/travel/discover/state-" + s + "/theme-" + theme + "/" + "page/2/";
                        crawlPlaces c2 = new crawlPlaces(url2);
                        for (int i = 0; i < c2.cCity.length; i++) {
                            Random random = new Random(System.nanoTime() % 100000);
                            int randomInt = random.nextInt(10) % 3;
                            String city2 = new String();
                            String places2 = new String();
                            String des2 = new String();
                            city2 = c2.cCity[i];
                            places2 = c2.cPlace[i];
                            des2 = c2.cDes[i];
                            String child = "1";
                            String rnt = new String();
                            rnt = randomInt + "";
                            if (state.equals("Goa")) {
                                child = "0";
                            }
                            //System.out.println("RESULT" + c.cCity[i] + c.cPlace[i] + c.cDes[i]);
                            u = f.fill(column, state, city2, places2, des2, rnt, child);
                        }
                    }
                    c.c -= 10;
                    if (c.c > 0) {
                        String url3 = "http://www.india.com/travel/discover/state-" + s + "/theme-" + theme + "/" + "page/3/";
                        crawlPlaces c3 = new crawlPlaces(url3);
                        for (int i = 0; i < c3.cCity.length; i++) {
                            Random random = new Random(System.nanoTime() % 100000);
                            int randomInt = random.nextInt(10) % 3;
                            String city3 = new String();
                            String places3 = new String();
                            String des3 = new String();
                            city3 = c3.cCity[i];
                            places3 = c3.cPlace[i];
                            des3 = c3.cDes[i];
                            String child = "1";
                            String rnt = new String();
                            rnt = randomInt + "";
                            if (state.equals("Goa")) {
                                child = "0";
                            }
                            //System.out.println("RESULT" + c.cCity[i] + c.cPlace[i] + c.cDes[i]);
                            u = f.fill(column, state, city3, places3, des3, rnt, child);
                        }
                    }
                }

            }*/
        %>
        <header role="banner">
            <!--<nav class="main-nav">
                        <ul>
                                <li><a class="cd-signin" href="#0">Sign in</a></li>
                                <li><a class="cd-signup" href="#0">Sign up</a></li>
                        </ul>
                </nav>-->
            <div class="container_12">
                <div class="grid_12">
                    <div class="menu_block">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">
                                <li class="current"><a href="index.jsp">HOME</a></li>
                                <li><a href="tours/index.jsp">HOT TOURS</a></li>
                                <li><a href="index-2.html">SPECIAL OFFERS</a></li>
                                <li><a href="index-3.html">BLOG</a></li>
                                    <% HttpSession login = request.getSession();
                                        if (login.getAttribute("name") == null) {
                                    %>
                                <li><a href="#0" onclick="display();">
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
                </div>
                <div class="grid_12">
                    <h1>
                        <a href="../index.jsp">
                            <img src="../images/logo1.png" alt="Your Happy Family">
                        </a>
                    </h1>
                </div>
            </div>
        </header>
                                <div id="pop" >

            <div id="signup">
                <div class="">
                    <button class="noBorder" id="title" onclick="signup();">Login</button><span>Sign up</span>
                    <button class="noBorder" id="close" onclick="document.getElementById('pop').style.display = 'none'" onmouseover="red();" onmouseout="black();">X</button><br><br>
                </div>

                <!--<div id="error">Email already exists</div>-->

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
                    <button class="noBorder" id="title" onclick="login();">Sign up</button><span class="col1">Login</span>
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
                    <button class="btnSignup btn1" name="login" onmouseover="red();" >Login</button>           


                </form>

            </div>

        </div>
                                <div class="slider_wrapper" id ="slide">
            <div id="camera_wrap" class="">
                <div data-src="../images/slide.jpg">
                    <div class="caption fadeIn">
                        <h2>New Delhi</h2>
                        <div class="price">
                            FROM
                            <span>Rs. 3,999</span>
                        </div>
                        <a href="packages/index.jsp?destination=delhi&submit=1">LEARN MORE</a>
                    </div>
                </div>
                <div data-src="../images/slide1.jpg">
                    <div class="caption fadeIn">
                        <h2>Karnataka</h2>
                        <div class="price">
                            FROM
                            <span>Rs. 6,999</span>
                        </div>
                        <a href="packages/index.jsp?destination=karnataka&submit=1">LEARN MORE</a>
                    </div>
                </div>
                <div data-src="../images/slide2.jpg">
                    <div class="caption fadeIn">
                        <h2>Maharashtra</h2>
                        <div class="price">
                            FROM
                            <span>Rs. 4,999</span>
                        </div>
                        <a href="packages/index.jsp?destination=maharashtra&submit=1">LEARN MORE</a>
                    </div>
                </div>
            </div>
        </div>
                                <div class="content">
                                    <div class="container_12">
                                        <div class="clear"></div>
                                        <div class="grid_8 prefix_1">

                
                <% while (places.next()) {
                        if ("0".equals(children)) {%>
                        <div class="block2">
                            <img src="../images/article-default.jpg" class="img_inner fleft">
                            <div class="extra_wrapper"><br><a href="../description/index.jsp?city=<%= places.getString("city")%>&place=<%=places.getString("place")%>" ><h2><%= places.getString("city")%></h2></a><%= places.getString("place")%>
                                
                                <%= places.getString("state")%>
                    
                                </div>
                        </div>
                <% } else if (!"0".equals(children) && "1".equals(places.getString("child"))) {%>
                <div class="block2">
                            <img src="../images/article-default.jpg" class="img_inner fleft">
                            <div class="extra_wrapper"><br><a href="../description/index.jsp?city=<%= places.getString("city")%>&place=<%=places.getString("place")%>" ><h2><%= places.getString("city")%></h2></a><%= places.getString("place")%>
                                
                                <%= places.getString("state")%>
                                <%= places.getString("description")%>
                                </div>
                        </div>
                <%}

                    }%>
                </div>
            </div>
                                    </div>
                                </div>
           
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
