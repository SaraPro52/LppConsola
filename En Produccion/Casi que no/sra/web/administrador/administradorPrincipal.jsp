<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Sara Administrador</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet"/>
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/themify-icons.css" rel="stylesheet">
        <link href="css/modal.css" rel="stylesheet"/>
        <link href="assets/css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Cambiar Contraseña</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-8">
                            <label>Contraseña actual</label>
                            <input id="ConActual" type="password" class="form-control border-input" placeholder="" >
                        </div> 
                        <div class="col-md-6">
                            <label>Nueva contraseña</label>
                            <input id="ConNueva" type="password" class="form-control border-input" placeholder="" >
                        </div>
                        <div class="col-md-6">
                            <label for="exampleInputEmail1">Confirmar nueva contraseña</label>
                            <input id="ConNuevaF"  type="password" class="form-control border-input" placeholder="">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper">
            <div class="sidebar" data-background-color="white" data-active-color="danger">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a class="simple-text">
                            <img src="assets/img/logo.png" alt="" />
                        </a>
                    </div>

                    <ul class="nav menu" id="menus">
                        <li class="active" value="1" ><a><i class="ti-home"></i><p><label style='cursor:pointer;' id="text1">Administrador</label></p></a></li>
                        <li class="btntt" value="0"><a><i class="ti-marker-alt"></i><p><label style='cursor:pointer;' id="text0">Registrar usuario</label></p></a></li>
                        <li class="btntt" value="1"><a><i class="ti-close"></i><p><label style='cursor:pointer;' id="text1">Deshabilitar usuario</label></p></a></li>
                        <li class="btntt" value="2"><a><i class="ti-file"></i><p><label style='cursor:pointer;' id="text2">Formato</label></p></a></li>
                        <li class="btntt" value="3"><a><i class="ti-ruler-alt-2"></i><p><label style='cursor:pointer;' id="text3">Área</label></p></a></li>
                        <li class="btntt" value="4"><a><i class="ti-layout-width-default"></i><p><label style='cursor:pointer;' id="text4">Ciudad</label></p></a></li>
                        <li class="btntt" value="5"><a><i class="ti-blackboard"></i><p><label style='cursor:pointer;' id="text5">Programa</label></p></a></li>
                    </ul>
                </div>
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar bar1"></span>
                                <span class="icon-bar bar2"></span>
                                <span class="icon-bar bar3"></span>
                            </button>
                            <h3><label style="color:#218276;" id="CasoNombre">Notificaciones producto virtual</label></h3>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="ti-bell"></i>
                                        <p class="notification"><label id="ccNoti">0</label></p>
                                        <p>Notificaciones</p>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu" id="tablaAdmiP">
                                        <li><a><label class="Notify">No hay funcionarios registrados</label></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div id="cuerpo" ></div>
                <footer class="footer footerPrincipal">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>

                                <li>
                                    <img src="assets/img/sena.png">


                                    <img src="assets/img/saraBlanco.png">
                                </li>


                            </ul>
                        </nav>
                        <div class="copyright pull-right">

                            <li>

                                <h3>Síguenos en:</h3>
                                <ul class="list-inline">
                                    <li>
                                        <a href="https://plus.google.com/u/0/101782866518065902776" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://github.com/SaraPro52/LppConsola" class="btn-social btn-outline"><i class="fa fa-fw fa-github"></i></a>
                                    </li>
                                </ul>

                            </li>

                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>

    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-checkbox-radio.js"></script>
    <script src="assets/js/chartist.min.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
    <script src="assets/js/paper-dashboard.js"></script>
    <script src="assets/js/demo.js"></script>
    <script type="text/javascript" src="administrador/js/admi.js"></script>
    <script>
        var ami = '<%= session.getAttribute("ami")%>';

        if (ami != null) {
            $("#menus").append("<li><a href='index.jsp'><i class='ti-shift-right'></i>Cerrar Sesion</a></li>");
        } else {
            location.replace('./index.jsp');
        }

        $.notify({
            icon: 'ti-gift',
            message: "Bienvenido a <b>Sara Pro</b> - Administrador " + ami + "."

        }, {
            type: 'success',
            timer: 4000
        });
    </script>
</html>
