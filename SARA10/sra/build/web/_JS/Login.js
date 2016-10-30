$(document).ready(function(){

  $('#btnLogin').on('click',function(){
<<<<<<< HEAD
    console.log("ENTRO");
=======
>>>>>>> 298e2a32555f98db1ed4082b1964553d69edefb4
    var objetoJson =
    {url:'sesion_controller',
    usuario:$('#user').val(),
    contraseña:$('#pwd').val()};
<<<<<<< HEAD
    Login(objetoJson);
  });


=======


  });

>>>>>>> 298e2a32555f98db1ed4082b1964553d69edefb4
  function Login(objeto){
    $.ajax({
      url:objeto.url,
      type:'POST',
      async:true,
      cache:false,
      datatype:'json',
      data:objeto,
      success:function(respuesta){
        console.log(respuesta);
      },
      error:function(jqXHR, textStatus, errorThrown){
        console.log('Falla: '+ textStatus + errorThrown);
      }
    });
  };
});
