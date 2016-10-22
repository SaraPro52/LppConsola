<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">                    
        <link href="css/jquery.tagit.css" rel="stylesheet" type="text/css">
        <link href="css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
        <title>Subir OA</title>
    </head>
    <body>
        <p>
        <h2 class="dark-grey">Subir Objeto de aprendizaje </h2>
    </p>
    <div id="formulario1">
        <section class="col col-md-4">
            <font FACE="arial" SIZE=4>Titulo publicacion</font>
            <div id="Tituloss" class="ui-widget">
                <input type="text" id="Titulo_Publicacion"  class="form-control ui-widget-content" placeholder="Titulo de publicacion"></input>
            </div>

            <label>Autores</label>
            <input type="text" class="form-control" placeholder="Autores" id="autores" maxlength="20" required="text">
            <font FACE="arial" SIZE=4>palabras claves</font>
            <input type="text" class="form-control" placeholder="Palabras claves" id="palabras_claves" maxlength="50">

            <font FACE="arial" SIZE=4>Decripcion OA</font>
            <textarea class="form-control"placeholder="Descripcion OA"  rows="5" id="descripcion_oa" maxlength="50"></textarea>
            <label>Definir de objecto de aprendizaje</label> <br/>
            <div class="control" id="TemaCategoria">
                <div class="contenedor">
                    <input type="hidden" class="datos" value="">
                    <label id="espacio"></label>
                    <ul class="view"></ul>
                </div>
            </div>  
            <input type="checkbox" id="Categorias"  >Categoria<br/>

            <div id="SelecCategoria">
                <label>Categorias</label>
                <input type="hidden" id="Categoria_Datos" value="" >
                <ul id="Categoria"></ul>
                <button class="btn" type="button" id="btnCategoria">Todas las Categorias</button>
                <div id="seCa">
                </div>
            </div>
            <input type="checkbox" id="Estrutura" >Estrura de formacion
            <div id="SelecEstrutura">
                <label for="">Estrutura </label>
                <input type="hidden" id="Estrutura_Datos" value="">
                <ul id="Estrutura"></ul>
                <button class="btn" type="button" id="btnEstrutura">TodasEstrutura</button>
            </div>

        </section>

        <section class="col col-md-5">

            <font FACE="arial" SIZE=4>Formato</font>
            <select class="form-control" id="formato" value="Valueblanco">
                <option value="" selected="selected">Selecciona...</option>
            </select>
            <font FACE="arial" SIZE=4>Requisitos instalacion</font>
            <textarea class="form-control" placeholder="Requisitos instalacion" rows="5" id="requisitos_instalacion" maxlength="40"></textarea>

            <font FACE="arial" SIZE=4>Instrucciones</font>
            <textarea class="form-control" placeholder="Instrucciones" rows="5" id="instrucciones" maxlength="40"></textarea>

            <form  id="formuploadajax" >
                <div class="col-md-12">
                    <label for="Imagen">Imagen del documento</label>  
                    <input type="file" size="60" id="Imagen" name="myfile">
                </div>
                <font FACE="arial" for="ejemplo_archivo_1">añadir OA</label>
                <div class="col-md-12">
                    <input type="file" size="60" id="Documento" name="myfile">
                </div>
            </form>
            <input  type="submit" value="Subir OA" class=" btn btn-info  col-md-4" id="subir_oa">
        </section>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="js/tag-it.js"></script>
<script type="text/javascript" src="js/jquery.GestionAutoCompletTags.js"></script>
<script type="text/javascript" src="instrutor/registroOA/js/SubirOa.js"></script>
</html>
