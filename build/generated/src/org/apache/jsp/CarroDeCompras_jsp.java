package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cl.aiep.examen.Usuarios;

public final class CarroDeCompras_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Carro De Compras</title>   \n");
      out.write("        <style>\n");
      out.write("            #admin{\n");
      out.write("                float: left;\n");
      out.write("                margin-top: 200px;   \n");
      out.write("                color: red;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("        <script>\n");
      out.write("            function  generarpdf(){\n");
      out.write("            Usuarios pdf = new Usuarios();\n");
      out.write("            String ruta = \"C:\\\\Users\\\\TinTO\\\\Desktop\";\n");
      out.write("            String contenido = \"Aqui estoy creando un pdf\";\n");
      out.write("            pdf.generarpdf(ruta, contenido);\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "PaginaBaseLlena.jsp", out, true);
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div id=\"admin\">\n");
      out.write("            ");

                Usuarios user = (Usuarios) session.getAttribute("user");
                out.println("<h2> Bienvenido: </h2>");
                out.println("<h2> " + user.getNombre().toUpperCase() + "  " + user.getApellidos().toUpperCase() + "</h2>");
            
      out.write("\n");
      out.write("            <form name=\"reporte\">\n");
      out.write("                <input type=\"button\" onclick=\"generarpdf()\" name=\"enviar\" value=\"Generar pdf\"/>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
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
