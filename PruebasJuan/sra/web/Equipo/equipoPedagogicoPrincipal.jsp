<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Sara-Equipo pedagogico</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet"/>
        <link href="assets/css/demo.css" rel="stylesheet" />
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/themify-icons.css" rel="stylesheet">
        <link href="assets/css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="sidebar" data-background-color="white" data-active-color="danger">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a class="simple-text">
                        <img src="assets/img/logoEquipo.png" alt="" />
                    </a>
                </div>
                <ul class="nav menu" id="menus">
                    <li class="active"   value="2"><a><i class="ti-home"></i><label style='cursor:pointer;' id="text2">Equipo pedagogico</label></a></li>
                    <li class="activado" value="0"><a><i class="ti-user"></i><p><label style='cursor:pointer;' id="text0">Perfil de usuario</label></p></a></li>
                    <li class="activado" value="1"><a><i class="icono izquierda  fa fa-book" aria-hidden="true"></i><label style='cursor:pointer;' id="text1">Crear lista de chequeo</label </a></li>
                    <li class="activado" value="3"><a><i class="icono izquierda  fa fa-edit" aria-hidden="true"></i><label style='cursor:pointer;' id="text3">Editar Lista de chequeo</label></a></li>
                    <li class="activado" value="2"><a><i class="icono izquierda  fa fa-eye" aria-hidden="true"></i><label  style='cursor:pointer;' id="text2">Consultar objetos</label></a></li>
                    <li class="activado" value="5"><a><i class="icono izquierda  fa fa-upload" aria-hidden="true"></i><label style='cursor:pointer;' id="text2">Cerrar Sesion</label></a></li>
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
                        <h3><label style="color:#E84E1B;" id="CasoNombre"></label></h3>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification"><label id="ccNoti">0</label></p>
                                    <p>Productos virtuales</p>
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
    var idTipoItem = 1;

    if (idUser == null || idRol == null || nomUser == null || idCentro == null) {
        location.replace('index.jsp');
    }
    var tem = '[{nomUser:' + nomUser + ',idUser:' + idUser + ',idRol:' + idRol + ',idCentro:' + idCentro + '}]';
    carga(tem, idRol);
    $.notify({
        icon: 'ti-gift',
        message: "Bienvenido a <b>Sara Pro</b> - Lider de equipo pedagogico " + nomUser + "."

    }, {
        type: 'success',
        timer: 4000
    });
</script>
</html>