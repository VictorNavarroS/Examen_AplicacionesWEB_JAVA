<%-- 
    Document   : agregaCarro
    Created on : 09-sep-2017, 9:07:27
    Author     : TinTO
--%>

<%@page import="cl.aiep.examen.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.aiep.examen.Carrito"%>
<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                    <%
                Usuarios user = (Usuarios) session.getAttribute("user");
                if (user != null && user.getTipo() == 2) {                   
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>   
    </head>    
    <body>
       <%
           int id =Integer.parseInt(request.getParameter("idProducto"));
           Productos busca = new Productos();
           busca.buscar(id);
           
           Carrito articulo = new Carrito();           
           articulo.setNum_boleta(1);
           articulo.setNombreCliente(user.getNombre()+"" +user.getApellidos());
           articulo.setRutCliente(user.getRut());
           articulo.setSerieProducto(busca.getSerie());
           articulo.setNombreProducto(busca.getNombre_producto());
           articulo.setCantidad(5);
           articulo.setValorUnitario(100);
            if (articulo.ingresoCompra()) {
                        out.println("<script>alert('Compra agregada correctamente');window.location.replace('ListaProductos.jsp');</script>");                        
                    } else {
                        out.println("<script>alert('No se pudo agregar Articulo al carro');window.location.replace('ListaProductos.jsp');</script>");
                    }
       %>
    </body>
</html>
