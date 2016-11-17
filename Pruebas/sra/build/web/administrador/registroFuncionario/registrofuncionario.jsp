<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registrar de funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="contenedor">
                            <div id="formulario1">
                                <section class="col col-md-6">
                                    <p><h3>Datos personales</h3></p>
                                    <label  class="col-md-12"  for="Centro">Tipo de usuario</label>
                                    <select class="form-control" id="tipoUsuario" name="tipoUsuario">
                                        <option>selecciona...</option>
                                    </select>
                                    <label>Nombre</label>
                                    <input type="text" class="form-control" placeholder="Nombre" id="nombre" maxlength="20">
                                    <label>Apellido</label>
                                    <input type="text" class="form-control" placeholder="Apellido" id="apellido" maxlength="20">
                                    <label>Tipo identificacion</label>
                                    <select class="form-control"  name="tipoIdenti" id="tipoIdenti">
                                        <option value="" selected="selected">Seleccione...</option>
                                    </select>
                                    <label>Numero identificacion</label>
                                    <input type="text" class="form-control" placeholder="Numero de identificacion" id="numeroIdentificacion" maxlength="10">
                                    <label>Correo electronico</label>
                                    <input type="text" class="form-control" placeholder="Correo electronico" id="email" maxlength="70">
                                </section>
                                <section class="col col-md-6">
                                    <p><h3>Datos SENA</h3> </p>
                                    <label>centro de formacion</label>
                                    <div class="form-group">
                                        <select class="form-control"  id="centroFormacion">
                                            <option value="" selected="selected">Selecciona...</option>
                                        </select>
                                    </div>
                                    <label  class="col-md-12"  for="area">Area</label>
                                    <select class="form-control" id="area" name="area">
                                        <option>selecciona...</option>
                                    </select>
                                    <label>Ip SENA</label>
                                    <input type="text" class="form-control" placeholder="Ip SENA" id="ipSena" maxlength="10">
                                    <label  for="cargo">Cargo</label>
                                    <input type="text" class="form-control" placeholder="Cargo" id="cargo" maxlength="15">
                                    <center>
                                        <input type="button" value="Registrar Funcionario"  id="boton1" class="btn btn-info">
                                    </center>
                                </section>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
     <script src="assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/registroFuncionario/js/registroCoordinador.js"></script>
</html>
