<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registrar de funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" href="css/freelancer.css" media="screen" title="no title" charset="utf-8">
    </head>
    <body>
        <section id="formularioTotal" class="row">
            <from id="FormRegistro" novalidate>
                <label><h3>Registro funcionario</h3></label>
                <br>
                <article id="formulario1" class="col-md-6">
                    <label class="col-md-12"><h4>Datos personales</h4></label>
                    <div class="row control-group col-md-10">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label class="col-md-12">Nombres</label>
                            <input type="text" class="form-control" placeholder="Nombres" id="nombre"  required data-validation-required-message="Ingresa tus nombres.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group col-md-10">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Apellidos</label>
                            <input type="text" class="form-control" placeholder="Apellido" id="apellido"  required data-validation-required-message="Ingresa tus apellidos.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <select class="form-control"  name="tipoIdenti" id="tipoIdenti">
                            <option value="" selected="selected">Tipo identificacion</option>
                        </select>
                    </div>
                    <div class="row control-group col-md-10">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Numero identificacion</label>
                            <input type="text" class="form-control" placeholder="Numero de identificacion" id="numeroIdentificacion"  required data-validation-required-message="Ingresa tu numero de identificacion.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <select class="form-control" id="tipoUsuario" name="tipoUsuario">
                            <option>Tipo de usuario</option>
                        </select>
                    </div>
                    <div class="row control-group col-md-10">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Correo electronico</label>
                            <input type="email" class="form-control" placeholder="Correo electronico" id="email"  required data-validation-required-message="Ingresa tu correo electronico.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>

                </article>
                <article class="col-md-6">
                    <label class="col-md-12"><h4>Datos Sena</h4></label>
                    <div class="row control-group col-md-10">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Ip Sena</label>
                            <input type="email" class="form-control" placeholder="Ip Sena" id="ipSena"  required data-validation-required-message="Ingresa tu Ip Sena.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group col-md-10">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Cargo</label>
                            <input type="email" class="form-control" placeholder="Cargo" id="cargo"  required data-validation-required-message="Ingresa tu cargo.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <select class="form-control"  id="centroFormacion">
                            <option value="" selected="selected">centro de formacion</option>
                        </select>
                        <select class="form-control" id="area" name="area">
                            <option>Area</option>
                        </select>  
                    </div>
                    <div class="col-md-8">
                        <button type="button" id="boton1" class="btn btn-block">Registrar funcionario</button>
                    </div>
                </article>
            </from>
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jqBootstrapValidation.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="administrador/registroFuncionario/js/registroCoordinador.js"></script>
</html>
