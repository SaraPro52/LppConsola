<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/estilo12.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <title>Consultar OA</title>
    </head>
    <body>
        <h2 class="dark-grey">Lista de objetos de aprendizaje </h2>
        <article class="">
            <div id="Tituloss" class="ui-widget">
                <label for="txtBuscar">Buscar titulo</label>
                <input type="text" id="txtBuscar" value="">
            </div>
            <div id="ElementoFormacion">
                <label>Programa de formacion</label>
                <select class="clickformacion" id="Formacion">
                    <option value="A0">Seleciona...</option>
                </select>
                <div id="formacionC" style="display: none;">
                    <label>area de formacion</label>
                    <select class="" id="AreaF">
                        <option value="A0">Seleciona...</option>
                    </select>
                </div>
            </div>
            <div id="ElementoCategoria">
                <label>categoria</label>
                <select class="" id="Categoria">
                    <option value="A0">Seleciona...</option>
                    <option value="0">...</option>
                </select>
                <div  id="CategoriaTem" style="display: none;">
                    <label>Tema de categoria</label>
                    <select class="" id="TemaC">
                        <option value="A0">Seleciona...</option>
                    </select>
                </div>
            </div>    


            <label  > <a id="BusquedaAvanzada">Busqueda Avanzada</a></label>
            <div id="Avando" style="display: none;" >
                <label for="Autores">Autores: </label>
                <input type="text" id="Autores" value="">
                <label for="Palabras">Palabras clave: </label>
                <input type="text" id="Autores" value="">
                <label for="Formato">Formato:</label>
                <select class="" id="Formato">
                    <option value="A0">Seleciona...</option>
                </select>
                <label for="Fecha">Fecha de publicacion:</label>
                <input type="date" id="Fecha" value="">
            </div>
        </article>
    </p>

    <div id="formulario1" style="display: none;">
        <section class="col col-md-10" id="Contenedora">
            <article class="col-md-3">
                <figure><img src="imagenes/imagenoa.png" width="160"  height="180" id="ImagenOA"></figure>
            </article>
            <article class="col-md-9" >
                <div class="col-md-6">
                    <label>Titulo publicacion</label>
                    <p id="TituloOa"></p>
                    <label>Autor(es)</label>
                    <p id="AutoresOa"></p>
                    <label>fecha de publicacion</label>
                    <p id="FechaPublicacionOa"></p>
                </div>
                <div class="col-md-6">
                    <label>Decripcion</label>
                    <p id="DescripcionOa"></p>
                    <button type="button" class="btn btn-info" id="BtnDescargar">Detalles oa</button>
                </div>
            </article>
        </section>
    </div>
</div>
<div id="resultados"></div>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jqueryUi.js"></script>
<script type="text/javascript" src="instrutor/ConsultaOa/js/consultarOa.js"></script>

</body>
</html>
