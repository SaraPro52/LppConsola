<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calificar objeto de aprendizaje</title>
    </head>
    <body>
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
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="Equipo/CalificarOa/js/calificarOa.js"></script>
</html>