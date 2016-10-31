<div id="ContenedoraBody" class="col-md-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Categorias</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="css/freelancer.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    </head>
    <body>
        <section class="row">
            <form id="FormCategoria" novalidate>
                <label class="col-md-12 col-md-offset-4"><h3>Categorias</h3></label>
                <br>
                <article id="formulario">  
                    <label class="col-md-12">Nombre de la categoria:</label>
                    <input type="text" class="form-control" placeholder="Nombre de la categoria" id="NombreCategoria"  required data-validation-required-message="Ingresa el nombre de la categoria.">
                    <label class="col-md-12">Descripcion de la categoria:</label>
                    <textarea type="text"  rows="2" class="form-control" placeholder="Descripcion de la categoria" id="DescripcionCategoria"  required data-validation-required-message="Ingresa la descripcion de la categoria."></textarea>                            
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </article> 
            </form>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel" >Agregar Tema</h4>
                        </div>
                        <div class="modal-body">
                            <label>Nombre del tema:</label>
                            <input type="text" class="form-control" placeholder="Nombre del tema." id="NombreTema">
                            <label>Descripcion del tema:</label>
                            <input type="text" class="form-control" placeholder="Descripcion del tema" id="DescripcionTema">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" id="btnTema" class="btn btn-info" data-dismiss="modal">Guardar Tema</button>
                        </div>
                    </div>
                </div>
            </div>
            <article class="col-md-7 col-md-offset-3">
                <div id="SelectTemasDiv">
                    <section  id=SelectTemas>
                    </section>
                </div>
                <button type="button" id="btnCategoria" class="btn btn-info">Guardar categoria</button>
            </article>
        </section>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="js/jquery.multi-select.js"></script></script>
        <script type="text/javascript" src="js/jquery.cecily.js"></script>
        <script type="text/javascript" src="js/bootstrap-modal.js"></script>
        <script type="text/javascript" src="coordinador/Categorias/js/categorias.js"></script>
</div>    