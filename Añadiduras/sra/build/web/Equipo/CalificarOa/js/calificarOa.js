function calificarPV(idLista) {
    var selector = [], hilo = [], jso = [], data = [], nombre = "funcionario", datos = [];

    $("#iFecha").datepicker();

    $("#clone").hide();
    var ob = new $.Luna("Producto virtual", $("#divContainer"));
    ob.Vivo("CalificarOA");
    jso[0] = ['Crud_Controller', '[{opcion:3,tabla2:15,tipo:2,elegir:[0,1,4],delimitador:"[{colum:3,operador:0,valor1:'+idLista+'}]",id:0,opSelect:6}]'];
    selector[0] = $("#divContainer");
    datos[0] = {nombre: "calificar",worker: true};
    ajax(0, datos[0]);
    
    var t = true;
    var fecha = "null";
    $(document).on('click', '.FechaLi', function (e) {
        if (t==true) {
            $("#TipodeFecha").show();
            t=false;
        }else if(t==false){
            $("#TipodeFecha").hide();
            t=true;
        }
        
    })
    $("#btnEvaluar").click(function () {
        var campo = "";
        var infoItems = [];
        var cc = 0;
        $("input:checkbox:checked").each(function () {
            campo = $(this).val();
            if (campo !== "on") {
                infoItems.push("1¤" + $("#" + campo).val() + "¤" + campo);
            }
        });
        $("input:checkbox:not(:checked)").each(function () {
            campo = $(this).val();
            if (campo !== "on") {
                infoItems.push("0¤" + $("#" + campo).val() + "¤" + campo);
                cc++;
            }
        });
        var resultado = 3;
        if (cc > 0) {
            resultado = 0;
        } else {
            resultado = 1;
        }
        if(t == false){
            fecha = $("#iFecha").val();
        }
        
        alert(fecha+"1");
        alert($("#iFecha").val());
        
        jso[1] = ['EvaluacionGeneral_Controller','[{opcion:1,idNoti:,infoEva:["'+$("#areaObservacion").val()+'","' + resultado + '","' + idVersion + '","' + idLista + '","' + idUser + '","' +fecha+ '"],infoItem:[' + infoItems + ']}]'];
        selector[1] = null;
        datos[1] = {nombre:"btn", worker: true};
        console.log(jso[1]);
        ajax(1, datos[1]); 
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
            $.notify({
                icon: 'ti-gift',
                message: data[i] + "."
            }, {
                type: 'success',
                timer: 4000
            });
        }
    }
}
    