<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registrar coordinador</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/registroCoordinador/js/registroCoordinador.js"></script>

    </head>
    <body>
        <section id="formDatosPerson" class="col-md-10">
            <article class="col-md-6">
                <form class="" action="coordinadorcontroller" method="post">
                    <label class="col-md-12" for="CampoNombre">Nombre</label>
                    <input class="form-control" type="text" id="CampoNombre" name="Nombre">

                    <label class="col-md-12" for="CampoApellido">Apellido</label>
                    <input class="form-control" type="text" id="CampoApellido" name="Apellido" >

                    <label class="col-md-12"  for="selectionTIdentificacion"> tipo Identificacion</label>
                    <select class="form-control" id="selectionTIdentificacion" name="TipoIdentificacion"  value="blanco">
                        <option value="1">Seleciona...</option>
                        <option value="1">Cedula Ciudadania</option>
                        <option value="2">Cedula Extrajeria</option>
                    </select>

                    <label class="col-md-12" for="campIdentificacion">N° identificacion</label>
                    <input class="form-control" type="text" id="campIdentificacion" name="identificacion">

                    <label class="col-md-12"  for="campoFuncionario">N° funcionario</label>
                    <input class="form-control" type="text" id="campFuncionario" name="Funcionario">

                    <label class="col-md-12"  for="camContrasena">Contraseña</label>
                    <input class="form-control" type="text" id="camContrasena" name="Contrasena">
                    </article>
                    <article class="col-md-6">
                        <label class="col-md-12"  for="confiContrasena">Confirmar Contraseña</label>
                        <input class="form-control" type="password" id="confiContrasena">

                        <label class="col-md-12"  for="campEmail">Email</label>
                        <input class="form-control" type="text" id="campEmail" name="Email">

                        <label class="col-md-12"  for="campoSena">Ip Sena</label>
                        <input class="form-control" type="text" id="campSena" name="Sena">

                        <label  class="col-md-12" for="cargo">cargo</label>
                        <select class="form-control" id="cargo" name="Cargo" value="blanco">
                            <option value="0">selecciona...</option>
                        </select>

                        <label  class="col-md-12"  for="campoCentro">Centro de formacion</label>
                        <select class="form-control" id="campoCentro" name="Centro">
                            <option>selecciona...</option>
                        </select>
                        <label  class="col-md-12"  for="campoCentro">Area</label>
                        <select class="form-control" id="campoArea" name="Area">
                            <option>selecciona...</option>
                        </select>
                        <label  class="col-md-12"  for="campoCentro">Estado</label>
                        <select class="form-control" id="campoEstado" name="Estado">
                            <option>selecciona...</option>
                        </select>

                        <input type="hidden" name="Opcion" value="1">
                        <input class="btn btn-block " type="submit" id="btnRegistrar" value="Registrar coordinador">
                    </article>

                </form>

                </body>
                </html>