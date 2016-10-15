<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/ciudad/js/ciudad.js"></script>
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <title>Ciudades</title>
    </head>
    <body>
        <section class="col-md-12">
            <article class="col-md-8">
                <form id = "formularioEstado">
                    <label for="EstadoC">Nombre de la ciudad</label>
                    <input type="text"  name="Ciudad" id="Ciudad">
                    <button type="button" id="btnEstado"  name="button">Guardar Ciudad</button>
                </form>
            </article>
            <article class="col-md-6 col-offset-2s">
                <table id="tablaCiudad" class="display table table-hover">
                    <thead>
                        <tr class="active">
                            <td>#</td>
                            <td>Nombre</td>
                            <td>Modificar</td>
                            <td>Eliminar</td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
        </section>
    </body>
</html>
