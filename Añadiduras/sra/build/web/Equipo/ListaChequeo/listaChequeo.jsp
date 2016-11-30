<div class="">
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    <link href="assets/css/paper-dashboardEquipo.css" rel="stylesheet"/>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-10">
                        <article class="col-md-6" id="item">
                            <input type="hidden" value="1" id="tipoLis">
                            <label>Nombre Lista</label>
                            <input type="text" class="form-control" id="NombreL"  placeholder=" Digite Nombre de lista">
                            <label>Decripción</label>
                            <textarea class="form-control"  id="DescripcionL" placeholder="Digite Descripción lista" rows="1" id="comment"></textarea>
                            <button class="btn btn-info col-md-6" id="BtnLista"> Crear lista</button>
                        </article>
                        <article class="col-md-6" id="items">
                            <label class="dark-grey" id="lista" >Items de lista de chequeo</label>
                            <div class="col-md-10">
                                <label for="Descripcion">Descripción de item</label>

                                <textarea class="form-control" placeholder=" Digite Descripción Item" rows="1" id="Descripcion"></textarea>
                            </div>
                            <div class="col-md-10">
                                <button  class="btn btn-info" id="btnItem">Agregar Item</button>
                            </div>
                        </article>
                        <article class="col-md-8 col-md-offset-1" id="tabla">
                            <div id="SelectItemDiv">
                                <section  id="SelectItem">
                                </section>
                            </div>
                        </article>
                    </section>
                </div>
            </div>
        </div>
    </div>
    

</section>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.multi-select.js"></script></script>
<script type="text/javascript" src="js/notify.js"></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="Equipo/ListaChequeo/js/listaChequeo.js"></script>
<script>
    listaChequeo(idTipoItem, idUser);
</script>
</div>