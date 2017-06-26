$(document).ready(function () {
    var dat = $("#tituloPro").text(), Producto = $("#idPro").text();
    $("#TituloProducto").text("Titulo del producto: " + dat);
    var acc = document.getElementsByClassName("accordion");
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
    datos[1] = {nombre: "DetallesOaC", nom: dat};
    ajax(1, datos[1]);

    $(document).on('click', '.Comentar', function (e) {
        jso[0] = ['Crud_Controller', '[{opcion:1,tabla1:13,tabla2:25,tipo:2,datos:["",' + $(".Comment" + this.value).val() + ',' + idUser + ',' + this.value + '],elegir:[0,1,2,3,4],delimitador:[{colum:4,operador:0,valor1:' + this.value + '}],id:0,opSelect:6}]'];
        selector[0] = $("#BaseComentario");
        datos[0] = {nombre: "Comentario", id: this.value};
        ajax(0, datos[0]);
    });

    $(document).on('click', '.labelEstrella', function (e) {
        console.log(this.id);
        var myClass = [];
        var s = $(this);
        myClass = s.attr("class");
        var res = myClass.substr(14, myClass.length);
        jso[2] = ['Rankin_Controller', '[{opcion:3,paramRankin:[0,' + res + ',' + idUser + ',' + this.id + ']}]'];
        selector[2] = $(this);
        datos[2] = {nombre: "btn"};
        ajax(2, datos[2]);
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
        if (i == 1) {
            jso[3] = ['Rankin_Controller', '[{opcion:1,paramRankin:[0,' + Producto + ',0,0]}]'];
            datos[3] = {nombre: "btn"};
            ajax(3, datos[3]);
        } else if (i == 2) {
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "Se agrego la calificacion  ";
            } else {
                estado = ("error");
                men = "No se a podido ingresar la calificacion";
            }
            $.notify(men, estado);
        }
    }
});


