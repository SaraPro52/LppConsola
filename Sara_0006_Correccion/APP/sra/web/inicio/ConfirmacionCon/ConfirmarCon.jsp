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
        <link href="css/styleConContrasea.css" rel="stylesheet" type="text/css"/>
        <title>Sara Pro</title>
    </head>
    <body>
        <section>
            <div id="header">
                <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom ">
                    <div class="container">
                        <div class="navbar-header page-scroll">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                            </button>
                            <img src="imagenes/sara4.png">
                        </div>
                    </div>
                </nav>
            </div>

            <div class="col-lg-8 col-lg-offset-3">
                <label><h3>Crear una nueva contraseña.</h3></label>
                <div class="wrapper ">
                    <div class="col-md-12 ">
                        <div class="password-container">
                            <div class="col-md-7">

                                <span class="error">La contraseña debe tener 8 caracteres</span>
                                <label for="cont" class="col-md-12"> Ingrese la contraseña:</label>
                                <input class="strong-password form-control" type="password" id="cont"/>
                            </div>
                            <div class="col-md-7">
                                <label for="cont1" class="col-md-12">Confirme la contraseña:</label>
                                <input class="strong-password form-control" type="password"  id="cont1"/>
                            </div>

                            <div class="strength-indicator">
                                <div class="meter">
                                </div>
                                <div class="taLetra">
                                    Las contraseñas seguras contienen 8-16 caracteres, no incluyen palabras o nombres comunes y combinan letras mayúsculas,
                                    minúsculas, números y símbolos.    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-md-offset-1">
                        <button id="btnContra" class="btn btn-success">Guardar contraseña</button>
                    </div>
                </div>  
            </div>
            <div class="espacioG"></div>
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

        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" src="js/pschecker.js"></script>
    <script type="text/javascript" src="inicio/ConfirmacionCon/js/ConfirmarCon.js"></script>
    <script>
        var fun = '<%= session.getAttribute("fun")%>';
        confirmarCon(fun);
    </script>
</html>
