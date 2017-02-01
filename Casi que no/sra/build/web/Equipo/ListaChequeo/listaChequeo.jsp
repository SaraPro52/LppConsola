<div class=""> 
    <link rel="stylesheet" type="text/css" href="css/multi-select.css">
    <link href="assets/css/paper-dashboardEquipo.css" rel="stylesheet"/>
    <link href="assets/css/estilo_1.css" rel="stylesheet" type="text/css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-10">
                        <article class="col-md-6" id="item" id="formulario">
                            <form id="formAgreLista">
                            <input type="hidden" value="1" id="tipoLis">
                            <label>Nombre Lista</label>
                            <input required="" type="text" class="form-control inputs1" id="NombreL"  placeholder=" Digite un  nombre para la lista">
                            <label>Descripción</label>
                            <textarea required class="form-control inputs1"  id="DescripcionL" placeholder="Describa una descripción para la lista" rows="5" id="comment"></textarea>
                            </form>
                        </article>

                        <article class="col-md-6" id="items">
                            <div id="SelectItemDiv">
                                <label>Items</label>
                                <select id="SelectItem" class="itemSelect" multiple="multiple">
                                    
                                </select>
                            </div>
                        </article> 
                        <button class="btn btn-info col-md-6" style=" margin-left:30%; margin-right:1%;" id="BtnLista"> Crear lista</button>
                        <article class="col-md-8 " id="tabla">
 
                            <form class="col-md-10" id="formAgregaItem">
                                <div>
                                    <label style="color: #E48D15;" id="lista" >Crear Item</label>
                                </div>

                                <label for="Descripcion">Descripción de item</label>

                                <textarea required class="form-control inputs" placeholder="Describa una descripción para el item" rows="1" id="Descripcion"></textarea>
                            </form>
                            <div class="col-md-10">
                                <button  class="btn btn-info" id="btnItem">Agregar Item</button>
                            </div>
                        </article>
                    </section>
                </div>
            </div>
        </div>
    </div>


</section>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.multi-select.js"></script>
<script type="text/javascript" src="js/jquery.quicksearch.js"></script>
<script type="text/javascript" src="js/notify.js"></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="Equipo/ListaChequeo/js/listaChequeo.js"></script>
<script>
    listaChequeo(idTipoItem, idUser);
</script>
</div>
