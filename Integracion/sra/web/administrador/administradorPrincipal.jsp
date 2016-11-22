<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Sara-Administrador</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet"/>
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/themify-icons.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">¡Para tener en cuenta!</h4>
                    </div>
                    <div class="modal-body">
                        <section id="sectionRecordatorio" style="display">
                            <article id="recordatorio">
                                <label id="textDanger"> Cambia tu contraseña frecunetemente, ayudanos a proteger mas tu seguridad</label>     
                                <img src="">
                            </article>
                            
                            <article id="formCambiarContra">
                                <input values="1" style="display:none;" >
                                <label >Contraseña actual </label>
                                <input id="conAct" type="password">
                                
                                <label>Nueva cotraseña </label>
                                <input id="conNueva" type="password">
                                
                                <label>Confirmar contraseña </label>
                                <input id="ConfirmConNueva" type="password">                                
                            </article>
                        </section>
                        
                    </div>
                    
                    <div class="modal-footer">
                        <button id="btnlater" type="button" class="btn btn-secondary" data-dismiss="modal">Ahora mas tarde</button>
                        <button  type="button" class="btn btn-primary modificar">Cambiar contraseña</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div
        
        <div class="wrapper">
            <div class="sidebar" data-background-color="white" data-active-color="danger">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="#" class="simple-text">
                            <img src="assets/img/logo.png" alt="" />
                        </a>
                    </div>
                    <ul class="nav menu" id="menus">
                        <li class="active"><a><i class="ti-home"></i><p>Administrador</p></a></li>
                        <li class="btntt" value="6"><a><i class="ti-user"></i><p><label id="text6">Perfil de usuario</label></p></a></li>
                        <li class="btntt" value="0"><a><i class="ti-marker-alt"></i><p><label id="text0">Registrar usuario</label></p></a></li>
                        <li class="btntt" value="1"><a><i class="ti-close"></i><p><label id="text1">Deshabilitar usuario</label></p></a></li>
                        <li class="btntt" value="2"><a><i class="ti-file"></i><p><label id="text2">Formato</label></p></a></li>
                        <li class="btntt" value="3"><a><i class="ti-ruler-alt-2"></i><p><label id="text3">Área</label></p></a></li>
                        <li class="btntt" value="4"><a><i class="ti-layout-width-default"></i><p><label id="text4">Ciudad</label></p></a></li>
                        <li class="btntt" value="5"><a><i class="ti-blackboard"></i><p><label id="text5">Programa</label></p></a></li>
                    </ul>
                    <input id="controller" value="Administrador_Controller" type="hidden">
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
                            <a class="navbar-brand"><label id="CasoNombre">Dehabilitar Funcionarios</label></a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="ti-panel"></i>
                                        <p>Stats</p>
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="ti-bell"></i>
                                        <p class="notification"><label id="ccNoti"></label></p>
                                        <p>Funcionarios</p>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu" id="tablaAdmiP">                     
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="ti-settings"></i>
                                        <p>Settings</p>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                </nav>


                <div id="cuerpo" >

                </div>

                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>

                                <li>
                                    <a href="http://www.creative-tim.com">
                                        Creative Tim
                                    </a>
                                </li>
                                <li>
                                    <a href="http://blog.creative-tim.com">
                                        Blog
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.creative-tim.com/license">
                                        Licenses
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright pull-right">
                            &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
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
                                    $("#menus").append("<li><a href='index.jsp?cerrar=true'><i class='icono izquierda  fa fa-upload' aria-hidden='true'></i>Cerrar Sesion</a></li>");
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

