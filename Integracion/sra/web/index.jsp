<%@page session = "true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <link href="css/saraestilo.css" rel="stylesheet" type="text/css"/>
        <title>Sara Pro</title>
    </head>
    <body>
        <div id="header">
            <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom ">
                <div class="container">
                    <div class="navbar-header page-scroll">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                        </button>
                        <img src="imagenes/sara4.png">
                    </div>
                    <div class="collapse navbar-collapse ubicacionLogin" id="bs-example-navbar-collapse-1">
                        <form action="sesion_controller" method="POST">
                            <div class="form-group col-md-3">
                                <label for="user">Usuario</label>
                                <input type="text" class="form-control" placeholder="Usuario" name="user" id="user">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="pwd">Contraseña</label>
                                <input type="password" class="form-control" placeholder="Contraseña" name="pwd" id="pwd">
                            </div>
                            <button type="submit" class="btn btn-default ubicacionLoginBoton" id="btnLogin">Iniciar sesión</button>
                        </form>

                        <!--form class="col-md-12" action="Equipo_Controller" method="post" class="form-control"> 
                            <select name="Opcion" value="2" >
                                <option value="2">seleciona</option>
                                <option value="2">Imagenes12</option>
                            </select>        
                            <input type="submit" name="btnenviar" value="Aceptar">
                        </form-->    

                    </div>
                </div>
            </nav>
        </div>
        <div id="carousel">
            <div id="carousel-example-generic" class="carousel slide im" data-ride="carousel">
                <!-- Indicadores -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                </ol>
                <!-- Imagenes Slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active ">
                        <img src="imagenes/1.png" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="imagenes/2.png" alt="...">
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>
                <!-- Controles  -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div id="queessara" class=" col-md-12 queEstilo">
            <img src="imagenes/preguntaS.png" class="queimagen">
            <h2 class="titleSARA">¿Que es SARApro?</h2>
            <div class="lineaHorizontal"></div>

            <div id="cajon1" class="col-md-6 seccionQueEsSARA" >
                <p>
                    SARApro es un aplicativo que te permitira publicar tus objetos de
                    aprendizaje y compartirlos con la comunidad de instructores SENA
                    a nivel nacional. A demas podras calificar y descargar ojjetos de
                    aprendizaje hechos por instructores SENA a nivel nacional.
                </p>
            </div>
            <div id="cajon2" class="col-md-5 seccionVideo">
                <div style="margin-left:10%; margin-bottom:3%;">
                    <video src="video/SARApro[1].webm" width="400" height="260" controls>
                    </video>
                </div>
            </div>
        </div>

        <div  class="col-md-12 quienesEstilo">
            <img src="imagenes/quienes3.png" class="queimagen">
            <h2 class="titleSARA">¿Quenes somos?</h2>
            <div class="lineaHorizontal"></div>
            <div id="cajon1" class="col-md-6 seccionEquipo" >
                <h3>Equipo desarrollador</h3>
                <p>
                    Somos un Grupo de aprendices SENA del programa de formacion analisis y
                    desarrollo de sistemas de informacion del centro de mercados,logistica
                    y las tecnologias de la informacion de la regional distrito capital
                </p>

                <table class="table">
                    <tbody>
                        <tr>
                            <td>
                                <div>
                                    <img src="imagenes/miguel.png" alt="" />
                                </div>
                            </td>
                            <td>
                                <p style="margin-left:10%;">
                                <p>Miguel Ángel Castiblanco</p>
                                <p>Líder bases de datos </p>
                                <p>macc@misena.edu.co</p>
                            </td>
                            <td>
                                <div>
                                    <img src="imagenes/juan.png" alt="" />
                                </div>
                            </td>
                            <td>
                                <p>Juan Andres Lopez</p>
                                <p>Líder proyecto SARApro</p>
                                <p>jalopez@misena.edu.co</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <img src="imagenes/patas.png" alt="" />
                                </div>
                            </td>
                            <td>
                                <p>anderson cabrera gonzález</p>
                                <p>Líder de documentación </p>
                                <p>adecabre@misena.edu.co </p>
                            </td>
                            <td>
                                <div>
                                    <img src="imagenes/leo.png" alt="" />
                                </div>
                            </td>
                            <td>
                                <p>Leonardo Franco</p>
                                <p>Lider de diseño grafico</p>
                                <p>elfranco6@misena.edu.co</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="cajon2" class="col-md-5 seccionHistoria" >

                <h3>Un poco de historia</h3>
                <p>
                    Este aplicativo tuvo sus inicios en el año 2016 como proyecto productivo de grado
                    del programa que actualmente el equipo de desarrollo de SARApro cursa en el
                    servicio nacional de aprendizaje SENA.
                </p>
                <p>
                    Este aplicativo nace a parti de la necesidad del sena de organizar y controlar
                    los objetos de aprendizaje, los cuales, dan a sus aprendices para su proceso
                    academico
                </p>

            </div>
        </div>
        <!--FIN EQUIPO-->

        <div class="col-lg-8 col-lg-offset-2">
            <h2 class="textContacto">Contáctenos</h2>
            <div class="lineaHorizontalContacto"></div>

            <form name="sentMessage" id="contactForm" novalidate>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Nombre</label>
                        <input type="text" class="form-control" placeholder="Nombre" id="name" required data-validation-required-message="Ingresa tu nombre.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Email</label>
                        <input type="email" class="form-control" placeholder="Email" id="email" required data-validation-required-message="Ingresa tu email.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Numero telefonico</label>
                        <input type="tel" class="form-control" placeholder="Numero telefonico" id="phone" required data-validation-required-message="Ingresa tu numero de telefonico.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Mensaje</label>
                        <textarea rows="5" class="form-control" placeholder="dejanos tu Mensaje" id="message" required data-validation-required-message="Ingresa un mensaje."></textarea>
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <br>
                <div id="success"></div>
                <div class="row">
                    <div class="form-group col-xs-12">
                        <button type="submit" class="btn btn-success btn-lg">Enviar</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-12 footerPrincipal">
            <footer  class="text-center">
                <div class="container">
                    <div class="row">
                        <div class="footer-col col-md-4">
                            <img src="imagenes/SENA1.png">
                        </div>
                        <div class="footer-col col-md-4">
                            <h3>Siguenos en:</h3>
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

                            <img src="imagenes/SARA.png">
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <div class="footer-below  col-md-12 footerSecundario">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <p>Ubicación</p>
                        Contacto:5674342-6563267
                        <br>Bogotá-Colombia
                        Copyright &copy; SARApro 2016
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/sesion.js"></script>
        <script type="text/javascript" src="_JS/Login.js"></script>
    </body>
</html>
