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
                    <div class="col-md-12">
                        <div class="contenedorFormulario col-md-10">
                            <div class="col-md-6">
                                <label>Centro de formación</label>
                                <select class="form-control" id="tipoUsuario" name="tipoUsuario">
                                    <option> Seleccione</option>
                                    <option>Centro de manufactura y cuero</option>
                                    <option>Centro  confección y textiles</option>
                                </select

                                <label> Àrea</label>
                                <select class="form-control" id="tipoUsuario" name="tipoUsuario">
                                    <option>Seleccione</option>
                                    <option> Diseño</option>
                                    <option> Maquinaria</option>
                                </select>

                                <label>Programa de Formación</label>
                                <input type="text" class="form-control" placeholder="Ej: Diseño multimedia ">
                                <button type="submit" class="btn btn-primary">Crear Área</button>
                            </div> 
                            <div class="col-md-6">
                                <label>Nombre Área</label>
                                <input  placeholder="Nombre del area"type="text" class="form-control"  name="areac" id="areaC" required="true">

                                <label>Líder de Área</label>  
                                <input placeholder="Lider del area" type="text" class="form-control"  name="areaL" id="areaL" required="true">
                                <button type="button" class="btn btn-info" id="btnArea"  name="button">Guardar Área</button>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>



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
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/area/js/area.js"></script>
</html>