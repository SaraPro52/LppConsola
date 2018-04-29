<div class="row">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
    <div class="col-md-10 col-md-offset-1 card">
        <div>
            <div class="header col-md-offset-1">
                <h4 class="title">Tipo de Producto Virtual</h4>
                <p class="category">Producto Virtual</p>
            </div>
            <div class="content col-md-offset-2">
                <div id="ProductoirtualE" class="ct-chart"></div>
                <div class="footer">
                    <div class="stats">
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-md-offset-1">
                <div class="col-md-12">
                    <label id="TiempoEstaProduc" class="col-md-12"> Estadistica Mensual</label>
                </div>
                <div class="col-md-4">
                    <p class="col-md-12">Año: </p>
                    <select class="anio form-control" id="anioTipo" style="border:1px solid #C0BEBE;">
                        <option value="A0">Selecione...</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <p class="col-md-12">Mes:</p>
                    <select class="mes form-control" id="mesTipo" style="border:1px solid #C0BEBE;">
                        <option value="A0">Selecione...</option>
                    </select>
                </div>
                <div class="col-md-12 col-md-offset-3 espacioTi">
                    <button id="btnProductoE" style="margin-bottom:5% ;" class="btn btn-info">General Estadistica</button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-10 col-md-offset-1 card">
        <div>
            <div class="header col-md-offset-1">
                <h4 class="title">Categoria</h4>
                <p class="category">Producto Virtual</p>
            </div>
            <div class="content col-md-offset-2">
                <div id="chartCategoria" class="ct-chart"></div>
                <div class="footer">
                    <div class="stats">
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-md-offset-1">
                <div class="col-md-12">
                    <label id="TiempoEstaProducto" class="col-md-12">Estadistica Mensual</label></i>
                </div>
                <div class="col-md-4">
                    <p class="col-md-12">Año: </p>
                    <select class="anio form-control" id="anioCategoria" style="border:1px solid #C0BEBE;">
                        <option value="A0">Selecione...</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <p class="col-md-10">Mes</p>
                    <select class="mes form-control" id="mesCategoria" style="border:1px solid #C0BEBE;">
                        <option value="A0">Selecione...</option>
                    </select>
                </div>
                <div class="col-md-12 col-md-offset-2 espacioTi">
                    <button id="btnCategoriaE" style="margin-bottom:5% ;" class="btn btn-info">General Estadistica</button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-10 col-md-offset-1 card">
        <div>
            <div class="header col-md-offset-1">
                <h4 class="title">Areas</h4>
                <p class="category">Productos Virtuales</p>
            </div>
            <div class="content col-md-offset-2">
                <div id="chartArea" class="ct-chart"></div>
                <div class="footer ">
                    <div class="stats">
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-md-offset-1">
                <div class="col-md-12">
                    <label id="TiempoEstadArea"> Estadisticas Mensuales</label></i>
                </div>
                <div class="col-md-4">
                    <p class="col-md-12">Año: </p>
                    <select class="anio form-control" id="anioArea" style="border:1px solid #C0BEBE;">
                        <option value="A0">Selecione...</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <p class="col-md-12">Mes:</p>
                    <select class="mes form-control" id="mesArea" style="border:1px solid #C0BEBE;">
                        <option value="A0">Selecione...</option>
                    </select>
                </div>
                <div class="col-md-12 col-md-offset-2 espacioTi">
                    <button id="btnAreaE"style="margin-bottom:5% ;" class="btn btn-info">General Estadistica</button>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jqueryUi.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/fusioncharts.js"></script>
    <script src="coordinador/ConsultarEstadisticas/js/Estadisticas.js" type="text/javascript"></script>
</div>
