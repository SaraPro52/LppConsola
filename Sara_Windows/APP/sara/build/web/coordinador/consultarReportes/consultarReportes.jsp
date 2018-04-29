<div class="content">
    <link href="assets/css/jquery-uitab.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
    <div class="">
        <div class="">
            <div class="col-md-12">
                <div class="contenedorFormulario col-md-10" style="margin-left:9%">
                    <div class="">
                        <div id="tabs">
                            <ul>
                                <li><a href="#tabs-1">Area</a></li>
                                <li><a href="#tabs-2">Formato</a></li>
                                <li><a href="#tabs-3">Categoria</a></li>
                                <li><a href="#tabs-4">Visitas del producto virtual</a></li>
                                <li><a href="#tabs-5">Producto virtual</a></li>
                                <li><a href="#tabs-6">Productos publicados/inhabilitados</a></li>
                                <li><a href="#tabs-7">Publicaciones de los funcionarios</a></li>
                                <li><a href="#tabs-8">Puestos de los productos virtuales</a></li>
                            </ul>
                            <div id="tabs-1" >

                                <div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Año: </p>
                                        <select class="anio form-control" id="anio1" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Mes:</p>
                                        <select class="mes form-control" id="mes1" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-md-offset-5">
                                        <button type="button" class="btn btn-info btnReporte" id="1">Consultar</button>
                                    </div>
                                    <table id="tablaReporte1" class="table-hover" style="width: 120px">

                                    </table>
                                </div>
                            </div>
                            <div id="tabs-2">
                                <div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Año: </p>
                                        <select class="anio form-control" id="anio2" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Mes:</p>
                                        <select class="mes form-control" id="mes2" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-md-offset-5">
                                        <button type="button" class="btn btn-info btnReporte" id="2">Consultar</button>
                                    </div>
                                    <table id="tablaReporte2" class="table-hover">

                                    </table>
                                </div>                                
                            </div>
                            <div id="tabs-3">
                                <div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Año: </p>
                                        <select class="anio form-control" id="anio3" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Mes:</p>
                                        <select class="mes form-control" id="mes3" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 col-md-offset-5">
                                        <button type="button" class="btn btn-info btnReporte" id="3">Consultar</button>
                                    </div>
                                    <table id="tablaReporte3" class="table-hover">

                                    </table>
                                </div>
                            </div>
                            <div id="tabs-4">
                                <div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Año: </p>
                                        <select class="anio form-control" id="anio4" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Mes:</p>
                                        <select class="mes form-control" id="mes4" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 col-md-offset-5">
                                        <button type="button" class="btn btn-info btnReporte" id="4">Consultar</button>
                                    </div>
                                    <table id="tablaReporte4" class="table-hover">

                                    </table>
                                </div>
                            </div>
                            <div id="tabs-5">
                                <div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Año: </p>
                                        <select class="anio form-control" id="anio5" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Mes:</p>
                                        <select class="mes form-control" id="mes5" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 col-md-offset-5">
                                        <button type="button" class="btn btn-info btnReporte" id="5">Consultar</button>
                                    </div>
                                    <table id="tablaReporte5" class="table-hover">

                                    </table>
                                </div>
                            </div>
                            <div id="tabs-6">
                                <div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Año: </p>
                                        <select class="anio form-control" id="anio6" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Mes:</p>
                                        <select class="mes form-control" id="mes6" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-md-offset-5">
                                        <button type="button" class="btn btn-info btnReporte" id="6">Consultar</button>
                                    </div>
                                    <table id="tablaReporte6" class="table-hover">

                                    </table>
                                </div>
                            </div>
                            <div id="tabs-7">
                                <div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Año: </p>
                                        <select class="anio form-control" id="anio7" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="col-md-12">Mes:</p>
                                        <select class="mes form-control" id="mes7" style="border:1px solid #C0BEBE;">
                                            <option value="A0">Selecione...</option>
                                        </select>
                                    </div>
                                    <table id="tablaReporte7" class="table-hover">

                                    </table>
                                </div>
                            </div>
                            <div id="tabs-8">
                                <div>                                  
                                    <div class="col-md-6 col-md-offset-5">
                                        <button type="button" class="btn btn-info" id="btnPublicacioneFunciones">Consultar</button>
                                    </div>
                                    <table id="tablaReporte8" class="table-hover">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jqueryUi.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" charset="utf8" src="coordinador/consultarReportes/js/ConsultarReportes.js"></script>
</div>