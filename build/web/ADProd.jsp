<%@page import="cl.aiep.examen.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADProd</title>
        <style>
            this {
                font-family: Arial, sans;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
            }
            h1 {
                position: fixed;
                margin-left: 34%;
                margin-top:  110px;
                text-align: center;
                background-color: black;
                color: darkred;
            }
            #container {
                padding-left: 30%;
                padding-top: 180px;
                width: 633px; /* Ancho del contenedor */
                position: fixed;
            }
            #container input {
                height: 2.5em;

            }
            #container label {
                background: #f1f1f1; /* Fondo de las pestañas */
                border-radius: .25em .25em 0 0;
                color: #888; /* Color del texto de las pestañas */
                cursor: pointer;
                display: block;
                float: left;
                font-size: 1em; /* Tamaño del texto de las pestañas */
                height: 2.5em;
                line-height: 2.5em;
                margin-right: 0em;            
                padding: 0 1.7em;
                text-align: center;
            }
            #container input:hover + label {
                background: #ddd; /* Fondo de las pestañas al pasar el cursor por encima */
                color: #666; /* Color del texto de las pestañas al pasar el cursor por encima */
            }
            #container input:checked + label {
                background: #E3E3E3; /* Fondo de las pestañas al presionar */
                color: #444; /* Color de las pestañas al presionar */
                position: relative;
                z-index: 6;
            }
            #content {
                background: #E3E3E3; /* Fondo del contenido */
                border-radius: 0 .25em .25em .25em;
                min-height: 28em; /* Alto del contenido */
                position: relative;
                width: 83%;
                z-index: 10;
            }
            #content div {
                opacity: 0;
                padding: 2.5em;
                position: absolute;
                z-index: -100;
            }
            #content-1 p {
                clear: both;
                margin-bottom: 1em;
            }
            #content-1 p.left img {
                float: left;
                margin-right: 1em;
            }
            #content-1 p.last {
                margin-bottom: 0;
            }
            #content-2 p {
                float: left;
                width: 48.5%;
            }
            #content-2 p.column-right {
                margin-left: 3%;
            }
            #content-2 p img {
                display: block;
                margin: 0 auto 1em auto;
            }
            #content-3 p,
            #content-3 ul {
                margin-bottom: 1em;
            }
            #content-3 ul {
                margin-left: 2em;
            }
            #container input#tab-1{
                visibility: hidden;
            }
            #container input#tab-2{
                visibility: hidden;
            }
            #container input#tab-3{
                visibility: hidden;
            }
            #tab-2{

            }
            #container input#tab-1:checked ~ #content #content-1,
            #container input#tab-2:checked ~ #content #content-2,
            #container input#tab-3:checked ~ #content #content-3 {
                opacity: 1;
                z-index: 100;
            }
        </style>
         <script>
            function ir(){
                document.location = "administracionDatos.jsp";
            }
        </script>
    </head>
    <body>
        <!--Título-->
        <h1>Administracion de Productos</h1>
        <!--Contenedor-->
        <div id="container">         

            <!--Pestaña 1 activa por defecto-->
            <input id="tab-1" type="radio" name="tab-group" checked="checked" />
            <label for="tab-1">Agregar Producto</label>
            <!--Pestaña 2 inactiva por defecto-->
            <input id="tab-2" type="radio" name="tab-group" />
            <label for="tab-2">Modificar Producto</label>
            <!--Pestaña 3 inactiva por defecto-->
            <input id="tab-3" type="radio" name="tab-group" />
            <label for="tab-3">Eliminar Producto</label>
            <!--Contenido a mostrar/ocultar-->
            <div id="content">

                <!--___________________________________________Contenido de la Pestaña 1__________________________________________________-->
                <div id="content-1">
                    <form action="adminProductosMetodos.jsp?tipo=1" onsubmit="" method="post">
                        <table>
                            <tr><td><label>Serie : </label></td><td><input type="text" name="txtnewSerie"/></td></tr>
                            <tr><td><label>Nombre : </label></td><td><input type="text" name="txtnewNombre"/></td></tr>
                            <tr><td><label>Descripcion : </label></td><td><textarea name='txtnewDescripcion' cols='20' rows='4'></textarea></td></tr>
                            <tr><td><label>Codigo Imagen : </label></td><td><input type="text" name="txtnewImagen"/></td></tr>
                            <tr><td><label>Valor : </label></td><td><input type="text" name="txtnewValor"/></td></tr>                                                  
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td><td><input type="submit" name="btnAgregar" value="Agregar Productos"/></td>
                            <td><input type='button' onclick='ir()' name='btnVolver' value='Volver'/></td></tr>
                        </table>  
                    </form>
                </div>

                <!--___________________________________________Contenido de la Pestaña 2__________________________________________________-->
                <div id="content-2">
                    <form name="modProd" action="adminProductosMetodos.jsp?tipo=2" method="post">
                        <%
                            Productos ob = new Productos();                           
                            ArrayList<Productos> lista = ob.getLista("");
                            out.println("<table>");
                            out.println("<tr><td><label >Sel. Producto: </label></td><td><select name='CmbSeleccion' "                                    
                                    + "<option selected='true' value='0'>Seleccione</option>");
                            for (int i = 0; i < lista.size(); i++) {
                                Productos aux = lista.get(i);
                                out.println("<option value='" + aux.getId_producto()+ "'>" + aux.getNombre_producto()+ "</option>");                            
                            }
                            out.println("</select></form></td></tr>");
                            out.println("<tr><td><label >Serie : </label></td><td><input type='text' name='txtModSerie'/> </td></tr>");
                             out.println("<tr><td><label >Nombre : </label></td><td><input type='text' name='txtModNombre'/> </td></tr>");    
                            out.println("<tr><td><label >Descripcion : </label></td><td><textarea name='txtModDescripcion' cols='20' rows='4'></textarea></td></tr>");                                                       
                            out.println("<tr><td><label >Codigo Imagen: </label></td><td><input type='text' name='txtModImagen'/> </td></tr>");    
                            out.println("<tr><td><label >Valor : </label></td><td><input type='text' name='txtModValor'/> </td></tr>");  
                            out.println("<tr><td><label >Estado: </label></td><td><input type='text' name='txtModEstado'/> </td></tr>");   
                            out.println("<tr><td></td><td> <input type='submit'  name='btnModificar' value='Modificar Producto'/></td>"
                                    + "<td><input type='button' onclick='ir()' name='btnVolver' value='Volver'/></td></tr>");
                            out.println("</table>");

                        %>   
                    </form>               
                </div>

                <!--_____________________________________Contenido de la Pestaña 3__________________________________________________-->
                <div id="content-3">
                    <form action="adminProductosMetodos.jsp?tipo=3" name="desactivaUser" method="post">                     

                        <%         out.println("<table>");
                            Productos del = new Productos();
                            ArrayList<Productos> listaDel = del.getLista(" where estado = 1");
                            out.println("<tr>");
                            out.println("<td><label>Sel. Producto: </label></td><td><select name='CmbSeleccionDel'>"
                                    + "<option selected='true' value='0'>Seleccione</option>");
                            for (int i = 0; i < listaDel.size(); i++) {
                                Productos aux = listaDel.get(i);
                                out.println("<option value='" + aux.getId_producto() + "'>" + aux.getNombre_producto() + "</option>");
                            }
                            out.println("</select></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td><td ><input type='submit' name='btnDesactivar' value='Desactivar Producto'/></td>"
                                    + "<td><input type='button' onclick='ir()' name='btnVolver' value='Volver'/></td></tr>");
                            out.println("</table>");
                        %>                           
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>