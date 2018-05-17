<%-- 
    Document   : adminProductosMetodos
    Created on : 09-sep-2017, 2:33:52
    Author     : TinTO
--%>

<%@page import="cl.aiep.examen.Productos"%>
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
                    Productos newProd = new Productos();
                    newProd.setSerie(request.getParameter("txtnewSerie"));
                    newProd.setNombre_producto(request.getParameter("txtnewNombre"));
                    newProd.setDescripcion(request.getParameter("txtnewDescripcion"));
                    newProd.setCod_imagen(request.getParameter("txtnewImagen"));
                    newProd.setValor(Integer.parseInt(request.getParameter("txtnewValor")));                  
                    newProd.setEstado(true);
                    if (newProd.ingresoProducto()) {
                        out.println("<script>alert('Producto agregado correctamente');window.location.replace('AdministrarProductos.jsp');</script>");                        
                    } else {
                        out.println("<script>alert('No se pudo agregar Producto');window.location.replace('AdministrarProductos.jsp');</script>");
                    }
                    break;
                case 2:
                     Productos ModProd = new Productos();
                    ModProd.setSerie(request.getParameter("txtModSerie"));
                    ModProd.setNombre_producto(request.getParameter("txtModNombre"));
                    ModProd.setDescripcion(request.getParameter("txtModDescripcion"));
                    ModProd.setCod_imagen(request.getParameter("txtModImagen"));
                    ModProd.setValor(Integer.parseInt(request.getParameter("txtModValor")));
                    ModProd.setEstado(true);
                    if (ModProd.modProducto()) {
                        out.println("<script>alert('Producto Modificado Correctamente');window.location.replace('AdministrarProductos.jsp');</script>");  
                    } else {
                        out.println("<script>alert('No se pudo modificar el Producto');window.location.replace('AdministrarProductos.jsp');</script>");
                    }
                    break;
                case 3:
                    Productos DelProd = new Productos();
                    DelProd.setId_producto(Integer.parseInt(request.getParameter("CmbSeleccionDel")));
                    if (DelProd.desactivaProducto()) {
                        out.println("<script>alert('Producto Desactivado Correctamente');window.location.replace('AdministrarProductos.jsp');</script>");  
                    } else {
                        out.println("<script>alert('No se pudo desactivar el Producto');window.location.replace('AdministrarProductos.jsp');</script>");
                    }
                    break;
            }

        %>      
    </body>
</html>
