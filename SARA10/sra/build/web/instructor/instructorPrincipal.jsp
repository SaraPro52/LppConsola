<%@page session = "true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="css/estilo.css" media="screen" title="no title">
        <title>Instructor</title>
    </head>
    <body class="col-md-12">
        <section>
            <div id="link">
            </div>
            <div class="contenedor-menu">
                <ul class="menu">
                    <li class=" activado"><a href="index.html"><i class="icono izquierda fa fa-home" aria-hidden="true"></i>Inicio</a></li>
                    <li><a href="#"><i class="icono izquierda fa fa-user-plus" aria-hidden="true"></i>Roles <i class=" icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                        <ul class="lineaHorizontal">
                            <li><a href="index.html"><i class="icono izquierda  fa fa-group" aria-hidden="true"></i>Instructor</a></li>
                            <li><a href="cerrarSesion.html"><i class="icono izquierda  fa fa-sign-out" aria-hidden="true"></i>Cambiar de rol</a></li>
                        </ul>
                    </li>
                    <li class="btntt" value="1"><a><i class="icono izquierda  fa fa-upload" aria-hidden="true"></i>Subir Objeto v.</a></li>
                    <li class="btntt" value="0"><a><i class="icono izquierda  fa fa-eye" aria-hidden="true"></i>Consultar objetos v.</a></li>
                </ul>
            </div>
            <div id="cuerpo" >

            </div>
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="instructor/js/InstrutorPrincipal.js"></script>
    <script>
        var nomUser = '<%= session.getAttribute("nomUser")%>';
        var idUser = '<%= session.getAttribute("idUser")%>';
        var idRol = '<%= session.getAttribute("idRol")%>';
        var idCentro = '<%= session.getAttribute("idCentro")%>';

        if (idUser != null && idRol != null && nomUser != null && idCentro != null) {
            alert(nomUser);
            alert(idUser);
            alert(idRol);
            alert(idCentro);
            $("#link").append("<a href='index.jsp?cerrar=true'><h5>Cerrar Sesion</h5></a>");
        } else {
            location.replace('index.jsp');
        }
        ;


    </script>
</html>
