<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">            <link rel="stylesheet" type="text/css" href="css/HojaEstilos.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/logico.js"></script>
        <script type="text/javascript" src="instrutor/registroOA/js/SubirOa.js"></script>
        <title>Subir OA</title>
    </head>
    <body>
        <section>
            <article class="col-md-12">
                <form class="" action="InstrutorController" method="post">

                    <div class="col-md-8">
                        <label for="Titulo">Titulo de la publicacion</label><span id="ITitulo" class="glyphicon glyphicon-sunglasses"></span>
                        <div class="col-md-offset-12" id="notificacion"> La peor informacion del mundo...</div>    
                    </div>
                    <form class="" action="index.html" method="post">
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
                                <div class="col-md-2 ">
                                    <figure><img src="recursos/images.jpeg" width="50px" height="50px" id="IImagen"/></figure>
                                </div>
                                <div class="col-md-8">
                                    <label for="Imagen">Añadir imagen</label><span id="IImagen" class="glyphicon glyphicon-sunglasses"></span>
                                    <div class="col-md-12">
                                        <input type="file" id="Imagen" value="subir">
                                        <span id="BtnBoton" class="glyphicon glyphicon-open-file"></span>
                                    </div>
                                </div>
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
                    </form>
            </article>
        </section>
    </body>
</html>
