 $(document).ready(function(){
  console.log("Vivio??SubirOA");   
  var opcion=0;
  Limpiar();
  CargarDatosSeleciones();
  function CargarDatosSeleciones(){
    opcion=2;
    var paises = new Array(
      "seleciona...",
      "Colombia",
      "venezuela",
      "argentina",
      "hola"
    )
    var carga= Enviar(opcion);
    var Selector = $("#Area");
    AddOption(paises,Selector);
    Selector = $("#Programa")
    AddOption(paises,Selector);
    Selector = $("#Tema")
     AddOption(paises,Selector);
    Selector = $("#Formato")
    AddOption(paises,Selector);
  }
  function AddOption(Datos,Selector){
      for (var i = 0; i < Datos.length; i++) {
          Selector.append($('<option>',{
            value: i,
            text: Datos[i]
          }));
      }
  }

  function Enviar(Datos){
    $.ajax({
      url:"instrutorcontroller",
      type:"POST",
      datatype:"Json",
      data: Datos,
      succes: function(Requets){
        console.log("Datos obtenidos desde servidor "+Requets);
        return Requets;
      }
    });
  }
    function Limpiar(){
        if (window.File && window.FileReader && window.FileList && window.Blob) {
          console.log("Navegador compatible");
        } else {
            console.log('Navegador no compatible.');
        }
        titulo =$("#Titulo").val("");
        descripcion =$("#Descripcion").val("");
        area =$("#Area").val("");
        programa =$("#Programa").val("");
        tema =$("#Tema").val("");
        imagen =$("#Imagen").val("");
        palabrasClave =$("#PalabrasClave").val("");
        formato =$("#Formato").val("");
        requisitos=$("#Requisitos").val("");
        instruciones =$("#Instruciones").val("");
        anniadir =$("#Anniadir").val("");
    }
});