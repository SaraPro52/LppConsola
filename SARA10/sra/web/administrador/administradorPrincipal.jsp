<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <title>Pagina pricipal administrador</title>
    </head>
    <body class="col-md-12"> 
        <section>
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
    <script type="text/javascript" src="js/sesion.js"></script>
</html>
