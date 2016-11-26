<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">                    
        <link rel="stylesheet" href=    "//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/multi-select.css">
        <title>Subir OA</title>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="contenedor">
                            <section class="col-md-12">
                                <label><h3>Subir producto virtual</h3></label>
                                <article>
                                    <form id = "formulario1">
                                        <div class="col-md-6" id="formulario11"> 
                                            <div class="form-group col-xs-12 floating-label-form-group controls">   
                                                <label>Titulo de la publicacion</label>
                                                <input class="form-control" type="text"  name="Titulo_Publicacion" id="Titulo_Publicacion" placeholder="Titulo de la publicacion" required data-validation-required-message="Ingresa el titulo de la publicacion.">
                                                <p class="help-block text-danger"></p>
                                            </div>
                                            <div class="form-group col-xs-12 floating-label-form-group controls">   
                                                <label>Palabras claves de busqueda</label>
                                                <input class="form-control" type="text"  name="palabras_claves" id="palabras_claves" placeholder="Palabras claves " required data-validation-required-message="Ingresa las palabras clave de la publicacion.">
                                                <p class="help-block text-danger"></p>
                                            </div>
                                            <div class="form-group col-xs-12 floating-label-form-group controls">   
                                                <label>Decripcion del producto</label>
                                                <input class="form-control" type="text"  name="palabras_claves" id="descripcion_oa" placeholder="Descripcion del P.V" required data-validation-required-message="Ingresa la descripcion del producto virtual.">
                                            </div>
                                        </div>

                                        <div class="col-md-6" iinstruccionesd="formulario2">
                                            <div>   
                                                <label for="instrucciones"> instrucciones de instalacion</label>
                                                <div class="form-group">
                                                    <textarea class="form-control " id="instrucciones" type="textarea " maxlength="200"  placeholder="instrucciones de instalacion" required data-validation-required-message="Ingresa requisitos de instalacion." rows="3"></textarea>
                                                </div>
                                            </div>
                                            <div>
                                                <label>Formato del archivo</label>
                                                <select class="form-control col-xs-12 floating-label-form-group controls" id="formato" value="Valueblanco">
                                                    <option value="FG" selected="selected">Selecciona...</option>
                                                </select>
                                            </div>
                                            
                                           
                                        </div>
                                    </form>

                                     <div class="col-md-6">   
                                         <label style="display: none;"> Requisitos de instalacion</label>
                                                <div class="form-group" style="visibility:hidden;">
                                                    <textarea class="form-control " type="textarea " maxlength="200" name="palabras_claves" id="requisitos_instalacion1" placeholder="Requisitos de instalacion" required data-validation-required-message="Ingresa requisitos de instalacion." rows="3"></textarea>
                                                </div>
                                            </div>

                                    <div class="col-md-6">
                                        
                                        <label>Categorias del producto virtual</label>   
                                        <div id="SelectCategoriaDiv">
                                            <section  id=SelectCategoria></section>
                                        </div>
                                        
                                        
                                                <div class="form-group col-md-10">
                                                    <label for="requisitos_instalacion"> requisitos de instalacion</label>
                                                    <textarea class="form-control " id="requisitos_instalacion" type="textarea " maxlength="200" name="palabras_claves" placeholder="requisitos  de instalacion"  rows="5"></textarea>
                                                </div>
                                        
                                    </div>

                                    <div class="col-md-6">
                                        <label>Programa de formacion</label> 
                                        <div id="SelectEstruturaDiv">
                                            <section  id=SelectEstrutura>
                                            </section>
                                        </div>
                                        
                                         <label>Autores</label>
                                       <div id="SelectAutoresDiv">
                                            <section  id="SelectAutores">
                                            </section>
                                        </div>
                                    </div>
                                    
                                     
                                   
                                   
                                </article>

                                <article>
                                    <div> 
                                        <div>
                                            <label for="Documento">añadir OA</label>
                                            <form id="UploadForm" action="archivos" method="post" enctype="multipart/form-data">
                                                <input type="file" size="60" id="myfile" name="myfile"> 
                                                <input type="submit" class=" btn btn-info  col-md-6"  value="Subir Produto virtual" id="subir_oa">
                                                <div id="progressbox">
                                                    <div id="progressbar"></div>
                                                    <div id="percent">0%</div>
                                                </div>
                                                <br />
                                                <div id="message"></div>
                                            </form>
                                        </div>    
                                    </div>
                                </article>
                            </section>       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"  src="js/jquery.form.js"></script> 
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="js/jqueryUi.js"></script>
<script src="js/jquery.multi-select.js"></script>
<script src="assets/js/bootstrap-notify.js"></script>
<script type="text/javascript" src="instructor/registroOA/js/SubirOa.js"></script>
</html>