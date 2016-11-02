<div id="contenedoraBody">
    <section class="col-md-6">
        <article class="col-md-12">
            <input id="listaSelec" value="1" type="hidden">
            <label class="col-md-6" id="LabelEquipo"></label>
            <label class="col-md-6" id="LabelVersion"></label>
            <label class="col-md-6" id="Nombrelista"></label>
            <div id="clone" class="col-md-8">
                <div class="col-md-12">
                    <input class="col-md-2 chex" type="checkbox" id="" value="">
                    <label class="locura col-md-10"> </label></br>

                    <label class="col-md-12" for="areaObservacion">Observaciones</label>
                    <textarea class="form-control col-md-offset-3 textarea" id="areaObservacion" rows="2" cols="40" ></textarea>
                </div>
            </div>
            <div class="col-md-8" id="divContainer">

            </div>
            <div class="col-md-8">
                <form class="col-md-12" id="res">
                    <input type="radio" id="Resultado" name="Resultado" value="1"> Aprovado<br>
                    <input type="radio" id="Resultado" name="Resultado" value="0" checked> Reprovado<br>
                </form>
                <label class="col-md-12">Observacion general</label>
                <textarea class="form-control textarea" id="ObservacionCompleta" rows="2" cols="40" ></textarea>
                <div id="dFecha">
                    <label>Fecha Vigencia</label>
                    <input type="text" id="iFecha" name="iFecha">
                </div>
                <div class="col-md-12 col-md-offset-2">
                    <button type="button" class="btn btn-block" id="btnEvaluar">Evaluar</button>
                </div>                
            </div>

        </article>
    </section>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="Equipo/CalificarOa/js/calificarOa.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        calificarPV(this.idLista);
        $fecha = $('#iFecha');
        if($fecha[0].type != "date"){
            $( "#iFecha" ).datepicker();
        } 
    </script>
</div>     