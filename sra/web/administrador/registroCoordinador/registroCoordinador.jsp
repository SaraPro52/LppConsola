<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registrar de funcionario</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/registroCoordinador/js/registroCoordinador.js"></script>

    </head>
    <body>
        <div id="formularioTotal">
            <hr>
            <div id="formulario1">
                <p><h2 class="dark-grey">Registrar coordinador</h2></p>
                <section class="col col-md-4">
                    <p><h3>Datos SENA</h3> </p>
                    
                    <label>Correo electronico</label>
                    <input type="text" class="form-control" placeholder="Correo electronico" id="email" maxlength="70">

                    <label>Ip SENA</label>
                    <input type="number" class="form-control" placeholder="Ip SENA" id="Ip_sena" maxlength="10">

                    <label  for="cargo">Cargo</label>
                    <select class="form-control" id="cargo" name="Cargo" value="blanco">
                        <option value="0">selecciona...</option>
                        <option value="1">Instructor</option>
                        <option value="2">Coordinador</option>
                    </select>

                    <label  class="col-md-12"  for="Area">Area</label>
                    <select class="form-control" id="Area" name="Area">
                        <option>selecciona...</option>
                    </select>
                    <label  class="col-md-12"  for="Estado">Estado</label>
                    <select class="form-control" id="Estado" name="Estado">
                        <option>selecciona...</option>
                    </select>

                    <label>centro de formacion</label>
                    <div class="form-group">
                        <select class="form-control" name="options" id="options2">
                            <option value="" selected="selected">Selecciona...</option>
                        </select>
                    </div>
                </section>
                <section class="col col-md-4">
                    <p><h3>Datos personales</h3></p>
                    <label  class="col-md-12"  for="Centro">Tipo de usuario</label>
                    <select class="form-control" id="tipoUsuario" name="Centro">
                        <option>selecciona...</option>
                        <option value="1">Instrutor</option>
                        <option value="2">Lider de equipo tecnico</option>
                        <option value="3">Lider de equipo pedagogico</option>
                        <option value="4">Coordinador</option>
                    </select>

                    <label>Nombre</label>
                    <input type="text" class="form-control" placeholder="Nombre" id="nombre" maxlength="15">

                    <label>Apellido</label>
                    <input type="text" class="form-control" placeholder="Apellido" id="apellido" maxlength="10">

                    <label>Tipo identificacion</label>
                    <select class="form-control"  name="options" id="options">
                        <option value="" selected="selected">Seleccione...</option>
                        <option value="opcion1">Cedula ciudadania</option>
                        <option value="opcion2">Cedula extrangeria</option>
                    </select>
                    <label>Numero identificacion</label>
                    <input type="number" class="form-control" placeholder="Numero de identificacion" id="Numero_identificacion" maxlength="10">
                    <center>
                        <br>
                        <input type="button" value="Cancelar" class="btn btn-danger" >
                        <input type="button" value="Registrar coordinador"  id="boton1" class="btn btn-info">
                    </center>
                </section>

            </div>
        </div>
    </body>
</html>
