$(document).ready(function(){

  $('#btnLogin').on('click',function(){
    console.log("ENTRO");
    var objetoJson =
    {url:'sesion_controller',
    usuario:$('#user').val(),
    contraseña:$('#pwd').val()};
    Login(objetoJson);
  });


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
