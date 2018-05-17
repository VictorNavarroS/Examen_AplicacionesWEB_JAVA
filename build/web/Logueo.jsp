
<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="JavaScript">
        </script>
    </head>
    <body>
        <%
            String usuario = request.getParameter("usuario");
            String pass = request.getParameter("pass");
            Usuarios us = new Usuarios();
            if (us.logueo(usuario, pass)) {                               
                int tipo = us.getTipo();                
                switch (tipo) {
                    case 1:
                        response.sendRedirect("administracionDatos.jsp");
                        break;
                    case 2:
                        response.sendRedirect("ListaProductos.jsp");
                        break;
                }
                session.setAttribute("user", us);
            } else {
                out.println("<script>alert('Datos de Usuario Invalidos');window.location.replace('index.jsp'); </script>");
               
                
            }
        %>
    </body>
</html>
