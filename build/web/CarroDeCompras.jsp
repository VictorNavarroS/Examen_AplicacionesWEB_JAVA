<%@page import="java.util.ArrayList"%>
<%@page import="cl.aiep.examen.Carrito"%>
<%@page import="cl.aiep.examen.Usuarios"%>
<html>
    <head>
        <title>Carro De Compras</title>   
        <style>
            #admin{
                float: left;
                margin-top: 200px;   
                color: red;
            }
        </style>
        <%
            Usuarios user = (Usuarios) session.getAttribute("user");
            if (user != null && user.getTipo() == 2) {
                out.println("<h2> Bienvenido: </h2>");
                out.println("<h2> " + user.getNombre().toUpperCase() + "  " + user.getApellidos().toUpperCase() + "</h2>");
            } else {
                response.sendRedirect("index.jsp");
            }
            ArrayList<Carrito> carro = (ArrayList<Carrito>) session.getAttribute("lista");
        %>   
    </head>
    <jsp:include page="PaginaBaseLlena.jsp" flush="true" />
    <body>
        <div id="admin">
            <form action="/Examen/pdf" name="reporte">
                <table border="5">
                    <tr>                   
                        <th>Serie Producto</th>                
                        <th>Nombre Producto</th>            
                        <th>Cantidad</th>    
                        <th>Precio Unitario</th>
                        <th>Subtotal</th>
                    </tr>
                    <%
                        Carrito ob = new Carrito();
                    ArrayList<Carrito> listacarro = ob.getListaCarrito(" where estado=1");
                        for (int i = 0; i < listacarro.size(); i++) {
                        Carrito aux = listacarro.get(i);
                        int subtotal=aux.getCantidad()*aux.getValorUnitario();
                        out.println("<form name='carro"+i+"'>");
                        out.println("<tr>");
                        out.println("<td class='peq'><label name='lblImg'><img src='imagenes/" + aux.getSerieProducto()+ "' class='magnify' id='imagen'/></label></td>");
                        out.println("<td class='med'><label name='lblNombre'>" + aux.getNombreProducto()+ "</label> </td>");
                        out.println("<td><label name='lblCantidad'>" + aux.getCantidad()+ "</label> </td>");                        
                        out.println("<td class='peq'><label name='lblValor'> $" + aux.getValorUnitario()+ "</label> </td>");
                        out.println("<td class='peq'><label name='lblSubtotal'> $" + subtotal + "</label> </td>");
                        
                        
                        out.println("<td class='med'><input type='text' name='cantidad' id='cantidad' value='0' readonly/>"
                                + "<input type='button' name='mas' id='mas' value='+' onClick='javascript:document.articulo"+i+".cantidad.value++;' />"
                                + "<input type='button' name='menos' id='menos' value='-' onClick='javascript:document.articulo"+i+".cantidad.value--;' /></td>");
                        out.println("<td class='peq'><input type='submit' value='Agregar al Carro'/></td>");                        
                        out.println("</tr>");
                        out.println("</form>");
                    }

                    %>

                </table>  
                <input type="text" name="texto" />
                <input type="submit" name="enviar" value="Generar pdf"/>

            </form>
        </div>
    </body>

</html>