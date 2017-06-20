<div id="contenedoraBody">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="assets/css/paper-dashboardEquipo.css" rel="stylesheet"/>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-12">
                        <article class="col-md-12">
                            <br/>
                            <div class="col-md-10">
                                <label class="col-lg-6 col-md-6">Nombre de la lista de chequeo:</label>
                                <label class="col-lg-6 col-md-6" id="Nombrelista"></label> 
                                <label class="col-lg-6 col-md-6">Descripción de la lista de chequeo:</label>
                                <label class="col-lg-6 col-md-6" id="DesLista"></label>
                                <label class="col-lg-6 col-md-6">Fecha de creación lista de chequeo:</label>
                                <label class="col-lg-6 col-md-6" id="FechaLista"></label>
                            </div>     
                            <table class="col-md-12 table">
                                <thead class="col-md-12">
                                <th class="col-lg-1 col-md-1">N°</th>
                                <th class="col-lg-3 col-md-6">Item</th>
                                <th class="col-lg-1 col-md-1">Cumple</th>
                                <th class="col-lg-4 col-md-4">Observaciones</th>
                                </thead>
                                <br/>
                                <tbody id="clone" class="col-md-12"></tbody>
                            </table>
                            <br/>
                            <div class="col-md-12 col-md-offset-3">
                                <label class="col-md-12">¿El objeto virtual aprueba?</label>
                                <input type='checkbox' name="aprobar" value="on" id="Aprueba">Si</br>
                                <input type='checkbox' name="aprobar"  value="on" id="noAprueba"> No</br>
                            </div>
                            </div>
                            <div class="col-md-12 col-md-offset-2" id="TipodeFecha" style="display: none;">
                                <label id="TextFecha" class="col-md-12"></label> 
                                <div class="col-md-5">
                                    <input type="text" id="iFecha" placeholder="D/M/A"  class="form-control">    
                                </div>
                            </div>
                            <div class="col-md-8 col-md-offset-1">
                                <label class="col-md-5" for="areaObservacion">Observaciones</label>
                                <div class="col-md-12">
                                    <textarea class=" form-control" id="areaObservacion" rows="3" cols="40"></textarea>    
                                </div>
                            </div>   
                            <div col-md-4 col-md-offset-1>
                                <div class="col-md-5 col-md-offset-2">
                                    <button type="button" class="btn btn-block col-md-offset-1" id="btnEvaluar">Evaluar</button>
                                </div>
                            </div>
                        </article>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="js/notify.js"></script>
    <script type="text/javascript" src="js/jqueryUi.js"></script>
    <script type="text/javascript" src="Equipo/CalificarOa/js/calificarOa.js"></script> 
    <script>
        calificarPV(this.idLista, this.idRol, this.Notifi);
    </script>
</div>     
