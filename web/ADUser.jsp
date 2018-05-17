
<%@page import="java.util.ArrayList"%>
<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADUser</title>
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
                min-height: 27em; /* Alto del contenido */
                position: relative;
                width: 79%;
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
            function ir() {
                document.location = "administracionDatos.jsp";
            }
        </script>
    </head>
    <body>
        <!--Título-->
        <h1>Administracion de Usuarios</h1>
        <!--Contenedor-->
        <div id="container">         

            <!--Pestaña 1 activa por defecto-->
            <input id="tab-1" type="radio" name="tab-group" checked="checked" />
            <label for="tab-1">Agregar Usuario</label>
            <!--Pestaña 2 inactiva por defecto-->
            <input id="tab-2" type="radio" name="tab-group" />
            <label for="tab-2">Modificar Usuario</label>
            <!--Pestaña 3 inactiva por defecto-->
            <input id="tab-3" type="radio" name="tab-group" />
            <label for="tab-3">Eliminar Usuario</label>
            <!--Contenido a mostrar/ocultar-->
            <div id="content">

                <!--___________________________________________Contenido de la Pestaña 1__________________________________________________-->
                <div id="content-1">
                    <form action="adminUsuariosMetodos.jsp?tipo=1" onsubmit="" method="post">
                        <table>
                            <tr><td><label>Rut : </label></td><td><input type="text" name="txtnewRut"/></td></tr>
                            <tr><td><label>Nombre : </label></td><td><input type="text" name="txtnewNombre"/></td></tr>
                            <tr><td><label>Apellidos : </label></td><td><input type="text" name="txtnewApellidos"/></td></tr>
                            <tr><td><label>Correo : </label></td><td><input type="text" name="txtnewCorreo"/></td></tr>
                            <tr><td><label>Clave : </label></td><td><input type="text" name="txtnewClave"/></td></tr>                      
                            <tr><td><label>Tipo : </label></td><td><select name="CmbnewTipo">
                                        <option value="1">Administrador</option><option value="2">Usuario</option>
                                    </select>  </td></tr> 
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td><td><input type="submit" name="btnAgregar" value="Agregar Usuario"/></td>
                                <td><input type='button' onclick='ir()' name='btnVolver' value='Volver'/></td></tr>
                        </table>  
                    </form>
                </div>

                <!--___________________________________________Contenido de la Pestaña 2__________________________________________________-->
                <div id="content-2">
                    <form name="modUser" action="adminUsuariosMetodos.jsp?tipo=2" method="post">
                        <%
                            Usuarios ob = new Usuarios();
                            ArrayList<Usuarios> lista = ob.getUsuarios("");
                            out.println("<table>");
                            out.println("<tr><td><label >Sel. Usuario: </label></td><td><select name='CmbSeleccion' "
                                    + "<option selected='true' value='0'>Seleccione</option>");
                            for (int i = 0; i < lista.size(); i++) {
                                Usuarios aux = lista.get(i);
                                out.println("<option value='" + aux.getId() + "'>" + aux.getNombre() + " " + aux.getApellidos() + "</option>");
                            }
                            out.println("</select></form></td></tr>");
                            out.println("<tr><td><label >Rut : </label></td><td><input type='text 'value=' ' name='txtModRut'/></td></tr>");
                            out.println("<tr><td><label>Nombre : </label></td><td><input type='text' name='txtModNombre'/> </td></tr>");
                            out.println("<tr><td><label >Apellidos : </label></td><td><input type='text' name='txtModApellidos'/></td></tr>");
                            out.println("<tr><td><label >Correo : </label></td><td><input type='text' name='txtModCorreo'/></td></tr>");
                            out.println("<tr><td><label>Clave : </label></td><td><input type='text' name='txtModClave'/></td></tr>");
                            out.println("<tr><td><label>Tipo : </label></td><td><select name='CmbModTipo'>"
                                    + "<option selected='true' value='0'>Seleccione</option>"
                                    + "<option value='1'>Administrador</option>"
                                    + "<option value='2'>Usuario</option>"
                                    + "</select></td></tr>");
                            out.println("<tr><td></td><td> <input type='submit'  name='btnModificar' value='Modificar Usuario'/></td>"
                                    + "<td><input type='button' onclick='ir()' name='btnVolver' value='Volver'/></td></tr>");
                            out.println("</table>");

                        %>   
                    </form>               
                </div>

                <!--_____________________________________Contenido de la Pestaña 3__________________________________________________-->
                <div id="content-3">
                    <form action="adminUsuariosMetodos.jsp?tipo=3" name="desactivaUser" method="post">                     

                        <%                            
                            out.println("<table>");
                            Usuarios del = new Usuarios();
                            ArrayList<Usuarios> listaDel = del.getUsuarios(" where estado = 1");
                            out.println("<tr>");
                            out.println("<td><label>Sel. Usuario: </label></td><td><select name='CmbSeleccionDel'>"
                                    + "<option selected='true' value='0'>Seleccione</option>");
                            for (int i = 0; i < listaDel.size(); i++) {
                                Usuarios aux = listaDel.get(i);
                                out.println("<option value='" + aux.getId() + "'>" + aux.getNombre() + " " + aux.getApellidos() + "</option>");
                            }
                            out.println("</select></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td></tr>");
                            out.println("<tr><td></td><td ><input type='submit' name='btnDesactivar' value='Desactivar Usuario'/></td>"
                                    + "<td><input type='button' onclick='ir()' name='btnVolver' value='Volver'/></td></tr>");
                            out.println("</table>");
                        %>                           

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
