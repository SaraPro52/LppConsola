<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Areas</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="wrapper">
                        <div id="myModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Modificar lider de  la area</h4>
                                    </div>
                                    <div class="modal-body">
                                        <select id="selecAreafun">
                                            <option value="A0">Seleciona...</option>
                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-info">Guardar</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <article class="col-md-10">
                            <label>Centro de formacion</label>
                            <select id="SelecionCentro" >
                                <option value="0">Seleciona...</option>
                            </select>
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
                                        <td>#</td>
                                        <td >Nombre area</td>
                                        <td>Lider de area</td>
                                        <td>Modificar lider</td>
                                    </tr>
                                </thead>
                                <tbody id="tablabody">
                                </tbody>
                            </table>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/area/js/area.js"></script>
</html>