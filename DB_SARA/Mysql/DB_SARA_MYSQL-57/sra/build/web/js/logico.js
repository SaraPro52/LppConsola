////Carga de imagenes 
$(document).on('ready', function () {
    console.log("Vivo??Logico");
    $("#Imagen").on('click', function () {
        function handleFileSelect(evt) {
            var files = evt.target.files;
            for (var i = 0, f; f = files[i]; i++) {
                if (!f.type.match('image.*')) {
                    continue;
                }
                var reader = new FileReader();
                reader.onload = (function (theFile) {
                    return function (e) {

                        var span = document.createElement('span');
                        $("#IImagen").attr("src", e.target.result);
                    };
                })(f);
                reader.readAsDataURL(f);
                console.log("Url " + f);
            }
            $("#resultIImagen").attr("src", f);
            console.log("a");
        }
        document.getElementById('Imagen').addEventListener('change', handleFileSelect, false);
        document.getElementById('Imagen').addEventListener('change', handleFileSelect, false);
        function handleDragOver(evt) {
            evt.stopPropagation();
            evt.preventDefault();
            evt.dataTransfer.dropEffect = 'copy';
        }
    });
});