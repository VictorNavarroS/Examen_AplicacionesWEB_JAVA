<%-- 
    Document   : agregaUser
    Created on : 08-sep-2017, 21:26:42
    Author     : TinTO
--%>

<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            switch (tipo) {
                case 1:
                    Usuarios newUser = new Usuarios();
                    newUser.setRut(request.getParameter("txtnewRut"));
                    newUser.setNombre(request.getParameter("txtnewNombre"));
                    newUser.setApellidos(request.getParameter("txtnewApellidos"));
                    newUser.setCorreo(request.getParameter("txtnewCorreo"));
                    newUser.setClave(request.getParameter("txtnewClave"));
                    newUser.setTipo(2);
                    newUser.setEstado(true);
                    if (newUser.ingresoUsuario()) {
                        out.println("<script>alert('Usuario agregado correctamente');window.location.replace('AdministrarUsuarios.jsp');</script>");                        
                    } else {
                        out.println("<script>alert('No se pudo agregar usuario');window.location.replace('AdministrarUsuarios.jsp');</script>");
                    }
                    break;
                case 2:
                     Usuarios modUser = new Usuarios();
                    modUser.setRut(request.getParameter("txtModRut"));
                    modUser.setNombre(request.getParameter("txtModNombre"));
                    modUser.setApellidos(request.getParameter("txtModApellidos"));
                    modUser.setCorreo(request.getParameter("txtModCorreo"));
                    modUser.setClave(request.getParameter("txtModClave"));
                    modUser.setTipo(Integer.parseInt(request.getParameter("CmbModTipo")));
                    modUser.setId(Integer.parseInt(request.getParameter("CmbSeleccion")));
                    modUser.setEstado(true);
                    if (modUser.modUsuario()) {
                        out.println("<script>alert('Usuario Modificado Correctamente');window.location.replace('AdministrarUsuarios.jsp');</script>");  
                    } else {
                        out.println("<script>alert('No se pudo modificar el usuario');window.location.replace('AdministrarUsuarios.jsp');</script>");
                    }
                    break;
                case 3:
                    Usuarios DelUser = new Usuarios();
                    DelUser.setId(Integer.parseInt(request.getParameter("CmbSeleccionDel")));
                    if (DelUser.desactivaUsuario()) {
                        out.println("<script>alert('Usuario Desactivado Correctamente');window.location.replace('AdministrarUsuarios.jsp');</script>");  
                    } else {
                        out.println("<script>alert('No se pudo desactivar el usuario');window.location.replace('AdministrarUsuarios.jsp');</script>");
                    }
                    break;
            }

        %>      
    </body>
</html>
