<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>formato</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="administrador/Formato/js/Formato.js"></script>
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    </head>
    <body class="col-md-12">
            <article class="col-md-10">
                <form id = "formularioEstado">
                    <label for="formato">Nombre del formato</label>
                    <input  placeholder="Nombre del formato" type="text"  name="formato" id="formato" required="true">
                    <label for="descripcion">descripcion formato</label>    
                    <textarea placeholder="descripcion formato" id="descripcion" name="descripcion" required="true"></textarea>
                        <button type="button" class="btn btn-info" id="btnformato"  name="button">Guardar formato</button>  
                </form>
            </article>
            <article class="col-md-10 ">
                <table id="tablaformato" class="table table-hover">
                    <thead>
                        <tr class="active">
                            <td>#</td>
                            <td >Nombre formato</td>
                            <td>Descripcion del formato</td>
                            <td></td>
                            <td></td>   
                        </tr>
                    </thead>
                    <tbody id="tablabody">
                    </tbody>
                </table>
            </article>
    </body>
</html>