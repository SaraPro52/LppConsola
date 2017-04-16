<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href= "//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/multi-select.css">
        <link rel="stylesheet" href="assets/css/estilo_1.css"/>
        <title>Subir OA</title>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="contenedor">
                            <section class="col-md-12">
                                <label><h3>Subir Producto Virtual</h3></label>
                                <article>
                                    <div class="col-md-6">
                                        <div class="col-md-12">
                                            <label> Titulo de Publicación</label>
                                            <input required class="form-control inputs" type="text"  name="Titulo_Publicacion" id="Titulo_Publicacion" placeholder="Titulo de la publicacion" required data-validation-required-message="Ingresa el titulo de la publicacion.">
                                            <p class="help-block text-danger"></p>

                                            <label>Palabras Claves</label>
                                            <input required class="form-control inputs" type="text"  name="palabras_claves" id="palabras_claves" placeholder="Palabras claves " required data-validation-required-message="Ingresa las palabras clave de la publicacion.">
                                            <p class="help-block text-danger"></p>

                                            <label> Descripción del Producto</label>
                                            <input required class="form-control inputs" type="text"  name="palabras_claves" id="descripcion_oa" placeholder="Descripcion del P.V" required data-validation-required-message="Ingresa la descripcion del producto virtual.">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="requisitos_instalacion"> Requisitos de Instalación</label>
                                            <textarea required class="form-control inputs" id="requisitos_instalacion" type="textarea " maxlength="200" name="palabras_claves" placeholder="Digite requisitos  de instalación"  rows="9"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label>Formato del archivo</label>
                                        <select  required class="form-control col-xs-12 floating-label-form-group controls select" id="formato" value="Valueblanco">
                                            <option value="A0" selected="selected">Selecciona...</option>
                                        </select>
                                        <div class="form-group">
                                            <label>Instrucciones de Instalación</label>
                                            <textarea required class="form-control inputs" id="instrucciones" type="textarea " maxlength="200"  placeholder="instrucciones de instalacion" required data-validation-required-message="Ingresa requisitos de instalacion." rows="3"></textarea>
                                        </div>
                                        <label class="col-md-12">Áutores del producto virtual</label>
                                        <div id="SelectAutoresDiv" class="col-md-12">
                                            <select required  id="SelectAutores" class="autoresMultiselect"  multiple='multiple' title="Busca un autor..">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="col-md-12">Busqueda de temas por categorias  del Producto Virtual</label>
                                        <div id="Cloncategoria" style="display: none;">
                                            <div class="contenCate col-md-12" >
                                                <label id="labelCate" class="col-md-12"></label>
                                                <label id="labelCateItems" class="col-md-8"></label>
                                                <div class="col-md-4">
                                                    <button id="buttonCate" class="clickCate btn btn-danger">Eliminar temas</button>
                                                </div>
                                                <p class="arrayCate" style="display: none;"></p>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="col-md-12">Buscar por categoria.</label>
                                            <select class="form-control" id="SelectCategoria" > 
                                                <option value="A0">Seleciona categoria</option>
                                            </select>
                                        </div>
                                        <div id="SelectCategoriaDiv" class="col-md-12"  style="display: none;">
                                            <label class="col-md-12">Temas de la categoria</label>
                                            <select required id="MultiCategoria" class="categoriaMultiselect"  multiple='multiple' title="Busca una categoria..">
                                                <option value="A0">Null</option>
                                            </select>
                                        </div>
                                        <div class="col-md-10 col-md-offset-2 " id="divBtnaCate" style="display: none;" >
                                            <button id="btnACategoria" class="btn btn-info" >Agregar temas de la categoria</button>
                                        </div>
                                        <div id="ECategoriaSelect" style="width: 100%; height: 100px; overflow-y: scroll;"></div>

                                        <div class="col-md-12">
                                            <label for="Documento" class="col-md-12">Adjuntar OA</label>
                                            <form id="UploadForm" action="archivos" method="post" enctype="multipart/form-data">
                                                <input type="file" size="26120" id="myfile" class="inputs input-file" name="myfile"> 
                                                <div class="inputNotifi"></div>   
                                                <input type="submit" class=" btn btn-info  col-md-8"  value="Subir Produto virtual" id="subir_oa">
                                                <div id="progressbox">
                                                    <div id="progressbar"></div>
                                                    <div id="percent">0%</div>
                                                </div>
                                                <br />
                                                <div id="message"></div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="espacio">Busqueda de temas por programa de Formación</label>

                                        <div id="ClonPrograma" style="display: none;">
                                            <div class="contenPro">
                                                <label id="labelPro" class="col-md-12"></label>
                                                <label id="labelProItems" class="col-md-8"></label>
                                                <div class="col-md-4">
                                                    <button id="buttonPro" class="clickPro btn btn-danger">Eliminar temas</button>
                                                </div>
                                                <p class="arrayPro" style="display: none;"></p>

                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="col-md-12" for="SelectArea">Buscar area de formacion.</label>
                                            <select id="SelectArea" class="form-control">
                                                <option value="A0">Seleciona...</option>
                                            </select>

                                            <label class="col-md-12" for="selectProgramaF">Buscar programa de formacion.</label>
                                            <select id="selectProgramaF" class="form-control">
                                                <option value="A0">Seleciona...</option>
                                            </select>
                                        </div>
                                        <br>
                                        <div id="SelectEstruturaDiv"  class="col-md-12 espacio" style="display: none;">
                                            <label class="col-md-12">Temas del programa de formacion</label>
                                            <select required  id="SelectEstrutura" class="programaFormacionMultiSelect"  multiple='multiple' title="Busca un programa.." >
                                                <option value="A0">Null</option>
                                            </select>
                                            <div class="col-md-10 col-md-offset-2"  id="divBtPro"> 
                                                <button id="btnACategoriaF" class="btn btn-info">Agregar temas de programa</button>
                                            </div>
                                        </div>


                                        <div id="EProgramaFSelect" style="width: 100%; height: 100px; overflow-y: scroll;"></div>
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
<script type="text/javascript" src="js/jquery.multi-select.js"></script>
<script type="text/javascript" src="js/jquery.quicksearch.js"></script>
<script type="text/javascript" src="js/notify.js"></script>
<script type="text/javascript" src="instructor/registroOA/js/SubirOa.js"></script>
</html>
