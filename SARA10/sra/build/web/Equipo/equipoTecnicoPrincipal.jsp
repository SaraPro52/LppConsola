<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css" media="screen" title="no title">
        <title>Equipo Tecnico</title>
    </head>
    <body class="col-md-12">
        <div class="contenedor-menu col-md-6">
            <ul class="menu">
                <li class=" activado"><a href="index.html"><i class="icono izquierda fa fa-home" aria-hidden="true"></i> inicio</a></li>
                <li><a href="#"><i class="icono izquierda fa fa-user-plus" aria-hidden="true"></i>Roles <i class=" icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                    <ul class="lineaHorizontal">
                        <li><a href="index.html"><i class="icono izquierda  fa fa-group" aria-hidden="true"></i>Equipo evaluador</a></li>
                        <li><a href="cerrarSesion.html"><i class="icono izquierda  fa fa-sign-out" aria-hidden="true"></i>Cambiar de rol</a></li>
                    </ul>
                </li>
                <li class="activado" value="1"><a><i class="icono izquierda  fa fa-book" aria-hidden="true"></i>Crear lista chequeo</a></li>
                <li class="activado" value="3"><a><i class="icono izquierda  fa fa-edit" aria-hidden="true"></i>Modificar Lista chequeo</a></li>
                <li class="activado" value="2"><a><i class="icono izquierda  fa fa-eye" aria-hidden="true"></i>consultar objetos</a></li>
            </ul>

    </body>
</div>
<input id="vista" value="0" type="hidden">
<section>
    <div id="link">
    </div>
    <div id="cuerpo" class="col-md-9">

    </div>
</section> 
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="Equipo/js/Principalequipo.js"></script>
<script>
    var nomUser = '<%= session.getAttribute("nomUser")%>';
    var idUser = '<%= session.getAttribute("idUser")%>';
    var idRol = '<%= session.getAttribute("idRol")%>';
    var idCentro = '<%= session.getAttribute("idCentro")%>';

    if (idUser != null && idRol != null && nomUser != null && idCentro != null) {
        $("#link").append("<a href='index.jsp?cerrar=true'><h5>Cerrar Sesion</h5></a>");
    } else {
        location.replace('index.jsp');
    }
</script>
</html>
