<div id="ContenedoraBody" >
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Categorias</title>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    <link href="assets/css/paper-dashboardCoordinador.css" rel="stylesheet"/>
    <link href="assets/css/estilo_1.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-12">
                        <article class="col-md-6">
                            <form id="AgregarCate" class="col-md-12">
                                <div class="col-md-12">
                                    <label   style="color:#60B359;">Crear Categoría </label>
                                </div>
                                <div class="col-md-12">
                                    <label for="NombreCategoria" >Nombre de la categoria:</label>
                                </div>
                                <div class="col-md-12"><input type="text" class="form-control inputsC" id="NombreCategoria" placeholder=" Digite Nombre de la categoría"></div>
                                <label for="DescripcionCategoria" class="col-md-12">Descripción de la categoria:</label>
                                <div class="col-md-12"><input type="text" class="form-control inputsC" id="DescripcionCategoria" placeholder="Digite Nombre de la descripción"></div>
                            </form>
                        </article>
                        <article class="col-md-6">
                            <form class="col-md-12" id="agregarTema">
                                <div class="col-md-12"> 
                                    <label style="color: #60B359;">Crear Tema</label>
                                </div>
                                <label for="NombreTema" class="col-md-12">Nombre del tema:</label>
                                <input type="text" class="form-control inputs" id="NombreTema" placeholder="Digite Nombre del Tema">
                                <label for="DescripcionCategoria" class="col-md-12">Descripción del tema:</label>
                                <input type="text" class="form-control inputs" id="DescripcionTema" placeholder="Digite Descripción del Tema">
                                <button type="button" id="btnTema" class="btn btn-info">Guardar Tema</button>
                            </form>
                        </article>
                        <article class="col-md-6">
                            <div id="SelectTemasDiv" class="col-md-12">
                                <select required  id="itemCategoria" class="itemCategorias"  multiple='multiple' title="Busca una categoria.." >
                                    <option value="A0">Null</option>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <button type="button" id="btnCategoria" class="btn btn-info">Guardar categoria</button>
                            </div>
                        </article>
                    </section>	
                </div>

            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.multi-select.js"></script></script>
<script type="text/javascript" src="js/jquery.quicksearch.js"></script></script>
<script type="text/javascript" src="js/notify.js"></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="coordinador/Categorias/js/categorias.js"></script>
</div>    