<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="assets/css/estilo.css"> 
<label id="IdProducto" ></label>
<div id="ClonDetalles" style="display: none;">
    <section class="col-md-12">
        <article class="col-md-10" id="Producto">
            <div class="col-md-16" id="consul">
                <label>Numero de version</label>
                <p id="NumVersion"></p>
                <label >Autores:</label>
                <p id="PvAutores"></p>
                <label>Fecha de envio</label>
                <p id="PvFechaEn"></p>
                <label>Fecha de publicacion</label>
                <p id="PvPublicacion"></p>
                <label >Fecha de Vigencia</label>
                <p id="PvFechaVigencia"></p>
                <div class="col-md-8">
                    <label for="PvRequisitos">Requisitos de instalacion</label>
                    <textarea id="PvRequisitos" rows="8" cols="80" readonly="true"></textarea>
                </div>
                <div class="col-md-8">
                    <label for="PvInstalacion">Instruciones de instalacion</label>
                    <textarea id="PvInstalacion" rows="8" cols="80" readonly="true"></textarea>
                </div>
                <label class="col-md-12">Valora Este objeto de aprendizaje</label>
                <form>
                    <p class="clasificacion" id="Clasificacion">
                        <label id="4" for="radio5" class="labelEstrella">★</label>
                        <label id="5" for="radio4" class="labelEstrella">★</label>
                        <label id="6" for="radio3" class="labelEstrella">★</label>
                        <label id="7" for="radio2" class="labelEstrella">★</label>
                        <label id="8" for="radio1" class="labelEstrella">★</label>
                    </p>
                </form>
                <h4 class="dark-grey">Cuentanos tu opinion</h4>
                <label>Cometarios</label>
                <textarea class="form-control" placeholder="Comentarios" rows="3" id="comment"></textarea>
                <button type="button" class="btn btn-default Comentar" id="btn_Comentar">Comentar P.V</button>
                <button type="button" class="btn btn-primary Descargar" id="Url_Version">Descargar P.V</button>
                <button type="button" class="btn btn-primary Actualizar" id="Actualizar">Actualizar P.V</button>
            </div>
        </article>
    </section>
</div>

<div id="resultados"></div>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="assets/js/bootstrap-notify.js"></script>
<script type="text/javascript" src="instructor/DetallesConsultaP/js/DetallesConsultaP.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    Detalles(this.idProducto, Titulo);
</script>
</section>


