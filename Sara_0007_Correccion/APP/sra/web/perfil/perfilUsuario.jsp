<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link id="cssUsuario" href="assets/css/paper-dashboard.css"/>
    </head>
    <body>
        <div class="content" id="formulario1">
            <div class="container-fluid">
                <div class="row">
                </div>
                <div class="col-lg-8 col-md-7" style="width:100%;">
                    <div class="card">

                        <form id="coambiarContra">
                            <div style="margin-left:5%;" class="col-md-4">
                                <label>Numero de identificacion</label>
                                <input required id="nIdentificaion" type="text" class="form-control border-input inputsC" placeholder="" >
                            </div>                                 
                            <div style="margin-left:5%;" class="col-md-4">
                                <label>Contraseña Actual</label>
                                <input required id="ConActual" type="password" class="form-control border-input inputsC" placeholder="" >
                            </div> 
                            <div style="margin-left:5%;" class="col-md-4">
                                <label>Nueva Contraseña</label>
                                <input required id="ConNueva" type="password" class="form-control border-input inputsC" placeholder="">
                            </div>
                            <div style="margin-left:5%;" class="col-md-4">
                                <label for="exampleInputEmail1">Confirmar Nueva Contraseña</label>
                                <input required id="ConNuevaF"  type="password" class="form-control border-input inputsC" placeholder="">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-12 col-md-offset-4" style="margin-bottom:3%; ">
                        <button id="BtnModificar1" type="button" class="btn btn-info btn-fill btn-wd ">Modificar Contraseña</button>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>

    </div>
</div>

</body>
<script type="text/javascript" src="assets/js/jquery-1.10.2.js" ></script>
<script type="text/javascript" src="js/bootstrap.js" ></script>
<script type="text/javascript" src="js/notify.js"></script> 
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="perfil/js/perfilUsuario.js"></script>
</html>

