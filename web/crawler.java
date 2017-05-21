
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class crawler {
    
    public void start(String url){
        Document doc;
        try {
            doc = Jsoup.connect(url).get();
            
            Elements anchors1 = doc.select("h3");
            Elements anchors = doc.select("div");
            Elements anchors2 = doc.select("span");
            for(Element anchor2 : anchors2){
                if("mtop10 clearfix fl color-777 line-height-20 mul-line-ellipsis".equals(anchor2.attr("class"))){
                    System.out.println(anchor2.text());
                }
            }
            
            for (Element anchor1 : anchors1) {
                if(!"".equals(anchor1.attr("title"))){
                    System.out.println(anchor1.attr("title"));
                }
            }
                for (Element anchor : anchors) {
                    if ("price".equals(anchor.attr("class").trim())) {
                        System.out.println(anchor.text());
                        
                    } else if ("mtop2 font-13 ellipsis".equals(anchor.attr("class").trim())) {
                        System.out.println(anchor.text());
                        
                    }
                }

                /*String s = anchor.toString().trim();
                String[] s1 = s.split(">");
               
                s = s1[1];
                s1 = s.split("<");
                s = s1[0];
                s = s.replace("<","");
                System.out.println(s);*/
            }
        catch (IOException ex) {
            Logger.getLogger(crawler.class.getName()).log(Level.SEVERE, null, ex);
        }
    
   

    }
}
