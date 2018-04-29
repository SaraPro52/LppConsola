<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sara Pro</title>
        <link rel="shotrcut icon" href="img/flavicon.ico">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                    <link href="https://fonts.googleapis.com/css?family=Grand+Hotel" rel="stylesheet">
                        <meta charset="utf-8">
                            <link rel="stylesheet" type="text/css" href="css/jquery.fullPage.css" />
                            <link rel="stylesheet" type="text/css" href="css/examples.css" />
                            </head>

                            <body onload="sinVueltaAtras();">
                                <div class="modal fade" id="myModalLogin" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Inicio de sesión</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form method="POST" action="principal">
                                                    <div class="form-group">
                                                        <label for="email">Documento de identidad:</label>
                                                        <input type="text" class="form-control" id="email" name="user">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pwd">Contraseña:</label>
                                                        <input type="password" class="form-control" id="pwd" name="pwd">
                                                    </div>
                                                    <input name="op" value="1" type="hidden">
                                                        <button type="submit" class="btn btn-default">Ingresar</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <ol id="menu">
                                    <li data-menuanchor="3rdPage"><a href="#3rdPage">Equipo Desarrollador</a></li>
                                    <li data-menuanchor="secondPage"><a href="#secondPage">A cerca de SARA PRO</a></li>
                                    <li data-menuanchor="firstPage" class="active"><a href="#firstPage">Inicio</a></li>
                                </ol>

                                <div id="fullpage">
                                    <div class="section " id="section0">
                                        <!--section1-->
                                        <div class="col-md-12">
                                            <div class="col-md-12 col-md-offset-2" style="margin-top:-5%;">
                                                <img src="img/saraGigante.png" class="img-responsive" alt="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="contenedor col-md-12 col-md-offset-5" style="margin-bottom:9%;">
                                                <ul>
                                                    <li>Sube</li>
                                                    <li>Comparte</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-12 ">
                                            <p class="textSecundary" style="margin-top: -8%; margin-bottom:3%;"> Tu conocimiento con la comunidad SENA del país </p>
                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-success btnStyle" data-toggle="modal" data-target="#myModalLogin">Iniciar sesión</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="section section1 " style="background-color:#ffffff;" id="section1">
                                        <!--section2-->
                                        <div class="queEsBenefic col-md-12">
                                            <div>
                                                <p class="textPrimary roboto">¿Porque SARA PRO?</p>
                                                <p class="lineaHorizontal"></p>
                                            </div>
                                            <div class="col-md-12">
                                                <h2 class=" textSecundary roboto"> Con SARAPRO puedes:</h2>
                                                <section>
                                                    <div class=" color11 redondear ">
                                                        <p class="roboto robotoWhite "><i class="fa fa-cloud-upload fawhySARA"></i></p>
                                                        <p class="roboto robotoWhite ">Subir productos</p>
                                                        <p class="roboto robotoWhite">vituales</p>
                                                    </div>
                                                    <div class=" color22 redondear">
                                                        <p class="roboto robotoWhite"><i class="fa fa-search fawhySARA"></i></p>
                                                        <p class="roboto robotoWhite"> Consultar productos</p>
                                                        <p class="roboto robotoWhite">virtuales</p>
                                                    </div>

                                                    <div class="color33 redondear ">
                                                        <p class="roboto robotoWhite"><i class="fa fa-cloud-download fawhySARA"></i></p>
                                                        <p class="roboto robotoWhite">Descargar productos</p>
                                                        <p class="roboto robotoWhite">virtuales</p>
                                                    </div>

                                                    <div class=" color44 redondear">
                                                        <p class="roboto robotoWhite"><i class="fa fa-spinner fawhySARA"></i></p>
                                                        <p class="roboto robotoWhite">Encontrar contenido</p>
                                                        <p class="roboto robotoWhite">actualizado</p>
                                                    </div>
                                                </section>
                                            </div>

                                        </div>

                                    </div>
                                    <!--END SECTION1-->

                                    <div class="section section2" id="section2">
                                        <!--section3-->
                                        <div class="col-md-12" style="margin-top:-50px;">
                                            <div>
                                                <p class="textPrimary roboto">Equipo desarrollador</p>
                                                <p class="lineaHorizontal"></p>
                                            </div>
                                            <div class="col-md-12">
                                                <section>
                                                    <div class=" redondear degraded">
                                                        <img src="img/miguel.png" class="img-responsive img-circle imgjeje" alt="">
                                                            <div class=" txtEquipo col-md-12">
                                                                <h5>Miguel Ángel Castiblanco</h5>
                                                                <h5>Líder bases de datos.</h5>
                                                                <h6>Macastiblanco88@misena.edu.co</h6>
                                                            </div>
                                                    </div>
                                                    <div class="redondear degraded ">
                                                        <img src="img/juan.png" class="img-responsive img-circle imgjeje" alt="">
                                                            <div class=" txtEquipo col-md-12">
                                                                <h4>Juán Ándres López </h4>
                                                                <h5>Lider de proyecto</h5>
                                                                <h6>Jalopez173@misena.edu.co</h6>
                                                            </div>

                                                    </div>

                                                    <div class=" redondear degraded ">
                                                        <img src="img/leo.png" class="img-responsive img-circle imgjeje" alt="">
                                                            <div class="txtEquipo col-md-12">
                                                                <h4>Leonardo Franco Rodriguez</h4>
                                                                <h5>Líder diseño gráfico </h5>
                                                                <h6>Elfranco6@misena.edu.co</h6>
                                                            </div>
                                                    </div>

                                                    <div class="redondear degraded">
                                                        <img src="img/patas.png" class="img-responsive img-circle imgjeje" alt="">
                                                            <div class="txtEquipo col-md-12">
                                                                <h4>Anderson Cabrera Gonzalez </h4>
                                                                <h5>Líder documentación</h5>
                                                                <h6>Anercabre@misena.edu.co</h6>
                                                            </div>
                                                    </div>
                                                </section>
                                            </div>
                                        </div>
                                        <div class="col-md-12 footerPrincipal">
                                            <footer class="text-center">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="footer col-md-4 img-responsive" style="margin-top:-10px;">
                                                            <img src="img/saranegro.png">
                                                        </div>
                                                        <div class="footer-col col-md-4">
                                                            <h3 style="color:black; font-size:20px; margin-top:12px;">Siguenos en:</h3>
                                                            <ol class="list-inline" style="margin-top:-5px;">
                                                                <li>
                                                                    <a href="https://plus.google.com/u/0/101782866518065902776" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                                                                </li>
                                                                <li>
                                                                    <a href="https://github.com/SaraPro52/LppConsola" class="btn-social btn-outline"><i class="fa fa-fw fa-github"></i></a>
                                                                </li>
                                                            </ol>
                                                        </div>
                                                        <div class="footer-col col-md-4">

                                                            <img src="img/senanegro.png">
                                                        </div>
                                                    </div>
                                                </div>
                                            </footer>
                                        </div>
                                    </div>
                                </div>

                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                                <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
                                <script type="text/javascript" src="js/jquery.fullPage.js"></script>
                                <script type="text/javascript" src="js/tonny.js"></script>
                            </body>
                            <script type="text/javascript">
                                function sinVueltaAtras() {
                                  //  location.href=('http://localhost:1437/sra005/#firstPage');
                                }
                            </script>
                            </html>
