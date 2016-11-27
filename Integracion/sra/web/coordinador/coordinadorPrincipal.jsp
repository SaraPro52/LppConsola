<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Sara-Coordinador</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet"/>
        <link href="assets/css/paper-dashboardCoordinador.css" rel="stylesheet"/>
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/themify-icons.css" rel="stylesheet">
    </head>
    <body>

        <div class="wrapper">
            <div class="sidebar" data-background-color="white" data-active-color="danger">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="http://www.creative-tim.com" class="simple-text">
                            <img src="assets/img/logoCoordinador.png" alt="" />
                        </a>
                    </div>

                    <ul class="nav menu" id="menus">
                        <li class="active"><a><i class="ti-home"></i><p>Coordinador</p></a></li>
                        <li class="btntt" value="4"><a><i class="ti-user"></i><p><label id="text4">Perfil de usuario</label></p></a></li>
                        <li class="btntt" value="0"><a><i class=" icono izquierda fa fa-area-chart" aria-hidden="true"></i><label id="text0">Consultar estadisticas</label></a></li>
                        <li class="btntt" value="1"><a><i class=" icono izquierda fa fa-check" aria-hidden="true"></i><label id="text1">Habilitar producto virtual</label></a></li>
                        <li class="btntt" value="2"><a><i class=" icono izquierda fa fa-credit-card-alt" aria-hidden="true"></i><label id="text2">Asignar roles</label></a></li>
                        <li class="btntt" value="3"><a><i class=" icono izquierda fa fa-edit" aria-hidden="true"></i><label id="text3">Crear categorias</label></a></li>
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
                            <a class="navbar-brand"><label id="CasoNombre"></label></a>
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
                                        <p>Productos virtuales a habilitar</p>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu" id="tablaAprobarP">
                                    </ul>
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
                            <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
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
    <script type="text/javascript" src="coordinador/js/PrincipalCoordinador.js"></script>
    <script>
                                var nomUser = '<%= session.getAttribute("nomUser")%>';
                                var idUser = '<%= session.getAttribute("idUser")%>';
                                var idRol = '<%= session.getAttribute("idRol")%>';
                                var idCentro = '<%= session.getAttribute("idCentro")%>';
                                if (idUser != null && idRol != null && nomUser != null && idCentro != null) {
                                    $("#menus").append("<li><a href='index.jsp?cerrar=true'><i class='icono izquierda  fa fa-upload' aria-hidden='true'></i>Cerrar Sesion</a></li>");
                                } else {
                                    location.replace('index.jsp');
                                }
                                $.notify({
                                    icon: 'ti-gift',
                                    message: "Bienvenido a <b>Sara Pro</b> - Coordinador " + nomUser + "."

                                }, {
                                    type: 'success',
                                    timer: 4000
                                });
    </script>

</html>
