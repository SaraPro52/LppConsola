<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css"> 
    <title>Consultar OA</title>
</head>
<body>
    <h2 class="dark-grey">Lista de objetos de aprendizaje </h2>
    <article class="">
        <div id="Tituloss" class="ui-widget">
            <label for="txtBuscar">Buscar producto virtual por titulo:</label>
            <input type="text" id="txtBuscarTitle" value="">
        </div>
        <p>Fecha: <input type="text" id="iFecha"></p>
        <label for="Formato">Formato:</label>
        <select class="" id="Formato">
            <option value="A0">Seleciona...</option>
        </select>
        <form class="col-md-5 col-md-offset-3" id="Resultado">
            <input type="radio" id="programa"  name="asdf" value="1">Programa de formacion<br>
            <input type="radio" id="categoria" name="asdf" value="0">Categoria<br>
        </form>

        <div id="ElementoFormacion" style="display: none;">
            <label for="CiudadFormacion">Ciudad</label>
            <select id="CiudadFormacion">
                <option value="A0">Seleciona...</option>
            </select>

            <label>centro de formacion</label>
            <select  id="CentroF">
                <option value="A0">Seleciona...</option>
            </select>

            <label>Area de formacion</label>
            <select  id="Area">
                <option value="A0">Seleciona...</option>
            </select>

            <label>Programa de formacion</label>
            <select  id="Programa">
                <option value="A0">Seleciona...</option>
            </select>
            <select  id="TemaPrograma">
                <option value="A0">Seleciona...</option>
            </select>
        </div>
        <div id="ElementoCategoria">
            <div  id="CategoriaTem" style="display: none;">
                <label>categoria</label>
                <select class="" id="SelectCategoria">
                    <option value="A0">Seleciona...</option>
                </select>
                <label>Tema de categoria</label>
                <select class="" id="TemaC"></select>
            </div>
        </div>    
        <label  > <a id="BusquedaAvanzada">Busqueda Avanzada</a></label>
        <div id="Avando" style="display: none;">
            <label for="Autores">Autores: </label>
            <input type="text" id="Autores" value="">
            <label for="Palabras">Palabras clave: </label>
            <input type="text" id="Autores" value="">

            <label for="Fecha">Fecha de publicacion:</label>
            <input type="date" id="Fecha" value="">
        </div>
    </article>
</p>
<button id="btnBuscar" type="button" class="btn ">Buscar</button>

<div id="formulario1" style="display: none;">
    <section class="col col-md-10" id="Contenedora">
        <article class="col-md-3">
            <figure><img src="imagenes/imagenoa.png" width="160"  height="180" id="ImagenOA"></figure>
        </article>
        <article class="col-md-9">
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
<ul class="pagination col-md-12" id="paginador">
    <li id="pag0" class='pagination'><a><lavel>0</label></a></li>
</ul>
<input value="pag0" id="pagActual" style="display: none;">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jqueryUi.js"></script>    
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/jquery.multi-select.js"></script></script>
<script type="text/javascript" src="js/bootstrap-modal.js"></script><script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="instructor/ConsultaOa/js/consultarOa.js"></script>
<script>
    var idProducto = 0;
    var Titulo = "";
</script>
</body>
</html>
