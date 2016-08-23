<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registrar de funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/registroCoordinador/js/registroCoordinador.js"></script>
    </head>
    <body>
        <section id="formDatosPerson" class="col-md-10">
            <article class="col-md-6">
                <form>
                    <label  class="col-md-12"  for="Centro">Tipo de usuario</label>
                    <select class="form-control" id="tipoUsuario" name="Centro">
                        <option>selecciona...</option>
                        <option value="1">Instrutor</option>
                        <option value="2">Lider de equipo tecnico</option>
                        <option value="3">Lider de equipo pedagogico</option>
                        <option value="4">Coordinador</option>
                    </select>
                    <label class="col-md-12" for="CampoNombre">Nombre</label>
                    <input class="form-control" type="text" id="CampoNombre" name="Nombre" placeholder="Ingresa el nombre">
                    <label class="col-md-12" for="CampoApellido">Apellido</label>
                    <input class="form-control" type="text" id="CampoApellido" name="Apellido" placeholder="Ingresa el apellido">
                    <label class="col-md-12"  for="selectionTIdentificacion" > tipo Identificacion</label>
                    <select class="form-control" id="selectionTIdentificacion" name="TipoIdentificacion"  value="blanco">
                        <option value="0">Seleciona...</option>
                        <option value="1">Cedula Ciudadania</option>
                        <option value="2">Cedula Extrajeria</option>
                        <option value="2">registro civil</option>
                    </select>
                    <label class="col-md-12" for="campIdentificacion">N° identificacion</label>
                    <input class="form-control" type="text" id="campIdentificacion" name="identificacion" placeholder="Ingresa el numero de identificacion">
                    <label class="col-md-12"  for="campEmail">Email</label>
                    <input class="form-control" type="email" id="campEmail" name="Email" placeholder="Ingresa el Email">
                    </article>
                    <article class="col-md-6">
                        <label class="col-md-12"  for="campoSena">Ip Sena</label>
                        <input class="form-control" type="text" id="campSena" name="Sena" placeholder="Ingresa identificacion sena ">
                        <label  class="col-md-12" for="cargo">cargo</label>
                        <select class="form-control" id="cargo" name="Cargo" value="blanco">
                            <option value="0">selecciona...</option>
                            <option value="1">Instructor</option>
                            <option value="2">Coordinador</option>
                        </select>
                        <label  class="col-md-12"  for="Centro">Centro de formacion</label>
                        <select class="form-control" id="Centro" name="Centro">
                            <option>selecciona...</option>
                        </select>
                        <label  class="col-md-12"  for="Area">Area</label>
                        <select class="form-control" id="Area" name="Area">
                            <option>selecciona...</option>
                        </select>
                        <label  class="col-md-12"  for="Estado">Estado</label>
                        <select class="form-control" id="Estado" name="Estado">
                            <option>selecciona...</option>
                        </select>
                        <br>
                        <button class="btn btn-block" type="button" id="btnRegistrar" >Registrar funcionario</button>   
                    </article>
                </form>
                </body>
                </html>