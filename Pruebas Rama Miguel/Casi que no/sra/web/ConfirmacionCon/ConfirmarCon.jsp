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
            <div class="col-lg-8 col-lg-offset-2">
                <br/>
                <h2 class="textTitulo">crear contraseña de cuenta</h2>
                <form>
                    <div class="col-md-8">   
                        <label for="cont1" class="text">Nueva contraseña</label>
                        <input type="password" id="cont1" name="cont1" class="form-control input" placeholder="Ingrese una nueva contraseña">
                    </div>
                    <div class="col-md-8">  
                        <label for="cont2" class="text">Confirmar nueva contraseña</label>
                        <input type="password" id="cont2" name="cont2" class="form-control input" placeholder="confirme su  contraseña">
                    </div>

                    <div id="success"></div>
                    <div class="row">
                        <div class="form-group col-xs-12">
                            <button type="button" id="btnContra" class="btn btn-success btn-lg">Cambiar contraseña</button>                        </div>
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
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="/js/ConfirmarCon.js"></script>
    <script>
         var fun = '<%= session.getAttribute("fun")%>';
        confirmarCon(fun);
    </script>
</html>
