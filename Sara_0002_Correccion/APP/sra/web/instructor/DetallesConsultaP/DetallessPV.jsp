<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="assets/css/estilo.css"> 
    </head>
    <body>
        <label id="TituloProducto" class="col-md-12"></label>
        <label id="DescripcionProducto" class="col-md-12"></label>
        <div id="Datos" style="display: none;">
            <p id="idPro"></p>
            <p id="tituloPro"></p>
        </div>
        <div id="ClonDetalles" style="display: none;">
            <button class="accordion" id="NumVersion"> </button>
            <div class="panel">
                <section class="col-md-12">

                    <article class="col-md-10" id="Producto">
                        <div class="col-md-16" id="consul">
                            <label >Autores:</label>
                            <p id="PvAutores"></p>
                            <label>Fecha de publicacion</label>
                            <p id="PvPublicacion"></p>
                            <label >Fecha de Vigencia</label>
                            <p id="PvFechaVigencia"></p>
                            <div class="col-md-8">
                                <label for="PvRequisitos">Requisitos de instalacion</label>
                                <textarea id="PvRequisitos"  class="form-control" cols="60"  rows="6"  readonly="true"></textarea>
                            </div>
                            <div class="col-md-8">
                                <label for="PvInstalacion">Instruciones de instalacion</label>
                                <textarea id="PvInstalacion" class="form-control" cols="60" rows="6" readonly="true"></textarea>
                            </div>
                            <label class="col-md-12">Valora Este objeto de aprendizaje</label>
                            <form>
                                <p class="clasificacion" id="Clasificacion">
                                    <label id="4" for="4l" class="labelEstrella">★</label><input id="4l" type="radio">
                                    <label id="5" for="5l" class="labelEstrella">★</label><input id="5l" type="radio">
                                    <label id="6" for="3l" class="labelEstrella">★</label><input id="6l" type="radio">
                                    <label id="7" for="7l" class="labelEstrella">★</label><input id="7l" type="radio">
                                    <label id="8" for="8l" class="labelEstrella">★</label><input id="8l" type="radio">
                                </p>
                            </form>
                            <div class="RComentarios">
                            </div>

                            <h4 class="dark-grey">Cuentanos tu opinion</h4>
                            <label>Cometarios</label>
                            <textarea class="form-control" placeholder="Comentarios" rows="3" id="comment"></textarea> 
                            <button type="button" class="btn btn-default Comentar" id="btn_Comentar">Comentar P.V</button>
                            <a id="Url_Version" class='btn btn-default Descargar'>Descargar P.V</a>
                        </div>
                    </article>
                </section>
                <div id="BaseComentario" class="panel" style="display: none;">
                    <div class="contenidoCome">
                        <p id="NombreAComen"></p>
                        <textarea class="form-control"  rows="3" id="BaseComment" readonly="true"></textarea> 
                    </div>
                </div>
            </div>
        </div>        
        <div id="resultados"></div>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-notify.js"></script>
        <script type="text/javascript" src="js/jqueryUi.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="instructor/DetallesConsultaP/js/DetallesConsultaP.js"></script>
</html>
