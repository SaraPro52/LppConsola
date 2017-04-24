<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/candy.css">
        <link rel="shotrcut icon" href="img/flavicon.ico">
        <title>Sara Pro</title>
    </head>
    <body id="total">
        <div id="estru">
        </div>
        <div id="cuerpo">

            <div class="headerIndex container-fluid img-responsive col-md-12">
                <div class="row degradadoHeader">
                    <div class=" logo col-md-3">
                        <img src="img/saraazul.png" alt="">
                    </div>
                    <div class="boton">
                        <!-- Trigger the modal with a button -->
                        <button type="button" class="btn btn-success btn-lg botonVerde" id="btnModales">Inicio</button>
                    </div>
                    <!-- Modal -->
                    <div id="myModal" class="modal fade"  role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content formularioLogin">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title" style="text-align:center; font-size:50px;">Inicio de sesión</h4>
                                </div>
                                <div class="modal-body">
                                    <form name="FormEntrar">
                                        <div class="formCamp input-group input-group-lg">
                                            <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="user" placeholder="Usuario" id="user" aria-describedby="sizing-addon1" required>
                                        </div>
                                        <br>
                                        <div class=" input-group input-group-lg">
                                            <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                            <input type="password" name="pwd" id="pwd" class="form-control" placeholder="******" aria-describedby="sizing-addon1" required>
                                        </div>
                                        <br>
                                        <div id="contentss">   </div>
                                        <br>
                                        <div class="col-md-12">
                                            <!--a id="olvidoPa" class="col-md-12">¿Olvido su cuenta?</a--> 
                                        </div>
                                        <br>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button class=" btn btn-lg btn-primary btn-block btn-signin" id="btnLogin" type="button">Entrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="txtheader">
                    <p>Crea y comparte tus conocimientos</p>
                    <p>Con toda la comunidad SENA en Colombia</p>
                </div>
            </div>
            <div class="queEsBenefic" >
                <div>
                    <p class="code">¿Por qué SARApro?</p>
                    <p class="lineaHorizontal"></p>
                    <p class="codeSmile">SARA pro es una aplicación que te permite compartir tus conocimientos con la comunidad del SENA y así
                        Mejorar la calidad de la educación en nuestro país.</p>
                </div>
                <div class="columna1 col-md-6">
                    <section  class="flip3d col-md-12 ">
                        <div class="back color1 ">
                            <p class="codeWhite textBack">SARApro it allows you virtual products</p>
                        </div>
                        <div class="front color11 ">
                            <p class="codeWhite"><i class="fa fa-cloud-upload fawhySARA"></i></p>
                            <p class="codeWhite">Subir productos virtuales</p>
                        </div>
                    </section>
                    <section  class="flip3d col-md-12">
                        <div class="back  color2 "></div>
                        <div class="front color22 ">
                            <p class="codeWhite"><i class="fa fa-search fawhySARA"></i></p>
                            <p class="codeWhite">Consultar productos virtuales</p>
                        </div>
                    </section>
                    <section  class="flip3d col-md-12">
                        <div class="back  color3 ">
                            <p class="codeWhite"> </p>
                        </div>
                        <div class="front color33 ">
                            <p class="codeWhite"><i class="fa fa-cloud-download fawhySARA"></i></p>
                            <p class="codeWhite">Descargar productos virtuales</p>
                        </div>
                    </section>
                </div>
                <div class="columna3 col-md-6">
                    <section  class="flip3d  col-md-12">
                        <div class="back color4"></div>
                        <div class="front  color44 ">
                            <p class="codeWhite"><i class="fa fa-star  fawhySARA"></i></p>
                            <p class="codeWhite">Calificar productos virtuales</p>
                        </div>
                    </section>
                    <section  class="flip3d col-md-12">
                        <div class="back color5"></div>
                        <div class="front color55 ">
                            <p class="codeWhite"><i class="fa fa-share-alt fawhySARA"></i></p>
                            <p class="codeWhite">Compartir con la comunidad SENA</p>
                        </div>
                    </section>
                    <section  class="flip3d col-md-12">
                        <div class="back  color7 "></div>
                        <div class="front color77 ">
                            <p class="codeWhite"><i class="fa fa-spinner fawhySARA"></i></p>
                            <p class="codeWhite">Contenidos actualizados</p>
                        </div>
                    </section>
                </div>
            </div>
            <div class="developedTeam col-md-12">
                <p class="code">Equipo de desarrollo</p>
                <p class="lineaHorizontal"></p>
                <p class="codeSmile"> El equipo de desarrollo de SARApro cuenta con 4 personas que son aprendices de ADSI y este es nuestro proyecto productivo</p>
                <div class="developer1 col-md-3">
                    <img class="img-responsive imgCentrar" src="img/miguel.png" alt="">
                    <table>
                        <tbody>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-user fa-2x"></i></td>
                                <td><p class="txtTeamName">Miguel Angel Castiblanco</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-universal-access fa-2x"></i></td>
                                <td><p>Lider de base de datos y codificador</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-envelope fa-2x"></i></td>
                                <td><p>macc@misena..edu.co</p></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="developer2 col-md-3">
                    <img class="img-responsive imgCentrar" src="img/juan.png" alt="">

                    <table>
                        <tbody>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-user fa-2x"></i></td>
                                <td><p class="txtTeamName">Juan Andres Lopez</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-universal-access fa-2x"></i></td>
                                <td><p>Lider del grupo y codificador</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-envelope fa-2x"></i></td>
                                <td><p>jalopez@misena.edu.co</p></td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="developer3  col-md-3">
                    <img class="img-responsive imgCentrar" src="img/leo.png" alt="">
                    <table>
                        <tbody>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-user fa-2x"></i></td>
                                <td><p class="txtTeamName">Ever Leonardo Franco</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-universal-access fa-2x"></i></td>
                                <td><p>Lider del diseño gráfico</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-envelope fa-2x"></i></td>
                                <td><p>elfranco6@misena.edu.co</p></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="developer4  col-md-3">
                    <img  class="img-responsive imgCentrar" src="img/patas.png" alt="">
                    <table>
                        <tbody>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-user fa-2x"></i></td>
                                <td><p class="txtTeamName">Anderson cabrera G.</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-universal-access fa-2x"></i></td>
                                <td><p>Lider de la documentacion</p></td>
                            </tr>
                            <tr>
                                <td><i class=" txtTeamName fa fa-fw fa-envelope fa-2x"></i></td>
                                <td><p>andecabre@misena.edu.co</p></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-12 footerPrincipal" id="footerPrincip">
            <footer  class="text-center">
                <div class="container">
                    <div class="row">
                        <div class="footer-col col-md-4">
                            <img src="img/SENA1.png">
                        </div>
                        <div class="footer-col col-md-4">
                            <h3>Síguenos en</h3>
                            <ul class="list-inline">
                                <li>
                                    <a href="https://plus.google.com/u/0/101782866518065902776" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                                </li>
                                <li>
                                    <a href="https://github.com/SaraPro52/LppConsola" class="btn-social btn-outline"><i class="fa fa-fw fa-github"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer-col col-md-4">

                            <img style="margin-top:5%;" src="img/saraBlanco.png">
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/sesion.js"></script>
    </body>
</html>
