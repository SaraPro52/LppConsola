<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen" title="no title">
        <link rel="stylesheet" href="css/estilo.css" media="screen" title="no title">
        <link rel="shotrcut icon" href="imagenes/flavicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagina pricipal administrador</title>
    </head>
    <body class="col-md-12"> 
        <section>
            <div id="link">
            </div>
            <header id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle">Administrador<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="btntt" value="0">Registrar funcionario</li>
                            <li class="btntt" value="1">Deshabilitar Funcionario</li>
                            <li class="btntt" value="2">Formato</li>
                            <li class="btntt" value="3">Area</li>
                            <li class="btntt" value="4">Ciudad</li>
                            <li class="btntt" value="5">Programa</li>
                        </ul>
                    </li>
                </ul>
                <input id="controller" value="Administrador_Controller" type="hidden">
            </header>           
            <div id="cuerpo" >

            </div>
        </section>    
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="administrador/js/administradorPricipal.js"></script>
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
