<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Equipo Tecnico</title>
    </head>
    <body>

        <section>
            <div id="link">
            </div>
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
