<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Productos</title>
        <style>
            #admin{
                float: left;
                margin-top: 200px;   
                color: red;
            }        
        </style>

    </head>
    <body>
        <div id="admin">
            <%
                Usuarios user = (Usuarios) session.getAttribute("user");
                if (user != null && user.getTipo() == 1) {
                    out.println("<h2> Bienvenido: </h2>");
                    out.println("<h2> " + user.getNombre().toUpperCase() + "  " + user.getApellidos().toUpperCase() + "</h2>");
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>       
        </div>
        <jsp:include page="PaginaBaseVacia.jsp" flush="true" />
        <jsp:include page="ADProd.jsp" flush="true" />
    </body>
</html>
