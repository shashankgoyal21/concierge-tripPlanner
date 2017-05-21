<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
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
        <link rel="stylesheet" href="../css/style.css"><link rel="stylesheet" href="../css/india.css">
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
        <title>Description</title>
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
            public class describe {

                int result = 0;
                String jdbcUrl = "jdbc:mysql://localhost/concierge";
                String username = "root";
                String password = "";
                Connection connection = null;
                PreparedStatement statement = null;
                PreparedStatement statement2 = null;
                ResultSet resultSet = null;

                public describe() {
                    try {
                        connection = DriverManager.getConnection(jdbcUrl, username, password);
                        statement = connection.prepareStatement("Select * from description WHERE place=" + "(?)");
                        statement2 = connection.prepareStatement("INSERT INTO description(banner,tableText,imagesLink,para,visit,todo,articles,rPara,rSection,place,imgAlt) VALUES" + "(?,?,?,?,?,?,?,?,?,?,?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet check(String place) {
                    try {
                        statement.setString(1, place.replace(" ", "-").toLowerCase());
                        resultSet = statement.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }

                public int setActors(String banner, String tableText, String imagesLink, String para, String visit, String todo, String articles, String rPara, String rSection, String place, String imgAlt) {
                    try {
                        statement2.setString(1, banner);
                        statement2.setString(2, tableText);
                        statement2.setString(3, imagesLink);
                        statement2.setString(4, para);
                        statement2.setString(5, visit);
                        statement2.setString(6, todo);
                        statement2.setString(7, articles);
                        statement2.setString(8, rPara);
                        statement2.setString(9, rSection);
                        statement2.setString(10, place);
                        statement2.setString(11, imgAlt);
                        result = statement2.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }
            }

            public class crawler1 {

                String banner = "0", tableText = "0", imagesLink = "0", para = "0", visit = "0", todo = "0", articles = "0", imgAlt = "0";
                String rPara = "0", rSection = "0";
                String[] clss = {"fa fa-plane", "fa fa-train", "fa fa-road"};
                int i = 0;

                public crawler1(String place) {
                    String p = place.replace(" ", "-").toLowerCase();
                    String url = "http://www.india.com/travel/" + p;
                    Document doc;
                    try {

                        doc = Jsoup.connect(url).get();
Elements div = doc.select("div");
                        Elements banners = doc.select("ul");
                        Elements texts = doc.select("section");
                        Elements tables = doc.select("table");
                        Elements images = doc.select("li");
                        Elements placesToVisit = doc.select("figure");
                        for (Element bannerImage : div) {
                            if ("sizeholder".equals(bannerImage.attr("id"))) {
                                banner = bannerImage.child(0).attr("id");
System.out.println(banner);
                            }
                        }

                        for (Element text : texts) {
                            if ("profile-text bio eventtracker".equals(text.attr("class"))) {
                                para = text.toString();
//System.out.println(para);
                                break;
                            }
                        }
                        para = "0";
                        i = 0;
                        for (Element table : tables) {
                            //out.print("dfasdf");
                            if ("table tblbesttime".equals(table.attr("class"))) {
                                //System.out.println(table.toString());

                                for (i = 1; i < 13; i++) {
                                    if (table.child(0).child(i).child(1).childNodeSize() > 0) {

                                        table.child(0).child(i).child(1).child(0).append("<i class='fa fa-calendar' ></i>");

                                    }
                                }

                                tableText = table.toString();
                            } else {
                                tableText = "0";
                            }
                        }
                        i = 0;
                        for (Element image : images) {
                            if ("inslider eventtracker".equals(image.parent().attr("class"))) {
                                if (i == 0) {
                                    imagesLink = image.child(0).child(0).attr("data-lazy-src");
                                    imgAlt = image.child(0).child(0).attr("alt");
                                    imgAlt = imgAlt.replace("-", " ").toUpperCase();
                                    i = i + 1;
                                } else {
                                    imagesLink = imagesLink + "," + image.child(0).child(0).attr("data-lazy-src");
                                    imgAlt = imgAlt + image.child(0).child(0).attr("alt").replace("-", " ").toUpperCase();
                                    if (imagesLink.lastIndexOf(".jpg") > 9500) {
                                        break;
                                    }
                                }
                            }
                            imgAlt = "0";
                        }
                        i = 0;

                        for (Element figure : placesToVisit) {
                            if ("PlacesToVisit".equals(figure.parent().parent().parent().attr("data-event-sub-cat"))) {
                                figure.child(0).child(0).attr("src", figure.child(0).child(0).attr("data-lazy-src"));
                                Element s = figure.parent().parent().parent();//.child(0).remove();
                                s.child(0).remove();
                                s = figure.parent().parent().parent();
                                //    s.child(3).remove();
                                //            figure.parent().parent().parent().child(0).remove();
                                visit = figure.parent().parent().parent().toString();
                            } else if ("ThingsToDo".equals(figure.parent().parent().parent().attr("data-event-sub-cat"))) {
                                figure.child(0).child(0).attr("src", figure.child(0).child(0).attr("data-lazy-src"));
                                /*figure.parent().parent().parent().child(0).remove();
                                figure.parent().parent().parent().child(1).remove();*/
                                Element s = figure.parent().parent().parent();//.child(0).remove();
                                s.child(0).remove();
                                //s//.child(3).remove();
                                todo = figure.parent().parent().parent().toString();
                            } else if ("Articles".equals(figure.parent().attr("data-event-sub-cat"))) {
                                figure.child(0).child(0).attr("src", figure.child(0).child(0).attr("data-lazy-src"));
                                //System.out.println(figure.parent().childNodeSize());
                                figure.parent().getElementsByAttributeValue("class", "view-all-place eventtracker").remove();
                                articles = figure.parent().toString();
                            }
                        }
                    } catch (IOException ex) {
                        Logger.getLogger(crawler1.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }

                public void reach(String place) {
                    String p = place.replace(" ", "-").toLowerCase();
                    String url = "http://www.india.com/travel/" + p + "/how-to-reach";
                    Document doc;
                    try {
                        doc = Jsoup.connect(url).get();
                        Elements paras = doc.select("p");
                        Elements sections = doc.select("section");

                        for (Element para : paras) {
                            if ("how-to-reach eventtracker".equals(para.parent().attr("class"))) {
                                //System.out.println(para.toString());
                                if (!"".equals(para.ownText())) {
                                    rPara = para.toString();
                                    //System.out.println(para.ownText());
                                    break;
                                }
                                /*else if ("desttext text_how_to_reach".equals(para.attr("class"))) {
                                    rPara = para.toString();
System.out.println(para.ownText());
                                    break;
                                }*/
                            }
                        }
                        i = 0;
                        for (Element section : sections) {
                            if (section.attr("class").equals("visit-list mt20") && !section.child(0).attr("class").equals("nodata")) {
                                for (i = 0; i < 3; i++) {
                                    section.child(i).child(0).child(0).addClass(clss[i]);
                                }
                                rSection = section.toString();
                                break;

                            } else {
                                rSection = section.ownText();
                            }
                        }

                    } catch (IOException ex) {
                        Logger.getLogger(crawler1.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }

        %>




        <%
            String place1 = request.getParameter("place");
            String city = request.getParameter("city");
            if (place1.contains("in")) {
                place1 = place1.split(" in ")[1];
            } else if (place1.contains("at")) {
                place1 = place1.split(" at ")[1];
            }
            describe d = new describe();
            ResultSet r1 = d.check(place1);
            if (!r1.last()) {
                //if (city.equals(place1)) {
                crawler1 c = new crawler1(place1);
                c.reach(place1);
                int result1 = d.setActors(c.banner, c.tableText, c.imagesLink, c.para, c.visit, c.todo, c.articles, c.rPara, c.rSection, place1, c.imgAlt);
                //}
                if(result1 == 1){
                    response.setIntHeader("Refresh", 1);
                }
            } else {
                r1 = d.check(place1);
                if (r1.last()) {
                    //System.out.println("dfaddf");
                }
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
                                    <% HttpSession login = request.getSession();
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
        <div id="pop">
            <div id="signup">
                <div class="">
                    <button class="noBorder" id="title" onclick="signup();">Login</button><span>Sign up</span>
                    <button class="noBorder" id="close" onclick="document.getElementById('pop').style.display = 'none'" onmouseover="red();" onmouseout="black();">X</button><br><br>
                </div>



                <form id="bookingForm1" method="post" action="../index.jsp">
                    <input type="text" name="name"  required placeholder="Full Name" data-constraints='@NotEmpty @Required @AlphaSpecial'/>
                    </br><input type="email" name="email" required placeholder="Email" data-constraints="@NotEmpty @Required @Email"/>
                    <input type="password" required name="password" placeholder="Password"/>
                    <input type="password" required name="confirmPassword" placeholder="Confirm Password"/>

                    <button class="btnSignup btn1" name="signup">Sign up</button>
                </form>
            </div>
            <div id="login">
                <div class="">
                    <button class="noBorder" id="title" onclick="login();">Sign up</button><span>Login</span>
                    <button class="noBorder" id="close" onclick="document.getElementById('pop').style.display = 'none'" onmouseover="red();" onmouseout="black();">X</button><br><br>
                </div>

                <form id="bookingForm2" method="post" action="../index.jsp">
                    <div class="fl1"></div>


                    <input type="email" required name="email" placeholder="Email" />

                    <div class="clear"></div>
                    <div class="f11"></div>
                    <input type="password" name="password" placeholder="Password"/>



                    <button name="login" class="btnSignup btn1" onmouseover="red();" >Login</button>           


                </form>

            </div>

        </div>
        <div class="slider_wrapper">
            <div id="camera_wrap" class="">
                <%
                                String[] pics1 = r1.getString("imagesLink").split(",");
                                String[] alt1 = r1.getString("imgAlt").split(",");
                                for (int j = 0; j < pics1.length; j++) {%>
                            <div data-src="<%= pics1[j]%>">

                    <div class="caption fadeIn">

                    </div>
                </div>
                            <%}
                            %>
                
                <div data-src="<%= r1.getString("banner")%>">


                </div>
            </div>
        </div> 
        <div class="content">
            <div class="container_12">
                <% //r1.getString("para") %>
                <header class="o-header">
                    <nav class="o-header-nav">
                    </nav>
                    <div class="o-container">
                        <h1 class="o-header__title"><%= r1.getString("place").toUpperCase() + " TOURISM"%></h1>
                    </div>
                </header>
                <br><br><br><br><br>
                <div id="showImage">
                    <div class=""><button class="noBorder" id="closeImg" onclick="document.getElementById('showImage').style.display = 'none'" >X</button></div>
                    <br><br><br><br><div class="slider_wrapper"> 
                        <div id="camera_wrap" class="">
                            <%
                                String[] pics = r1.getString("imagesLink").split(",");
                                String[] alt = r1.getString("imgAlt").split(",");
                                for (int j = 0; j < pics.length; j++) {%>
                            <div data-src="../images/slide.png">

                            </div>
                            <%}
                            %>
                        </div> 
                    </div>
                </div>
                <main class="o-main">
                    <div class="o-container">

                        <div class="o-section">
                            <div id="tabs" class="c-tabs no-js">
                                <div class="c-tabs-nav">
                                    <a href="#" class="c-tabs-nav__link is-active">
                                        <i class="fa fa-home"></i>
                                        <span>Places to Visit</span>
                                    </a>
                                    <a href="#" class="c-tabs-nav__link">
                                        <i class="fa fa-file"></i>
                                        <span>Things to do</span>
                                    </a>
                                    <a href="#" class="c-tabs-nav__link">
                                        <i class="fa fa-photo"></i>
                                        <span>Photos</span>
                                    </a>
                                    <!--<a href="#" class="c-tabs-nav__link">
                                      <i class="fa fa-calendar"></i>
                                      <span>Calendar</span>
                                    </a>-->
                                    <a href="#" class="c-tabs-nav__link">
                                        <i class="fa fa-map-marker"></i>
                                        <span>Hot to reach</span>
                                    </a><a href="#" class="c-tabs-nav__link">
                                        <i class="fa fa-newspaper-o"></i>
                                        <span>Articles</span>
                                    </a>
                                </div>
                                <div class="c-tab is-active">
                                    <div class="c-tab__content">

                                        <%
                                            if (!"0".equals(r1.getString("visit"))) {
                                                out.println(r1.getString("visit"));
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="c-tab">
                                    <div class="c-tab__content">
                                        <!-- Things to do--><%
                                            if (!"0".equals(r1.getString("todo"))) {
                                                out.println(r1.getString("todo"));
                                            } else {%>
                                        <p>This content is currently unavailable</p>
                                        <%}
                                        %>
                                    </div>
                                </div>
                                <div class="c-tab">
                                    <div class="c-tab__content">
                                        <!-- PHOTOS -->
                                        <%
                                            String[] photos1 = r1.getString("imagesLink").split(",");
                                            for (int i = 0; i < photos1.length; i++) {%>
                                        <img src="<% out.println(photos1[i]);%>" alt="<%= r1.getString("place")%>" >
                                        <%}
                                        %>

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
                                        <%
                                            if (!"0".equals(r1.getString("rPara"))) {
                                                out.println(r1.getString("rPara"));
                                                out.println(r1.getString("rSection"));
                                            } else {%>
                                        <p>This content is currently unavailable</p>
                                        <%}
                                        %>
                                        <!--  how to reach -->
                                    </div>
                                </div>
                                <div class="c-tab">
                                    <div class="c-tab__content">
                                        <%if (!"0".equals(r1.getString("articles"))) {
                                                out.println(r1.getString("articles"));
                                            } else {
                                        %><p>This content is currently unavailable</p><%
                                            }%>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="o-section">
                            <div id="github-icons"></div>
                        </div>
                    </div>
                </main>   

                <%
                    if (!"0".equals(r1.getString("tableText"))) {
                %>
                <h2> Best Time to Visit</h2>
                <%
                        out.println(r1.getString("tableText"));
                    } else {
                    }
                %>
            </div>
        </div>
        <% }

        %>
        <script src="../tabs.js"></script>
        <script>

                        var myTabs = tabs({
                            el: '#tabs',
                            tabNavigationLinks: '.c-tabs-nav__link',
                            tabContentContainers: '.c-tab'
                        });
                        myTabs.init();

        </script>
        <script type="text/javascript">
            function showImg() {
                document.getElementById("showImage").style.display = "block";

            }
            function closeImg() {
                document.getElementById("showImage").style.display = "none";
            }
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
