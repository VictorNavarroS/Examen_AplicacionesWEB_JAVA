<%-- 
    Document   : index
    Created on : 29-ago-2017, 19:55:25
    Author     : TinTO
--%>

<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de Ingreso</title>

        <style>
            #con {
                height: 700px;
                display: flex;
                flex-direction: column;
                align-items: center; 
                justify-content: center;
            }
            #formLogueo{       
                background-image:url(imagenes/fondogris.jpg);   
                background-repeat: no-repeat;
                background-size: cover;
                text-align: center;
                border-radius: 20px;
                border: 3px solid #666666;
                width: 30%;   
            }   
            input.ingresar{
                color: red;
                margin-left: 55%;                
                width: 30%;
            }
            table{
                width: 95%;
            }
            #contraseña,#rut{
                position: relative;
                text-align: left;
                width: 90%; 
            }
            #fotoLogueo{
                float: left;
                width: 60px;
                height: 60px;
                padding-left: 50px;
                padding-top: 15px;
            }
            table{
                font-size: 20px;
                font-style: oblique;
                font-weight:bolder;
            }
        </style>
           
    </head>
    <body>
        <jsp:include page="PaginaBaseVacia.jsp" flush="true" />
        <div id="con">
            <form action="Logueo.jsp" method="post" id='formLogueo'>
                <img src="imagenes/boba.png" id="fotoLogueo" alt=""/><h1><strong><i>Login usuarios</i></strong></h1><br/>
                <table >
                    <tr>
                        <td>Usuario</td>
                        <td> : <input type="text" name="usuario" id="rut"/></td>
                    </tr>                    
                    <tr> </tr><tr> </tr>
                    <tr>
                        <td> Contraseña</td>
                        <td> : <input type="text" name="pass" id="contraseña"/></td>
                    </tr>   
                    <tr> </tr>
                </table>   
                <br/>  
                <input class="ingresar" type="submit" value="Ingresar" name="loguear"/>                          
                <br/>   
                <br/>                 
            </form>             
        </div>
        <br/> <br/> 
    </body>
</html>
