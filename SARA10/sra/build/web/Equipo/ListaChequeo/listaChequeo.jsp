<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/multi-select.css">
        
        <title>Crear lista de chequeo</title>
    </head>
    <body class="col-md-12">
        <section class="col-md-10">
            <label class="dark-grey" id="lista"><h2>Crear lista de chequeo</h2></label>
            <article class="col-md-6" id="item">
                <input type="hidden" value="1" id="tipoLis">
                <label>Nombre Lista</label>
                <input type="text" class="form-control" id="NombreL"  placeholder="Nombre de lista">
                <label>Decripcion</label>
                <textarea class="form-control"  id="DescripcionL" placeholder="Descripcion lista" rows="1" id="comment"></textarea>
                <button class="btn btn-info col-md-6" id="BtnLista"> Crear lista</button>
            </article>
            <article class="col-md-6" id="items">
                <label class="dark-grey" id="lista" >Items de lista de chequeo</label>
                <div class="col-md-10">         
                    <label for="Descripcion">Descripcion de item</label>

                    <textarea class="form-control" placeholder="Descripcion lista" rows="1" id="Descripcion"></textarea>
                </div>
                <div class="col-md-10"> 
                    <button  class="btn btn-info" id="btnItem">Agregar Item</button>
                </div>
            </article>
            <article class="col-md-8 col-md-offset-1" id="tabla">
                <div id="SelectItemDiv">
                    <section  id=SelectItem>
                    </section>
                </div>
            </article>
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/jquery.multi-select.js"></script></script>
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="Equipo/ListaChequeo/js/listaChequeo.js"></script>
</html>