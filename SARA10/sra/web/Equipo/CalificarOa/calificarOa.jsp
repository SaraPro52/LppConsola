<div id="contenedoraBody">
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <section class="col-md-10">
                        <article class="col-md-12">
                            <label class="col-md-6" id="LabelEquipo"></label>
                            <label class="col-md-6" id="LabelVersion"></label>
                            <label class="col-md-6" id="Nombrelista"></label>
                            <div class="col-md-8" id="divContainer">

                            </div>
                            <label class="col-md-5" for="areaObservacion">Observaciones</label>
                            <textarea class="col-md-5 col-md-offset-3" id="areaObservacion" rows="1" cols="40"></textarea>
                            <form class="col-md-5 col-md-offset-3" action="">
                                <input type="radio" id="Resultado" name="Resultado" value="1"> Aprovado<br>
                                <input type="radio" id="Resultado" name="Resultado" value="0"> Reprovado<br>
                            </form>
                            <div col-md-4 col-md-offset-1>
                                <button type="button" class="btn btn-block" id="btnEvaluar">Evaluar</button>
                            </div>
                        </article>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" src="Equipo/CalificarOa/js/calificarOa.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        calificarPV(this.idLista);
        $fecha = $('#iFecha');
        if ($fecha[0].type != "date") {
            $("#iFecha").datepicker();
        }
    </script>
</div>     