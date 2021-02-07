import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;


public class ControllerServlet extends HttpServlet {

    

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection Con = null;
        Statement stmt = null;
        ResultSet RS = null;
        PreparedStatement preparedStatement = null;

        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/staffmember";
            String user = "root";
            String password = "";
            String value;
            Con = DriverManager.getConnection(url, user, password);
        int id = Integer.parseInt(request.getSession().getAttribute("sessionUserID").toString());
        String mail = request.getParameter("mail");
        String phone = request.getParameter("phone");
        String passwordd = request.getParameter("password");
 
        User userr = new User(mail,phone, id, passwordd);
        String anotherQuery = "UPDATE student SET mail = '" + userr.getMail() + "', phone = '" + userr.getPhone() + "', password = '" + userr.getPassword() + "' WHERE id = '" + id + "';";
        preparedStatement = Con.prepareStatement(anotherQuery);
        int rows2 = preparedStatement.executeUpdate(anotherQuery);
       
        out.print("hi Magdy");
        
            Con.close();
            preparedStatement.close();
            RS.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
