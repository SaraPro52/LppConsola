<div class="content">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="contenedorFormulario col-md-10"style="margin-top: 3%;">
                    <div class="form-group contenedorInsert">
                        <div class="col-md-6">
                            <label for="formato">Nombre del Formato:</label>
                            <input required placeholder="Nombre del Formato" type="text" class="form-control inputs" name="formato" id="formato" required="true">
                        </div>
                        <div class="col-md-6">
                            <label for="descripcion">Descripción del Formato:</label>
                            <input required type="text" placeholder="Descripción Formato"  class="form-control inputs" id="descripcion" name="descripcion" required="true">
                        </div> 
                        <div class="col-md-6">
                            <label for="descripcion">Tipo de Formato:</label>
                            <select id="tipoFormato" class="form-control">
                                <option value="A0">Selecionar...</option>
                            </select>
                        </div> 
                        <div class="col-md-12 col-md-offset-1 espacio">
                            <button type="button" class="btn btn-info espacio" id="btnformato"  name="button">Guardar formato</button>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <article style="margin-left:8%;" class="col-md-8 ">
            <table id="tablaformato" class="table table-hover">
                <thead>
                    <tr class="active">
                        <td>N°</td>
                        <td>Nombre del formato</td>
                        <td>Descripcion del formato</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody id="tablabody">
                </tbody>
            </table>
        </article>
    </div>
    <script type="text/javascript" charset="utf8" type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/notify.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="js/notify.js"></script> 
    <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="administrador/Formato/js/Formato.js"></script>
</div>
