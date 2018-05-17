<%-- 
    Document   : ListaProductos
    Created on : 31-ago-2017, 19:11:35
    Author     : TinTO
--%>

<%@page import="cl.aiep.examen.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.aiep.examen.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Productos</title>

        <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js' type='text/javascript'></script>
        <script type='text/javascript'>
            //<![CDATA[
            /* jQuery Image Magnify script v1.1
             * This notice must stay intact for usage 
             * Author: Dynamic Drive at http://www.dynamicdrive.com/
             * Visit http://www.dynamicdrive.com/ for full source code
             
             * Nov 16th, 09 (v1.1): Adds ability to dynamically apply/reapply magnify effect to an image, plus magnify to a specific width in pixels.
             * Feb 8th, 11 (v1.11): Fixed bug that caused script to not work in newever versions of jQuery (ie: v1.4.4)
             */

            jQuery.noConflict()

            jQuery.imageMagnify = {
                dsettings: {
                    magnifyby: 3, //default increase factor of enlarged image
                    duration: 500, //default duration of animation, in millisec
                    imgopacity: 0.2 //opacify of original image when enlarged image overlays it
                },
                cursorcss: 'url(magnify.cur), -moz-zoom-in', //Value for CSS's 'cursor' attribute, added to original image
                zIndexcounter: 100,
                refreshoffsets: function ($window, $target, warpshell) {
                    var $offsets = $target.offset()
                    var winattrs = {x: $window.scrollLeft(), y: $window.scrollTop(), w: $window.width(), h: $window.height()}
                    warpshell.attrs.x = $offsets.left //update x position of original image relative to page
                    warpshell.attrs.y = $offsets.top
                    warpshell.newattrs.x = winattrs.x + winattrs.w / 2 - warpshell.newattrs.w / 2
                    warpshell.newattrs.y = winattrs.y + winattrs.h / 2 - warpshell.newattrs.h / 2
                    if (warpshell.newattrs.x < winattrs.x + 5) { //no space to the left?
                        warpshell.newattrs.x = winattrs.x + 5
                    } else if (warpshell.newattrs.x + warpshell.newattrs.w > winattrs.x + winattrs.w) {//no space to the right?
                        warpshell.newattrs.x = winattrs.x + 5
                    }
                    if (warpshell.newattrs.y < winattrs.y + 5) { //no space at the top?
                        warpshell.newattrs.y = winattrs.y + 5
                    }
                },
                magnify: function ($, $target, options) {
                    var setting = {} //create blank object to store combined settings
                    var setting = jQuery.extend(setting, this.dsettings, options)
                    var attrs = (options.thumbdimensions) ? {w: options.thumbdimensions[0], h: options.thumbdimensions[1]} : {w: $target.outerWidth(), h: $target.outerHeight()}
                    var newattrs = {}
                    newattrs.w = (setting.magnifyto) ? setting.magnifyto : Math.round(attrs.w * setting.magnifyby)
                    newattrs.h = (setting.magnifyto) ? Math.round(attrs.h * newattrs.w / attrs.w) : Math.round(attrs.h * setting.magnifyby)
                    $target.css('cursor', jQuery.imageMagnify.cursorcss)
                    if ($target.data('imgshell')) {
                        $target.data('imgshell').$clone.remove()
                        $target.css({opacity: 1}).unbind('click.magnify')
                    }
                    var $clone = $target.clone().css({position: 'absolute', left: 0, top: 0, visibility: 'hidden', border: '1px solid gray', cursor: 'pointer'}).appendTo(document.body)
                    $clone.data('$relatedtarget', $target) //save $target image this enlarged image is associated with
                    $target.data('imgshell', {$clone: $clone, attrs: attrs, newattrs: newattrs})
                    $target.bind('click.magnify', function (e) { //action when original image is clicked on
                        var $this = $(this).css({opacity: setting.imgopacity})
                        var imageinfo = $this.data('imgshell')
                        jQuery.imageMagnify.refreshoffsets($(window), $this, imageinfo) //refresh offset positions of original and warped images
                        var $clone = imageinfo.$clone
                        $clone.stop().css({zIndex: ++jQuery.imageMagnify.zIndexcounter, left: imageinfo.attrs.x, top: imageinfo.attrs.y, width: imageinfo.attrs.w, height: imageinfo.attrs.h, opacity: 0, visibility: 'visible', display: 'block'})
                                .animate({opacity: 1, left: imageinfo.newattrs.x, top: imageinfo.newattrs.y, width: imageinfo.newattrs.w, height: imageinfo.newattrs.h}, setting.duration,
                                        function () { //callback function after warping is complete
                                            //none added		
                                        }) //end animate
                    }) //end click
                    $clone.click(function (e) { //action when magnified image is clicked on
                        var $this = $(this)
                        var imageinfo = $this.data('$relatedtarget').data('imgshell')
                        jQuery.imageMagnify.refreshoffsets($(window), $this.data('$relatedtarget'), imageinfo) //refresh offset positions of original and warped images
                        $this.stop().animate({opacity: 0, left: imageinfo.attrs.x, top: imageinfo.attrs.y, width: imageinfo.attrs.w, height: imageinfo.attrs.h}, setting.duration,
                                function () {
                                    $this.hide()
                                    $this.data('$relatedtarget').css({opacity: 1}) //reveal original image
                                }) //end animate
                    }) //end click
                }
            };
            jQuery.fn.imageMagnify = function (options) {
                var $ = jQuery
                return this.each(function () { //return jQuery obj
                    var $imgref = $(this)
                    if (this.tagName != "IMG")
                        return true //skip to next matched element
                    if (parseInt($imgref.css('width')) > 0 && parseInt($imgref.css('height')) > 0 || options.thumbdimensions) { //if image has explicit width/height attrs defined
                        jQuery.imageMagnify.magnify($, $imgref, options)
                    } else if (this.complete) { //account for IE not firing image.onload
                        jQuery.imageMagnify.magnify($, $imgref, options)
                    } else {
                        $(this).bind('load', function () {
                            jQuery.imageMagnify.magnify($, $imgref, options)
                        })
                    }
                })
            };
            jQuery.fn.applyMagnifier = function (options) { //dynamic version of imageMagnify() to apply magnify effect to an image dynamically
                var $ = jQuery
                return this.each(function () { //return jQuery obj
                    var $imgref = $(this)
                    if (this.tagName != "IMG")
                        return true //skip to next matched element

                })

            };
            jQuery(document).ready(function ($) {
                var $targets = $('.magnify')
                $targets.each(function (i) {
                    var $target = $(this)
                    var options = {}
                    if ($target.attr('data-magnifyto'))
                        options.magnifyto = parseFloat($target.attr('data-magnifyto'))
                    if ($target.attr('data-magnifyby'))
                        options.magnifyby = parseFloat($target.attr('data-magnifyby'))
                    if ($target.attr('data-magnifyduration'))
                        options.duration = parseInt($target.attr('data-magnifyduration'))
                    $target.imageMagnify(options)
                })
                var $triggers = $('a[rel^="magnify["]')
                $triggers.each(function (i) {
                    var $trigger = $(this)
                    var targetid = $trigger.attr('rel').match(/\[.+\]/)[0].replace(/[\[\]']/g, '') //parse 'id' from rel='magnify[id]'
                    $trigger.data('magnifyimageid', targetid)
                    $trigger.click(function (e) {
                        $('#' + $(this).data('magnifyimageid')).trigger('click.magnify')
                        e.preventDefault()
                    })
                })
            })
            /***********************************************
             * jQuery Image Magnify- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
             * This notice MUST stay intact for legal use
             * Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
             ***********************************************/
            //]]>
        </script>
        
        <style>
            body {            
                background-image: url(imagenes/death_star1.jpg);
                background-size: 100%; 
                padding-top: 120px;
                padding-bottom: 35px;
            }        
            #tablaProductos{
                margin-left: 3%;
                width: 94%;
                color: white;
                border: 3px solid darkred;
            }
            #imagen{            
                width:100%; 
                height:100%;
            }
            td{
                text-align: center;                
            }
            td.peq{
                width:100px;
                height: 100px;   
                color: #35D626;
            }
            td.med{
                width:200px;
                height: 100px;                   
            }
            #cantidad{
                width: 30%;               
                margin-left: 20px;
                margin-right: 20px;
                float: left;   
            }
            #mas,#menos{
                width: 40px;                                       
                text-align: center;
                float: left;   
            }
        </style>
        <script language="JavaScript">
            function aviso() {
                if (!confirm("Producto agregado al carrito \n\- Para ir al Carro de Compras Presione OK \n\- Para continuar explorando productos Presione CANCELAR")) {
                    return false;
                } else {
                    document.location = "CarroDeCompras.jsp";
                    return true;  
                }
            }
        </script>
                            <%
                Usuarios user = (Usuarios) session.getAttribute("user");
                if (user != null && user.getTipo() == 2) {                   
                } else {
                    response.sendRedirect("index.jsp");
                }
            %>   
    </head>
    <body>        
        <jsp:include page="PaginaBaseLlena.jsp" flush="true" />        
            <table border="1" id='tablaProductos'>
                <tr>                   
                    <th colspan="2">Producto</th>                
                    <th>Descripcion</th>               
                    <th>Estado</th>    
                    <th>Precio Unitario</th>
                    <th colspan="2">Cantidad</th>
                </tr>
                <%
                    Productos ob = new Productos();
                    ArrayList<Productos> lista = ob.getLista(" where estado=1");
                    for (int i = 0; i < lista.size(); i++) {
                        Productos aux = lista.get(i);
                        out.println("<form action='agregaCarro.jsp' name='articulo"+i+"' >");
                        out.println("<tr>");
                        out.println("<td class='peq'><label name='lblImg'><img src='imagenes/" + aux.getCod_imagen() + "' class='magnify' id='imagen'/></label></td>");
                        out.println("<td class='med'><label name='lblNombre'>" + aux.getNombre_producto() + "</label> </td>");
                        out.println("<td><label name='lblDescripcion'>" + aux.getDescripcion() + "</label> </td>");                        

                        if (aux.isEstado()) {
                            out.println("<td class='peq'><label name='lblEstado'> Disponible </label></td>");
                        }
                        out.println("<td class='peq'><label name='lblValor'> $" + aux.getValor() + "</label> </td>");
                        out.println("<td class='med'><input type='text' name='cantidad' id='cantidad' value='0' readonly/>"
                                + "<input type='button' name='mas' id='mas' value='+' onClick='javascript:document.articulo"+i+".cantidad.value++;' />"
                                + "<input type='button' name='menos' id='menos' value='-' onClick='javascript:document.articulo"+i+".cantidad.value--;' /></td>");
                        out.println("<td class='peq'><input type='submit' value='Agregar al Carro'/></td>");
                        out.println("<td><input type='hidden' name='txtSerie' value='"+aux.getSerie()+"'/></td>");
                        out.println("<td><input type='hidden' name='idProducto' value='"+aux.getId_producto()+"'/></td>");
                        out.println("</tr>");
                        out.println("</form>");
                    }
                %>

            </table>                
            <br/><br/>
    </body>      
</html>
