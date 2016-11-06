<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <title>Ciudades</title>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <section class="col-md-12">
                            <article class="col-md-8">
                                <form id = "formularioEstado">
                                    <label for="EstadoC">Nombre de la ciudad</label>
                                    <input type="text"  name="Ciudad" id="Ciudad">
                                    <button type="button" id="btnCiudad"  name="button">Guardar Ciudad</button>
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
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/ciudad/js/ciudad.js"></script>
</html>
