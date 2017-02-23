<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row"> 
                    <article id="formularioss" style="display: none;">
                        <section class="col-md-12">
                            <label><h3>Subir Producto Virtual</h3></label>
                            <article>
                                <div class="col-md-6">
                                    <div class="">
                                        <label> Titulo de Publicación</label>
                                        <input required class="form-control inputs" type="text"  name="Titulo_Publicacion" id="Titulo_Publicacion" placeholder="Titulo de la publicacion" required data-validation-required-message="Ingresa el titulo de la publicacion.">
                                        <p class="help-block text-danger"></p>
                                        <label>Palabras Claves</label>
                                        <input required class="form-control inputs" type="text"  name="palabras_claves" id="palabras_claves" placeholder="Palabras claves " required data-validation-required-message="Ingresa las palabras clave de la publicacion.">
                                        <p class="help-block text-danger"></p>
                                        <label> Descripción del Producto</label>
                                        <input required class="form-control inputs" type="text"  name="palabras_claves" id="descripcion_oa" placeholder="Descripcion del P.V" required data-validation-required-message="Ingresa la descripcion del producto virtual.">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Formato del archivo</label>
                                    <select required class="form-control col-xs-12 floating-label-form-group controls select" id="formato" value="Valueblanco">
                                        <option value="FG" selected="selected">Selecciona...</option>
                                    </select>
                                    <div class="form-group">
                                        <label>Instrucciones de Instalación</label>
                                        <textarea required class="form-control inputs" id="instrucciones" type="textarea " maxlength="200"  placeholder="instrucciones de instalacion" required data-validation-required-message="Ingresa requisitos de instalacion." rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Categorías del Producto Virtual</label>   
                                    <div id="SelectCategoriaDiv">
                                        <section required id=SelectCategoria></section>
                                    </div>
                                    <div class="form-group col-md-10">
                                        <label for="requisitos_instalacion"> Requisitos de Instalación</label>
                                        <textarea required class="form-control inputs" id="requisitos_instalacion" type="textarea " maxlength="200" name="palabras_claves" placeholder="Digite requisitos  de instalación"  rows="5"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>Programa de Formación</label> 
                                    <div id="SelectEstruturaDiv">
                                        <section required  id=SelectEstrutura>
                                        </section>
                                    </div>
                                    <label>Áutores</label>
                                    <div id="SelectAutoresDiv">
                                        <section required  id="SelectAutores">
                                        </section>
                                    </div>
                                </div>
                            </article>
                            <div class="form-group">
                                <label for="Documento">Adjuntar OA</label>
                                <input required type="file" class="form-control-file inputs" id="myfile" name="myfile" aria-describedby="fileHelp">
                                <input type="submit" class=" btn btn-info  col-md-6"  value="Correguir produto virtual" id="correguir_oa">
                                <div id="progressbox">
                                    <div id="progressbar"></div>
                                    <div id="percent">0%</div>
                                </div>
                                <br />
                                <div id="message"></div>
                            </div>
                    </article>

                    <div class="col-md-12">
                        <div class="contenedor">
                            <article style="margin-top: 3%;" class="col-md-8 col-md-offset-1" id="tabla">
                                <table class="table table-striped" id="tablaActualizacion">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Titulo</th>
                                            <th>Version</th>
                                            <th>Autor</th>
                                            <th>Fecha de vigencia</th>
                                            <th>Descargar</th>
                                            <th>Actualizar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript"  src="js/jquery.form.js"></script> 
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="instructor/ActualizarOa/js/Actualizar.js" type="text/javascript"></script>
    <script>
        console.log(this.id);
        //Actualizar();
    </script>
</html>