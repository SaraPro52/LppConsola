<div class="">
    <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-10">
                        <div class="EspacioItems">
                            <article class="col-md-6" id="item">
                                <input type="hidden" value="1" id="tipoLis">
                                <label>Nombre Lista</label>
                                <input type="text" class="form-control" value="GH" id="NombreL"  placeholder="Nombre de lista">
                                <label>Decripcion</label>
                                <textarea class="form-control" value="AS" id="DescripcionL" placeholder="Descripcion lista" rows="1" id="comment"></textarea>
                            </article>
                            <article class="col-md-6" id="items">
                                <p><h3 class="dark-grey"><b>Items de lista de chequeo</b></h3></p>
                                <label for="Descripcion">Descripcion de item</label>
                                <div class="col-md-10">
                                    <textarea class="form-control" placeholder="Descripcion lista" rows="1" id="Descripcion"></textarea>
                                </div>
                                <div class="col-md-10">
                                    <button  class="btn btn-info" id="btnItem">Agregar Item</button>
                                </div>
                            </article>
                        </div>
                        <article class="col-md-10 col-md-offset-1" id="CompoLista">
                            <table class="table table-striped" id="tablalista">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre lista</th>
                                        <th>Descripcion</th>
                                        <th>Fecha creacion</th>
                                        <th>Modificar lista</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </article>
                    </section>
                    <article class="col-md-16" class="EspacioItems">
                        <div id="SelectItemDiv">
                            <select id=SelectItem></select>
                            <div id="campoItemsDatos">
                                <label>Items de lista de chequeo</label>

                            </div>
                        </div>
                    </article>
                    <article class="col-md-12">
                        
                        <button class="btn btn-info col-md-6" id="BtnLista">Modificar lista</button>
                    </article>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>        
    <script src="assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script src="js/jquery.multi-select.js"></script></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="Equipo/ModificarLista/js/modificarLista.js"></script>
<script>
    modificar(this.idTipoItem);
</script>
</div>