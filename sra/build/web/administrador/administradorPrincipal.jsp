<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <title>Pagina pricipal administrador</title>
    </head>
    <body>
        <section>
            <article>
                <center><label>casos de uso</label></center>
                <form class="" action="administradocontroller" method="post">
                    <label for="Opcion">Seleciona el caso de uso ;)</label>
                    <select name="Opcion" value="blanco" >
                        <option value="1">Estados de funcionario</option>
                        <option value="2">Estados de version</option>
                        <option value="3">Areas</option>
                        <option value="4">Ciudad</option>
                        <option value="5">Registrar coordinador</option>
                        <option value="6">Principal instrutor</option>
                    </select>
                    <input type="submit" name="btnenviar" value="Aceptar">
                </form>
            </article>
            <article>
                <table id="tabla" border="1" class="table table-hover  table-bordered">
                    <thead>
                    <th class="info">Nombre</th>
                    <th class="info">Cargo</th>
                    <th class="info">Area</th>
                    <th class="info">Estado</th>
                    <th class="info">Deshabilitar</th>
                    </thead>
                    <tbody>
                        <tr>

                        </tr>   
                    </tbody>
                </table>
            </article>
        </section>
    </body>
</html>
