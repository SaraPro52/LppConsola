<%-- 
    Document   : index
    Created on : 30/07/2016, 10:26:24 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/sesion.js"></script>
    <title>Inicio de sesion</title>
  </head>
  <body>
    <section>
      <article>
        <center><label>Menu de roles y sus casos de uso</label></center>
        <form action="sesioncontroller" method="post">
          <select name="Opcion" value="blanco" >
            <option value="1">Administrador</option>
            <option value="2">Instrutor</option>
            <option value="3">Equipo</option>
            <option value="4">Coordinador</option>
          </select>
          <input type="submit" name="btnenviar" value="Aceptar">
        </form>
      </article>
    </section>
  </body>
</html>
