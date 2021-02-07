import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;

public class messagetostaff extends HttpServlet{ 
 
 public void doPost(HttpServletRequest request, 
  HttpServletResponse response)
  throws ServletException,IOException{
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();

  System.out.println("MySQL Connect Example.");
  Connection conn = null;
  String url = "jdbc:mysql://localhost:3306/";
  String dbName = "staffmember";
  String driver = "com.mysql.jdbc.Driver";
  String userName = "root"; 
  String password = "";


  
  Statement st = null;
  try {
  Class.forName(driver).newInstance();
  conn = DriverManager.getConnection(url+dbName,userName,password);
  st = conn.createStatement();
  System.out.println("Connected to the database");
  String members = request.getParameter("members");
  
  String from = request.getParameter("mfrom");
  String subject = request.getParameter("msubject");
  String content = request.getParameter("mcontent");
  String S = "Done";
  
                String query = "INSERT INTO messages(mfrom,msubject,mcontent) VALUES("
                        
                        + "'" + from + "',"
                        + "'" + subject + "',"
                        + "'" + content +  "')";
                        st.executeUpdate(query);
                st.close();
                st.close();

                response.sendRedirect("index.html");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
  }
}