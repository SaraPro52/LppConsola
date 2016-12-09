<div id="contenedoraBody">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="assets/css/paper-dashboardEquipo.css" rel="stylesheet"/>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-10">
                        <article class="col-md-12">
                            <label class="col-md-6" id="LabelEquipo"></label>
                            <label class="col-md-6" id="LabelVersion"></label>
                            <label class="col-md-6" id="Nombrelista"></label> 
                            <div id="clone">
                                <div class="col-md-12">
                                    <label class="col-md-2">Cumple</label>    
                                    <input type="checkbox" class="chex col-md-1"> 
                                    <label class="locura col-md-8"></label>
                                </div>
                                <textarea class="textarea form-control inputs"></textarea>
                            </div>
                            <div class="col-md-8" id="divContainer">

                            </div>
                            <div class="col-md-5">
                                <button id="FechaLi" class="FechaLi btn btn-block" > Fecha limite</button>
                            </div>

                            <dvi class="col-md-12" id="TipodeFecha" style="display: none;">
                                <label id="TextFecha"></label> <input type="text" id="iFecha">    
                            </dvi>

                            <label class="col-md-5" for="areaObservacion">Observaciones</label>
                            <div class="col-md-8">
                                <textarea class="col-md-5 form-control" id="areaObservacion" rows="1" cols="40"></textarea>
                            </div>   

                            <div col-md-4 col-md-offset-1>
                                <div class="col-md-5">
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
    <script type="text/javascript" src="Equipo/CalificarOa/js/calificarOa.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        calificarPV(this.idLista, this.idRol,this.Notifi);
    </script>
</div>     