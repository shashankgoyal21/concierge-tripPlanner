<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Date" %>
<%@page import = "java.io.IOException"%>
<%@page import ="java.util.logging.Level"%>
<%@page import ="org.jsoup.nodes.Element"%>
<%@page import = "org.jsoup.select.Elements"%>
<%@page import ="java.util.logging.Logger" %>
<%@page import = "org.jsoup.Jsoup"%>
<%@page import = "org.jsoup.nodes.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("com.mysql.jdbc.Driver");%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no" />

        <meta name="viewport" content="width=device-width,initial-scale=1.0">

        <meta name="description" content="Responsive tabbed layout component built with some CSS3 and JavaScript">
        <link rel="stylesheet" href="../font-awesome.css">
        <link rel="stylesheet" href="../style.min.css">
        <link rel="apple-touch-icon" href="/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="/favicon.png">
        <link rel="icon" href="images/favicon.ico">
        <link rel="shortcut icon" href="images/favicon.ico" />
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
        <title>Packages</title>
    </head>
    <body  class="page1" id="top" style="background: #FFF">
        <%
            HttpSession login = request.getSession();
            if (login.getAttribute("name") == null) {
        %><script type="text/javascript">document.getElementById("pop").style.display = 'block';</script>
        <%}


        %>
        <%!
            public class booking {

                String[] detail, name, place, price;
                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String password = "";
                Connection connection = null;
                PreparedStatement statement = null;
                PreparedStatement statement2 = null;
                ResultSet resultSet = null;

                public booking() {
                    try {
                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        statement = connection.prepareStatement("INSERT INTO trips(destination,name,place,price,detail,info,inclusion,image)" + " VALUES(?,?,?,?,?,?,?,?)");
                        statement2 = connection.prepareStatement("SELECT * from trips where destination = " + "(?)");//callCrawler(url);

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet checkDes(String des) {
                    try {
                        statement2.setString(1, des);
                        resultSet = statement2.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }

                public int insertCrawler(String des,String[] name1, String[] name, String[] place, String[] price, String[] detail, String[] info, String[] inclusion, String[] imgLink) {
                    int result1 = 0;
                    try {

                        for (int i = 0; i < name.length; i++) {
                            if (name[i] != null) {
                                statement.setString(1, des);
                                statement.setString(2, name[i]);
                                statement.setString(3, place[i]);
                                statement.setString(4, price[i]);
                                statement.setString(5, detail[i]);
                                statement.setString(6, info[i]);
                                statement.setString(7, inclusion[i]);
                                statement.setString(8, imgLink[i]);
                                result1 = statement.executeUpdate();
                            }else if(name1[i]!=null){statement.setString(1, des);
                                statement.setString(2, name1[i]);
                                statement.setString(3, place[i]);
                                statement.setString(4, price[i]);
                                statement.setString(5, detail[i]);
                                statement.setString(6, info[i]);
                                statement.setString(7, inclusion[i]);
                                statement.setString(8, imgLink[i]);
                                result1 = statement.executeUpdate();}
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result1;
                }

                public int setActors(String name) {
                    int result = 0;
                    try {
                        statement.setString(1, name);
                        result = statement.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }
            }

            public class crawler {

                //public String s = "Print ho jaa";
                public String[] detail, name, place, price, info, inclusion, imgLink,name1;
                String div = new String();

                public crawler(String url) {

                    int i = 1, j = 0;
                    Document doc;
                    try {
                        doc = Jsoup.connect(url).get();
                        //System.out.println(doc.toString());
                        Elements anchors1 = doc.select("a");
                        Elements anchors = doc.select("div");
                        Elements anchors2 = doc.select("span");
                        Elements anchors3 = doc.select("div");
                        Elements anchors4 = doc.select("button");
                        Elements anchors5 = doc.select("img");
Elements anchors6 = doc.select("h3");

                        inclusion = new String[anchors3.size()];
                        for (Element anchor3 : anchors3) {
                            if (anchor3.attr("class").equals("tab-content")) {
                                div = anchor3.toString();
                            }
                            String s = "allHolidayThemes" + i;
                            if (s.equals(anchor3.attr("id"))) {
                                inclusion[j] = anchor3.text();
                                //System.out.println(inclusion[j]);
                                i++;
                                j++;
                            }
                        }

                        i = 0;
                        name = new String[anchors1.size()];
                        for (Element anchor1 : anchors1) {
                            if ("ellipsis width109 listWidth300 txt-cap line-height-20".equals(anchor1.attr("class")) && !anchor1.ownText().contains("@")) {

                                name[i] = anchor1.attr("title");
                                System.out.println(name[i]);
                                i++;
                            }
                        }

name1 = new String[anchors1.size()];
    for (Element anchor6 : anchors6) {
                            if ("ellipsis width109 listWidth300 txt-cap line-height-20".equals(anchor6.attr("class")) && !anchor6.ownText().contains("@")) {

                                name1[i] = anchor6.attr("title");
                                System.out.println(name1[i]);
                                i++;
                            }
                        }


                        i = 0;
                        j = 0;
                        imgLink = new String[anchors5.size()];
                        for (Element anchor5 : anchors5) {
                            if (i < 10) {
                                if (j == 0) {
                                    j++;
                                } else {
                                    imgLink[i] = anchor5.attr("data-src");
                                    i++;
                                }
                            }
                        }
                        i = 0;
                        j = 0;
                        info = new String[anchors4.size()];
                        for (Element anchor4 : anchors4) {
                            if ("btn btn-blue font-12 mtop10 fr btn-fixed eventTrackable".equals(anchor4.attr("class"))) {
                                String s = anchor4.attr("onclick");
                                s = s.substring(22);
                                s = s.replace("'", "");
                                info[i] = s;
                                //System.out.println(info[j]);
                                i++;
                            }
                        }

                        i = 0;
                        detail = new String[anchors2.size()];
                        for (Element anchor2 : anchors2) {
                            if ("mtop10 clearfix fl color-777 line-height-20 mul-line-ellipsis".equals(anchor2.attr("class"))) {
                                //System.out.println(anchor2.text());

                                detail[i] = anchor2.text();
                                i++;
                            }
                        }

                        i = 0;

                        place = new String[anchors.size()];
                        price = new String[anchors.size()];
                        for (Element anchor : anchors) {
                            if ("price".equals(anchor.attr("class").trim())) {

                                place[i] = anchor.text();
                                //System.out.println(anchor.text());
                                i++;
                            } else if ("mtop2 font-13 ellipsis".equals(anchor.attr("class").trim())) {

                                price[j] = anchor.text();
                                //System.out.println(anchor.text());
                                j++;
                            }
                        }

                    } catch (IOException ex) {
                        Logger.getLogger(crawler.class.getName()).log(Level.SEVERE, null, ex);
                    }

                }

            }

            public class form {

                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String password = "";
                ResultSet result = null;
                Connection connection = null;
                PreparedStatement statement = null;

                public form() {

                    try {

                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        statement = connection.prepareStatement(
                                "SELECT * FROM trips WHERE destination=" + "(?)");

//System.out.println(newStatement.toString());
                    } catch (SQLException e) {

                        e.printStackTrace();

                    }

                }

                public ResultSet getPackages(String state) {
                    try {
                        statement.setString(1, state);
                        result = statement.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }
            }


        %>

        <%            int result = 0;
            if (request.getParameter("submit") != null) {
                if (request.getParameter("destination") != null) {

                    String destination = request.getParameter("destination");
                    destination = destination.toLowerCase();
                    //System.out.println(destination);
                    form f = new form();
                    ResultSet packages = f.getPackages(destination);
                    if (packages.last()) {
                        //System.out.println("dsfasdf");
                        packages = f.getPackages(destination);
        %>
        <header>
            <div class="container_12">
                <div class="grid_12">
                    <div class="menu_block">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">
                                <li class="current"><a href="../index.jsp">HOME</a></li>
                                <li><a href="../tours/index.jsp">HOT TOURS</a></li>
                                <li><a href="index-2.html">SPECIAL OFFERS</a></li>
                                <li><a href="index-3.html">BLOG</a></li>
                                    <%
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

        </div><!--
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
              </div>--><br><br><br><br>
        <div claas="content">
            <div class="container_12">
                <br><br>
                <div class="grid_12">
                    <h2 class="head1"style='font-size:40px;'><%= destination + " Packages"%></h2>
                </div><br><br><br><br><br>
                <%
                    int count = 0;
                    while (packages.next()) {
                        
                        String send =packages.getString("info").split(".htm?")[1];
                        count++;%>
                <div class="grid_4">
                    <div class="banner">
                        <img src="<%= packages.getString("image")%>" alt="">

                        <h1><%= packages.getString("name")%></h1>
                        <div class="price"><span><%= "  " + packages.getString("place")%></span></div>
                        <div class="price"><%= packages.getString("inclusion")%></div>
                        <a href="../book/index.jsp<%= send %>" target="_blank" onclick="<%  %>">LEARN MORE</a>

                    </div>
                    <br><br><br>
                </div>

                <%if ((count % 3) == 0) {%>

                <% }
                   }%>

            </div>
        </div>
        <%
        } else {
            String name1 = "https://www.yatra.com/india-tour-packages/holidays-in-" + destination.replace(" ","-");
            //System.out.println(name1);

            crawler c = new crawler(name1);
            booking b = new booking();
            result = b.insertCrawler(destination,c.name1, c.name, c.place, c.price, c.detail, c.info, c.inclusion, c.imgLink);
if(result ==1){response.setIntHeader("Refresh", 1);}
            packages = f.getPackages(destination);

            while (packages.next()) {%>

        <%}%>

        <%}
                }
            }
        %>

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
                document.getElementById('close').style.color = 'RED';
            }
            function black() {
                document.getElementById('close').style.color = 'BLACK';
            }
        </script>
    </body>
</html>
