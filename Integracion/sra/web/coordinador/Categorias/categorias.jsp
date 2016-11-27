<div id="ContenedoraBody" >
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Categorias</title>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
     <link href="assets/css/paper-dashboardCoordinador.css" rel="stylesheet"/>
</head>
<body>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
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
                </div>

            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/jquery.multi-select.js"></script></script>
<script src="assets/js/bootstrap-notify.js"></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="js/bootstrap-modal.js"></script>
<script type="text/javascript" src="coordinador/Categorias/js/categorias.js"></script>
</div>    