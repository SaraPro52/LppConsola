<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
        <link rel="shotrcut icon" href="recursos/flavicon.ico">
        <link href="css/candy.css" rel="stylesheet" type="text/css"/>
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
            <section id="espacioF" class="col-md-12  espacioG">
                <article id="cuerpo" class="col-md-8 col-md-offset-2">
                    <h2 class="col-md-12">Recuperar su cuenta</h2>
                    <div class="col-md-8">
                        <label class="col-md-12">Ingrese el correo eletronico de su cuenta</label>
                        <div class="col-md-12">
                            <input id="camCorreo"  type="text" class="form-control">                            
                        </div>
                        <br/>
                        <div class="col-md-12 espa">
                            <button id="BtnCorreo" class="btn btn-info"><span class="glyphicon glyphicon-envelope"></span>Enviar correo</button>    
                        </div>
                    </div>                  
                </article>
            </section>
        </section>
    </body>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" src="js/pschecker.js"></script>
    <script type="text/javascript" src="inicio/olvidoCuenta/js/olvidoCuenta.js"></script>
</html>
