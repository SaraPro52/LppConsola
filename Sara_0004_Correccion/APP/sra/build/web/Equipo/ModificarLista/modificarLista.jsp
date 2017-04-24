<div class="">
    <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    <link href="assets/css/paper-dashboardEquipo.css" rel="stylesheet"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-10">
                        <div class="EspacioItems">
                            <article class="col-md-6" id="item">
                                <input type="hidden" value="1" id="tipoLis">
                                <label>Nombre Lista de Chequeo:</label>
                                <input  requiredtype="text" class="form-control inputs1" value="GH" id="NombreL"  placeholder="Nombre de lista">
                                <label>Decripción de la Lista de Chequeo:</label>
                                <textarea required class="form-control inputs1" value="AS" id="DescripcionL" placeholder="Descripcion lista" rows="1" id="comment"></textarea>
                            </article>
                            <article class="col-md-6" id="items">
                                    <label class="dark-grey">Items de lista de chequeo</label>
                                    <label for="Descripcion">Descripcion de item:</label>
                                    <div class="col-md-10">
                                        <textarea required class="form-control inputs" placeholder="Descripcion lista" rows="1" id="Descripcion"></textarea>
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
                                        <th>N°</th>
                                        <th>Nombre de la lista</th>
                                        <th>Descripción</th>
                                        <th>Fecha creación</th>
                                        <th>Modificar lista</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </article>
                    </section>
                    <article style="margin-left: 12%;" class="col-md-16" class="EspacioItems">
                        <div id="SelectItemDiv" class="EspacioItems">
                            <select id="SelectItem" class="itemselect" multiple="multiple">
                                <option>null</option>
                            </select>
                            <div>
                                <button class="btn btn-info col-md-6" id="BtnLista" >Modificar Lista</button>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>        
    <script type="text/javascript" charset="utf8" src="js/notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.multi-select.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.quicksearch.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="Equipo/ModificarLista/js/modificarLista.js"></script>
    <script>
        modificar(this.idTipoItem);
    </script>
</div>