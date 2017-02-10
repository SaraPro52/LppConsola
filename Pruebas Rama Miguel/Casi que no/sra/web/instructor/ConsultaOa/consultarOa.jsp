<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css"> 
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/estilo_1.css"/>
</head>
<body>
    <article class="col-md-12">
        <div id="Tituloss">
            <div class="col-md-6">
                <label for="txtBuscarTitle">Buscar producto virtual por titulo:</label>
                <input required type="text" id="txtBuscarTitle" value="" class="form-control inputs">
            </div>
            <div class="col-md-6">
                <label for="Autores">Autor: </label>
                <input required type="text" id="Autores" value="" class="form-control inputs">
            </div>

            <div class="col-md-7">
                <label><a id="BusquedaAvanzada">Busqueda Avanzada</a></label>

                <div id="Avando" style="display: none;">
                    <div class="col-md-12">
                        <label><input type="checkbox" id="Programas">Programa de formacion</label>    
                        <label><input type="checkbox" id="Categoria">Categoria</label>

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
                            <select  id="Programa"></select>
                        </div>
                        <div id="ElementoCategoria" style="display: none;">
                            <div  id="CategoriaTem" >
                                <label>categoria</label>
                                <select class="" id="SelectCategoria">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <label for="dataInicialA">Fecha inicial:</label>  
                            <br>
                            <input required class="form-control inputs" type="text" id="dataInicialA">
                        </div>
                        <div class="col-md-6">
                            <label for="dataFinalA">Fecha final:</label>
                            <br> 
                            <input required class="form-control inputs" type="text" id="dataFinalA">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="Formato">Formato:</label>
                        <select class="form-control select" id="Formato">
                            <option value="AF">Selecione...</option>
                        </select>
                    </div>

                    <!--label for="Palabras">Palabras clave: </label>
                    <input type="text" id="Palabras" value=""-->
                </div>
            </div>
        </div>
    </article>
</p>
<div class="col-md-offset-1 col-md-3">
    <button id="btnBuscar" type="button" class="btn btn-block">Buscar producto virtual...</button>
</div>


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
                <div class="col-md-8">
                    <button type="button" class="btn btn-block" id="BtnDescargar">Detalles P.V</button>
                </div>
            </div>
        </article>
    </section>
</div>
</div>
<div id="resultadosProductos"></div>
<div class="center-block">
    <ul class="pagination col-md-12" id="paginador">
        <li id="pag0" class='pagination'><a><lavel>0</label></a></li>
    </ul>
</div>  
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