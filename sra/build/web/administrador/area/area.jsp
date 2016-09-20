<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Areas</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/area/js/area.js"></script>
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    </head>
    <body class="col-md-12">
            <article class="col-md-10">
                <form id = "formularioEstado">
                    <label for="areaC">Nombre Area</label>
                    <input  placeholder="Nombre del area"type="text"  name="areac" id="areaC" required="true">
                    <label for="areaC">Lider de area</label>
                    <input placeholder="Lider del area" type="text"  name="areaL" id="areaL" required="true">
                    <button type="button" class="btn btn-info" id="btnArea"  name="button">Guardar area</button>
                </form>
            </article>
            <article class="col-md-10 ">
                <table id="tablaarea" class="table table-hover">
                    <thead>
                        <tr class="active">
                            <td>Id</td>
                            <td >Nombre area</td>
                            <td>Lider de area</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody id="tablabody">
                    </tbody>
                </table>
            </article>
    </body>
</html>