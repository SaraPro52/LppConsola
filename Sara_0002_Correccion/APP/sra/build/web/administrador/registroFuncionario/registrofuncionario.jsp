<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registrar de funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link href="css/carg.css" rel="stylesheet"/>
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
                                        <option value="A0">selecciona...</option>
                                    </select>
                                    <label>Nombre</label>
                                    <input type="text" class="form-control" placeholder="Digite Nombre" id="nombre" maxlength="20">
                                    <label>Apellido</label>
                                    <input type="text" class="form-control" placeholder=" Digite Apellido" id="apellido" maxlength="20">
                                    <label>Tipo Identificacion</label>
                                    <select class="form-control"  name="tipoIdenti" id="tipoIdenti">
                                        <option value="A0" selected="selected">Selecciona...</option>
                                    </select>
                                    <label>Numero Identificación</label>
                                    <input type="text" class="form-control" placeholder="Digite Numero de Identificación" id="numeroIdentificacion" maxlength="10">
                                    <label>Correo Eléctronico</label>
                                    <input type="text" class="form-control" placeholder=" Digite Correo Eléctronico" id="email" maxlength="70">
                                </section>
                                <section class="col col-md-6">
                                    <p><h3>Datos SENA</h3> </p>
                                    <label>Centro de Formación</label>
                                    <div class="form-group">
                                        <select class="form-control"  id="centroFormacion">
                                            <option value="A0" selected="selected">Selecciona...</option>
                                        </select>
                                    </div>
                                    <label  class="col-md-12"  for="area">Área</label>
                                    <select class="form-control" id="area">
                                        <option value="A0" selected="selected">selecciona...</option>
                                    </select>
                                    <label>Ip SENA</label>
                                    <input type="text" class="form-control" placeholder=" Digite Ip SENA" id="ipSena" maxlength="10">
                                    <label  for="cargo">Cargo</label>
                                    <input type="text" class="form-control" placeholder=" Digite Cargo" id="cargo" maxlength="15">
                                    <center>
                                        <br/>
                                        <div id="AnimacionCargando" class="col-md-12">
                                            <p class="col-md-8" ALIGN=right>Creando usuario</p>
                                            <div class="windows8 col-md-4">
                                                <div class="wBall" id="wBall_1">
                                                    <div class="wInnerBall"></div>
                                                </div>
                                                <div class="wBall" id="wBall_2">
                                                    <div class="wInnerBall"></div>
                                                </div>
                                                <div class="wBall" id="wBall_3">
                                                    <div class="wInnerBall"></div>
                                                </div>
                                                <div class="wBall" id="wBall_4">
                                                    <div class="wInnerBall"></div>
                                                </div>
                                                <div class="wBall" id="wBall_5">
                                                    <div class="wInnerBall"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" id="boton1" class="btn btn-info">Registrar Funcionario</button>
                                    </center>
                                </section>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/registroFuncionario/js/registroCoordinador.js"></script>
</html>
