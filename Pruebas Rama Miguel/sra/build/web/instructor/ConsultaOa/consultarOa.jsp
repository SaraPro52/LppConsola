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
                <label for="txtBuscarTitle" class="col-md-12">Buscar producto virtual por titulo:</label>
                <div class="col-md-10">
                    <input required type="text" id="txtBuscarTitle" value="" class="form-control inputs">
                </div>
            </div>
            <div class="col-md-6">
                <label for="Autores" class="col-md-12">Autor: </label>
                <div class="col-md-10">
                    <input required type="text" id="Autores" value="" class="form-control inputs">
                </div>
            </div>

            <div class="col-md-12
                 ">
                <div class="col-md-12">
                    <label><a id="BusquedaAvanzada">Busqueda Avanzada</a></label>    
                </div>

                <div id="Avando" style="display: none;" class="col-md-10">
                    <div class="col-md-12">
                        <label class="col-md-12">Buscar por:</label>
                        <label class="col-md-6">Programa de formacion<input type="checkbox" id="Programas"></label>    
                        <label class="col-md-6">Categoria<input type="checkbox" id="Categoria"></label>

                        <div id="ElementoFormacion" style="display: none;" class="col-md-12">
                            <div class="col-md-6">
                                <label for="CiudadFormacion" class="col-md-12">Ciudad</label>
                                <select id="CiudadFormacion" class="form-control">
                                    <option value="A0">Seleciona...</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="CentroF" class="col-md-12">centro de formacion</label>
                                <select  id="CentroF" class="form-control">
                                    <option value="A0">Seleciona...</option>
                                </select>    
                            </div>
                            <div class="col-md-6">
                                <label for="Area" class="col-md-12">Area de formacion</label>
                                <select  id="Area" class="form-control">
                                    <option value="A0">Seleciona...</option>
                                </select>                                
                            </div>
                            <div id="ElementoPrograma" style="display: none;" class="col-md-12">
                                <label class="col-md-12">Programa de formacion</label>
                                <select id="Programa" class="Programa" multiple="multiple">
                                    <option>null</option>
                                </select>
                            </div>

                        </div>
                        <div id="ElementoCategoria" style="display: none;">
                            <div  id="CategoriaTem" >
                                <label>Categorias de los productos virtuales</label>
                                <select id="SelectCategoria" class="SelectCategoria" multiple="multiple">
                                    <option>null</option>
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
                        <label for="Formato" class="col-md-12">Formato:</label>
                        <div class="col-md-6">
                            <select class="form-control select" id="Formato">
                                <option value="AF">Selecione...</option>
                            </select>                            
                        </div>
                    </div>
                    <!--label for="Palabras">Palabras clave: </label>
                    <input type="text" id="Palabras" value=""-->
                </div>
            </div>
        </div>
    </article>
</p>
<div class="col-md-offset-1 col-md-3">
    <button id="btnBuscar" type="button" class="btn btn-block">Buscar producto virtual</button>
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
<div id="resultadosProductos" class="col-md-10 col-md-offset-1 "></div>
<div class="col-md-12 col-md-offset-1">
    <ul class="pagination col-md-8 col-md-offset-2" id="paginador">
        <li id="pag0" class='pagination'><a><lavel>0</label></a></li>
    </ul>
</div>  
<input value="pag0" id="pagActual" style="display: none;">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jqueryUi.js"></script>    
<script src="js/jquery.multi-select.js"></script></script>
<script src="js/jquery.quicksearch.js"></script></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>    
<script type="text/javascript" src="instructor/ConsultaOa/js/consultarOa.js"></script>
</body>
</html>