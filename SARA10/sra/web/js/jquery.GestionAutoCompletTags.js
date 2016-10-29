jQuery.GAutoTags = function () {
    this.Json1;
    this.Json3;
    function setArray(json) {
        j = [];
        this.Json1 = json;
    }
    function getArray() {
        return this.Json1;
    }

    function getArray3() {
        return this.Json3;
    }
    this.ajax = function (datos, selecion) {
        $.ajax({
            url: datos.url,
            type: 'POST',
            async: true,
            cache: false,
            datatype: 'json',
            data: datos,
            success: function (json) {

                CagarHijos(datos, selecion, "nnul", json);

            },
            error: function () {
                alert = ("Disculpa, pero existe un error al cargar datos del servidor :/");
            }
        });
    };
    this.CagarHijo = function (datos, selecion, contenedor, json) {
        CagarHijos(datos, selecion, contenedor, json)
    }
    function CagarHijos(datos, selecion, contenedor, json) {
        var s = [];
        var ar = [];
        var ja = Object.keys(json[0]);
        for (var i = 0; i < json.length; i++) {
            s.push(json[i][ja[1]]);
        }
        if (datos.arr == 0) {
            setArray(s);
            autocomplete(selecion, datos);
        } else if (datos.arr == 1) {
            $("#seCa").empty();
            var dat = getArray();
            ar = selecion.val().split(",");
            for (var i = 0; i < ar.length; i++) {
                for (var j = 0; j < dat.length; j++) {
                    if (dat[j].trim() == ar[i].trim()) {
                        var u = ar[i].replace(/\s/g, "_");
                        var conte = contenedor.clone();
                        conte.find(".contenedor").attr("id", ar[i] + "_Contenedor");
                        conte.find(".accordion").text("Tema: " + ar[i]);
                        conte.find(".accordion").attr("id", "L" + datos.opSelect + u);
                        conte.find(".view").attr("id", u);
                        conte.find(".datos").attr("id", u + "_Datos");
                        conte.children().appendTo(json);
                    }
                }
            }
            if (datos.opSelect == 4) {
                var bu = "<button type='button' class='btnRebus' id='valorPrograma'>Agregar tema</button>";
                $("#seEs").append(bu);
            }
        }
    }

    function autocomplete(selector, elecion) {
        console.log(selector);
        console.log(elecion);
        var dat;
        if (elecion.arr == 0) {
            dat = this.Json1;
        }
        var datos = selector;
        datos = (datos.selector + "_Datos");
        console.log(dat);
        selector.tagit({
            availableTags: dat,
            singleField: true,
            removeConfirmation: true,
            placeholderText: "Ingresa " + elecion.mensaje + "...",
            singleFieldNode: datos,
            beforeTagRemoved: function (evt, ui) {
                if (ui.tag.context.id.trim() == elecion.Constante) {
                    $("#" + ui.tagLabel + "_Contenedor").remove();
                }
            }
        });
    }
    ;
};
