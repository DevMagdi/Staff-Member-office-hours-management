import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.security.SecureRandom;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

public class registeration extends HttpServlet {

   private String host;
    private String port;
    private String user;
    private String pass;
    private static final Random RANDOM = new SecureRandom();
    public static final int PASSWORD_LENGTH = 8;
    public static String generateRandomPassword()
  {
      // Pick from some letters that won't be easily mistaken for each
      // other. So, for example, omit o O and 0, 1 l and L.
      String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789+@";

      String pw = "";
      for (int i=0; i<PASSWORD_LENGTH; i++)
      {
          int index = (int)(RANDOM.nextDouble()*letters.length());
          pw += letters.substring(index, index+1);
      }
      return pw;
  }
   @Override
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
        
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String mail = request.getParameter("mail");
        String phone = request.getParameter("mobile");
        String password ="";
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        Statement stmt = null;
        ResultSet RS = null;
        PreparedStatement preparedStatement = null;
        boolean status = true;

       
        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/staffmember";
            String userdb = "root";
            String passworddb = "";
            con = DriverManager.getConnection(url, userdb, passworddb);
           
             //out.println("Registered Successfully 1");
            if (mail != null && mail.trim().length() > 0) {
            stmt = con.createStatement();
            String fetchEmail = "Select mail from student where mail=" + "'" + mail + "'";
            ResultSet rs = stmt.executeQuery(fetchEmail);
             //out.println("Registered Successfully 2");
             
             
            if (!rs.next()) {
                stmt = con.createStatement();
                String sql = "insert into student values('" + name + "','" + mail + "','" + phone + "','" +id + "','" + password +"')";
                status = stmt.execute(sql);
                out.println("Registered Successfully and email with password sent ");
                
                
                String recipient = request.getParameter("mail");
                String subject = "Temporary Password to your account";
                String content = generateRandomPassword();

                String resultMessage = "";
                try {

                        stmt = con.createStatement();
                        String query4 = "UPDATE student SET password = '" + content + "' WHERE id = '" + id + "';";
                        preparedStatement = con.prepareStatement(query4);
                        int rows3 = preparedStatement.executeUpdate(query4);
                    } catch (SQLException cnfe) {
                        System.err.println("Exception: " + cnfe);
                    }

                try {
                    EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                            content);
                    resultMessage = "The e-mail was sent successfully";
                } catch (Exception ex) {
                    ex.printStackTrace();
                    resultMessage = "There were an error: " + ex.getMessage();
                } finally {
                    request.setAttribute("Message", resultMessage);
                    getServletContext().getRequestDispatcher("/Result.jsp").forward(
                            request, response);
                }
                
            } else {
                out.print("<span id=\"msg\" style=\"color:red;\">" + mail + "</span>" + " is already registered. Click "
                        + " <a href=\"login.jsp\">Here</a>" + " to signin");
                

            }
        } else {
                
            stmt = con.createStatement();
            String sql = "insert into student values('" + name + "','" + mail + "','" + phone + "' ,'" + id + "','" + password +"')";
            status = stmt.execute(sql);
            out.println("Registered Successfully");
            
            String recipient = request.getParameter("mail");
                String subject = "Temporary Password to your account";
                String content = generateRandomPassword();

                String resultMessage = "";
                try {

                        stmt = con.createStatement();
                        //out.print("mmmmmm");
                        String query4 = "UPDATE student SET password = '" + content + "' WHERE id = '" + id + "';";
                        preparedStatement = con.prepareStatement(query4);
                        int rows3 = preparedStatement.executeUpdate(query4);
                    } catch (SQLException cnfe) {
                        System.err.println("Exception: " + cnfe);
                    }

                try {
                    EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                            content);
                    resultMessage = "The e-mail was sent successfully";
                } catch (Exception ex) {
                    ex.printStackTrace();
                    resultMessage = "There were an error: " + ex.getMessage();
                } finally {
                    request.setAttribute("Message", resultMessage);
                    getServletContext().getRequestDispatcher("/Result.jsp").forward(
                            request, response);
                }
        }
            
        } catch (Exception e) {
        out.println(e);
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
        processRequest(request, response);
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
