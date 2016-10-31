<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css" media="screen" title="no title">
        <title>Equipo Tecnico</title>
    </head>
    <body>

        <div class="contenedor-menu">
            <!--<a href="#" class="btn-menu">menu<i class=" icono derecha fa fa-bars" aria-hidden="true"></i></a>-->
            <ul class="menu">
                <li class=" activado"><a href="index.html"><i class="icono izquierda fa fa-home" aria-hidden="true"></i> inicio</a></li>
                <li><a href="#"><i class="icono izquierda fa fa-user-plus" aria-hidden="true"></i>Roles <i class=" icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                    <ul class="lineaHorizontal">
                        <li><a href="index.html"><i class="icono izquierda  fa fa-group" aria-hidden="true"></i>Equipo evaluador</a></li>
                        <li><a href="cerrarSesion.html"><i class="icono izquierda  fa fa-sign-out" aria-hidden="true"></i>Cambiar de rol</a></li>
                    </ul>
                </li>
                <li><a href="crearLista.html"><i class="icono izquierda  fa fa-book" aria-hidden="true"></i>Crear lista chequeo</a></li>
                <li><a href="modificar.html"><i class="icono izquierda  fa fa-edit" aria-hidden="true"></i>Modificar Lista chequeo</a></li>
                <li><a href="evaluar.html"><i class="icono izquierda  fa fa-check" aria-hidden="true"></i>Evaluar Objetos</a></li>
                <li><a href="consultar.html"><i class="icono izquierda  fa fa-eye" aria-hidden="true"></i>consultar objetos</a></li>
            </ul>

        </div>
        <section>
            <header id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle">Equipo Tecnico<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="btntt" value="0">Evaluar Producto Virtual</li>
                            <li class="btntt" value="1">Crear Lista Chequeo</li>
                            <li class="btntt" value="2">Consultar P.V</li>
                            <li class="btntt" value="3">Modificar lista</li>
                        </ul>
                    </li>
                </ul>
                <input id="controller" value="Equipo_Controller" type="hidden">
                <input id="vista" value="0" type="hidden">
            </header>           
            <div id="cuerpo" >

            </div>
        </section>    
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/sesion.js"></script>  
</html>
