<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/sesion.js"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Inicio de sesion</title>
    </head>
    <body>
            <form action="sesioncontrollers" method="post">
          <select name="Opcion" value="blanco" >
            <option value="0">Administrador</option>
            <option value="2">Instrutor</option>
            <option value="3">Equipo</option>
            <option value="4">Coordinador</option>
          </select>
          <input type="submit" name="btnenviar" value="Aceptar">
</form>
        <header id="navbar" class="navbar-collapse collapse">
            <div id="header">
                
            </div>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle">Casa</a>
                </li>
                <li class="dropdown"><a class="dropdown-toggle">Administrador<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="btntt" value="0">Funcionarios activos</li>
                        <li class="btntt" value="1">Estados de funcionarios</li>
                        <li class="btntt" value="2">Estados de version</li>
                        <li class="btntt" value="3">Areas</li>
                        <li class="btntt" value="4">Ciudad</li>
                        <li class="btntt" value="5">Registro funcionario</li>
                        <li class="btntt" value="11">Formato</li>
                    </ul>
                </li>
                <li class=" dropdown"><a href="#" class="dropdown-toggle">instructor<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="btntt" value="6">Registro de OA</li>
                        <li class="btntt" value="9">Consultar de OA</li>
                    </ul>
                </li>
                <li class=" down"><a href="#" class="dropdown-toggle">Equipo tecnico <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="btntt" value="7">Crear lista de chequeo</li>
                        <li class="btntt" value="8">Modificar lista de chequeo</li>
                        <li class="btntt" value="10">Calificar OA</li>
                    </ul>
                </li>
                <li class=" down"><a href="#" class="dropdown-toggle" >Equipo pedagogico<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="btntt" value="7">Crear lista de chequeo</li>
                        <li class="btntt" value="8">Modificar lista de chequeo</li>
                        <li class="btntt" value="10">Calificar OA</li
                    </ul>
                </li>
                <li class="down"><a href="#" class="dropdown-toggle">Coordinador<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="btntt" value="0">Funcionarios activos</li>
                    </ul>
                </li>
            </ul>
        </header>
        <div id="cuerpo">

        </div>
    </body>
    <div id="footer">
    </div>
</html>
