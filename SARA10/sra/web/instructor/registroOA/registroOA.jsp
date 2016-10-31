<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/hojaestilo.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">                    
        <link rel="stylesheet" href=    "//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/multi-select.css">
        <link rel="stylesheet" href="css/freelancer.css" media="screen" title="no title" charset="utf-8">
        <title>Subir OA</title>
    </head>
    <body>
        <section class="col-md-12">
            <label class="col-md-12"><h3>Subir producto virtual</h3></label>
            <article class="col-md-6">
                <form id = "formulario1">
                    <div class="form-group col-xs-12 floating-label-form-group controls">   
                        <label>Titulo de la publicacion</label>
                        <input type="text"  name="Titulo_Publicacion" id="Titulo_Publicacion" placeholder="Titulo de la publicacion" required data-validation-required-message="Ingresa el titulo de la publicacion.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div>
                        <div id="SelectAutoresDiv">
                            <section  id="SelectAutores">
                            </section>
                        </div>

                    </div>
                    <div class="form-group col-xs-12 floating-label-form-group controls">   
                        <label>Palabras claves de busqueda</label>
                        <input type="text"  name="palabras_claves" id="palabras_claves" placeholder="Palabras claves " required data-validation-required-message="Ingresa las palabras clave de la publicacion.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group col-xs-12 floating-label-form-group controls">   
                        <label>Decripcion del producto</label>
                        <input type="text"  name="palabras_claves" id="descripcion_oa" placeholder="Descripcion del P.V" required data-validation-required-message="Ingresa la descripcion del producto virtual.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div>
                        <label>Definir de objecto de aprendizaje</label> <br/>
                        <input type="checkbox" id="Categorias"  >Categoria<br/>
                        <div id="SelectCategoriaDiv">
                            <section  id=SelectCategoria>
                            </section>
                        </div>
                        <input type="checkbox" id="Estruturas" >Estrura de formacion
                        <div id="SelectEstruturaDiv">
                            <section  id=SelectEstrutura>
                            </section>
                        </div>
                    </div>
                </form>
            </article>
            <article class="col-md-6">
                <div>
                    <label>Formato del archivo</label>
                    <select class="form-control" id="formato" value="Valueblanco">
                        <option value="" selected="selected">Selecciona...</option>
                    </select>
                </div>
                <div class="form-group col-xs-12 floating-label-form-group controls">   
                    <label>Requisitos de instalacion</label>
                    <input type="text"  name="palabras_claves" id="requisitos_instalacion" placeholder="Requisitos de instalacion" required data-validation-required-message="Ingresa requisitos de instalacion.">
                    <p class="help-block text-danger"></p>
                </div>

                <div class="form-group col-xs-12 floating-label-form-group controls">   
                    <label>Instrucciones de instalacion</label>
                    <input type="text"  name="palabras_claves" id="instrucciones" placeholder="Instrucciones de instalacion" required data-validation-required-message="Ingresa instrucciones de instalacion.">
                    <p class="help-block text-danger"></p>

                </div>
                    <div> 
                        <div class="col-md-12">
                            <label for="Imagen">Imagen del documento</label>  
                            <input type="file" size="60" id="Imagen" name="myfile" class="input-file">
                        </div>
                        <label for="ejemplo_archivo_1">añadir OA</label>
                        <div class="col-md-12">
                            <input type="file" size="60" id="Documento" name="myfile" class="input-file">
                        </div>

                    </div>
                        <button class=" btn btn-info  col-md-4" id="subir_oa" >Agregar Archivos</button>
            </article>
        </section>       
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="js/tag-it.js"></script>
<script type="text/javascript" src="js/jqueryUi.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jqBootstrapValidation.js"></script>
<script src="js/jquery.multi-select.js"></script>
<script type="text/javascript" src="instrutor/registroOA/js/SubirOa.js"></script>
</html>
