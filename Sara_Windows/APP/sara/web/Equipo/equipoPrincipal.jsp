<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es" id="estru">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title id="tituloPLantilla"></title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet"/>
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/themify-icons.css" rel="stylesheet">
        <link href="assets/css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/paper-dashboardEquipo.css"/>
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-background-color="white" data-active-color="danger">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a class="simple-text">
                            <img src="assets/img/logoEquipo.png" alt="" />
                        </a>
                    </div>
                    <ul class="nav menu" id="menus">
                        <li class="active"   value="2"><a><i class="ti-home"></i><label style='cursor:pointer;' id="text2"></label></a></li>
                        <li class="activado" value="0"><a><i class="ti-user"></i><p><label style='cursor:pointer;' id="text0">Perfil de Usuario</label></p></a></li>
                        <li class="activado" value="1"><a><i class="icono izquierda  fa fa-book" aria-hidden="true"></i><label style='cursor:pointer;' id="text1">Crear Lista de Chequeo</label </a></li>
                        <li class="activado" value="3"><a><i class="icono izquierda  fa fa-edit" aria-hidden="true"></i><label style='cursor:pointer;' id="text3">Editar Lista de Chequeo</label></a></li>
                        <li class="activado" value="2"><a><i class="icono izquierda  fa fa-eye" aria-hidden="true"></i><label  style='cursor:pointer;' id="text2">Consultar P.V</label></a></li>
                        <li class="activado" value="5"><a href="principal?opcion=2"><i class="glyphicon glyphicon-off" aria-hidden="true"></i><label style='cursor:pointer;' id="text2">Cerrar Sesión</label></a></li>
                    </ul>
                </div>
                <p id="tis" style="display: none;"></p>
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
                            <h3 style="color:#E84E1B;"><label id="CasoNombre"></label></h3>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="ti-bell"></i>
                                        <p class="notification"><label id="ccNoti">0</label></p>
                                        <p>Productos Virtuales</p>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu" id="tablaConsultarOaP">
                                        <li><a><label class="Notify">No hay productos a evaluar</label></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div id="cuerpo" >


                </div>
                <footer class="text-center footerDown" style="margin-top: 3%;">
                    <div class="container">
                        <div class="row">
                            <div class="footer col-md-4 img-responsive" style="margin-top:-10px;">
                                <img src="assets/img/saranegro.png">
                            </div>
                            <div class="footer-col col-md-4">
                                <h3 style="color:black; font-size:20px; margin-top:12px;">Siguenos en:</h3>
                                <ol class="list-inline" style="margin-top:-5px;">
                                    <li>
                                        <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-github"></i></a>
                                    </li>
                                </ol>
                            </div>
                            <div class="footer-col col-md-4">

                                <img src="assets/img/senanegro.png">
                            </div>
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
    <script type="text/javascript" src="js/jquery.cecily.js"></script>
    <script type="text/javascript" src="Equipo/js/Principalequipo.js"></script>
    <script>
        var nomUser = '<%= session.getAttribute("nomUser")%>';
        var idUser = '<%= session.getAttribute("idUser")%>';
        var idRol = '<%= session.getAttribute("idRol")%>';
        var idCentro = '<%= session.getAttribute("idCentro")%>';
        var idTipoItem = 0;
        if (idUser == null || idRol == null || nomUser == null || idCentro == null) {
            location.replace('index.jsp');
        } else {
            var tem = '[{nomUser:' + nomUser + ',idUser:' + idUser + ',idRol:' + idRol + ',idCentro:' + idCentro + '}]';
            carga(tem, idRol);
            var men = "";
            if (idRol == 2) {
                $("#text2").text("Equipo Técnico");
                idTipoItem = 0;
                men = "Bienvenido a <b>Sara Pro</b> - Lider de equipo tecnico " + nomUser + ".";

            } else if (idRol == 3) {
                $("#text2").text("Equipo Pedagogico");
                men = "Bienvenido a <b>Sara Pro</b> - Lider de equipo pedagogico " + nomUser + ".";
                idTipoItem = 1;
            }
            $.notify({
                message: men
            }, {
                type: 'success',
                timer: 4000
            });
        }
    </script>
</html>
