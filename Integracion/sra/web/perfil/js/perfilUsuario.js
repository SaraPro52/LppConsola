$(document).on('ready', function () {
    var objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "perfil", tabla: "17", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
    var selector = $("#formulario");
    var ob = new $.Luna(objet.nombre, selector);
    ob.Vivo("PerfilUsuario");
    ob.ajax(objet, selector);
    var cF = 0;
    $("#BtnModificar").click(function(){
        $("#NombreFun").val();
        $("#ApellidoFun").val();
        $("#IdentificacionFunTipo").val();
        $("#IdentificacionFun").val();
        $("#NFuncionarioFun").val();
        $("#CorreoFun").val();
        $("#IdSenaFun").val();
        $("#CaargoFun").val();
    });
    $("#Btncontrasena").click(function () {
        //$("#myModal").modal('show');
    });
    $("#IdentificacionFun").hover(function () {
        if (cF == 0) {
            selector = $("#IdentificacionFun");
            objet = {d: 0, opcion: 3, url: "Crud_Controller", nombre: "perfil", tabla: "17", datos: [""], elegir: ["0", "1", "2"], id: 0, opSelect: 4};
            ob.ajax(objet, selector);
        }
        cF++;
    });
    
      
    $("#BtnModificar").click(function (){
    console.log("hellow por fin!!!!!!!!!");
var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;	
    $(".remove").remove();
        if( $("#NombreFun").val() == "" ){
            $("#NombreFun").focus().after("<div class='remove'><font color='red'>digite el nombre</font><div>");
            return false;
        
    }else if( $("#ApellidoFun").val() == ""){
            $("#ApellidoFun").focus().after("<div class='remove'><font color='red'>Ingrese un apellido</font></div>");
            return false;
		}else if( $("#IdentificacionFunTipo").val() == "A0" ){
            $("#IdentificacionFunTipo").focus().after("<div class='remove'><font color='red'>seleccione una opcion</font></div>");
            return false;
		}else if( $("#IdentificacionFun").val() == "" ){
            $("#IdentificacionFun").focus().after("<div class='remove'><font color='red'>ingrese su numero de identificacion</font></div>");
            return false;
		}else if( $("#NFuncionarioFun").val() == "" ){
            $("#NFuncionarioFun").focus().after("<div class='remove'><font color='red'>ingrese su numero de funsionario</font></div>");
            return false;
		}else if( $("#CorreoFun").val() == "" || !emailreg.test($("#CorreoFun").val()) ){
            $("#CorreoFun").focus().after("<div class='remove'><font color='red'>Ingrese un email correcto</font></div>");
            return false;
		}else if( $("#IdSenaFun").val() == "" ){
            $("#IdSenaFun").focus().after("<div class='remove'><font color='red'>ingrese una ip</font></div>");
            return false;
		}else if( $("#CaargoFun").val() == "" ){
            $("#CaargoFun").focus().after("<div class='remove'><font color='red'>ingrese un cargo</font></div>");
            return false;
			}
    });

    $("#CorreoFun").keyup(function(){
        if( $(this).val() != "" && emailreg.test($(this).val())){
            $(".error").fadeOut();
            return false;
        }
    });
    $("#BtnMcontrasena").click(function () {
       console.log("vivi");
        clave1 = $("#ConNueva").val();
      	clave2 = $("#ConNuevaF").val();
         $(".remove").remove();
        
        if( $("#ConActual").val() == "" ){
            $("#ConActual").focus().after("<div class='remove'><font color='red'>ingrese contraseña actual</font><div>");
            return false;
         }else if(clave1.trim() != clave2.trim()){
				$("#ConNuevaF").focus().after("<div class='remove'><font color='red'>Las contraseñas no son iguales.</font></div>");
			return false;
                    } 
    });
});

