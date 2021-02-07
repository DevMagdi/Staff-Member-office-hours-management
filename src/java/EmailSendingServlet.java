import java.io.IOException;
import static java.lang.System.out;
 import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.apache.coyote.http11.Constants.a;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
    
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
 
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String recipient = request.getParameter("mail");
        String id = request.getParameter("id");
        String subject = "Temporary Password to your account";
        String content = generateRandomPassword();
 
        String resultMessage = "";
        try {
            
                Class.forName("com.mysql.jdbc.Driver");
                String urldb = "jdbc:mysql://localhost:3306/staffmember";
                String userdb = "root";
                String passworddb = "";
                String Line;
                Connection Con = null;
                Statement Stmt = null;
                PreparedStatement preparedStatement = null;
                Con = DriverManager.getConnection(urldb, userdb, passworddb);
                Stmt = Con.createStatement();
                //out.print("mmmmmm");
                String query4 = "UPDATE student SET password = '" + content + "' WHERE id = '" + id + "';";
                preparedStatement = Con.prepareStatement(query4);
                int rows3 = preparedStatement.executeUpdate(query4);
            } catch (SQLException cnfe) {
                System.err.println("Exception: " + cnfe);
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmailSendingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
   
}
