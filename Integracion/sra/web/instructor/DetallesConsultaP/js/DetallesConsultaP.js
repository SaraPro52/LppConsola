function Detalles(Producto, dat) {
    $("#IdProducto").text("Produto: " + dat);
    var selector = [], hilo = [], jso = [], data = [], datos = [];
    var ob = new $.Luna("Consultar PV", $("#formulario1"));
    jso[1] = ['ProductoVirtual_Controller', '[{opcion:5,arrayTemas:[],archivoNom:"",info:[],arrayFun:[],idPV:' + Producto + '}]'];
    selector[1] = $("#ClonDetalles");
    datos[1] = {nombre: "DetallesOaC", worker: true};
    console.log(jso[1]);
    ajax(1, datos[1]);

    $(document).on('click', '.Comentar', function (e) {
        var s = $("#consul" + this.value);
        jso[0] = ['Crud_Controller', '[{opcion:1,tabla:7,delimitador:[],datos:["",' + $(".Comment" + this.value).val() + ',' + idUser + ',' + this.value + '],\n\
        elegir:[0,1,2,3],delimitar:[{colum:3,operador:0,valor1:' + this.value + '}],id:0,opSelect:6}]'];
        selector[0] = "null";
        datos[0] = {nombre: "btn", worker: true};
        ajax(0, datos[0]);
    });

    $(document).on('click', '.labelEstrella', function (e) {
        console.log(this.id);
        var myClass=[];
        var s = $(this);
        console.log(s);
        myClass = s.attr("class");
        var res= myClass.substr(14,myClass.length); 
        jso[2] = ['Rankin_Controller', '[{opcion:1,idVer:' +res+',campRa:' +this.id+ '}]'];
        selector[2] = "null";
        datos[2] = {nombre: "btn", worker: true};
        ajax(2, datos[2]);
    });

    $(document).on('click', '.Descargar', function (e) {
        location.href = "Archivos/" + this.value;
    });
    $(document).on('click', '.Actualizar', function (e) {
        console.log("dios");
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
        if (i == 0) {
            console.log(data[i]);
        } else if (i == 1) {
            console.log(data[i]);

        } else if (i == 2) {
            console.log(data[i]);
        } else if (i == 5) {
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
