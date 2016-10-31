<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <title>Equipo Pedagogico</title>
    </head>
    <body class="col-md-12">
        <section>
            <div id="link">
            </div>
            <header id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle">Equipo pedagigico<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="btntt" value="0">Evaluar Producto Virtual</li>
                            <li class="btntt" value="1">Crear Lista Chequeo</li>
                            <li class="btntt" value="2">Consultar P.V</li>
                            <li class="btntt" value="3">Modificar lista</li>
                        </ul>
                    </li>
                </ul>
                <input id="controller" value="Equipo_Controller" type="hidden">
                <input id="vista" value="1" type="hidden">
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