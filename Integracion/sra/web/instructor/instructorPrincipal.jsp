<%@page session = "true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Sara-Instructor</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet"/>
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/themify-icons.css" rel="stylesheet">
        <link href="assets/css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-background-color="white" data-active-color="danger">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="http://www.creative-tim.com" class="simple-text">
                            <img src="assets/img/logo.png" alt="" />
                        </a>
                    </div>

                    <ul class="nav menu" id="menus">
                        <li class="active"><a><i class="ti-home"></i><p>Instrutor</p></a></li>
                        <li class="btntt" value="4"><a><i class="ti-user"></i><p><label id="text4">Perfil de usuario</label></p></a></li>
                        <li class="btntt" value="1"><a><i class="ti-cloud-up"></i><label id="text1">Subir P.V.</label></a></li>
                        <li class="btntt" value="0"><a><i class="ti-eye"></i><label id="text0">Consultar P.V.</label></a></li>
                        <li class="btntt" value="3"><a><i class="ti-bell"></i><label id="text3">Notificaciones P.V</label></a></li>
                        <li class="btntt" value="2"><a><i class="ti-pencil-alt"></i><label id="text2">Correguir P.V</label></a></li>
                        <li class="btntt" value="6"><a><i class="ti-cloud-up"></i><label id="text6">Actualizar P.V</label></a></li>
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
                            <h3 style="color:#218276;">  <label id="CasoNombre">Notificaciones producto virtual</label></h3>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="ti-bell"></i>
                                        <p class="notification"><label id="ccNoti"></label></p>
                                        <p>Notificaciones</p>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu" id="tablaNotificacionP">
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div id="cuerpo" >


                </div>
                  <footer>
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
    <script src="assets/js/bootstrap-notify.js"></script>
    <script src="assets/js/paper-dashboard.js"></script>
    <script src="assets/js/demo.js"></script>
    <script src="instructor/js/InstrutorPrincipal.js"></script>
    <script type="text/javascript">
        var nomUser = '<%= session.getAttribute("nomUser")%>';
        var idUser = '<%= session.getAttribute("idUser")%>';
        var idRol = '<%= session.getAttribute("idRol")%>';
        var idCentro = '<%= session.getAttribute("idCentro")%>';
        if (idUser != null && idRol != null && nomUser != null && idCentro != null) {
            $("#menus").append("<li><a href='index.jsp?cerrar=true'><i class='ti-shift-right'></i>Cerrar Sesion</a></li>");
        } else {
            location.replace('index.jsp');
        }
    </script>
</html>