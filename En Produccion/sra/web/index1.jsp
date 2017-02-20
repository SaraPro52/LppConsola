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
    <body id="total" style="background-color: #218276">
        <div id="estru">

        </div>
        <div id="cuerpo"> 
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

                            <div class="form-group col-md-3">
                                <label for="user">Usuario</label>
                                <input type="text" class="form-control" placeholder="Usuario" id="user" >
                            </div>
                            <div class="form-group col-md-3">
                                <label for="pwd">Contraseña</label>
                                <input type="password" class="form-control" placeholder="Contraseña" name="pwd" id="pwd" maxlength="16">
                                  <div class="col-md-12"><p style="color:#FF0000";>Usuario o contraseña erronea intente nuevamente</p></div>    
                                <a id="olvidoPa" class="col-md-12">¿Olvido su cuenta?</a> 
                            </div>
                            <button type="button" class="btn btn-default ubicacionLoginBoton" id="btnLogin">Iniciar sesión</button>

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

                <div id="cajon1" class="col-md-6 col-md-offset-3 seccionQueEsSARA" >
                    <h5>
                        SARApro es un aplicativo que te permitira publicar tus objetos de
                        aprendizaje y compartirlos con la comunidad de instructores SENA
                        a nivel nacional. A demas podras calificar y descargar objetos de
                        virtuales hechos por instructores SENA a nivel nacional.
                    </h5>
                </div>

            </div>

            <div  class="col-md-12 quienesEstilo">
                <img src="imagenes/quienes3.png" class="queimagen">
                <h2 class="titleSARA">¿Quienes somos?</h2>
                <div class="lineaHorizontal"></div>

                <div id="cajon2" class="col-md-6 col-md-offset-3   seccionHistoria" >

                    <h3>Un poco de historia</h3>
                    <h5>
                        Este aplicativo tuvo sus inicios en el año 2016 como proyecto productivo de grado
                        del programa que actualmente el equipo de desarrollo de SARApro cursa en el
                        servicio nacional de aprendizaje SENA.
                    </h5>
                    <p>
                        Este aplicativo nace a parti de la necesidad del sena de organizar y controlar
                        los objetos de aprendizaje, los cuales, dan a sus aprendices para su proceso
                        academico
                    </p>    

                </div>
            </div>
            <!--FIN EQUIPO-->


        </div>
        <div class="col-md-12 footerPrincipal" id="footerPrin">
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

        <div class="footer-below  col-md-12 footerSecundario" id="footerPrin1">
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
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/sesion.js"></script>
</body>
</html>
