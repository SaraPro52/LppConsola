<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>estados</title>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="administrador/area/js/area.js"></script>
  </head>
  <body>
    <header></header>
    <section class="col-md-12">
      <article class="col-md-8">
        <form id = "formularioEstado" method="post" action="EstadoController">
              <input type="text"  name="Area" id="areaC">
              <input type="hidden" name="Opcion" value="1">
              <input type="submit" id="btnEstado" value="Guardar estado">
        </form>
      </article>
      <article class="col-md-6 col-offset-2s">
        <table id="tabla" class="table table-hover">
          <thead>
            <tr class="active">
              <td>Id</td>
              <td >Nombre area</td>
              <td></td>
              <td></td>
            </tr>
          </thead>
          <tbody id="tablabody">
          </tbody>
        </table>
      </article>
    </section>
    <footer></footer>
  </body>
</html>
