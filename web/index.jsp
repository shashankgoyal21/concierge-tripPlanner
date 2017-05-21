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
<html lang="en">
    <head>
        <title>Concierge</title>
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no" />

        <meta name="viewport" content="width=device-width,initial-scale=1.0">

        <meta name="description" content="Responsive tabbed layout component built with some CSS3 and JavaScript">
        <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>

        <!-- Gem style --><link rel="stylesheet" href="font-awesome.min.css">
        <link rel="stylesheet" href="style.min.css">
        <link rel="apple-touch-icon" href="/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="/favicon.png">
        <link rel="icon" href="images/favicon.ico">
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.js" type="text/javascript"></script>
        <script src="//www.google-analytics.com/analytics.js"></script>
        <script src="https://storage.googleapis.com/code.getmdl.io/1.0.5/material.min.js"></script>
        <script src="js/jquery.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <link rel="stylesheet" href="css/camera.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/navcss.css" >
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="booking/css/booking.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="../js1/main.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.2.1.js"></script>
        <script src="js/script.js"></script>
        <script src="js/superfish.js"></script>

        <script src="js/jquery.ui.totop.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/owl.carousel.js"></script>
        <script src="js/camera.js"></script>
        <!--[if (gt IE 9)|!(IE)]><!-->
        <script src="js/jquery.mobile.customized.min.js"></script>
        <!--<![endif]-->
        <script src="booking/js/booking.js"></script>
        <link rel="stylesheet" href="../css1/reset.css"> <!-- CSS reset -->
        <link rel="stylesheet" href="../css1/style.css">
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
        <!--[if lt IE 8]>
        <div style=' clear: both; text-align:center; position: relative;'>
                <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
                        <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
                </a>
        </div>
        <![endif]-->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <link rel="stylesheet" media="screen" href="css/ie.css">
        <![endif]-->
    </head>
    <body class="page1" id="top">
        <%
            int r = 0;
            String userName = new String();
            String userId = new String();
            String userEmail = new String();
            if (request.getParameter("signup") != null) {
                String email = new String();
                String fullName = new String();
                String pass = new String();
                String cpass = new String();
                email = request.getParameter("email");
                fullName = request.getParameter("name");
                pass = request.getParameter("password");
                cpass = request.getParameter("confirmPassword");
                UserLogin user = new UserLogin();
                if (pass.equals(cpass)) {
                    r = user.setActors(fullName, email, pass);
                } else {

                }
            }
            if (request.getParameter("login") != null) {
                System.out.println("fdsafad");
                String loginEmail = new String();
                String loginPassword = new String();
                loginEmail = request.getParameter("email");
                loginPassword = request.getParameter("password");
                UserLogin user = new UserLogin();
                System.out.println("getting Result");
                ResultSet loginResult = user.getActors(loginEmail, loginPassword);
                while (loginResult.next()) {
                    if ((loginResult.getString("email")).equals(loginEmail)
                            && (loginResult.getString("password")).equals(loginPassword)) {
                        HttpSession loginSession = request.getSession();
                        userName = loginResult.getString("name");
                        userId = loginResult.getString("id");
                        userEmail = loginResult.getString("email");
                        loginSession.setAttribute("id", userId);
                        loginSession.setAttribute("email", userEmail);
                        loginSession.setAttribute("name", userName);
                    }
                }
            }


        %>
        <%!
            public class confirmEmail {

                public boolean sendEmail(String from, String password, String message, String to) {
                    String host = "smtp.gmail.com";
                    Properties props = System.getProperties();
                    //props.put("mail.smtp.starttls.enable","true");
                    props.put("mail.smtp.host", host);
                    props.put("mail.smtp.user", from);
                    props.put("mail.smtp.password", password);
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.debug", "true");
                    props.put("mail.smtp.socketFactory.port", "587");
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.socketFactory.fallback", "false");
//SMTPAuthenticator auth = new SMTPAuthenticator();
                    Session session = Session.getDefaultInstance(props, null);
                    MimeMessage mimeMessage = new MimeMessage(session);
                    try {
                        mimeMessage.setFrom(new InternetAddress(from));
                        InternetAddress toAddress = new InternetAddress(to);
                        mimeMessage.addRecipient(RecipientType.TO, toAddress);
                        mimeMessage.setSubject("Confirm your CONCIERGE Account ");
                        mimeMessage.setText(message);
                        Transport transport = session.getTransport("smtps");
                        transport.connect(host, from, password);
                        transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
                        transport.close();
                        return true;
                    } catch (MessagingException ex) {
                        Logger.getLogger(confirmEmail.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    return false;
                }
            }

            public class crawler {

                //public String s = "Print ho jaa";
                public String[] detail, name, place, price, info, inclusion;

                public crawler(String url) {

                    int i = 1, j = 0;
                    Document doc;
                    try {
                        doc = Jsoup.connect(url).get();
                        Elements anchors1 = doc.select("h3");
                        Elements anchors = doc.select("div");
                        Elements anchors2 = doc.select("span");
                        Elements anchors3 = doc.select("div");
                        Elements anchors4 = doc.select("button");
                        inclusion = new String[anchors3.size()];
                        for (Element anchor3 : anchors3) {
                            String s = "allHolidayThemes" + i;
                            if (s.equals(anchor3.attr("id"))) {
                                inclusion[j] = anchor3.text();
                                //System.out.println(inclusion[j]);
                                i++;
                                j++;
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
                                System.out.println(info[j]);
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
                        name = new String[anchors1.size()];
                        for (Element anchor1 : anchors1) {
                            if (!"".equals(anchor1.attr("title"))) {

                                name[i] = anchor1.attr("title");
                                //System.out.println(name[i]);
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
                        statement = connection.prepareStatement("INSERT INTO trips(destination,name,place,price,detail,info,inclusion)" + " VALUES(?,?,?,?,?,?,?)");
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

                public int insertCrawler(String des, String[] name, String[] place, String[] price, String[] detail, String[] info, String[] inclusion) {
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
                                result1 = statement.executeUpdate();
                            }
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
        %>
        <%            int result = 0;
            String[] name, detail, price, place;
            if (request.getParameter("submit") != null) {
                System.out.println("fadfadfaf");
                String destination = new String();
                if (request.getParameter("destination") != null) {
                    if (request.getParameter("submit") != null) {
                        System.out.println("fadfadfaf22222222222222222");
                        destination = request.getParameter("destination");
                        destination = destination.toLowerCase();
                        String name1 = "https://www.yatra.com/india-tour-packages/holidays-in-" + destination;
                        crawler c = new crawler(name1);

                        booking b = new booking();
                        ResultSet r1 = b.checkDes(destination);
                        //while(r.next()){System.out.println("33333333333");}
                        if (!r1.last()) {
                            result = b.insertCrawler(destination, c.name, c.place, c.price, c.detail, c.info, c.inclusion);
                        }
                    }
                }
            }

        %>
        <!--==============================header=================================-->
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
                                    <a href="user.jsp"><%=login.getAttribute("name")%></a>
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
                        <a href="index.html">
                            <img src="images/logo1.png" alt="Your Happy Family">
                        </a>
                    </h1>
                </div>
            </div>
        </header>

        <%!
            public class UserLogin {

                String password = "";
                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String loginPassword = "quantummechanics@007";
                Connection connection = null;
                PreparedStatement statement = null;
                PreparedStatement loginStatement = null;
                PreparedStatement checkUser = null;
                ResultSet resultSet = null;

                public UserLogin() {
                    try {
                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        statement = connection.prepareStatement("INSERT INTO users(name,email,password,confirmNumber,verified)" + " VALUES(?,?,?,?,?)");
                        //callCrawler(url);
                        System.out.println("executing query");
                        loginStatement = connection.prepareStatement("Select * from users Where email = " + "(?)" + "and "
                                + "password = " + "(?)");
                        checkUser = connection.prepareStatement("Select email from users WHERE email = " + "(?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setActors(String name, String email, String password) {
                    int result = 0;
                    try {

                        ResultSet existingUser = getUser(email);
                        if (!existingUser.last()) {

                            Random random = new Random(System.nanoTime() % 100000);
                            int randomInt = random.nextInt(1000000000);
                            statement.setString(1, name);
                            statement.setString(2, email);
                            statement.setString(3, password);
                            statement.setInt(4, randomInt);
                            statement.setInt(5, 0);
                            result = statement.executeUpdate();
                            if (result == 1) {
                                confirmEmail ce = new confirmEmail();
                                ce.sendEmail("conciergeemailconfirmation@gmail.com", loginPassword, "localhost:8080/conceirge/confirmEmail/index.jsp?confirm=" + randomInt + "&email=" + email, email);
                            }
                        } else {
                            System.out.println("User already exists");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }

                public ResultSet getActors(String email, String password) {
                    try {
                        loginStatement.setString(1, email);
                        loginStatement.setString(2, password);
                        resultSet = loginStatement.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }

                public ResultSet getUser(String email) {
                    try {
                        checkUser.setString(1, email);
                        resultSet = checkUser.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }
            }
        %>


        <div id="pop" >

            <div id="signup">
                <div class="">
                    <button class="noBorder" id="title" onclick="signup();">Login</button><span>Sign up</span>
                    <button class="noBorder" id="close" onclick="document.getElementById('pop').style.display = 'none'" onmouseover="red();" onmouseout="black();">X</button><br><br>
                </div>

                <!--<div id="error">Email already exists</div>-->

                <form id="bookingForm1" method="post" action="index.jsp">
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

                <form id="bookingForm2" method="post" action="index.jsp">
                    
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
                <div data-src="images/slide.jpg">
                    <div class="caption fadeIn">
                        <h2>New Delhi</h2>
                        <div class="price">
                            FROM
                            <span>Rs. 3,999</span>
                        </div>
                        <a href="packages/index.jsp?destination=delhi&submit=1">LEARN MORE</a>
                    </div>
                </div>
                <div data-src="images/slide1.jpg">
                    <div class="caption fadeIn">
                        <h2>Karnataka</h2>
                        <div class="price">
                            FROM
                            <span>Rs. 6,999</span>
                        </div>
                        <a href="packages/index.jsp?destination=karnataka&submit=1">LEARN MORE</a>
                    </div>
                </div>
                <div data-src="images/slide2.jpg">
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
        <!--==============================Content=================================-->
        <div id="content" class="content">
            <div class="container_12">
                <header class="o-header">
                    <nav class="o-header-nav">

                    </nav>
                </header>

                <main class="o-main">
                    <div class="o-container">

                        <div class="o-section">
                            <div id="tabs" class="c-tabs no-js">
                                <div class="c-tabs-nav">
                                    <a href="#" class="c-tabs-nav__link is-active">
                                        <i class="fa fa-chevron-up"></i>
                                        <span>Booking Form</span>
                                    </a>
                                    <a href="#" class="c-tabs-nav__link">
                                        <i class="fa fa-book"></i>
                                        <span>Packages</span>
                                    </a>
                                    <a href="#" class="c-tabs-nav__link">
                                        <i class="fa fa-plane"></i>
                                        <span>Flights</span>
                                    </a>
                                    <!--<a href="#" class="c-tabs-nav__link">
                                      <i class="fa fa-calendar"></i>
                                      <span>Calendar</span>
                                    </a>-->
                                    <a href="#" class="c-tabs-nav__link">
                                        <i class="fa fa-home"></i>
                                        <span>SEARCH HOTELS</span>
                                    </a>
                                </div>
                                <div class="c-tab is-active">

                                    <div class="c-tab__content">

                                        <form id="bookingForm"  method="post" action="booking-form/">


                                            <!--<input name="destination" id="destination" placeHolder="Destination" type="text" data-constraints='@NotEmpty @Required @AlphaSpecial'>
                                            <div id ="suggestion"></div>
                                            -->
                                            <!--<div class="tmInput">
                                                    <input name="Country" placeHolder="Country:" type="text" data-constraints="@NotEmpty @Required">
                                            </div>-->

                                            <div class="fl1">
                                                <!--<div class="tmInput">
                                                    <input name="Email" placeHolder="Email:" type="text" data-constraints="@NotEmpty @Required @Email">
                                                </div>-->
                                                <!--<div class="tmInput mr0">
                                                        <input name="Hotel" placeHolder="Hotel:" type="text" data-constraints="@NotEmpty @Required">
                                                </div>-->
                                            </div>
                                            <div class="clear"></div>
                                            <!--<strong>Check-in</strong>
                                            <label class="tmDatepicker">
                                                <input type="text" name="Check-in" placeHolder='10/05/2014' data-constraints="@NotEmpty @Required @Date">
                                            </label>
                                            <div class="clear"></div>
                                            <strong>Check-out</strong>
                                            <label class="tmDatepicker">
                                                <input type="text" name="Check-out" placeHolder='20/05/2014' data-constraints="@NotEmpty @Required @Date">
                                            </label>-->
                                            <div class="clear"></div><br>
                                            <div class="tmRadio">
                                                <p>Comfort</p>
                                                <input name="Comfort" type="radio" id="tmRadio0" value="2" data-constraints='@RadioGroupChecked(name="Comfort", groups=[RadioGroup])' checked/>
                                                <span>Cheap</span>
                                                <input name="Comfort" type="radio" id="tmRadio1" value="1" data-constraints='@RadioGroupChecked(name="Comfort", groups=[RadioGroup])' />
                                                <span>Standard</span>
                                                <input name="Comfort" type="radio" id="tmRadio2" value="0" data-constraints='@RadioGroupChecked(name="Comfort", groups=[RadioGroup])' />
                                                <span>Lux</span>
                                            </div>
                                            <div class="clear"></div>
                                            <div class="fl1 fl2">
                                                <em>Adults</em>
                                                <select name="Adults" class="tmSelect auto" data-class="tmSelect tmSelect2" data-constraints="">
                                                    <option>1</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                </select>
                                                <div class="clear"></div>
                                                <!--<em>Rooms</em>
                                                <select name="Rooms" class="tmSelect auto" data-class="tmSelect tmSelect2" data-constraints="">
                                                    <option>1</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                </select>-->
                                            </div>
                                            <div class="fl1 fl2">
                                                <em>Children</em>
                                                <select name="Children" class="tmSelect auto" data-class="tmSelect tmSelect2" data-constraints="">
                                                    <option>0</option>
                                                    <option>0</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                </select>
                                            </div>
                                            <div class="clear"></div>

                                            <div class="tmCheckbox">
                                                <p>Type</p>
                                                <input name="places" type="checkbox" value="Adventure" id="tmCheck2"  />
                                                <span>Adventure</span>
                                                <input name="places" type="checkbox" value="Architecture" id="tmCheck2"  />
                                                <span>Architecture</span>
                                                <input name="places" type="checkbox" value="Art Galleries" id="tmCheck2"  />
                                                <span>Art Galleries</span>
                                                <input name="places" type="checkbox" value="Bazar" id="tmCheck2"  />
                                                <span>Bazar</span>
                                                <input name="places" type="checkbox" value="Beaches" id="tmCheck2"  />
                                                <span>Beaches</span>
                                                <input name="places" type="checkbox" value="Caves" id="tmCheck2"  />
                                                <span>Caves</span>
                                                <input name="places" type="checkbox" value="Churches" id="tmCheck2"  />
                                                <span>Churches</span>
                                                <input name="places" type="checkbox" value="Cuisine" id="tmCheck2"  />
                                                <span>Cuisine</span>
                                                <input name="places" type="checkbox" value="Cultural" id="tmCheck2"  />
                                                <span>Cultural</span>
                                                <input name="places" type="checkbox" value="Deserts" id="tmCheck2"  />
                                                <span>Deserts</span>
                                                <input name="places" type="checkbox" value="Events" id="tmCheck2"  />
                                                <span>Events</span>
                                                <input name="places" type="checkbox" value="Forts" id="tmCheck2"  />
                                                <span>Forts</span>
                                                <input name="places" type="checkbox" value="Ghats" id="tmCheck2"  />
                                                <span>Ghats</span>
                                                <input name="places" type="checkbox" value="Grounds" id="tmCheck2"  />
                                                <span>Grounds</span>
                                                <input name="places" type="checkbox" value="Hill Stations" id="tmCheck2"  />
                                                <span>Hill Stations</span>
                                                <input name="places" type="checkbox" value="Historical" id="tmCheck0" />
                                                <span>Historical</span>
                                                <input name="places" type="checkbox" value="Industrial" id="tmCheck2"  />
                                                <span>Industrial</span>
                                                <input name="places" type="checkbox" value="Islands" id="tmCheck2"  />
                                                <span>Islands</span>
                                                <input name="places" type="checkbox" value="Lakes" id="tmCheck2"  />
                                                <span>Lakes</span>
                                                <input name="places" type="checkbox" value="Leisure" id="tmCheck2"  />
                                                <span>Leisure</span>
                                                <input name="places" type="checkbox" value="Monastries" id="tmCheck2"  />
                                                <span>Monasteries</span>
                                                <input name="places" type="checkbox" value="Mosques" id="tmCheck2"  />
                                                <span>Mosques</span>
                                                <input name="places" type="checkbox" value="Mountains" id="tmCheck2"  />
                                                <span>Mountains</span>
                                                <input name="places" type="checkbox" value="Museums" id="tmCheck2"  />
                                                <span>Museum</span>
                                                <input name="places" type="checkbox" value="Nature" id="tmCheck2"  />
                                                <span>Nature</span>
                                                <input name="places" type="checkbox" value="Nightlife" id="tmCheck2"  />
                                                <span>Nightlife</span>
                                                <input name="places" type="checkbox" value="Palaces" id="tmCheck2"  />
                                                <span>Palaces</span>
                                                <input name="places" type="checkbox" value="Parks" id="tmCheck2"  />
                                                <span>Parks</span>
                                                <input name="places" type="checkbox" value="Passes" id="tmCheck2"  />
                                                <span>Passes</span>
                                                <input name="places" type="checkbox" value="Recreation" id="tmCheck2"  />
                                                <span>Recreation</span>
                                                <input name="places" type="checkbox" value="Relaxation" id="tmCheck2"  />
                                                <span>Relaxation</span>
                                                <input name="places" type="checkbox" value="Religious" id="tmCheck2"  />
                                                <span>Religious</span>
                                                <input name="places" type="checkbox" value="Sanctuaries" id="tmCheck2"  />
                                                <span>Sanctuaries</span>
                                                <input name="places" type="checkbox" value="Shopping" id="tmCheck2"  />
                                                <span>Shopping</span>
                                                <input name="places" type="checkbox" value="Temples" id="tmCheck2"  />
                                                <span>Temples</span>
                                                <input name="places" type="checkbox" value="Tombs" id="tmCheck2"  />
                                                <span>Tombs</span>
                                                <input name="places" type="checkbox" value="Valleys" id="tmCheck2"  />
                                                <span>Valleys</span>
                                                <input name="places" type="checkbox" value="Waterfalls" id="tmCheck2"  />
                                                <span>Waterfalls</span>
                                                <input name="places" type="checkbox" value="Wildlife" id="tmCheck2"  />
                                                <span>Wildlife</span>
                                            </div>


                                            <div class="clear"></div>
                                            <!--<div class="tmTextarea">
                                                    <textarea name="Message" placeHolder="Message" data-constraints='@NotEmpty @Required @Length(min=20,max=999999)'></textarea>
                                            </div>-->

                                            <input type="submit" class="btn1 noBorder" name="bookingForm" value="Search">
                                        </form>
                                    </div>
                                </div>
                                <div class="c-tab">
                                    <div class="c-tab__content">
                                        <form id="bookingForm3" method="POST" action="packages/">
                                            <input name="destination" id="destination" placeHolder="Destination" type="text" data-constraints='@NotEmpty @Required @AlphaSpecial'>
                                            <select >
                                                <option>
                                                    
                                                </option>
                                            </select>
                                            <div class="fl1">
                                                <!--<div class="tmInput">
                                                    <input name="Email" placeHolder="Email:" type="text" data-constraints="@NotEmpty @Required @Email">
                                                </div>-->
                                                <!--<div class="tmInput mr0">
                                                        <input name="Hotel" placeHolder="Hotel:" type="text" data-constraints="@NotEmpty @Required">
                                                </div>-->
                                            </div>
                                            <div class="clear"></div>

                                            <!--<strong>Check-in</strong>
                                            <label class="tmDatepicker">
                                                <input type="text" name="Check-in" placeHolder='10/05/2014' data-constraints="@NotEmpty @Required @Date">
                                            </label>
                                            <div class="clear"></div>
                                            <strong>Check-out</strong>
                                            <label class="tmDatepicker">
                                                <input type="text" name="Check-out" placeHolder='20/05/2014' data-constraints="@NotEmpty @Required @Date">
                                            </label>-->
                                            <div class="clear"></div>
                                            <br>
                                            <input type="submit" class="btn1 noBorder" name="submit" value="Search">
                                        </form>
                                    </div>
                                </div>
                                <div class="c-tab">
                                    <div class="c-tab__content">
                                        <script type="text/javascript" src="//api.skyscanner.net/api.ashx?key=hvgfgmnvugt6trfgujbvcredres5"></script>
                                        <script type="text/javascript">
                        skyscanner.load("snippets", "2");
                        function main() {
                            var snippet = new skyscanner.snippets.SearchPanelControl();
                            snippet.setShape("box300x250");
                            snippet.setCulture("en-GB");
                            snippet.setCurrency("INR");
                            snippet.setMarket("IN");
                            snippet.setColourScheme("steelgreylight");
                            snippet.setProduct("flights", "1");

                            snippet.draw(document.getElementById("snippet_searchpanel"));
                        }
                        skyscanner.setOnLoadCallback(main);
                                        </script>
                                        <div id="snippet_searchpanel" style="width: auto; height:auto;"></div>
                                    </div>
                                </div>
                                <!--<div class="c-tab">
                                  <div class="c-tab__content">
                                    <h2>Stay Busy</h2>
                                    <p>Calendar ipsum dolor sit amet, consectetur adipisicing elit. Ipsam quo minus voluptate unde tempore eveniet consequuntur in, quod animi libero rem similique pariatur quos, et eum nisi ducimus, architecto voluptatibus!</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto aspernatur natus dolorem fuga cumque optio saepe corrupti earum. Ipsam quaerat asperiores similique omnis excepturi temporibus ab eum magnam ipsa, odio.</p>
                                  </div>
                                </div>-->
                                <div class="c-tab">
                                    <div class="c-tab__content">

                                        <script src="https://sbhc.portalhc.com/173962/SearchBox/383175"></script>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="o-section">
                            <div id="github-icons"></div>
                        </div>
                    </div>
                </main>
                <!--<div class="grid_4">
                    <div class="banner">
                        <img src="images/ban_img1.jpg" alt="">
                        <div class="label">
                            <div class="title">Manali</div>
                            <div class="price">FROM<span>Rs. 4,999</span></div>
                            <a href="#">LEARN MORE</a>
                        </div>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="banner">
                        <img src="images/ban_img2.jpg" alt="">
                        <div class="label">
                            <div class="title">GOA</div>
                            <div class="price">FROM<span>Rs. 7,499</span></div>
                            <a href="#">LEARN MORE</a>
                        </div>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="banner">
                        <img src="images/ban_img3.jpg" alt="">
                        <div class="label">
                            <div class="title">Dalhousie</div>
                            <div class="price">FROM<span>Rs. 7,299</span></div>
                            <a href="#">LEARN MORE</a>
                        </div>
                    </div>
                </div>-->
                <div class="clear"></div>







                <div class="grid_6">
                    <!-- <h3>Booking Form</h3>
                     <form id="bookingForm"  method="post" action="index.jsp">
                         <div class="fl1">
                             <div class="tmInput">
                                 <input name="destination" id="destination" placeHolder="Destination" type="text" data-constraints='@NotEmpty @Required @AlphaSpecial'>
                                 <div id ="suggestion"></div>
                             </div>
                    <!--<div class="tmInput">
                            <input name="Country" placeHolder="Country:" type="text" data-constraints="@NotEmpty @Required">
                    </div>-->
                    <!-- </div>
                     <div class="fl1">
                         <div class="tmInput">
                             <input name="Email" placeHolder="Email:" type="text" data-constraints="@NotEmpty @Required @Email">
                         </div>
                    <!--<div class="tmInput mr0">
                            <input name="Hotel" placeHolder="Hotel:" type="text" data-constraints="@NotEmpty @Required">
                    </div>-->
                    <!--  </div>
                      <div class="clear"></div>
                      <strong>Check-in</strong>
                      <label class="tmDatepicker">
                          <input type="text" name="Check-in" placeHolder='10/05/2014' data-constraints="@NotEmpty @Required @Date">
                      </label>
                      <div class="clear"></div>
                      <strong>Check-out</strong>
                      <label class="tmDatepicker">
                          <input type="text" name="Check-out" placeHolder='20/05/2014' data-constraints="@NotEmpty @Required @Date">
                      </label>
                      <div class="clear"></div><br>
                      <div class="tmRadio">
                          <p>Comfort</p>
                          <input name="Comfort" type="radio" id="tmRadio0" data-constraints='@RadioGroupChecked(name="Comfort", groups=[RadioGroup])' checked/>
                          <span>Cheap</span>
                          <input name="Comfort" type="radio" id="tmRadio1" data-constraints='@RadioGroupChecked(name="Comfort", groups=[RadioGroup])' />
                          <span>Standard</span>
                          <input name="Comfort" type="radio" id="tmRadio2" data-constraints='@RadioGroupChecked(name="Comfort", groups=[RadioGroup])' />
                          <span>Lux</span>
                      </div>
                      <div class="clear"></div>
                      <div class="fl1 fl2">
                          <em>Adults</em>
                          <select name="Adults" class="tmSelect auto" data-class="tmSelect tmSelect2" data-constraints="">
                              <option>1</option>
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                          </select>
                          <div class="clear"></div>
                          <em>Rooms</em>
                          <select name="Rooms" class="tmSelect auto" data-class="tmSelect tmSelect2" data-constraints="">
                              <option>1</option>
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                          </select>
                      </div>
                      <div class="fl1 fl2">
                          <em>Children</em>
                          <select name="Children" class="tmSelect auto" data-class="tmSelect tmSelect2" data-constraints="">
                              <option>0</option>
                              <option>0</option>
                              <option>1</option>
                              <option>2</option>
                          </select>
                      </div>
                      <div class="clear"></div>

                      <div class="tmCheckbox">
                          <p>Type</p>
                          <input name="type" type="checkbox" id="tmCheck0" />
                          <span>Historical</span>
                          <input name="type" type="checkbox" id="tmCheck1"  />
                          <span>Shopping</span>
                          <input name="type" type="checkbox" id="tmCheck2"  />
                          <span>Hill Stations</span>
                      </div>


                      <div class="clear"></div>
                    <!--<div class="tmTextarea">
                            <textarea name="Message" placeHolder="Message" data-constraints='@NotEmpty @Required @Length(min=20,max=999999)'></textarea>
                    </div>-->

                    <!--  <input type="submit" class="btn1 noBorder" name="submit" value="Search">
                  </form>-->

                </div>
                <!--<div class="grid_5 prefix_1">
                    <h3>Welcome</h3>
                    <img src="images/page1_img1.jpg" alt="" class="img_inner fleft">
                    <div class="extra_wrapper">
                        <p>Lorem ipsum dolor sit ere amet, consectetur ipiscin.</p>
                        In mollis erat mattis neque facilisis, sit ametiol
                    </div>
                    <div class="clear cl1"></div>
                    <p>Find the detailed description of this <span class="col1"><a href="http://blog.templatemonster.com/free-website-templates/" rel="dofollow">freebie</a></span> at TemplateMonster blog.</p>
                    <p><span class="col1"><a href="http://www.templatemonster.com/category/travel-website-templates/" rel="nofollow">Travel Website Templates</a></span> category offers you a variety of designs that are perfect for travel sphere of business.</p>
                    Proin pharetra luctus diam, a scelerisque eros convallis
                    <h4>Clientsâ Quotes</h4>
                    <blockquote class="bq1">
                        <img src="images/page1_img2.jpg" alt="" class="img_inner noresize fleft">
                        <div class="extra_wrapper">
                            <p>Duis massa elit, auctor non pellentesque vel, aliquet sit amet erat. Nullam eget dignissim nisi, aliquam feugiat nibh. </p>
                            <div class="alright">
                                <div class="col1">Miranda Brown</div>
                                <a href="#" class="btn">More</a>
                            </div>
                        </div>
                    </blockquote>
                </div>-->
                <div class="grid_12">
                    <h3 class="head1">Latest Deals</h3><br>
                </div>
                <div class="grid_4">
                    <div class="banner">
                        <img src="images/ban_img1.jpg" alt="">
                        <div class="label">
                            <div class="title">Manali</div>
                            <div class="price">FROM<span>Rs. 4,999</span></div>
                            <a href="packages/index.jsp?destination=manali&submit=1">LEARN MORE</a>
                        </div>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="banner">
                        <img src="images/ban_img2.jpg" alt="">
                        <div class="label">
                            <div class="title">GOA</div>
                            <div class="price">FROM<span>Rs. 7,499</span></div>
                            <a href="packages/index.jsp?destination=goa&submit=1">LEARN MORE</a>
                        </div>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="banner">
                        <img src="images/ban_img3.jpg" alt="">
                        <div class="label">
                            <div class="title">Dalhousie</div>
                            <div class="price">FROM<span>Rs. 7,299</span></div>
                            <a href="packages/index.jsp?destination=dalhousie&submit=1">LEARN MORE</a>
                        </div>
                    </div>
                </div><!--<div class="grid_4">
                    <div class="block1">
                        <time datetime="2014-01-01">10<span>Jan</span></time>
                        <div class="extra_wrapper">
                            <div class="text1 col1"><a href="#">Aliquam nibh</a></div>
                            Proin pharetra luctus diam, any scelerisque eros convallisumsan. Maecenas vehicula egestas
                        </div>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="block1">
                        <time datetime="2014-01-01">21<span>Jan</span></time>
                        <div class="extra_wrapper">
                            <div class="text1 col1"><a href="#">Etiam dui eros</a></div>
                            Any scelerisque eros vallisumsan. Maecenas vehicula egestas natis. Duis massa elit, auctor non
                        </div>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="block1">
                        <time datetime="2014-01-01">15<span>Feb</span></time>
                        <div class="extra_wrapper">
                            <div class="text1 col1"><a href="#">uamnibh Edeto</a></div>
                            Ros convallisumsan. Maecenas vehicula egestas venenatis. Duis massa elit, auctor non
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
        <!--==============================footer=================================-->
        <footer id="foot">
            <div class="container_12">
                <div class="grid_12">
                    <div class="socials">
                        <a href="#" class="fa fa-facebook"></a>
                        <a href="#" class="fa fa-twitter"></a>
                        <a href="#" class="fa fa-google-plus"></a>
                    </div>
                    <div class="copy">
                        Concierge (c) 2017 
                    </div>
                </div>
            </div>
        </footer>
        <!--
        <link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css"/>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
        <script src="js/jquery.ui.autocomplete.html.js"></script>-->
        <script src="tabs.js"></script>

        <script>

                        var myTabs = tabs({
                            el: '#tabs',
                            tabNavigationLinks: '.c-tabs-nav__link',
                            tabContentContainers: '.c-tab'
                        });
                        myTabs.init();

                        $(function () {
                            $('#bookingForm').bookingForm({
                                ownerEmail: '#'
                            });
                        });
                        $(function () {
                            $('#bookingForm input, #bookingForm textarea').placeholder();
                        });
        </script>
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