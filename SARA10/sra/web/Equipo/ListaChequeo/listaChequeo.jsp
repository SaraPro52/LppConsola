<div class="">

    <section class="col-md-6">
        <label class="" id="lista"><h2>Crear lista de chequeo</h2></label>
        <article class="" id="item">
            <input type="hidden" value="1" id="tipoLis">
            <label>Nombre Lista</label>
            <input type="text" class="form-control" id="NombreL"  placeholder="Nombre de lista">
            <label>Decripcion</label>
            <textarea class="form-control"  id="DescripcionL" placeholder="Descripcion lista" rows="1" id="comment"></textarea>

        </article>

        <article class=" col-md-offset-1" id="tabla">
            <div id="SelectItemDiv">
                <section  id=SelectItem>
                </section>
            </div>
        </article>
        <article>
            <button class="btn btn-info col-md-6" id="BtnLista"> Crear lista</button>
        </article>

        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
            <span class="glyphicon glyphicon-plus"></span>
        </button>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel" >Item de lista de chequeo</h4>
                    </div>
                    <div class="modal-body">
                        <div >         
                            <label for="Descripcion">Descripcion de item</label>

                            <textarea class="form-control" placeholder="Descripcion lista" rows="1" id="Descripcion"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button  class="btn btn-info" id="btnItem" data-dismiss="modal">Agregar Item</button>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/jquery.multi-select.js"></script></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="js/bootstrap-modal.js"></script>
<script type="text/javascript" src="Equipo/ListaChequeo/js/listaChequeo.js"></script>
</div>