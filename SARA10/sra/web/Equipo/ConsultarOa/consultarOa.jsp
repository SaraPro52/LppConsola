<div id="ContenedoraBody">
    <link rel="stylesheet" href="css/estilo.css" media="screen" title="no title">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <section class="col-md-6">
        <article class="" id="tabla">
            <table class="table table-striped" id="tablaConsultarOa">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Descripcion</th>   
                        <th>Fecha envio</th>   
                        <th>Evaluar</th>   
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </article>
        <article class="col-md-12" id="lista">
    </section>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Lista de chequeo para evaluar Producto virtual</h4>
                </div>
                <div class="modal-body">
                    <article  id="tabla">
                        <table class="table table-striped" id="tablaListaChequeo">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre de lista</th>
                                    <th>Descripcion</th>
                                    <th>Fecha</th>
                                    <th>Escojer</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </article>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>  
    <script type="text/javascript" src="js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="Equipo/ConsultarOa/js/consultarOa.js"></script>
    <script>
        this.consultar(this.idRol);
        alert("Consultar"+ this.idRol);
    </script>
</div>