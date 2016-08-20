
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>estados</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/estado/js/estado.js"></script>
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    </head>
    <body>
        <header></header>
        <section class="col-md-12">
            <article class="col-md-8">
                <form id = "formularioEstado">
                    <label for="EstadoC">Estados de version</label>
                    <label for="EstadoC">Nombre estado</label>
                    <input type="text"  name="Estado" id="EstadoC">
                    <input type="hidden" id="tipo" value="2">
                    <button type="button" id="btnEstado" name="button">Guardar estado</button>
                </form>
            </article>
            <article class="col-md-6 col-offset-2s">
                <table id="tabla" class="display table table-hover">
                    <thead>
                        <tr class="active">
                            <td id ="id">Id</td>
                            <td id="Nombre">Nombre estado</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
        </section>
        <footer></footer>
    </body>
</html>