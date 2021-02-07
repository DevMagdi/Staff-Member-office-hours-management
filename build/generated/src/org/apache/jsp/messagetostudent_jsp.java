package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class messagetostudent_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Drs & Tas  Office Hours</title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <h1>Drs & Tas  Office Hours</h1>\n");
      out.write("        ");

            String url = "jdbc:mysql://localhost:3306/staffmember";
            String user = "root";
            String password = "";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;

            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                //int rows_affected = Stmt.executeUpdate("INSERT INTO department VALUES ('TestDepartment', 100, '111111101', '1988-05-22');");
                //out.println("Number of Rows Affected  "+ rows_affected);

                RS = Stmt.executeQuery("SELECT name FROM office_hours;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
          RS.getString("name");????????????
          <select><option value="sub"><%=RS.getString("name")
      out.write("</option></select>\n");
      out.write("        %>\n");
      out.write("        ");

                while (RS.next()) {
      out.write("\n");
      out.write("                <select><option value=\"sub\">");
      out.print(RS.getString("name"));
      out.write("</option></select>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("        <br/>\n");
      out.write("        <a href=\"index.html\">Bach to Home</a>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");

    RS.close();
    Stmt.close();
    Con.close();

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
