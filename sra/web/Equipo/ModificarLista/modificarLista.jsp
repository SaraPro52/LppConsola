<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link rel="shotrcut icon" href="flavicon.ico">
        <script type="text/javascript" src="js/jquery.js"></script>        
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <script type="text/javascript" src="Equipo/ModificarLista/js/modificarLista.js"></script>
        <script type="text/javascript" src="js/jqueryUi.js"></script>



        <link rel="stylesheet" href="css/common.css" type="text/css" />
        <link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/ui-lightness/jquery-ui.css" />
        <link type="text/css" href="css/ui.multiselect.css" rel="stylesheet" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/plugins/localisation/jquery.localisation-min.js"></script>
        <script type="text/javascript" src="js/plugins/scrollTo/jquery.scrollTo-min.js"></script>
        <script type="text/javascript" src="js/multiselect/ui.multiselect.js"></script>
        <script type="text/javascript" src="js/locale/ui-multiselect-es.js"></script>

        <script type="text/javascript" src="js/logico1.js"></script>

        <title>Crear lista de chequeo</title>
    </head>
    <body class="col-md-12">
        <aside class="col-md-2">
            <ul class="nav nav-pills nav-stacked col" >
                <li class="active"><a href="#">Modificar lista de chequeo</a></li>
                <li><a href="#">Modificar Lista</a></li>
                <li><a href="#">Evalular OA</a></li>
            </ul>
        </aside>
        <section class="col-md-10">
            <h2 class="dark-grey">Modificar lista de chequeo</h2>
            <article class="col-md-6" id="item">
                <input type="hidden" value="1" id="tipoLis">
                <label>Nombre Lista</label>
                <input type="text" class="form-control" id="NombreL"  placeholder="Nombre de lista">
                <label>Fecha de creacion </label>
                <input type="text" readonly="readonly" class="form-control"  id="calen">
                <label>Decripcion</label>
                <textarea class="form-control"  id="DescripcionL" placeholder="Descripcion lista" rows="1" id="comment"></textarea>
                <button class="btn btn-info col-md-6" id="BtnLista">Modificar lista</button>
            </article>


            <article class="col-md-6" id="items">

                <p><h3 class="dark-grey"><b>Items de lista de chequeo</b></h3></p>
                <label for="Descripcion">Descripcion de item</label>
                <div class="col-md-10"> 
                    <textarea class="form-control" placeholder="Descripcion lista" rows="1" id="Descripcion"></textarea>
                </div>
                <div class="col-md-10"> 
                    <button  class="btn btn-info" id="btnItem">Agregar Item</button>
                </div>
            </article>
            <article class="col-md-8 col-md-offset-1" id="tabla">
                <table class="table table-striped" id="tablalista">
                    <thead>
                        <tr>
                            <th>Numero</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Fecha</th>
                            <th>Modificar lista</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
        </section> 
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <article class="col-md-16" id="tablaItems">
            <center>
                <select id="countries" class="multiselect" multiple="multiple" name="countries[]">
                    <option value="AFG">Afghanistan</option>
                    <option value="ALB">Albania</option>
                    <option value="DZA">Algeria</option>
                    <option value="AND">Andorra</option>
                    <option value="ARG">Argentina</option>
                    <option value="ARM">Armenia</option>
                    <option value="ABW">Aruba</option>
                    <option value="AUS">Australia</option>

                </select>
            </center>
        </article>
    </body>
</html>