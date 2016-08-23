<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="Equipo/ListaChequeo/js/listaChequeo.js"></script>
        <title>Crear lista de chequeo</title>
    </head>
    <body class="col-md-12">
        <aside class="col-md-2">
            <ul class="nav nav-pills nav-stacked col" >
                <li><a href="#">Pagina principal</a></li>
                <li class="active"><a href="#">Crear lista de chequeo</a></li>
                <li><a href="#">Modificar Lista</a></li>
                <li><a href="#">Evalular OA</a></li>
            </ul>
        </aside>
        <section class="col-md-10">
            <h2 class="dark-grey">Crear lista de chequeo</h2>
            <article class="col-md-6" id="item">
                <input type="hidden" value="1" id="tipoLis">
                <label>Nombre Lista</label>
                <input type="text" class="form-control" id="NombreL"  placeholder="Nombre de lista">
                <label>Fecha de creacion </label>
                <input type="text" readonly="readonly" class="form-control"  id="calen">
                <label>Decripcion</label>
                <textarea class="form-control"  id="DescripcionL" placeholder="Descripcion lista" rows="1" id="comment"></textarea>
                <button class="btn btn-info col-md-6" id="BtnLista"> Crear lista</button>
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
                <table class="table table-striped" id="tablaItems">
                    <thead>
                        <tr>
                            <th> # </th>
                            <th>item</th>
                            <th>¿Asignar?</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </article>
            <article class="col-md-12" id="lista">
        </section>
        
    </body>
</html>





