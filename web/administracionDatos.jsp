<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adminsitracion</title>
        <style>

            #contenedor {
                padding-left: 30%;
                padding-top: 180px;
                width: 633px; /* Ancho del contenedor */
                position: fixed;
                color: red;
            }
            #contenedor input {                
                height: 5em;
                width: 15em;
               
            }
        </style>
        <script>
            function pag(num) {
                switch (num) {
                    case 1:
                        document.location = "AdministrarUsuarios.jsp";
                        break;
                    case 2:
                        document.location = "AdministrarProductos.jsp";
                        break;
                    case 3:
                        document.location = "AdministrarCompras.jsp";
                        break;
                        case 4:
                        document.location = "index.jsp";
                        break;
                }
            }
        </script>
    </head>
    <body>
        <div id="contenedor">

            <%

                Usuarios user = (Usuarios) session.getAttribute("user");
                if (user != null && user.getTipo() == 1) {
                    out.println("<h2 align='center'> Bienvenido:  " + user.getNombre().toUpperCase() + "  " + user.getApellidos().toUpperCase() + "</h2>");

                } else {
                    response.sendRedirect("index.jsp");
                }

            %>       
            <br/>
            <br/>
            <input type="button" onclick="pag(1)" name="btnSeleccion" value="Usuarios"/>
            <input type="button" onclick="pag(2)" name="btnSeleccion" value="Productos"/>
            <input type="button" onclick="pag(3)" name="btnSeleccion" value="Compras"/>
            <br/>
            <br/>
            <br/>
            <input type="button" onclick="pag(4)" name="btnSalir" value="Salir" align="right"/>

        </div>
        <jsp:include page="PaginaBaseVacia.jsp" flush="true" />

    </body>
</html>
