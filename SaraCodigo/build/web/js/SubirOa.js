 $(document).ready(function(){
  var opcion=0;
  Limpiar();
  CargarDatosSeleciones();
  $("#Imagen").on('click',function(){
    function handleFileSelect(evt) {
      var files = evt.target.files;
      for (var i = 0, f; f = files[i]; i++) {
          if (!f.type.match('image.*')) {
              continue;
            }
            var reader = new FileReader();
    reader.onload = (function(theFile) {
      return function(e) {
        // Render thumbnail.
        var span = document.createElement('span');
        $("#IImagen").attr("src", e.target.result);
      };
    })(f);
    reader.readAsDataURL(f);
    console.log("Url "+f);
  }
}
      document.getElementById('Imagen').addEventListener('change', handleFileSelect, false);
      document.getElementById('Imagen').addEventListener('change', handleFileSelect, false);
      function handleDragOver(evt) {
        evt.stopPropagation();
        evt.preventDefault();
        evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
}
  });

  function CargarDatosSeleciones(){
    console.log("CargarDatosSeleciones");
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

  $("#btnSubir").click(function(){
    opcion=1;
    var Imagen=$("#foto").attr('src');
    var objeto={
      "Opcion":opcion,
      "Titulo": $("#Titulo").val(),
      "Actor":$("#Autores").val(),
      "Descripcion": $("#Descripcion").val(),
      "Area": $("#Area").val(),
      "Programa": $("#Programa").val(),
      "Tema": $("#Tema").val(),
      "Imagen": Imagen,
      "PalabrasClave": $("#PalabrasClave").val(),
      "Formato": $("#Formato").val(),
      "Requisitos": $("#Requisitos").val(),
      "Instruciones": $("#Instruciones").val(),
      "Anniadir":$("#Anniadir").val(),
    }
    a = Enviar(objeto);
  });

  function Enviar(Datos){
    $.ajax({
      url:"controllersubiroa",
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
        console.log("Vivo??SubirOa");
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
