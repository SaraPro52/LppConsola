<div id="contenedoraBody">
    <section class="col-md-6">
        <article class="col-md-12">
            <input id="listaSelec" value="1" type="hidden">
            <label class="col-md-6" id="LabelEquipo"></label>
            <label class="col-md-6" id="LabelVersion"></label>
            <label class="col-md-6" id="Nombrelista"></label>
            <div id="clone" class="col-md-8">
                <label class="locura col-md-12"> </label>
                <input class="col-md-6" type="radio" checked="checked"   name="validado" value="0"><label>No cumple</label><br>
                <input class="col-md-6" type="radio" name="validado" value="1"><label>Cumple</label><br>
                <label class="col-md-8" for="areaObservacion">Observaciones</label>
                <textarea class="col-md-8 col-md-offset-3 observacion" id="areaObservacion" rows="1" cols="40"></textarea>
            </div>
            <div class="col-md-8" id="divContainer">

            </div>

            <form class="col-md-5 col-md-offset-3" action="">
                <input type="radio" id="Resultado" name="Resultado" value="1"> Aprovado<br>
                <input type="radio" id="Resultado" name="Resultado" value="0"> Reprovado<br>
            </form>
            <div col-md-4 col-md-offset-1>
                <button type="button" class="btn btn-block" id="btnEvaluar">Evaluar</button>
            </div>
        </article>
    </section>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="Equipo/CalificarOa/js/calificarOa.js"></script>
</div>     