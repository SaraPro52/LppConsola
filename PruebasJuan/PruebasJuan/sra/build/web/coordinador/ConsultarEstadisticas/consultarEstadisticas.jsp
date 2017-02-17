<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/css/paper-dashboardCoordinador.css" rel="stylesheet"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Areas</h4>
                        <p class="category">Productos virtuales</p>
                    </div>
                    <div class="content">
                        <div id="chartArea" class="ct-chart"></div>
                        <div class="footer">
                            <div class="stats">
                                <label id="TiempoEstadArea"> Estadisticas mensuales</label></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <p>Fecha inicial: <input type="text" id="dataInicialA"></p>
                        </div>
                        <div class="col-md-6">
                            <p>Fecha final: <input type="text" id="dataFinalA"></p>
                        </div>
                    </div>
                    <button id="btnAreaE" class="btn btn-info">General estadistica</button>
                </div>
            </div>

            <div class="col-md-10 col-md-offset-1">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Tipo de Producto virtual</h4>
                        <p class="category">Producto virtual</p>
                    </div>
                    <div class="content">
                        <div id="ProductoirtualE" class="ct-chart"></div>
                        <div class="footer">
                            <div class="stats">
                                <label id="TiempoEstaProduc"> Estadistica mensual</label></i> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <p>Fecha inicial: <input type="text" id="dataInicialP"></p>
                        </div>
                        <div class="col-md-6">
                            <p>Fecha final: <input type="text" id="dataFinalP"></p>
                        </div>
                    </div>
                    <button id="btnProductoE" class="btn btn-info">General estadistica</button>
                </div>   
            </div>
            <div class="col-md-10 col-md-offset-1">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Categoria</h4>
                        <p class="category">Producto virtual</p>
                    </div>
                    <div class="content">
                        <div id="chartCategoria" class="ct-chart"></div>
                        <div class="footer">
                            <div class="stats">
                                <label id="TiempoEstaProducto"> Estadistica mensual</label></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <p>Fecha inicial: <input type="text" id="dataInicialC"></p>
                        </div>
                        <div class="col-md-6">
                            <p>Fecha final: <input type="text" id="dataFinalC"></p>
                        </div>
                    </div>
                    <button id="btnCategoriaE" class="btn btn-info">General estadistica</button>
                </div>
            </div>
        </div>
    </body>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jqueryUi.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/fusioncharts.js"></script>
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script src="coordinador/ConsultarEstadisticas/js/Estadisticas.js" type="text/javascript"></script>
</html>
