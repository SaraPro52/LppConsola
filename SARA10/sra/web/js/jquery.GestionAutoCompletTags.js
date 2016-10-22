jQuery.GAutoTags = function () {
    this.Json1;
    this.Json2;
    function setArray(json) {
        this.Json1 = json;
    }
    ;
    function setArray1(json) {
        this.Json2 = json;
    }
    ;
    var http_request = false;
    this.puroAjax = function (json) {
        http_request = false;
        if (window.XMLHttpRequest) {
            http_request = new XMLHttpRequest();
            if (http_request.overrideMimeType) {
                http_request.overrideMimeType('text/xml');
                //application/json;charset=UTF-8
            }
        } else if (window.ActiveXObject) { // IE
            try {
                http_request = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                }
            }
        }
        if (!http_request) {
            alert('Falla :( No es posible crear una instancia XMLHTTP');
            return false;
        }
        http_request.open('POST', json.url, true);
        http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        http_request.send("opcion=3&tabla=16&elegir=0&elegir1=1&id=0&opSelect=4&datos=" + JSON.stringify(json.datos));
        http_request.onreadystatechange = alertContents;
    }
    function alertContents() {
        if (http_request.readyState == 4) {
            if (http_request.status == 200) {
                console.log(http_request.responseText);
            } else {
                console.log('Hubo problemas con la petición.');
            }
        }
    }
    this.ajax = function (datos, selecion) {
        if (this.getSemaforo = false) {
            $.ajax({
                url: datos.url,
                type: 'POST',
                async: true,
                cache: false,
                datatype: 'json',
                data: datos,
                success: function (json) {
                    console.log(json);
                    CagarHijos(datos, selecion, json);
                },
                error: function () {
                    alert = ("Disculpa, pero existe un error al cargar datos del servidor :/");
                },
                complete: function () {
                    console.log("Peticion completada");
                }
            });
        }

    };

    function CagarHijos(datos, selecion, json) {
        var s = [];
        for (var i = 0; i < json.length; i++) {
            s.push(json[i].Nom_Categoria);
        }
        if (datos.arr == 0) {
            setArray(s);
            autocomplete(selecion, datos);
        } else if (datos.arr == 1) {
            //console.log(datos);
            setArray1(json);
            $("#seCa").empty();
            var contes = "$('" + datos.contenedor + "')";
            var ar = selecion.val().split(",");
            console.log(json);
            console.log(ar);
//            for (var i = 0; i < ar.length; i++) {
//                for (var j = 0; j < this.Json1.length; j++) {
//                    if (this.Json2[j].trim() == ar[i].trim()) {
//                        var conte = contenedor.clone();
//                        conte.find(".contenedor").attr("id", ar[i] + "_Contenedor");
//                        conte.find("#espacio").text("Tema: " + ar[i]);
//                        conte.find(".view").attr("id", ar[i]);
//                        conte.find(".datos").attr("id", ar[i] + "_Datos");
//                        conte.children().appendTo("#seCa");
//                        this.setMen("un@" + ar[i]);
//                        this.autocomplete($("#" + ar[i]), 1);
//                    }
//                }
//            }
        }
    }
    ;
    function autocomplete(selector, elecion) {
        var dat;
        if (elecion.arr == 0) {
            dat = this.Json1;
        } else if (elecion == 1) {
            dat = this.Json2;
        }
        var datos = selector;
        datos = (datos.selector + "_Datos");
        var x = elecion.Constante;
        selector.tagit({
            availableTags: dat,
            singleField: true,
            removeConfirmation: true,
            placeholderText: "Ingresa " + elecion.mensaje + "...",
            singleFieldNode: datos,
            beforeTagRemoved: function (evt, ui) {
                if (ui.tag.context.id.trim() == x) {
                    $("#" + ui.tagLabel + "_Contenedor").remove();
                }
            }
        });
    }
    ;
};
