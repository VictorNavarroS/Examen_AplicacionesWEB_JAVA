package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cl.aiep.examen.Usuarios;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("        <title>Pagina de Ingreso</title>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            #con {\n");
      out.write("                height: 700px;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                align-items: center; \n");
      out.write("                justify-content: center;\n");
      out.write("            }\n");
      out.write("            form{       \n");
      out.write("                background-image:url(imagenes/fondogris.jpg);   \n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-size: cover;\n");
      out.write("                text-align: center;\n");
      out.write("                border-radius: 20px;\n");
      out.write("                border: 3px solid #666666;\n");
      out.write("                width: 30%;   \n");
      out.write("\n");
      out.write("            }   \n");
      out.write("            input.ingresar{\n");
      out.write("                color: red;\n");
      out.write("                margin-left: 55%;                \n");
      out.write("                width: 30%;\n");
      out.write("            }\n");
      out.write("            table{\n");
      out.write("                width: 95%;\n");
      out.write("            }\n");
      out.write("            #contraseña,#rut{\n");
      out.write("                position: relative;\n");
      out.write("                text-align: left;\n");
      out.write("                width: 90%; \n");
      out.write("            }\n");
      out.write("            #fotoLogueo{\n");
      out.write("                float: left;\n");
      out.write("                width: 60px;\n");
      out.write("                height: 60px;\n");
      out.write("                padding-left: 50px;\n");
      out.write("                padding-top: 15px;\n");
      out.write("            }\n");
      out.write("            table{\n");
      out.write("                font-size: 20px;\n");
      out.write("                font-style: oblique;\n");
      out.write("                font-weight:bolder;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("           \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "PaginaBaseVacia.jsp", out, true);
      out.write("\n");
      out.write("        <div id=\"con\">\n");
      out.write("            <form action=\"Logueo.jsp\" method=\"post\">\n");
      out.write("                <img src=\"imagenes/boba.png\" id=\"fotoLogueo\"/><h1><strong><i>Login usuarios</i></strong></h1><br/>\n");
      out.write("                <table >\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Usuario</td>\n");
      out.write("                        <td> : <input type=\"text\" name=\"usuario\" id=\"rut\"/></td>\n");
      out.write("                    </tr>                    \n");
      out.write("                    <tr> </tr><tr> </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td> Contraseña</td>\n");
      out.write("                        <td> : <input type=\"text\" name=\"pass\" id=\"contraseña\"/></td>\n");
      out.write("                    </tr>   \n");
      out.write("                    <tr> </tr>\n");
      out.write("                </table>   \n");
      out.write("                <br/>  \n");
      out.write("                <input class=\"ingresar\" type=\"submit\" value=\"Ingresar\" name=\"loguear\"/>                          \n");
      out.write("                <br/>   \n");
      out.write("                <br/>                 \n");
      out.write("            </form>             \n");
      out.write("        </div>\n");
      out.write("        <br/> <br/> \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
