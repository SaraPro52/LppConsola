 function Detalles(Producto, dat) { 
    var acc = document.getElementsByClassName("accordion");
    var IdSelec = [];
    $(document).on('click', '.accordion', function (e) {
        for (e = 0; e < acc.length; e++) {
            acc[e].onclick = function () {
                this.classList.toggle("active");
                this.nextElementSibling.classList.toggle("show");
            }
        }
    });
     

    $("#IdProducto").text("Produto: " + dat);
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("Consultar PV1", $("#formulario1"));
    ob.Vivo("DetallesConsulta1");
    jso[1] = ['ProductoVirtual_Controller', '[{opcion:6,arrayTemas:[],archivoNom:"",info:[],arrayFun:[],idPV:' + Producto + '}]'];
    selector[1] = $("#ClonDetalles");
    datos[1] = {nombre: "DetallesOaC", worker: true, nom: dat};
    ajax(1, datos[1]);

    $(document).on('click', '.Comentar', function (e) {
        jso[0] = ['Crud_Controller', '[{opcion:1,tabla1:7,tabla2:25,tipo:2,datos:["",' + $(".Comment" + this.value).val() + ',' + idUser + ',' + this.value + '],elegir:[0,1,2,3,4],delimitador:[{colum:4,operador:0,valor1:' + this.value + '}],id:0,opSelect:6}]'];
        selector[0] = $("#BaseComentario");
        datos[0] = {nombre: "Comentario", worker: true,id:this.value};
        ajax(0, datos[0]);
    });

    $(document).on('click', '.labelEstrella', function (e) {
        console.log(this.id);
        var myClass = [];
        var s = $(this);
        console.log(s);
        myClass = s.attr("class");
        var res = myClass.substr(14, myClass.length);
        jso[2] = ['Rankin_Controller', '[{opcion:1,idVer:' + res + ',campRa:' + this.id + '}]'];
        selector[2] = "null";
        datos[2] = {nombre: "btn", worker: true};
        ajax(2, datos[2]);
    });


    $(document).on('click', '.Descargar', function (e) {
        location.href = "Archivos/" + this.value;
    });
    $(document).on('click', '.Actualizar', function (e) {
        console.log(this);
        
    });
    function ajax(i, datos) {
        hilo[i] = new Worker("js/worker.js");
        hilo[i].postMessage(jso[i]);
        hilo[i].onmessage = function (event) {
            data[i] = event.data;
            ob.cargarTabla(data[i], selector[i], datos);
            hilo[i].terminate();
            peticionCompleta(i);
        };
    }
    function peticionCompleta(i) {
        if (i==0) {
             
            
        }else if (i == 15) {
            $.notify({
                icon: 'ti-gift',
                message: data[5] + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
}
