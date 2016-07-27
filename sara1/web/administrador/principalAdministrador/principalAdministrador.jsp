<%-- 
    Document   : principalAdministrador
    Created on : 26/07/2016, 09:53:55 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/estiloPrincipal.css" >
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <title></title>
  </head>
  <body>
    <header>
      <div id="logo"> <img src="recursos/jeje.png" height="100px"></div>
    </header>

    <div id="tablaDatos">
     <div id="botones">
      <a href="../estado/estado.jsp"><input type="submit" id="btnEstado" value="Estado"class="btn btn-info"></a>
      
      <a href="../registroCoordinador/RegistroCoordinador.jsp"><input type="submit" id="btnEstado" value="Registrar Coordinador" class="btn btn-info"></a>
    </div>
    
    <table border="1" class="table table-hover  table-bordered">
      <thead>
        <th class="info">Nombre</th>
        <th class="info">Cargo</th>
        <th class="info">Area</th>
        <th class="info">Estado</th>
        <th class="info">Deshabilitar</th>
      </thead>
      <tbody>
        <tr>
        <td>miguel Castibanco</td>
        <td>coordinador</td>
        <td>teleinformatica</td>
        <td>Activo</td>
        <td>
          <select>
            <option>seleccione..</option>
            <option>deshabilitado</option>
            <option>habilitado</option>
          </select>
        </td>
        </tr>

        <tr>
        <td>Leonardo Franco</td>
        <td>Instructor</td>
        <td>teleinformatica</td>
        <td>Inactivo</td>
        <td>
          <select>
            <option>seleccione..</option>
            <option>deshabilitado</option>
            <option>habilitado</option>
          </select>
        </td>
        </tr>
        <tr>
          <td>Juan Lopez</td>
          <td>Coordinador</td>
          <td>Lógistica</td>
          <td>Activo</td>
          <td>
            <select>
              <option>seleccione..</option>
              <option>deshabilitado</option>
              <option>habilitado</option>
            </select>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <div id="footerIndex">
    <footer id="derechos">
        <p>
          Desarrollado por: Equipo de desarrollo SARApro
        </p>
        <p>
          Reservados todos los derechos
        </p>
        <p>
          2016
        </p>
    </footer>
  </div>
  </body>
</html>

