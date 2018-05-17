<%-- 
    Document   : PaginaBaseVacia
    Created on : 05-sep-2017, 1:44:13
    Author     : TinTO
--%>

<%@page import="cl.aiep.examen.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pie de pagina</title>
        <style>
            body {            
                background-image: url(imagenes/death_star1.jpg);
                background-size: 100%;            
            }   
            #divID{
                color : red;
                text-align: center;
                bottom:  35px; 
                position: fixed;
                width:100%; 
                left: 0;
                background-color: black;                
            }
            .pie{                
                color : red;
                font-size: 17px;
                position: fixed;
                width:100%; 
                background-color: black;
            }

            hr#sable { 
                height: 10px; 
                width:100%; 
                background: url(imagenes/sablerojo.jpg) no-repeat center; 
                border: none;
                left: 0; 

                position: fixed; /* Hacemos que tenga una posición fija */
            }      
            #main-header {                              
                height: 120px;
                background-color: black;
                background-image: url(imagenes/header.jpg);     
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
                width: 100%; /* hacemos que la cabecera ocupe el ancho completo de la página */
                left: 0; /* Posicionamos la cabecera al lado izquierdo */
                top: 0; /* Posicionamos la cabecera pegada arriba */
                position: fixed; /* Hacemos que la cabecera tenga una posición fija */
            }	
            #main-header a {
                color: white;
            }

            #logo-header {
                float: left;
                padding: 40px 0 0 40px;
                text-decoration: none;
            }
            #logo-header:hover {
                color: #0b76a6;
            }

            #logo-header .site-name {
                display: block;
                font-weight: 700;
                font-size: 1.7em;
            }

            #logo-header .site-desc {
                display: block;
                font-weight: 300;
                font-size: 0.8em;
                color: #999;
            }        
        </style>
        
    <header id="main-header">

        <a id="logo-header" href="#">
            <span class="site-name">Figuras Star Wars</span>
            <span class="site-desc">Venta de figuras Star Wars</span>
        </a> <!-- / #logo-header -->
    </header><!-- / #main-header -->
</head>
<body>
    <div id="divID">
        <hr id="sable"/>
        <p class="pie"> © Copyright 2017----------Creado por Victor Navarro S.----------</p>
    </div>
</body>
</html>

