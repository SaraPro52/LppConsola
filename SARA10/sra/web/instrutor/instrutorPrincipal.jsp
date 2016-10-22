<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <title>Equipo Tecnico</title>
    </head>
    <body class="col-md-12">
        <section>
            <header id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a class="dropdown-toggle">Instrutor<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="btntt" value="0">Consultar P.V</li>
                            <li class="btntt" value="1">Subir P.V</li>
                        </ul>
                    </li>
                </ul>
                <input id="controller" value="Instrutor_Controller" type="hidden">
            </header>           
            <div id="cuerpo" >

            </div>
        </section>    
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/sesion.js"></script>
</html>