<div class="content">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <section class="col-md-12 ">
                    <div id="divModificarROl" class="col-md-9 col-md-offset-1" style="display: none;">
                        <div class="col-md-6 ">
                            <label class="col-md-12">Nombre del funcionario</label>
                            <input id="nomFun" disabled="true" class="form-control"> 
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-12">Rol disponible</label>
                            <select id="selectRol" class="form-control">
                                <option value="A0">Selecione...</option>
                            </select>
                        </div>
                        <div>
                            <button id="btnModificarRol" class="btn btn-info">Modificar funcionario</button>
                    <br>
                        </div>
                    </div>
                    <br>
                    <article class="col-md-10 col-md-offset-1" id="tabla">
                        <table class="table table-striped" id="tablaARoles">
                            <thead>
                                <tr>
                                    <th>N°</th>
                                    <th>Nombre Funcionario</th>
                                    <th>Rol</th>
                                    <th>Asignar</th>
                                </tr>
                            </thead>
                            <tbody id="bus">
                            </tbody>
                        </table>
                    </article>
                    <article class="col-md-12" id="lista">
                </section>
            </div>
        </div>
        <script type="text/javascript" charset="utf8" type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
        <script src="assets/js/bootstrap-notify.js"></script>
        <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
        <script type="text/javascript" src="coordinador/AsignarRoles/js/asignarRoles.js"></script>
    </div>
</div>
