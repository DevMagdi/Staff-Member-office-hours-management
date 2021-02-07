import java.io.* ;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         
       
    }

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType (" html;charset =UTF 8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
         
        try {
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            System.out.println(gRecaptchaResponse);
            boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
            checker check = new checker();
            if ((check.validate(id, password))&& verify)
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("sessionUserID", id);
                response.sendRedirect("LoginSuccess.jsp");
            }
            else {
                       RequestDispatcher rd = getServletContext().getRequestDispatcher(
                                       "/login.jsp");
                       if (verify) {

                               out.println("<h4 style=\"color: red; font-size: 20px; text-align: center;\">Either user name or password is wrong.</h4>");
                       } else {
                               out.println("\n<h4 style=\"color: red; font-size: 20px; text-align: center;\">You missed the Captcha.</h4>");
                       }
                       rd.include(request, response);
               }
        
        }
        finally {
            out.close();
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
