<%-- 
    Document   : RegistroCoordinador
    Created on : 19/07/2016, 02:53:02 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Registrar coordinador</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">   
  </head>
  <body>
    <div id="titulo">
      <header>
        <div id="logo">
          <img src="imagenes/jeje.png" width="300px" height="85px">
        </div>

      </header>
    </div>
    <section id="formDatosPerson" class="col-md-2">
      <form>
        <label>Nombre</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <label>Apellido</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <label>tipo Identificación</label>
        <br>
        <select>
          <option>seleccione...</option>
          <option>Cedula Ciudadania</option>
          <option>Cedula Extrajeria</option>
        </select>
        <br>
        <label>N° identificacion</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <label>N° funcionario</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <label>Contraseña</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <label>Confirmar Contraseña</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <br>
      </form>
      </section>
      <section id="formDatosCentro" class="col-md-4">
      <form>
        <label>Email</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <label>Ip Sena</label>
        <br>
        <input type="text" id="campNombre">
        <br>
        <label>cargo</label>
        <br>
        <select>
          <option>seleccione...</option>
          <option>Instructor</option>
          <option>Funcionario</option>
        </select>
        <br>
        <label>Centro de formacion</label>
        <br>
        <select>
          <option>seleccione...</option>
          <option>Centro de mercados logistica y tics</option>
          <option>Centro de inndustria y construccion</option>
        </select>
        <br>
        <br>
      </form>
      </section>
        <div id="btnRegistrar">
         <input class="btn btn-primary" type="submit" id="btnRegistrar" value="Registrar coordinador">
        </div>
      <footer>  
        <div id="derechos">
          <center>
            <label>Realizado por: equipo de desarrollo SARApro</label>
            <br>
            <label>Reservados todos los derechos</label>
            <br>
            <label>2016 ©</label>
          </center>
          <br>
        </div>

      </footer>
    
  </body>
</html>