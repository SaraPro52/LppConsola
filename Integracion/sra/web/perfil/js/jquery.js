$(document).ready(function () {
    var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    $("#boton").click(function (){
	clave1 = $("#contraseña").val();
	clave2 = $("#confiramar").val();
    $(".remove").remove();
        if( $("#nombre").val() == "" ){
            $("#nombre").focus().after("<div class='remove'><font color='red'>digite el nombre</font><div>");
            return false;
        
    }else if( $("#apellido").val() == ""){
            $("#apellido").focus().after("<div class='remove'><font color='red'>Ingrese un apellido</font></div>");
            return false;
     }else if(clave1.trim() != clave2.trim()){
				$("#confiramar").focus().after("<div class='remove'><font color='red'>Las contraseñas no son iguales.</font></div>");
			return false;
		}else if( $("#contraseña").val() == "" ){
            $("#contraseña").focus().after("<div class='remove'><font color='red'>ingrese una contraseña</font></div>");
            return false;
		}else if( $("#confiramar").val() == "" ){
            $("#confiramar").focus().after("<div class='remove'><font color='red'>vuelva e ingrese una contraseña</font></div>");
            return false;
		}else if( $("#sel1").val() == "" ){
            $("#sel1").focus().after("<div class='remove'><font color='red'>seleccione una opcion</font></div>");
            return false;
		}else if( $("#identificacion").val() == "" ){
            $("#identificacion").focus().after("<div class='remove'><font color='red'>ingrese su numero de identificacion</font></div>");
            return false;
		}else if( $("#funcionario").val() == "" ){
            $("#funcionario").focus().after("<div class='remove'><font color='red'>ingrese su numero de funsionario</font></div>");
            return false;
		}else if( $("#email").val() == "" || !emailreg.test($("#email").val()) ){
            $("#email").focus().after("<div class='remove'><font color='red'>Ingrese un email correcto</font></div>");
            return false;
		}else if( $("#sena").val() == "" ){
            $("#sena").focus().after("<div class='remove'><font color='red'>ingrese una ip</font></div>");
            return false;
		}else if( $("#cargo").val() == "" ){
            $("#cargo").focus().after("<div class='remove'><font color='red'>ingrese un cargo</font></div>");
            return false;
		}else if( $("#sel2").val() == "" ){
            $("#sel2").focus().after("<div class='remove'><font color='red'>seleccione una opcion</font></div>");
            return false;
	
			}




    });
    $("#nombre, #apellido, #contraseña,#confiramar,#sel1").keyup(function(){
        if( $(this).val() != "" ){
            $(".remove").fadeOut();
            return false;
        }
    });
    $("#email").keyup(function(){
        if( $(this).val() != "" && emailreg.test($(this).val())){
            $(".error").fadeOut();
            return false;
        }
    });
});
