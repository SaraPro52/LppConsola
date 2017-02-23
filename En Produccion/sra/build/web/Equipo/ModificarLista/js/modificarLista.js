function modificar(idTipoItem) {
    //axn ;)
    var jso = [], selector = [], hilo = [], data = [], ww = "", multi = [], arraySelecion = [], Lista = -8, men = "", men1 = "", estado = "";
    $(".EspacioItems").hide();
    $("#tablaItems").hide();
    var ob = new $.Luna("Lista", $("#tablalista"));
    ob.Vivo("ModificarListaDeChequeo3");
    jso[2] = ['Crud_Controller', '[{opcion:3,tabla2:12,tipo:2,elegir:[0,1,2,3],delimitador: "[{colum:5,operador:0,valor1:' + idRol + '}]",id:0,opSelect:6}]'];
    var datos = {nombre: "Lista", worker: true};
    selector[2] = $("#tablalista");
    ob.TablaEspa(selector[2]);
    ajax(2, datos);

    var arraySelecion = [];
    $('.itemselect').multiSelect({
        selectableHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un item...'>",
        selectionHeader: "<input type='text' class='search-input form-control' autocomplete='off' placeholder='Busca un item...'>",
        afterInit: function (ms) {
            var that = this,
                    $selectableSearch = that.$selectableUl.prev(),
                    $selectionSearch = that.$selectionUl.prev(),
                    selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
                    selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

            that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                    .on('keydown', function (e) {
                        if (e.which === 40) {
                            that.$selectableUl.focus();
                            return false;
                        }
                    });

            that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                    .on('keydown', function (e) {
                        if (e.which == 40) {
                            that.$selectionUl.focus();
                            return false;
                        }
                    });
        },
        afterSelect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            arraySelecion.push(val);
        },
        afterDeselect: function (val) {
            this.qs1.cache();
            this.qs2.cache();
            var busqueda = $.inArray(val, arraySelecion);
            arraySelecion.splice(busqueda, 1);
        }
    });

    $(document).on('click', '.btnclick', function (e) {
        $(".EspacioItems").show();
        $("#CompoLista").hide();
        var s = [];
        var dat = $(this).val();
        s = dat.split("$$$");
        $("#NombreL").val(s[0]);
        $("#DescripcionL").val(s[1]);
        jso[0] = ['Crud_Controller', '[{opcion:3, tabla2: 15,tipo:2, elegir:[0,1],delimitador: "[{colum:3,operador:0,valor1:' + this.id + ',añadir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id: 0, opSelect: 6}]'];
        var datos = {nombre: "btn", worker: true};
        selector[0] = "null";
        Lista = this.id;
        ajax(0, datos);
    });

    $("#btnItem").click(function () {
//        $(".remove").remove();
//        var boo = 0; 
//        var inputs = $(".inputs");
//        var input, selet;
//        for (var i = 0; i < inputs.length; i++) {
//            if (inputs[i].value == "") {
//                input = $(inputs[i]);
//                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
//            } else {
//                boo++;
//            }
//        }
//        if (boo == 1) {
        BtnItem();
        //   }
    });

    function  BtnItem() {
        jso[1] = ['Crud_Controller', '[{opcion:1,tabla1:19,tabla2:19,tipo:1,datos:["",' + $("#Descripcion").val() + ',' + idTipoItem + '],elegir:[0,1],delimitador:"[{colum:2,operador:0,valor1:' + idTipoItem + '}]",id:0,opSelect:6}]'];
        selector[1] = $("#SelectItem");
        datos[1] = {nombre: "btn"};
        ajax(1, datos[1]);
    }

    $("#BtnLista").click(function () {
        $(".remove").remove();
        var boo = 0;
        var inputs = $(".inputs1");
        var input;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].value == "") {
                input = $(inputs[i]);
                input.focus().after("<div class='remove'><font color='red'>Rellene este campo</font><div>");       
            } else {
                boo++;
            }
        }
        if (boo == 2) {
            BtnLista();
        }
    });

    function BtnLista() {
        jso[5] = ['ListaChequeo_Controller', '[{opcion: 2,mLista:["' + Lista + '","' + $("#NombreL").val() + '","' + $("#DescripcionL").val() + '"],mItems:[' + arraySelecion + ']}]'];
        datos[5] = {nombre: "btn", worker: true};
        men1 = $("#NombreL").val();
        ajax(5, datos[5]);
    }

    function ajax(i, datos) {
        try {
            hilo[i] = new Worker("js/worker.js");
            hilo[i].postMessage(jso[i]);
            hilo[i].onmessage = function (event) {
                data[i] = event.data;
                ob.cargarTabla(data[i], selector[i], datos);
                if (i != 5) {
                    data[i] = jQuery.parseJSON(event.data);
                }
                hilo[i].terminate();
                peticionCompleta(i);
            };
        } catch (error) {
            console.log(error);
        }
    }
    function peticionCompleta(i) {
        var arrItemsC = [];
        var arrItems = [];
        if (i == 0) {
            var ww = "";
            var js = data[0];
            for (var f = 0; f < js.length; f++) {
                alert("DATA: " + data[0][f].Id_Item_Lista+ " VAL: " +js.length);
                arrItemsC.push({Id_Item_Lista: js[f].Id_Item_Lista, Des_Item_Lista: js[f].Des_Item_Lista, tipo: true});
                arrItems.push({Id_Item_Lista: js[f].Id_Item_Lista});
                if(f == 0){//Solucion Momentanea
                    ww += js[f].Id_Item_Lista;
                }else {
                    ww +=  "," + js[f].Id_Item_Lista;
                }
            }
            jso[3] = ['Crud_Controller', '[{opcion: 3,tabla2:19,tipo:1,elegir: [0,1],delimitador:"[{colum:0,operador:7,valor1:\'' + ww + '\',añadir:0},{colum:2,operador:0,valor1:' + idTipoItem + '}]", id:0,opSelect:6}]'];
            datos[3] = {nombre: "btn"};
            ajax(3, datos[3]);
        } else if (i == 3) {
            var js = data[3];
            var conunt = 0;
            for (var f = 0; f < js.length; f++) {
                for (var o = 0; o < arrItems.length; o++) {
                    if (js[f].Id_Item_Lista == arrItems[o].Id_Item_Lista) {
                        conunt++;
                    }
                }
                if (conunt == 0) {
                    arrItemsC.push({Id_Item_Lista: js[f].Id_Item_Lista, Des_Item_Lista: js[f].Des_Item_Lista, tipo: false});
                }
                conunt = 0;
            }
            $("#SelectItem").empty();
            datos[3] = {nombre: "MultiSelect", compuesto: true};
            ob.cargarTabla(arrItemsC, $("#SelectItem"), datos[3]);
        } else if (i == 1) {
            if (data[0].length == data[i].length) {
                men = "El item " + men + " no se ingreso.";
                estado = ("error");
            } else if (data[0].length < data[i].length) {
                var uu = data[i].length;
                var jsoData = jQuery.parseJSON(data[i]);
                var jj = Object.keys(jsoData[0]);
                var opcion = "<option value=" + jsoData[uu].Des_Item_Lista + ">" + jsoData[uu].Id_Item_Lista + "</option>";
                $("#SelectItem").append(opcion);
                $("#SelectItem").multiSelect('refresh');
                men = "El item " + data[uu].Des_Item_Lista + " se ingreso correctamente";
                estado = ("success");
            }
            $.notify(men, estado);
        } else if (i == 5) {
            $(".EspacioItems").hide();
            $("#CompoLista").show();
            var daMen = data[i].split("$$");
            if (daMen[0] == "true") {
                estado = ("success");
                men = "La lista " + men1 + " " + daMen[1];
            } else {
                estado = ("error");
                men = daMen[1];
            }
            $.notify(men, estado);
        }
    }
}

jso[0] = ['ListaChequeo_Controller','[{opcion:3,lista:1,tipoItem:0}]'];