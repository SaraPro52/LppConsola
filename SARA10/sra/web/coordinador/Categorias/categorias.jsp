<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    </head>
    <body>
        <section class="col-md-12">
            <article class="col-md-6">
                <label for="NombreCategoria" class="col-md-12">Nombre:</label>
                <div class="col-md-12"><input type="text" class="form-control" id="NombreCategoria" placeholder="Nombre de la categoria"></div>
                <label for="DescripcionCategoria" class="col-md-12">Descripcion:</label>
                <div class="col-md-12"><input type="text" class="form-control" id="DescripcionCategoria" placeholder="Nombre de la descripcion"></div>
            </article>
            <article class="col-md-6">

                <div class="col-md-12"><input type="text" class="form-control" id="NombreTema" placeholder="Nombre del tema"></div>
                <label for="DescripcionCategoria" class="col-md-12">Descripcion:</label>
                <div class="col-md-12"><input type="text" class="form-control" id="DescripcionTema" placeholder="Nombre del tema"></div>
                <button type="button" id="btnTema" class="btn btn-info">Guardar Tema</button>

            </article>
            <article class="col-md-6">
                <div id="SelectTemasDiv">
                    <section  id=SelectTemas>
                    </section>
                </div>
                <button type="button" id="btnCategoria" class="btn btn-info">Guardar categoria</button>
            </article>
        </section>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="js/jquery.multi-select.js"></script></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="coordinador/Categorias/js/categorias.js"></script>
</html>
