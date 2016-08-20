<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">                    
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="instrutor/registroOA/js/SubirOa.js"></script>
        <title>Subir OA</title>
    </head>
    <body>
        <section>
            <article class="col-md-12">
                
                    <div class="col-md-7">
                        <input class="form-control" type="text" id="Titulo" value="">
                    </div>  
                    <article class="col-md-6">
                        <div class="col-md-6">

                            <div class="col-md-12">
                                <label for="Autores">Autores de la publicacion</label><span id="IAutores" class=" glyphicon glyphicon-sunglasses"></span></div>
                            <div class="col-md-12">
                                <input class="form-control" type="text" id="Autores" value="">
                            </div>
                        </div> 
                        <div class="col-md-12"><label for="Descripcion">Descripcion </label><span id="IDescripcion" class=" glyphicon glyphicon-sunglasses"></span></div>
                        <textarea id="Descripcion" rows="6" cols="50"></textarea>
                        <div class="col-md-12"><label for="Area">Area </label><span id="IArea" class=" glyphicon glyphicon-sunglasses"></span></div>
                        <select class="col-md-8" id="Area" value="">
                            <option value="SelectArea">Seleciona...</option>
                        </select>
                        <div class="col-md-12"><label for="Programa">Programa </label><span id="IPrograma" class=" glyphicon glyphicon-sunglasses"></span></div>
                        <select class="col-md-8" id="Programa" value="Valueblanco">
                            <option value="SelectPrograma">Seleciona...</option>
                        </select>

                        <div class="col-md-12"><label for="Tema"></label>Tema <span id="ITema" class=" glyphicon glyphicon-sunglasses"></span></div>
                        <select class="col-md-8" id="Tema" value="Valueblanco">
                            <option value="SelectTema">Seleciona...</option>
                        </select>
                        <div class="col-md-12">
                            <label for="Imagen">Imagen del documento</label>  
                            <input type="file" size="60" id="Imagen" name="myfile">
                            <div id="progressbox">
                                <div id="progressbar"></div>
                                <div id="precent"></div>
                            </div>
                            <br/>
                            <div id="message"></div             
                        </div>
                        <div class="col-md-12">
                            <label for="Documento">archivo</label>
                            <input type="file" size="60" id="Documento" name="myfile">
                            <div id="progressbox">
                                <div id="progressbar"></div>
                                <div id="precent"></div>
                            </div>
                            <br/>
                            <div id="message"></div             
                        </div>
                    </article>
                    <article class="col-md-6">
                        <div class="col-md-12"><label for="PalabrasClave">Palabras clave </label> <span id="IPalabrasClave" class="glyphicon glyphicon-sunglasses"></span></div>
                        <input type="text" id="PalabrasClave" value="">
                        <div class=""><label for="Formato">Formato </label><span id="IFormato" class="glyphicon glyphicon-sunglasses"></span></div>
                        <select class="" id="Formato" value="Valueblanco">
                            <option value="Valueblanco">Seleciona...</option>
                        </select>

                        <div > <label for="Requisitos">Requisitos de instalacion </label> <span id="IRequisitos" class=" glyphicon glyphicon-sunglasses"></span> </div>
                        <textarea id="Requisitos" rows="6" cols="50"></textarea>
                        <div class="col-md-12"> <label for="Instruciones">Instruciones </label> <span id="IInstruciones" class=" glyphicon glyphicon-sunglasses"></span> </div>
                        <textarea id="Instruciones" rows="6" cols="50"></textarea>
                        <div > <label for="Añadir">Añadir OA </label> <span id="IAnniadir" class="glyphicon glyphicon-sunglasses"></span> </div>
                        <input id="Anniadir"></input>    
                    </article>
                    <article class="col-md-2 col-md-offset-8">
                        <input class="btn btn-block" type="submit" name="btnenviar" value="Aceptar">
                        <input type="hidden" name="textOpcion" value="1">
                    </article>
            </article>
        </section>
    </body>
</html>
