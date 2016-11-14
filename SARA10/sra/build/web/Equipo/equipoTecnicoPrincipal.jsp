<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>

        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Sara Pro....</title>
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
        <div class="wrapper">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Lista de chequeo para evaluar Producto virtual</h4>
                        </div>
                        <div class="modal-body">
                            <article  id="tabla">
                                <table class="table table-striped" id="tablaListaChequeo">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre lista</th>
                                            <th>Descripcion lista</th>
                                            <th>Fecha vigencia</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sidebar" data-background-color="white" data-active-color="danger">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a class="simple-text">
                            <img src="assets/img/logo.png" alt="" />
                        </a>
                    </div>
                    <ul class="nav menu"><li class="active"><a href="inicio.html"><i class="ti-home"></i><p>Equipo tecnico</p></a></li>
                        <li class="activado" value="0"><a><i class="ti-user"></i><p>Perfil de usuario</p></a></li>
                        <li class="activado" value="1"><a><i class="icono izquierda  fa fa-book" aria-hidden="true"></i>Crear lista de chequeo</a></li>
                        <li class="activado" value="3"><a><i class="icono izquierda  fa fa-edit" aria-hidden="true"></i>Modificar Lista  de chequeo</a></li>
                        <li class="activado" value="2"><a><i class="icono izquierda  fa fa-eye" aria-hidden="true"></i>consultar objetos</a></li>
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
                            <a class="navbar-brand" href="#">Incio</a>
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
                                        <p class="notification">5</p>
                                        <p>Notifications</p>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Notification 1</a></li>
                                        <li><a href="#">Notification 2</a></li>
                                        <li><a href="#">Notification 3</a></li>
                                        <li><a href="#">Notification 4</a></li>
                                        <li><a href="#">Another notification</a></li>
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
                            <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
                        </div>
                    </div>
                </footer>

            </div>
        </div>

    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-checkbox-radio.js"></script>
    <script src="assets/js/chartist.min.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
    <script src="assets/js/paper-dashboard.js"></script>
    <script src="assets/js/demo.js"></script>
    <script type="text/javascript" src="Equipo/js/Principalequipo.js"></script>
    <script>
                                var nomUser = '<%= session.getAttribute("nomUser")%>';
                                var idUser = '<%= session.getAttribute("idUser")%>';
                                var idRol = '<%= session.getAttribute("idRol")%>';
                                var idCentro = '<%= session.getAttribute("idCentro")%>';
                                var idTipoItem = 0;

                                if (idUser != null && idRol != null && nomUser != null && idCentro != null) {
                                    $("#link").append("<a href='index.jsp?cerrar=true'><h5>Cerrar Sesion</h5></a>");
                                } else {
                                    location.replace('index.jsp');
                                }

                                $.notify({
                                    icon: 'ti-gift',
                                    message: "Bienvenido a <b>Sara Pro</b> - Lider de equipo tecnico " + nomUser + "."

                                }, {
                                    type: 'success',
                                    timer: 4000
                                });
    </script>
</html>
