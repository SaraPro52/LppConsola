<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="Equipo/ListaChequeo/js/listaChequeo.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
    </head>
    <body>
        <section class="col-md-10">
            <article class="">
                <label for="Descripcion">Descripcion de item</label>
                <input type="text" id="Descripcion" required="">
                <input type="hidden" id="tipo" value="1">
                <button id="btn">Agregar Item</button>
            </article>
            <article class="">
                <button id="btnLista">Agregra lista</button>                
            </article>
            
            <article class="">
                <center> <label>Lista de chequeo</label></center>
                
            </article>
            <article class="col-md-4 col-md-offset-2  panel panel-body" id="contenedor">
            </article>
            
        </section>
    </body>
</html>