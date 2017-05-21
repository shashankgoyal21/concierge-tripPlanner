/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.*;
import java.sql.*;
import javax.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author sag14
 */
public class FormServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out;
        out=response.getWriter();
        try  {
            
            out.print("<h1>HI</h1>");
           
        }catch (Exception e){
            
        }finally {
            out.close();
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //processRequest(request, response);
        response.setContentType("text/html");
        PrintWriter out;
        out=response.getWriter();
        out.print("<h2>Print<h2>");
        try {
           
          Class.forName("com.mysql.jdbc.Driver");
          String jdbcUrl="jdbc:mysql://localhost:8080/concierge";
          String username="root";
          String password="";
          Connection connection=null;
          
          connection = DriverManager.getConnection(jdbcUrl,username,password);
          Statement statement = connection.createStatement();
          
          String x=request.getParameter("Name");
          out.print(x);
          String sql="insert into name values ('"+x+"')";
          
          statement.executeUpdate(sql);
          
          out.println("<h1>Record successfully inserted</h1>");
          RequestDispatcher rd = request.getRequestDispatcher("/form.html");
          rd.include(request,response);
            
            
        }catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FormServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
