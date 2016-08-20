<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/ciudad/js/ciudad.js"></script>

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
                <table id="tabla" class="display table table-hover">
                    <thead>
                        <tr class="active">
                            <td id ="id">Id</td>
                            <td id="Ciudad">Nombre ciudad</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
        </section>
    </body>
</html>
