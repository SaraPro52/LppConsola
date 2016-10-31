<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <title>Principal coordinador</title>
    </head>
    <body>
<<<<<<< HEAD
        <section>
            <div id="link">
            </div>
            <header id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle">Coordinador<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="btntt" value="0">Consultar Estadisticas</li>
                            <li class="btntt" value="1">Habilitar Producto Virtual</li>
                            <li class="btntt" value="2">Asignar Roles</li>
                            <li class="btntt" value="3">Crear Categorias</li>
                        </ul>
                    </li>
                </ul>
                <input id="controller" value="coordinador_controller" type="hidden">
            </header>           
=======
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
                <li class="btntt" value="2"><><i class=" icono izquierda fa fa-credit-card-alt" aria-hidden="true"></i>Asignar roles</a></li>
                <li class="btntt" value="3"><a><i class=" icono izquierda fa fa-edit" aria-hidden="true"></i>Crear categorias</a></li>
            </ul>
        </div>
        <section>           
>>>>>>> db0bf837eea292c0ee92ba10379fa52718269f63
            <div id="cuerpo" >

            </div>
        </section>    
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/sesion.js"></script>
    <script>
        var nomUser =   '<%= session.getAttribute("nomUser") %>';
        var idUser =    '<%= session.getAttribute("idUser") %>';
        var idRol =     '<%= session.getAttribute("idRol") %>';
        var idCentro =  '<%= session.getAttribute("idCentro") %>';

        if(idUser != null && idRol != null && nomUser != null && idCentro != null){
          alert(nomUser);
          alert(idUser);
          alert(idRol);
          alert(idCentro);
          $("#link").append("<a href='index.jsp?cerrar=true'><h5>Cerrar Sesion</h5></a>");
        }else {
          location.replace('index.jsp');
        };
    </script>
</html>
