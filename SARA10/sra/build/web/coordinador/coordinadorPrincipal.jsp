<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css" media="screen" title="no title">
        <title>Principal coordinador</title>
    </head>
    <body>
        <div class="contenedor-menu">
            <ul class="menu">
                <li class=" activado"><a href="index.html"><i class="icono izquierda fa fa-home" aria-hidden="true"></i> inicio</a></li>
                <li><a href="#"><i class="icono izquierda fa fa-user-plus" aria-hidden="true"></i>Roles <i class=" icono derecha fa fa-chevron-down" aria-hidden="true"></i></a>
                    <ul class="lineaHorizontal">
                        <li><><i class="icono izquierda  fa fa-user" aria-hidden="true"></i>coordinador</a></li>
                        <li><><i class="icono izquierda  fa fa-sign-out" aria-hidden="true"></i>cambiar de rol</a></li>
                    </ul>
                </li>
                <li class="btntt" value="0"><a><i class=" icono izquierda fa fa-area-chart" aria-hidden="true"></i>Consultar estadisticas</a></li>
                <li class="btntt" value="1"><a><i class=" icono izquierda fa fa-check" aria-hidden="true"></i>Habilitar producto virtual</a></li>
                <li class="btntt" value="2"><a><i class=" icono izquierda fa fa-credit-card-alt" aria-hidden="true"></i>Asignar roles</a></li>
                <li class="btntt" value="3"><a><i class=" icono izquierda fa fa-edit" aria-hidden="true"></i>Crear categorias</a></li>
            </ul>
        </div>
        <section>           
            <div id="cuerpo" >
            </div>
        </section>    
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="coordinador/js/PrincipalCoordinador.js"></script>
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
