<%-- 
    Document   : index
    Created on : 23/07/2016, 01:26:22 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Subir OA</title>

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/SubirOa.js"></script>
        <link rel="stylesheet" href="css/HojaEsstilos.css" media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    </head>
    <body>
        <header>
        </header>
        <nav>
        </nav>

        <section>
            <article class="col-md-12">
                <div class="col-md-8">
                    <label for="Titulo">Titulo de la publicacion</label><span id="ITitulo" class=" glyphicon glyphicon-sunglasses"></span>
                    <div class="col-md-offset-12" id="notificacion"> La peor informacion del mundo...</div>    
                </div>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="Titulo" value="">
                </div>  

                <div class="col-md-6">
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
                                <input type="file" value="" />
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
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
                </div>
                <div class="col-md-2 col-md-offset-8"> 
                    <button class="btn btn-block"type="button" id="btnSubir">Subir OA</button>
                </div>
                </div>
            </article>
        </section>
        <footer>
            <a href ="administrador/registroCoordinador/RegistroCoordinador.jsp">Click</a>
        </footer>
    </body>
</html>
