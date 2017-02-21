<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>formato</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet" id="cssUsuario"/>

    </head>
    <body>

        <div class="content" id="formulario1">
            <div class="container-fluid">
                <div class="row">
                </div>
                <div class="col-lg-8 col-md-7" style="width:100%; ">
                    <div class="card">
                        <div class="header">
                            <h4 style="font-size:25px;"class="title">Editar Perfil</h4>
                        </div>
                        <div class="header">
                            <h4 class="title">Datos Personales</h4>
                        </div>
                        <div class="content">
                            <form id="formulario">
                                <div  style="margin-left: 5%;" class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input required id="NombreFun" type="text" class="form-control border-input inputs"  placeholder="Ej:Juan">
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Apellido</label>
                                            <input required id="ApellidoFun" type="text" class="form-control border-input inputs"  placeholder="Ej:Martinez">
                                        </div>
                                    </div>  
                                </div>
                                <div style="margin-left:5%;" class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Tipo De Identificación</label>
                                            <select required id="IdentificacionFunTipo" class="form-control border-input select">
                                                <option value="A0">Seleciona...</option>
                                                <option value="1">Cedula de Ciudadania</option>
                                                <option value="2">Cedula Extrangera</option>
                                                <option value="3">Registro Civil</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Numero De Identificación</label>
                                            <input required id="IdentificacionFun"  type="text" class="form-control border-input inputs" placeholder="Ej:11195673412" maxlength="1000" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                                        event.returnValue = false;">
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 style="font-size:25px;"class="title" >Datos SENA</h4>

                                    </div>

                                    <div style="margin-left:5%;" class="row">

                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Ip SENA</label>
                                                <input required id="IdSenaFun" type="text" class="form-control border-input inputs" placeholder="Ej:54587093" value="" maxlength="1000" onKeypress="if (event.keyCode < 45 || event.keyCode > 57)
                                                            event.returnValue = false;">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Cargo</label>
                                                <input required id="CaargoFun" type="text" maxlength="12"  class="form-control border-input inputs" placeholder="Ej:Instructor">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Correo Eléctronico</label>
                                                <input required id="CorreoFun" type="email" class="form-control border-input" placeholder="Ej:ejemplo@ejemplo.com">
                                            </div>
                                        </div>
                                    </div>
                                    <form id="coambiarContra">
                                        <div style="margin-left:5%;" class="col-md-4">
                                            <label>Usuario:</label>
                                            <input required id="user" type="text" class="form-control border-input inputsC" placeholder="" >
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
                                            <label for="exampleInputEmail1">Confirmar nueva contraseña</label>
                                            <input required id="ConNuevaF"  type="password" class="form-control border-input inputsC" placeholder="">
                                        </div>
                                    </form>
                                </div>
                                <div class="text-center" style="margin-bottom:3%; ">
                                    <button id="BtnModificar" type="button" class="btn btn-info btn-fill btn-wd ">Modificar perfil</button>
                                    <button id="BtnModificar1" type="button" class="btn btn-info btn-fill btn-wd ">Modificar Contraseña</button>

                                </div>
                        </div>

                        <div class="clearfix"></div>
                        <form/>
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

