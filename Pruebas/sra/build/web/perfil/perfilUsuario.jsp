<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>formato</title>
        <link rel="stylesheet" href="css/bootstrap.css" media="screen" title="no title" charset="utf-8">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <!--div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"-->
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Modifica tu contraseña</h4>
                                </div>
                                <div class="modal-body">
                                    <article  id="tabla">
                                        <div class="col-md-3">
                                            <label>Contraseña actual</label>
                                            <input id="ConActual" type="password" class="form-control border-input" placeholder="" >
                                            <label>Nueva contraseña</label>
                                            <input id="ConNueva" type="password" class="form-control border-input" placeholder="" >
                                            <label for="exampleInputEmail1">Confirmar nueva contraseña</label>
                                            <input id="ConNuevaF"  type="password" class="form-control border-input" placeholder="">
                                        </div>
                                </div>
                                <div id="modal-footer">
                                    <button id="BtnMcontrasena"type="button">Modificar</button>
                                </div>
                                </article>
                            </div>
                        </div>
                    <!--/div-->
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Editar Perfil</h4>
                        </div>
                        <div class="header">
                            <h4 class="title">Datos Personales</h4>
                        </div>
                        <div class="content">
                            <form id="formulario">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input id="NombreFun" type="text" class="form-control border-input"  placeholder="Ej:Juan">
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label>Apellido</label>
                                            <input id="ApellidoFun" type="text" class="form-control border-input"  placeholder="Ej:Martinez">
                                        </div>
                                    </div>  
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Tipo De Identificación</label>
                                            <select id="IdentificacionFunTipo" class="form-control border-input">
                                                <option>Seleciona...</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Numero De Identificación</label>
                                            <input id="IdentificacionFun"  type="number" class="form-control border-input" placeholder="Ej:11195673412" value="Faker">
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="title">Datos Sena</h4>
                                        <div class="form-group">
                                            <label>Numero Funcionario</label>
                                            <input id="NFuncionarioFun"  type="number" class="form-control border-input" placeholder="Ej:745085">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Correo Electronico</label>
                                            <input id="CorreoFun" type="email" class="form-control border-input" placeholder="Ej:ejemplo@ejemplo.com">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Ip Sena</label>
                                            <input id="IdSenaFun" type="number" class="form-control border-input" placeholder="Ej:54587093">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Cargo</label>
                                            <input id="CaargoFun" type="text" class="form-control border-input" placeholder="Ej:Instructor">
                                        </div>
                                    </div>
                                </div>

                        </div>
                        <div class="text-center">
                            <button id="Btncontrasena"  type="button" class="btn btn-info btn-fill btn-wd">Contraseña</button>
                            <button id="BtnModificar" type="button" class="btn btn-info btn-fill btn-wd">Modificar perfil</button>
                        </div>
                        <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap-notify.js"></script> 
<script src="js/bootstrap-modal.js"></script> 
<script type="text/javascript" src="js/jquery.cecily.js"></script>
<script type="text/javascript" src="perfil/js/perfilUsuario.js"></script>
</html>

