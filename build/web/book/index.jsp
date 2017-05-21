<%-- 
    Document   : index
    Created on : Apr 20, 2017, 7:39:25 PM
    Author     : Shashank
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.json.Json"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Date" %>
<%@page import="org.json.simple.JSONObject"%><%@ page import="java.io.*"%>
<%@ page import="org.json.simple.JSONValue"%>
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
    <%!
        public class bookPage {

            String s = new String();
            boolean S = true;
            String images = "null";
            String themes = "";
            String destinationName = "", destinationCode = "", destinationDuration = "", connectingSegmentInOrder = "null", transportRef = "", accomodationRef = "", hotelNames = "", hotelDesc = "",
                    ratingImage = "", address = "", packageTitle, hotelCheckInDay = "", hotelImg = "";
            String dcName = "", dcCode = "", dcIsSelected = "", departureCityCode = "", inclusionTypes = "", meals = "", transfers = "", sightseeing = "", iTitle = "",
                    iDescription = "";
            int i = 10, days = 0, segment = 0;
            String customizable = "", packageType = "", travelBy = "", overview = "", durationNight = "", durationDays = "", holdAndPayValue = "",
                    isHoldAndPayEnabled = "", departureCityName = "",
                    startFromPrice = "", strikeOffPrice = "", inclusions = "", exclusions = "", cancelPolicy = "", paymentPolicy = "";

            public bookPage(String url) {

                Document doc;
                try {
                    doc = Jsoup.connect(url).timeout(60000).maxBodySize(0).get();
                    Elements heads = doc.select("script");

                    for (Element head : heads) {
                        Element script = head;
                        s = head.toString();
                        if (s.contains("secureHost")) {
                            //System.out.println(s);
//FileInputStream in = new FileInputStream("../script.txt");
                            FileOutputStream out = new FileOutputStream("../script.txt");
                            try {
                                byte[] value = s.getBytes();
                                out.write(value);
                                break;
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                            FileInputStream in = new FileInputStream("../script.txt");
                        }
                        i++;
                    }
                    int c = 0;
                    i = 0;
                    FileReader f = new FileReader(new File("../script.txt"));
                    BufferedReader br = new BufferedReader(f);
                    String line;
                    while ((line = br.readLine()) != null) {

                        if (line.contains("largeimg") && line.contains("url")) {
                            line = line.trim();
                            line = line.substring(8, line.length() - 2);

                            if (c == 0) {
                                images = line;
                                c++;
                            } else {
                                images = images + "," + line;
                            }
                        }

                        if (line.contains("meals\":")) {
                            days++;
                            //System.out.println(days + "");
                            if (!line.contains("null")) {
                                line = br.readLine();
                                line = line.trim();
                                line = line.substring(1, line.length() - 1);
                                meals = meals + "&&" + line;

                                //System.out.println("meals " + meals);
                            } else {
                                meals = meals + "&&" + null;
                                //System.out.println(meals);
                            }
                        }
                        if (line.contains("transfers")) {
                            if (!line.contains("null")) {
                                line = br.readLine();
                                line = line.trim();
                                line = line.substring(1, line.length() - 1);
                                transfers = transfers + "&&" + line;
                                //System.out.println("transfers " + line);
                            } else {
                                transfers = transfers + "&&" + null;

                                //System.out.println(line);
                            }
                        }

                        if (line.contains("transportRef")) {
                            if (!line.contains("null")) {
                                //line = br.readLine();
                                line = line.trim();
                                line = line.substring(1, line.length() - 1);
                                transportRef = transportRef + "&&" + line;
                                //System.out.println("transfers " + line);
                            } else {
                                transportRef = transportRef + "&&" + null;

                                //System.out.println(line);
                            }
                        }
                        if (line.contains("accomodationRef")) {
                            if (!line.contains("null")) {
                                //line = br.readLine();
                                line = line.trim();
                                line = line.substring(1, line.length() - 1);
                                accomodationRef = accomodationRef + "&&" + line;
                                //System.out.println("transfers " + line);
                            } else {
                                accomodationRef = accomodationRef + "&&" + null;

                                //System.out.println(line);
                            }
                        }
                        if (line.contains("sightseeings")) {
                            if (!line.contains("]")) {
                                line = br.readLine();
                                line = line.trim();
                                line = line.substring(1, line.length() - 2);
                                sightseeing = sightseeing + "&&" + line;
                                //System.out.println("signtseeing " + line);
                            } else {
                                sightseeing = sightseeing + "&&" + null;
                                //System.out.println(line);
                            }
                        }
                        if (line.contains("itineraries") && !line.contains("where")) {
                            if (!line.contains("null")) {
                                line = br.readLine();
                                line = line.trim();
                                line = line.substring(10, line.length() - 2);
                                iTitle = iTitle + "&&" + days + "&&" + line;

                                //System.out.println("intineraries title " + line);
                                line = br.readLine();
                                line = line.trim();
                                line = line.substring(16, line.length() - 1);

                                iDescription = iDescription + "&&" + days + "&&" + line;
                                //System.out.println("itineraries description " + line);
                            } else {
                                iTitle = iTitle + "&&" + days + "&&" + null;
                                iDescription = iDescription + "&&" + days + "&&" + null;

                                //  System.out.println(line);
                            }
                        }

                        if (line.contains("packageTitle") && line.contains(":")) {
                            line = line.substring(19, line.length() - 2);
                            packageTitle = line;
                        }
                        if (line.contains("packageAccomodation")) {
                            hotelCheckInDay = "";
                            while (true) {
                                if (line.contains("#") && line.contains(":")) {
                                    line = line.split("#")[1];
                                    line = line.substring(0, line.length() - 4);
                                    hotelCheckInDay = hotelCheckInDay + "&&" + line;
                                    System.out.println(hotelCheckInDay);
                                }
                                if (line.contains("hotelName") && line.contains(":")) {
                                    line = line.substring(20, line.length() - 2);
                                    hotelNames = hotelNames + "&&" + line;
                                    //System.out.println(hotelNames);
                                }
                                if (line.contains("hotelDesc") && line.contains(":")) {
                                    line = line.substring(20, line.length() - 2);
                                    hotelDesc = hotelDesc + "&&" + line;
                                    //System.out.println(hotelDesc);
                                }
                                if (line.contains("imageUrl")) {
                                    line = line.substring(19, line.length() - 2);
                                    hotelImg = hotelImg + "&&" + line;
                                }
                                if (line.contains("ratingImage") && line.contains(":")) {
                                    line = line.substring(22, line.length() - 2);
                                    ratingImage = ratingImage + "&&" + line;
                                    //System.out.println(ratingImage);
                                }
                                if (line.contains("address") && line.contains(":")) {
                                    line = line.substring(18, line.length() - 2);
                                    address = address + "&&" + line;
//System.out.println(address);
                                }
                                if (line.contains("destinationVsDaysComponents\":")) {
                                    break;
                                }
                                line = br.readLine();
                            }
                        }

                        if (line.contains("tourType\"")) {
                            line = br.readLine().trim();
                            if (line.contains("tourTypeDesc\"")) {
                                line = line.trim();
                                line = line.substring(17, line.length() - 2);
                                customizable = line;
                                //System.out.println("tourTypeDesc " + line);
                                line = br.readLine().trim();
                                line = line.substring(16, line.length() - 2);
                                packageType = line;
                                //System.out.println("packageType " + line);
                                line = br.readLine().trim();
                                line = line.substring(13, line.length() - 2);
                                travelBy = line;
                                //System.out.println("TravelBy " + line);
                                line = br.readLine().trim();
                                line = line.substring(13, line.length() - 2);
                                line = line.replace("\\n", "");
                                line = line.replace("\\t", "");
                                overview = line;
                                //System.out.println("overview " + line);
                                line = br.readLine();
                                line = line.substring(29, line.length() - 1);
                                durationNight = line;
                                //System.out.println("Duration Nights " + line);
                                line = br.readLine();
                                line = line.substring(27, line.length() - 1);
                                durationDays = line;
                                //System.out.println("Duration Days " + line);
                                line = br.readLine();
                                line = br.readLine();
                                line = br.readLine();
                                line = br.readLine();
                                line = line.substring(20, line.length() - 3);
                                holdAndPayValue = line;
                                //System.out.println("Hold and pay Value " + line);
                                line = br.readLine();
                                line = line.substring(25, line.length() - 1);
                                isHoldAndPayEnabled = line;
                                //System.out.println("Enabled " + line);
                                line = br.readLine();
                                line = line.substring(20, line.length() - 3);
                                startFromPrice = line;
                                //System.out.println("Start Price " + line);
                                line = br.readLine();
                                line = line.substring(20, line.length() - 3);
                                strikeOffPrice = line;
                            } else {
                                customizable = "null";
                                line = line.substring(16, line.length() - 2);
                                packageType = line;
                                //System.out.println("packageType " + line);
                                line = br.readLine().trim();
                                line = line.substring(13, line.length() - 2);
                                travelBy = line;
                                //System.out.println("TravelBy " + line);
                                line = br.readLine().trim();
                                line = line.substring(13, line.length() - 2);
                                line = line.replace("\\n", "");
                                line = line.replace("\\t", "");
                                overview = line;
                                //System.out.println("overview " + line);
                                line = br.readLine();
                                line = line.substring(line.length() - 2, line.length() - 1);
                                durationNight = line;
                                //System.out.println("Duration Nights " + line);
                                line = br.readLine();
                                line = line.substring(line.length() - 2, line.length() - 1);
                                durationDays = line;
                                //System.out.println("Duration Days " + line);
                                line = br.readLine();
                                line = br.readLine();
                                line = br.readLine();
                                line = br.readLine();
                                line = line.substring(20, line.length() - 3);
                                holdAndPayValue = line;
                                //System.out.println("Hold and pay Value " + line);
                                line = br.readLine();
                                line = line.substring(25, line.length() - 1);
                                isHoldAndPayEnabled = line;
                                //System.out.println("Enabled " + line);
                                line = br.readLine();
                                line = line.substring(20, line.length() - 3);
                                startFromPrice = line;
                                //System.out.println("Start Price " + line);
                                line = br.readLine();
                                line = line.substring(20, line.length() - 3);
                                strikeOffPrice = line;
                            }
                            //System.out.println("Strike Price " + line);

                        }

                        if (line.contains("packageThemes\":")) {
                            System.out.println("dfadfads");
                            themes = "";
                            line = br.readLine().trim();
                            while (!line.contains("]")) {
                                line = line.replace(",", "");
                                line = line.replace("\"", "");
                                System.out.println(line);
                                //line = line.substring(1, line.length() - 1);
                                themes = themes + "&&" + line;
                                line = br.readLine().trim();
                            }
                            //System.out.println(themes);
                            line = br.readLine();
                            line = line.substring(17, line.length() - 2);
                            line = line.replace("\\n", "");
                            line = line.replace("\\t", "");
                            inclusions = line;
                            System.out.println(inclusions);
                            //line.replace("\\t", "");
                            //System.out.println("inclusions " + line);
                            line = br.readLine();
                            line = line.substring(16, line.length() - 2);
                            line = line.replace("\\n", "");
                            line = line.replace("\\t", "");
                            exclusions = line;
                            //System.out.println("exclusions " + line);
                            line = br.readLine();
                            line = line.substring(25, line.length() - 2);
                            line = line.replace("\\n", "");
                            line = line.replace("\\t", "");
                            cancelPolicy = line;
                            //System.out.println("cancellation Policy " + line);
                            line = br.readLine();
                            line = line.substring(20, line.length() - 2);
                            line = line.replace("\\n", "");
                            line = line.replace("\\t", "");
                            paymentPolicy = line;
                            //System.out.println("Payment Policy " + line);
                        }
                        if (line.contains("packageInclusionTypes") && line.contains("[")) {
                            inclusionTypes = "";
                            line = br.readLine().trim();
                            while (!line.contains("]")) {
                                if (line.contains(",")) {
                                    line = line.substring(1, line.length() - 2);
                                } else {
                                    line = line.substring(1, line.length() - 1);
                                }

                                inclusionTypes = inclusionTypes + "&&" + line;
                                line = br.readLine().trim();
                            }
                        }
                        if (line.contains("departureCities") && line.contains("[")) {
                            dcName = "";
                            dcCode = "";
                            dcIsSelected = "";
                            while (!line.contains("]")) {

                                if (line.contains("\"name\": \"")) {
                                    line = line.substring(9, line.length() - 2);
                                    dcName = dcName + "&&" + line;
                                } else if (line.contains("\"code\": \"")) {
                                    line = line.substring(9, line.length() - 2);
                                    dcCode = dcCode + "&&" + line;
                                } else if (line.contains("\"isSelected\": ")) {
                                    line = line.substring(14);
                                    dcIsSelected = dcIsSelected + "&&" + line;
                                }
                                line = br.readLine().trim();
                            }
                            //System.out.println("Departure Cities Names " + dcName);
                            //System.out.println("Departure Cities Codes " + dcCode);
                            //System.out.println("Departure City Selected " + dcIsSelected);

                            String[] names = dcName.split("&&");
                            String[] codes = dcCode.split("&&");
                            String[] selected = dcIsSelected.split("&&");
//System.out.println(names[1]);
                            for (int x = 0; x < names.length; x++) {
                                if ("true".equals(selected[x])) {
                                    departureCityName = names[x];
                                    departureCityCode = codes[x];
                                    break;
                                }
                            }
                        }
                        if (line.contains("departureCities") && line.contains("null")) {
                            dcName = "null";
                            dcCode = "null";
                            dcIsSelected = "null";
                            departureCityName = "null";
                            departureCityCode = "null";
                        }
                        if (line.contains("destinationDurations\":")) {
                            while (!line.contains("]")) {
                                if (line.contains("destinationName")) {
                                    destinationName = destinationName + "&&" + line.substring(28, line.length() - 2);
                                    line = br.readLine();

                                    destinationCode = destinationCode + "&&" + line.substring(28, line.length() - 2);
                                    line = br.readLine();
                                    destinationDuration = destinationDuration + "&&" + line.substring(21, line.length() - 1);
                                }

                                line = br.readLine();
                            }
//System.out.println("destinationName " +destinationName );
                            System.out.println("destinationCode " + destinationDuration);
                        }
                        if (line.contains("connectingSegmentsInOrder")) {
                            line = br.readLine();
                            line = br.readLine();
                            line = line.substring(34, line.length() - 2);
                            connectingSegmentInOrder = connectingSegmentInOrder + "," + line;
                            line = br.readLine();
                            line = line.substring(32, line.length() - 2);
                            connectingSegmentInOrder = connectingSegmentInOrder + "," + line;
                            line = br.readLine();
                            line = br.readLine();
                            line = br.readLine();
                            line = line.substring(30, line.length() - 2);
                            connectingSegmentInOrder = connectingSegmentInOrder + "," + line;
                            line = br.readLine();
                            line = line.substring(28, line.length() - 2);
                            connectingSegmentInOrder = connectingSegmentInOrder + "," + line;
                            line = br.readLine();
                            line = br.readLine();
                            line = br.readLine();
                            line = br.readLine();
                            line = line.substring(25);
                            connectingSegmentInOrder = connectingSegmentInOrder + "," + line;
                            line = br.readLine();
                            line = br.readLine();
                            line = br.readLine();
                            line = br.readLine();
                            line = br.readLine();
                            line = br.readLine();
                            line = line.substring(24, line.length() - 1);
                            connectingSegmentInOrder = connectingSegmentInOrder + "," + line;
                            connectingSegmentInOrder = connectingSegmentInOrder + "&&";
//System.out.println(connectingSegmentInOrder);
                        }

                    }

//System.out.println(s);                        
//Object obj = JSONValue.parse(responsivedetailslargeimg);    //System.out.println(obj);
                    //JSONObject jsonObject = (JSONObject) obj;
                    //if(jsonObject.isEmpty()){System.out.println("dfadsf");}
//                        System.out.println(jsonObject.toString());

                    /*JsonReader reader = Json.createReader(new StringReader(""));
                    JsonArray array = new JsonArray();
                    /*array.add(s);*/
 /*Elements uls = doc.select("ul");
                    Elements bodys = doc.select("body");
                    Elements sections = doc.select("select");

                    for (Element section : sections) {
                        if ("itinerary".equals(section.attr("id"))) {
                            //System.out.println(section.toString());
                        }
                    }
                    for (Element ul : uls) {
                        if ("my-amenities".equals(ul.attr("class"))) {
                            themes = ul.toString();
                            //System.out.println(themes);
                        }
                    }*/
                } catch (IOException ex) {
                    Logger.getLogger(bookPage.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        public class insert {

            String jdbcUrl = "jdbc:mysql://localhost/concierge";
            String username = "root";
            String password = "";
            Connection connection = null;
            PreparedStatement statement = null;
            PreparedStatement statement1 = null;
            PreparedStatement statement2 = null;
            PreparedStatement statement3 = null;
            PreparedStatement statement4 = null;
            ResultSet s = null;
            ResultSet s1 = null;

            public insert() {
                try {
                    connection = DriverManager.getConnection(jdbcUrl, username, password);
                     statement4 = connection.prepareStatement("INSERT INTO booknow(name,price)" + " VALUES(?,?)");
                    statement = connection.prepareStatement("INSERT INTO book(packageId,customizable,packageType,travelBy,"
                            + "overview,durationNight,durationDays,holdAndPayValue,isHoldAndPayEnabled,startFromPrice,strikeOffPrice,"
                            + "inclusions,exclusions,cancelPolicy,paymentPolicy,images,themes,inclusionTypes,meals,transfers,sightseeing,"
                            + "iTitle,iDescription,dcName,dcCode,dcIsSelected,departureCityName,departureCityCode,defaultDeparture,packageTitle)"
                            + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    //statement2 = connection.prepareStatement("SELECT * from trips where destination = " + "(?)");//callCrawler(url);
                    statement2 = connection.prepareStatement("INSERT INTO book1(id,destinationName,destinationCode,connectingSegment,transportRef,"
                            + "accomodationRef,hotelName,hotelDesc,ratingImage,address,destinationDuration,hotelCheckInDay,hotelImg) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

             public int bookNow(String name, int price) {
                int result = 0;
                try {
                    statement4.setString(1, name);
                    statement4.setInt(2, price);
                    result = statement4.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return result;
            }

            public int setActors(bookPage b, String packageId, String departureCityCode) {
                int r = 0;
                try {
                    statement.setString(1, packageId);
                    statement.setString(2, b.customizable);
                    statement.setString(3, b.packageType);
                    statement.setString(4, b.travelBy);
                    statement.setString(5, b.overview);
                    statement.setString(6, b.durationNight);
                    statement.setString(7, b.durationDays);
                    statement.setString(8, b.holdAndPayValue);
                    statement.setString(9, b.isHoldAndPayEnabled);
                    statement.setString(10, b.startFromPrice);
                    statement.setString(11, b.strikeOffPrice);
                    statement.setString(12, b.inclusions);
                    statement.setString(13, b.exclusions);
                    statement.setString(14, b.cancelPolicy);
                    statement.setString(15, b.paymentPolicy);
                    statement.setString(16, b.images);
                    statement.setString(17, b.themes);
                    statement.setString(18, b.inclusionTypes);
                    statement.setString(19, b.meals);
                    statement.setString(20, b.transfers);
                    statement.setString(21, b.sightseeing);
                    statement.setString(22, b.iTitle);
                    statement.setString(23, b.iDescription);
                    statement.setString(24, b.dcName);
                    statement.setString(25, b.dcCode);
                    statement.setString(26, b.dcIsSelected);
                    statement.setString(27, b.departureCityName);
                    statement.setString(28, b.departureCityCode);

                    if (departureCityCode.equals("null")) {
                        statement.setString(29, "1");
                    } else {
                        statement.setString(29, "0");
                    }
                    statement.setString(30, b.packageTitle);
                    r = statement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return r;
            }

            public int setActors1(bookPage b, String id) {
                int k = 0;
                try {
                    statement2.setString(1, id);
                    statement2.setString(2, b.destinationName);
                    statement2.setString(3, b.destinationCode);
                    statement2.setString(4, b.connectingSegmentInOrder);
                    statement2.setString(5, b.transportRef);
                    statement2.setString(6, b.accomodationRef);
                    statement2.setString(7, b.hotelNames);
                    statement2.setString(8, b.hotelDesc);
                    statement2.setString(9, b.ratingImage);
                    statement2.setString(10, b.address);
                    statement2.setString(11, b.destinationDuration);
                    statement2.setString(12, b.hotelCheckInDay);
                    statement2.setString(13, b.hotelImg);
                    k = statement2.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return k;
            }

            public ResultSet getActors1(String id) {
                String query = "SELECT * FROM book1 WHERE id=" + "'" + id + "'";
                try {
                    statement3 = connection.prepareStatement(query);
                    s1 = statement3.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return s1;
            }

            public ResultSet getActors(String packageId, String departureCityCode) {
                String query = "SELECT * FROM book WHERE packageId=" + "'" + packageId + "' and departureCityCode=" + "'" + departureCityCode + "'";
                if (departureCityCode.equals("null")) {
                    query = "SELECT * FROM book WHERE packageId=" + "'" + packageId + "' and defaultDeparture=" + "'1'";
                }

                try {
                    statement1 = connection.prepareStatement(query);
                    s = statement1.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return s;
            }
        }
    %>
    <body class="page1" id="top">
        <%
            String url = new String();
            if (request.getParameter("packageId") != null) {
                String packageId = request.getParameter("packageId");
                String departureCityCode = "null";
                if (request.getParameter("departureCityCode") != null) {
                    departureCityCode = request.getParameter("departureCityCode");
                    url = "https://packages.yatra.com/holidays/details.htm?packageId=" + request.getParameter("packageId") + "&source=" + request.getParameter("source") + "&departureCityCode=" + departureCityCode;
                } else {
                    url = "https://packages.yatra.com/holidays/details.htm?packageId=" + request.getParameter("packageId") + "&source=" + request.getParameter("source");
                }
                //System.out.println(url);

                //System.out.println(url);
                //out.println(b.images);
                insert i = new insert();
                ResultSet bookresult = i.getActors(packageId, departureCityCode);
                //bookPage s = new bookPage(url);
                if (!bookresult.last()) {
                    bookPage b = new bookPage(url);
                    int k = i.setActors(b, packageId, departureCityCode);
                    bookresult = i.getActors(packageId, departureCityCode);
                    while (bookresult.next()) {
                        int k1 = i.setActors1(b, bookresult.getString("id"));
                    }
                    if (k == 1) {
                        response.setIntHeader("Refresh", 1);
                    }
                } else {

                    bookresult = i.getActors(packageId, departureCityCode);
                    while (bookresult.next()) {
                        ResultSet book1 = i.getActors1(bookresult.getString("id"));
                        String[] meals = bookresult.getString("meals").split("&&");
                        String[] sightseeing = bookresult.getString("sightseeing").split("&&");
                        String[] transfers = bookresult.getString("transfers").split("&&");
                        String[] dcNames = bookresult.getString("dcName").split("&&");
                        String[] dNames = {};
                        String[] hNames = {};
                        String[] hdesc = {};
                        String[] rImage = {};
                        String[] address = {};
                        String[] checkIn = {};
                        String[] stayDuration = {};
                        int[] check1 = {};
                        String[] dcCode = bookresult.getString("dcCode").split("&&");

                        String[] connect = {};
                        String[] hotelImg = {};
                        boolean con = false;
                        while (book1.next()) {
                            if (book1.getString("connectingSegment").contains("&&")) {
                                connect = book1.getString("connectingSegment").split("&&");
                                con = true;
                            }

                            dNames = book1.getString("destinationName").split("&&");
                            hNames = book1.getString("hotelName").split("&&");
                            hdesc = book1.getString("hotelDesc").split("&&");
                            rImage = book1.getString("ratingImage").split("&&");
                            address = book1.getString("address").split("&&");
                            checkIn = book1.getString("hotelCheckInDay").split("&&");
                            stayDuration = book1.getString("destinationDuration").split("&&");
                            hotelImg = book1.getString("hotelImg").split("&&");
                        }
                        System.out.println(checkIn.length);
                        if (checkIn.length > 2) {
                            for (int z = 1; z < checkIn.length; z++) {
                                for (int z1 = z + 1; z1 < checkIn.length; z1++) {
                                    if (Integer.valueOf(checkIn[z1]) < Integer.valueOf(checkIn[z])) {
                                        String temp = checkIn[z1];
                                        checkIn[z1] = checkIn[z];
                                        checkIn[z] = temp;
                                        String temp1 = hNames[z1];
                                        hNames[z1] = hNames[z];
                                        hNames[z] = temp1;
                                        String temp2 = hotelImg[z1];
                                        hotelImg[z1] = hotelImg[z];
                                        hotelImg[z] = temp2;
                                        String temp3 = rImage[z1];
                                        rImage[z1] = rImage[z];
                                        rImage[z] = temp3;
                                    }
                                }

                            }
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
        <div id="pop" >

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
        <div class="slider_wrapper">
            <div id="camera_wrap" class="">
                <%

                    String[] pics1 = bookresult.getString("images").split(",");
                    //String[] alt1 = r1.getString("imgAlt").split(",");
                    for (int j = 0; j < pics1.length; j++) {

                        if (pics1[j].equals("null")) {
                            pics1[j] = "../images/book1.jpg";
                        }
                        //System.out.println(pics1[j]);
                %>
                <div data-src="<%= pics1[j]%>">

                    <div class="caption fadeIn">
                        <h2><%= bookresult.getString("packageTitle")%></h2>
                        
                        <%if (!bookresult.getString("departureCityName").equals("null")) {%><div class="title">FROM</div>
                        <div class="price"><%= bookresult.getString("departureCityName")%></div><%}%>
                        <% HttpSession log = request.getSession();
                                        if (log.getAttribute("name") == null){%>
                                        <a href="#">BOOK NOW</a>
               <%} else{%>
                        <a href="booknow.jsp?id=<%= request.getParameter("packageId") %>">BOOK NOW</a>
                        <%}%>
                   
                    
                    </div>
                </div>

                <%}
                %>

            </div>
        </div>

        <div class="content">
            <div class="container_12">
                <div class="grid_5" style="padding:10px;">
                    <h2 style="padding-top:50px;">Inclusions</h2>
                    <ul class="sf-menu1">
                        <%
                            String[] inclusions = bookresult.getString("inclusionTypes").split("&&");
                            for (int x = 1; x < inclusions.length; x++) {
                                String font = inclusions[x].toLowerCase();
                                font = font.substring(0, font.length() - 1);
                                if ("Meals".equals(inclusions[x]) || "meals".equals(inclusions[x])) {
                        %>
                        <li><i class="ico-am am-food"></i><p><%= inclusions[x]%></p></li>
                                <%
                                    }

                                    if ("Transfer".equals(inclusions[x]) || "transfers".equals(inclusions[x])) {
                                %><li> <i class="ico-am am-transport">

                            </i><p><%= inclusions[x]%></p></li>
                            <%
                                }
                                if ("Accommodation".equals(inclusions[x]) || "accommodation".equals(inclusions[x])) {
                            %><li ><i class="ico-am am-hotel">

                            </i><p><%= inclusions[x]%></p></li>
                            <%
                                }

                                if ("Flights".equals(inclusions[x]) || "flights".equals(inclusions[x])) {
                            %><li><i class="ico-am am-plane">

                            </i><p><%= inclusions[x]%></p></li>
                            <%
                                }
                                if ("Sightseeing".equals(inclusions[x]) || "sightseeing".equals(inclusions[x])) {
                            %><li><i class="ico-am am-sight">

                            </i><p><%= inclusions[x]%></p></li>
                            <%
                                    }
                                }
                            %>
                    </ul>
                </div>
                <div class="grid_6 prefix_1" style="padding: 10px;">
                    <h2 style="padding-top:50px;">Package Themes</h2>
                    <ul class="sf-menu1">
                        <%
                            String[] themes = bookresult.getString("themes").split("&&");
                            for (int x = 1; x < themes.length; x++) {
                                String icon = themes[x].toLowerCase().replace("", "-");
                                icon = "ico-am am-" + icon;
                        %>
                        <li><i class="<%= "ico-am am-" + themes[x].toLowerCase().replace(" ", "-")%>"></i><p><%= themes[x]%></p></li>
                                <%
                                    }
                                %>
                    </ul></div>
                <hr>
                <h2>Overview</h2>
                <p class="overview"><%String over = bookresult.getString("overview");
                    over = over.replace("<div>", "");
                    over = over.replace("</div>", "");
                    over = over.replace("<p>", "");
                    over = over.replace("</p>", "");
                    out.println(over); %></p>
                <hr>
            </div>
            <div class="container_12">
                <%if (dcNames.length < 2) {

                %><h2>Package Itinerary </h2>
                <% } else {
                    for (int y = 1; y < dcNames.length; y++) {
                        //System.out.println(dcCode[y]);
                        if (dcCode[y].equals(request.getParameter("departureCityCode"))) {
                          //  System.out.println("ghjgj" + y);
                            String temp = dcCode[y];
                            dcCode[y] = dcCode[1];
                            dcCode[1] = temp;
                            String temp1 = dcNames[y];
                            dcNames[y] = dcNames[1];
                            dcNames[1] = temp1;
                        }
                    }
                %><h2>Package Itinerary - <select style="color: #000;" onchange="location = this.options[this.selectedIndex].value;"><%
                    for (int x = 1; x < dcNames.length; x++) {

                        %>
                        <option value="index.jsp?packageId=<%= request.getParameter("packageId")%>&source=SEO&departureCityCode=<%= dcCode[x]%>"><%= dcNames[x]%></option>
                        <%
                            }
                        %></select></h2><%
                            }%>
                        <%
                            int stay = 0;
                            int x = 1;
                            int st = 1;
                            String days = bookresult.getString("durationNight");
                            int day = Integer.valueOf(days);
                            while (x <= day) {%><div class="container_12"><%
                                System.out.println(stayDuration[st]);
                                int stay1 = Integer.valueOf(stayDuration[st]);
                                if (stay1 == 0) {
                                    System.out.println("stay1" + stay1);

                                    stay1 = Integer.valueOf(stayDuration[st + 1]);
                                }
                                stay = stay + stay1;

                                int check = Integer.valueOf(checkIn[st]);
                    %><br><div class="dest">
                        <%
                            out.println("<h2>" + dNames[st] + "</h2>" + " Check In for " + stay1 + " days");%></div><div class="hotel" style="padding:0px;">
                        <%if (!hotelImg[st].contains("ul")) {%><img src="<%= hotelImg[st]%>"><%} else {%><img style="width:87px;" src="../images/default-hotel-image.jpg"><%}%><div class="hdetail"><%
                            out.println(hNames[st] + "<br>");
                            if (!rImage[st].contains("ul")) {%>

                            <img src="<%= rImage[st]%>" /><%}%></div></div><br><br><br><br><br><%

                                while (true) {
                            %>
                    <div class="day" style="margin-top:10px;margin-bottom: 10px;"><%out.println("DAY - " + x + "<br>");%></div>
                    <%if (con && x == 1) {%><div class="dest"><%out.println("Flight DEtails");
                        %></div><div class="hotel" style="padding:14px;"><%
                            String[] c = connect[0].split(",");
                            if (connect[0].contains("ul")) {
                                out.println("<span style='float:left;postion:relative;'>" + c[1] + "</span>" + " <span style='float:left;'><i class='ico-am am-bus-tours' style='position:relative;'></i></span>" + "<span style='position:absolute;'>" + c[2] + "</span>");
                            } else {
                                out.println("<span style='float:left;postion:relative;'>" + c[1] + "<br>" + c[3] + "</span>" + " <span style='float:left;'><i class='ico-am am-plane' style='position:relative;'></i></span>" + "<span style='position:absolute;'>" + c[2] + "<br>" + c[4] + "</span>");
                            }

                            %></div><%}
                                if (con && x == day) {
                        %><div class="dest"><%out.println("Flight DEtails");
                        %></div><div class="hotel" style="padding:14px;"><%
                            String[] c = connect[1].split(",");
                            if (connect[1].contains("ul")) {
                                out.println("<span style='float:left;postion:relative;'>" + c[1] + "</span>" + " <span style='float:left;'><i class='ico-am am-bus-tours' style='position:relative;'></i></span>" + "<span style='position:absolute;'>" + c[2] + "</span>");
                            } else {
                                out.println("<span style='float:left;postion:relative;'>" + c[1] + "<br>" + c[3] + "</span>" + " <span style='float:left;'><i class='ico-am am-plane' style='position:relative;'></i></span>" + "<span style='position:absolute;'>" + c[2] + "<br>" + c[4] + "</span>");
                            }
                            %></div><br><br><% }

                                if (!meals[x].equals("null")) {%><div class='dest'>Meals</div><div class="hotel" ><%
                                    out.println(meals[x] + "<br>");%></div><%
                        }
                        if (!transfers[x].equals("null")) {%><div class='dest'>Transfers</div><div class="hotel" ><%
                            out.println(transfers[x] + "<br>");%></div><%
                                    }
                                    if (!sightseeing[x].equals("null")) {%><div class='dest'>Sightseeing</div><div class="hotel" ><%
                   out.println("Sightseeing " + sightseeing[x] + "<br>");%></div><%

                                                                       }

                                                                       if (x == stay) {
                                                                           x++;
                                                                           break;
                                                                       }
                                                                       x++;%><%
                                                                                                                 }
                                %><br><%
                                                                    st++;
                    %></div><%}
                    %>

            </div>
            <hr>
            <div class="container_12">
                <div class="grid_5">
                    <h2>Inclusions</h2>
                    <%String inc = bookresult.getString("inclusions");
                        inc = inc.replace("<ul>", "<ul class='list' >");
                        out.print(inc);
                    %>     
                </div>           

                <div class="grid_6 prefix_1">
                    <h2>Exclusions</h2>
                    <%
                        String exc = bookresult.getString("exclusions");
                        exc = exc.replace("\"", "");
                        exc = exc.replace("<ul>", "<ul class='list'>");
                        out.print(exc);
                    %>
                </div><hr>
                <div class="grid_5">
                    <h2>Payment Policy</h2>
                    <%
                        String pay = bookresult.getString("paymentPolicy");
                        pay = pay.replace("<h2>", "<h3 style='padding:5px;padding-bottom:5px;margin:5px;'>");
                        pay = pay.replace("<ul>", "<ul class='list'>");
                        out.print(pay);
                    %>
                </div>
                <div class="grid_6 prefix_1">
                    <h2>Cancellation Policy</h2>
                    <%
                        String can = bookresult.getString("cancelPolicy");
                        can = can.replace("<ul>", "<ul class='list'>");
                        out.print(can);
                    %>
                </div><hr>
                <h2>Detailed Day Wise Itinerary</h2>
                <% String[] iTitle = bookresult.getString("iTitle").split("&&");
                    String[] iDescription = bookresult.getString("iDescription").split("&&");
                    for (x = 1; x < iTitle.length; x = x + 2) {
                %><h2><%String s = iTitle[x + 1].replace("\\n", "");
                    s = s.replace("\\t", "");
                    out.print("DAY " + iTitle[x] + " - " + s);
                    s = iDescription[x + 1].replace("\\n", "");
                    s = s.replace("\\t", "");%></h2><p>
                    <%out.println(s);%></p><%
                        }
                    %>
            </div>
        </div>
        <%
                    }
                    /*while (result.next()) {
                        System.out.println("fdasf");
                        out.println(result.getString("customizable"));
                        out.println(result.getString("packageType"));
                        out.println(result.getString("travelBy"));
                        out.println(result.getString("overview"));
                        out.println(result.getString("durationNight"));
                        out.println(result.getString("durationDays"));
                        out.println(result.getString("holdAndPayValue"));
                        out.println(result.getString("isHoldAndPayEnabled"));
                        out.println(result.getString("startFromPrice"));
                        out.println(result.getString("strikeOffPrice"));
                        out.println(result.getString("themes"));
                        out.println(result.getString("inclusions"));
                        out.println(result.getString("exclusions"));
                        out.println(result.getString("cancelPolicy"));
                        out.println(result.getString("paymentPolicy"));
                        out.println(result.getString("inclusionTypes"));
                        out.println(result.getString("images"));
                        out.println(result.getString("meals"));
                        out.println(result.getString("transfers"));
                        out.println(result.getString("sightseeing"));
                        out.println(result.getString("transfers"));
                        out.println(result.getString("iTitle"));
                        out.println(result.getString("iDescription"));

                    }*/
                }
            }
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
        <script type="text/javascript"
        src="http://viralpatel.net/blogs/demo/jquery/jquery.shorten.1.0.js"></script>
        <script type="text/javascript">
                    $(document).ready(function () {

                        $(".overview").shorten();

                    });
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
